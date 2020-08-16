package com.hp.docker_base.service;

import com.hp.docker_base.bean.Department;

import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/6 16:58
 */
public interface IDepartmentService {
    /**
     * 查询所有的科室
     * @param keywords
     */
    List<Department> queryAllDepartmentList(String keywords);

    /**
     * 新增科室信息
     */
    int addDepartmentInfo(Department department,
                          String userName);

    /**
     * 获取默认排序
     */
    int findDefaultSort();

    /**
     * 删除科室
     */
    int deleteDepartmentInfo(String departmentId,
                             String userName);

    /**
     * 编辑科室
     */
    Department editDepartmentInfo(String accountId,
                                  Department department,
                                  String userName);

    Department queryDepartmentByUUID(String departmentId);

}
