package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.DepartmentFeature;
import com.hp.docker_base.bean.DepartmentFeatureExample;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.DepartmentFeatureMapper;
import com.hp.docker_base.service.IDepartmentFeatureService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/26 22:10
 */
@Service
public class DepartmentFeatureServiceImpl implements IDepartmentFeatureService {

    @Autowired
    private DepartmentFeatureMapper departmentFeatureMapper;


    @Override
    public List<String> findDepartmentFeatureIdList(String departmentId) {
        if(StringUtils.isEmpty(departmentId)){
            return null;
        }

        DepartmentFeatureExample example = new DepartmentFeatureExample();
        DepartmentFeatureExample.Criteria criteria = example.createCriteria();

        criteria.andDepartmentIdEqualTo(departmentId);
       // criteria.andFeatureIdEqualTo(featureId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        List<DepartmentFeature> departmentFeatures = departmentFeatureMapper.selectByExample(example);

        if(!CollectionUtils.isEmpty(departmentFeatures)){
            return departmentFeatures.stream().map(DepartmentFeature::getFeatureId).collect(Collectors.toList());

        }
        return null;
    }

    @Override
    public List<String> findFeatureDepartmentIdList(String featureId) {
        if(StringUtils.isEmpty(featureId)){
            return null;
        }

        DepartmentFeatureExample example = new DepartmentFeatureExample();
        DepartmentFeatureExample.Criteria criteria = example.createCriteria();

        //criteria.andDepartmentIdEqualTo(departmentId);
        criteria.andFeatureIdEqualTo(featureId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        List<DepartmentFeature> departmentFeatures = departmentFeatureMapper.selectByExample(example);

        if(!CollectionUtils.isEmpty(departmentFeatures)){
            return departmentFeatures.stream().map(DepartmentFeature::getDepartmentId).collect(Collectors.toList());

        }
        return null;
    }

    @Override
    public int addDepartmentFeature(String departmentId,
                                    String featureId,
                                    String userName) {
      /*  DepartmentFeatureExample example = new DepartmentFeatureExample();
        DepartmentFeatureExample.Criteria criteria = example.createCriteria();*/

        if(StringUtils.isEmpty(departmentId)
                || StringUtils.isEmpty(featureId) ){
            return 0;
        }

        DepartmentFeature record = new DepartmentFeature();

        record.setDepartmentId(departmentId);
        record.setFeatureId(featureId);

        record.setCreateTime(new Date());
        record.setUpdateTime(new Date());
        record.setCreateUser(userName);
        record.setUpdateUser(userName);
        record.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        return departmentFeatureMapper.insert(record);
    }

    @Override
    public int modifyDepartmentFeature(String departmentId,
                                       String featureId,
                                       String userName) {
        if(StringUtils.isEmpty(departmentId)
                || StringUtils.isEmpty(featureId) ){
            return 0;
        }
        DepartmentFeature record = new DepartmentFeature();

        record.setDepartmentId(departmentId);
        record.setFeatureId(featureId);

        return 0;
    }


    @Override
    public int deleteDepartmentFeature(String departmentId,
                                       String featureId) {
        DepartmentFeatureExample example = new DepartmentFeatureExample();
        DepartmentFeatureExample.Criteria criteria = example.createCriteria();

        criteria.andDepartmentIdEqualTo(departmentId);
        criteria.andFeatureIdEqualTo(featureId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return departmentFeatureMapper.deleteByExample(example);
    }

    @Override
    public int deleteDepartmentFeature(String departmentId,
                                       List<String> featureIdList) {
        if(CollectionUtils.isEmpty(featureIdList)
                || StringUtils.isEmpty(departmentId) ){
            return 0;
        }

        int addCount =0;
        for(String featureId : featureIdList){
            addCount += deleteDepartmentFeature(departmentId,featureId);
        }

        return addCount;
    }

    @Override
    public String findDepartmentFeatureDetail(String departmentId,
                                              String featureId) {
        DepartmentFeatureExample example = new DepartmentFeatureExample();
        DepartmentFeatureExample.Criteria criteria = example.createCriteria();

        criteria.andDepartmentIdEqualTo(departmentId);
        criteria.andFeatureIdEqualTo(featureId);

        List<DepartmentFeature> departmentFeatures = departmentFeatureMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(departmentFeatures)){
            return departmentFeatures.get(0).getFeatureId();
        }
        return null;
    }

    @Override
    public List<String> findDepartmentFeatureList(String departmentId) {
        DepartmentFeatureExample example = new DepartmentFeatureExample();
        DepartmentFeatureExample.Criteria criteria = example.createCriteria();

        criteria.andDepartmentIdEqualTo(departmentId);

        List<DepartmentFeature> departmentFeatures = departmentFeatureMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(departmentFeatures)){
            return departmentFeatures.stream().map(t->t.getFeatureId()).collect(Collectors.toList());
        }
        return null;
    }

    @Override
    public int addDepartmentFeatureList(List<String> departmentIDs, String featureId, String userName) {
        if(CollectionUtils.isEmpty(departmentIDs)
                || StringUtils.isEmpty(featureId) ){
            return 0;
        }

        int addCount = 0;
        for(String departmentId : departmentIDs){
            if(StringUtils.isEmpty(findDepartmentFeatureDetail(departmentId,featureId))){
                addCount += addDepartmentFeature(departmentId,featureId,userName);
            }

        }

        return addCount;
    }

    @Override
    public int addDepartmentFeatureList(String departmentId,
                                        List<String> featureIds,
                                        String userName) {
        if(CollectionUtils.isEmpty(featureIds)
                || StringUtils.isEmpty(departmentId) ){
            return 0;
        }

        int addCount = 0;
        for(String featureId : featureIds){
            if(StringUtils.isEmpty(findDepartmentFeatureDetail(departmentId,featureId))){
                addCount += addDepartmentFeature(departmentId,featureId,userName);
            }
        }

        return addCount;
    }

    @Override
    public int deleteDepartmentFeature(List<String> departmentIdList,
                                       String featureId) {
        if(CollectionUtils.isEmpty(departmentIdList)
                || StringUtils.isEmpty(featureId) ){
            return 0;
        }

        int addCount = 0;
        for(String departmentId : departmentIdList){
            addCount += deleteDepartmentFeature(departmentId,featureId);
        }

        return addCount;
    }
}
