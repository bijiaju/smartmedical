package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.Disease;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.mapper.DepartmentMapper;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.IDiseaseService;
import com.hp.docker_base.service.IUserService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.validate.ErrorParamException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/6 16:59
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;
    
    @Autowired
    private IUserService userService;

    @Autowired
    private IDiseaseService diseaseService;

    @Override
    public List<Department> queryDepartmentList(List<String> departmentIdList) {
        if(!CollectionUtils.isEmpty(departmentIdList)){
            return departmentMapper.findDepartmentListByIdList(departmentIdList);
        }
        return null;
    }

    @Override
    public List<Department> queryAllDepartmentList(String keywords) {
        return departmentMapper.selectAllDepartmentList(keywords);
    }

    @Override
    public int addDepartmentInfo(Department department,
                                 String userName) {
        if(department != null){

            department.setUuid(CommonUtil.generateUUID());
            department.setSort(findDefaultSort());

            department.setCreateTime(new Date());
            department.setUpdateTime(new Date());
            department.setCreateUser(userName);
            department.setUpdateUser(userName);
            department.setIsDelete(EnumDelete.NOT_DELETE.getCode());
            departmentMapper.insertDepartmentInfo(department);
        }
        return 0;
    }

    @Override
    public int findDefaultSort() {
        List<Department> departmentList = departmentMapper.selectAllDepartmentList(null);
        if(!CollectionUtils.isEmpty(departmentList)){
            return departmentList.size()+1;
        }
        return 0;
    }

    @Override
    public int deleteDepartmentInfo(String departmentId,
                                    String userName) {
        Department department = findDepartmentByUUID(departmentId);
        if(department != null){

            // 查看科室下的账户
            List<User> allUsers = userService.findAllUsers(departmentId, null);
            if(!CollectionUtils.isEmpty(allUsers)){
                throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"科室下有医生，暂不能删除");
            }

            // 查询科室下疾病
            List<Disease> diseases = diseaseService.queryAllDiseaseList(departmentId, null);
            if(!CollectionUtils.isEmpty(diseases)){
                throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"科室下有疾病，暂不能删除");
            }

            department.setUpdateUser(userName);
            department.setUpdateTime(new Date());
            department.setIsDelete(EnumDelete.DELETE.getCode());

            return departmentMapper.updateDepartmentInfo(department);
        }
        return 0;
    }

    @Override
    public Department editDepartmentInfo(String departmentId,
                                         Department department,
                                         String userName) {
        Department oldDepartment = findDepartmentByUUID(departmentId);
        if(department != null){

            oldDepartment.setSort(department.getSort());
            oldDepartment.setName(department.getName());
            oldDepartment.setRemark(department.getRemark());
            departmentMapper.updateDepartmentInfo(oldDepartment);

            return this.findDepartmentByUUID(departmentId);
        }
        return null;
    }

    @Override
    public Department queryDepartmentByUUID(String departmentId) {
        if(!StringUtils.isEmpty(departmentId)){
            return departmentMapper.selectDepartmentByUUID(departmentId);
        }
        return null;
    }

    public Department findDepartmentByUUID(String departmentId){
        if(StringUtils.isEmpty(departmentId)){
            return null;
        }

        return departmentMapper.selectDepartmentByUUID(departmentId);
    }

}
