package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Disease;
import com.hp.docker_base.bean.DiseaseExample;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.mapper.DiseaseMapper;
import com.hp.docker_base.service.IDiseaseService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.validate.ErrorParamException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/16 18:46
 */
@Service
public class DiseaseServiceImpl implements IDiseaseService {
    @Autowired
    private DiseaseMapper diseaseMapper;


    @Override
    public int addDiseaseInfo(Disease disease,
                              String userName) {
        if(disease != null){

            disease.setUuid(CommonUtil.generateUUID());

            disease.setCreateTime(new Date());
            disease.setUpdateTime(new Date());
            disease.setCreateUser(userName);
            disease.setUpdateUser(userName);
            disease.setIsDelete(EnumDelete.NOT_DELETE.getCode());
            disease.setSort(findDefaultSort(disease.getDepartmentId()));
            diseaseMapper.insert(disease);
        }
        return 0;
    }

    @Override
    public int editDiseaseInfo(String diseaseId,
                               Disease disease,
                               String userName) {
        if(StringUtils.isEmpty(diseaseId)){
            return 0;
        }

        disease.setUuid(diseaseId);
        disease.setUpdateUser(userName);
        return updateDiseaseInfo(disease);
    }

    @Override
    public int findDefaultSort(String departmentId) {
        List<Disease> diseases = this.queryAllDiseaseList(departmentId, null);
        if(!CollectionUtils.isEmpty(diseases)){
            return diseases.size()+1;
        }
        return 0;
    }

    @Override
    public List<Disease> queryAllDiseaseList(String departmentId, String keywords) {
        DiseaseExample example = new DiseaseExample();
        DiseaseExample.Criteria criteria = example.createCriteria();

        if(StringUtils.isNotEmpty(departmentId)){
            criteria.andDepartmentIdEqualTo(departmentId);
        }

        if(StringUtils.isNotEmpty(keywords)){
            criteria.andNameLike("%"+keywords+"%");
        }

        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return diseaseMapper.selectByExample(example);
    }

    @Override
    public Disease queryDiseaseByUUID(String diseaseId) {
        if(StringUtils.isNotEmpty(diseaseId)){
            DiseaseExample example = new DiseaseExample();
            DiseaseExample.Criteria criteria = example.createCriteria();
            criteria.andUuidEqualTo(diseaseId);
            criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

            List<Disease> diseases = diseaseMapper.selectByExample(example);
            if(!CollectionUtils.isEmpty(diseases)){
                return diseases.get(0);
            }
        }
        return null;
    }

    @Override
    public int deleteDiseaseInfo(String diseaseId,
                                 String userName) {
        //Disease disease = this.queryDiseaseByUUID(diseaseId);
        Disease disease = this.queryDiseaseByExtUUID(diseaseId);
        if(disease != null){
            if(StringUtils.isNotEmpty(disease.getForeignId())){
                throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"当前疾病为诊断结果疾病，不能删除");
            }

            disease.setUuid(diseaseId);
            disease.setUpdateUser(userName);
            disease.setIsDelete(EnumDelete.DELETE.getCode());

            updateDiseaseInfo(disease);
        }
        return 0;
    }

    @Override
    public Disease queryDiseaseByForeignId(String foreignId) {
        if(!StringUtils.isEmpty(foreignId)){
            return diseaseMapper.selectDiseaseByForeignId(foreignId);
        }
        return null;
    }

    @Override
    public Disease queryDiseaseByExtUUID(String uuid) {
        if(!StringUtils.isEmpty(uuid)){
            return diseaseMapper.selectDiseaseByUUID(uuid);
        }
        return null;
    }

    private int updateDiseaseInfo(Disease disease){
        disease.setUpdateTime( new Date());

        DiseaseExample example = new DiseaseExample();
        DiseaseExample.Criteria criteria = example.createCriteria();

        criteria.andUuidEqualTo(disease.getUuid());
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return diseaseMapper.updateByExampleSelective(disease,example);
    }
}
