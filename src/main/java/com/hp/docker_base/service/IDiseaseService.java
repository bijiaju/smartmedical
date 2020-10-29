package com.hp.docker_base.service;

import com.hp.docker_base.bean.Disease;

import java.util.List;

/**
 * @description: 疾病服务
 * @author: biyangqiang
 * @time: 2020/8/16 18:46
 */
public interface IDiseaseService {

    /**
     * 新增疾病
     */
    int addDiseaseInfo(Disease disease,
                       String userName);

    /**
     * 编辑疾病
     */
    int editDiseaseInfo(String diseaseId,
                        Disease disease,
                        String userName);

    /**
     *
     * @return
     * @param departmentId
     */
    int findDefaultSort(String departmentId);


    List<Disease> queryAllDiseaseList(String departmentId, String keywords);

    Disease queryDiseaseByUUID(String diseaseId);

    int deleteDiseaseInfo(String diseaseId, String userName);

    Disease queryDiseaseByForeignId(String foreignId);

}
