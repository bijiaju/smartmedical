package com.hp.docker_base.service;


import com.hp.docker_base.bean.TreatmentResult;
import com.hp.docker_base.bean.dto.TreatmentResultDto;

/**
 * 诊断结果服务
 */
public interface ITreatmentService {

    /**
     * 新增诊断结果记录
     */
    int addTreatmentResultInfo(String medicalRecordId,
                               TreatmentResultDto treatmentResult,
                               String userId);

    /**
     * 根据诊疗id获取结果
     */
    TreatmentResult queryResultByMedicalRecordId(String medicalRecordId);
}
