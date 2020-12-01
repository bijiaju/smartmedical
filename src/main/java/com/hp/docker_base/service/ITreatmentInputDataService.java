package com.hp.docker_base.service;

import com.hp.docker_base.bean.TreatmentInputData;

/**
 * @Desc 输入参数服务
 * @Author 24763
 * @Date 2020/12/1 10:01
 */
public interface ITreatmentInputDataService {

    /**
     * 新增诊断输入参数
     */
    int addTreatmentInputData(TreatmentInputData data);

    /**
     *  根据诊断编号获取输入参数
     * @param treatmentId 诊断编号
     */
    TreatmentInputData getTreatmentInputDataByTreamentId(String treatmentId);
}
