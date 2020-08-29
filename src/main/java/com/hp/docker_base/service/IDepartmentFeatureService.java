package com.hp.docker_base.service;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/26 22:09
 */

public interface IDepartmentFeatureService {

    /**
     * 批量添加部门特征
     */
    List<String> findDepartmentFeatureIdList(String departmentId);


    /**
     * 批量添加部门特征
     */
    List<String> findFeatureDepartmentIdList(String featureId);

    /**
     * 新增部门特色
     */
    int addDepartmentFeature(String departmentId,
                             String featureId,
                             String userName);

    /**
     * 新增部门特色
     */
    int modifyDepartmentFeature(String departmentId,
                             String featureId,
                             String userName);

    /**
     * 删除部门特征
     */
    int deleteDepartmentFeature(String departmentId,
                                String featureId);

    /**
     * 删除部门特征
     */
    int deleteDepartmentFeature(String departmentId,
                                List<String> featureIdList);


    /**
     * 查找部门特色
     */
    String findDepartmentFeatureDetail(String departmentId,
                                       String featureId);


    /**
     * 查找部门特色
     */
    List<String> findDepartmentFeatureList(String departmentId);

    /**
     * 批量添加部门特征
     */
    int addDepartmentFeatureList(List<String> departmentIDs,
                                  String uuid,
                                  String userName);



    /**
     * 批量添加部门特征
     */
    int addDepartmentFeatureList(String departmentId,
                                 List<String> featureIds,
                                 String userName);

    int deleteDepartmentFeature(List<String> departmentIdList,
                                String featureId);
}
