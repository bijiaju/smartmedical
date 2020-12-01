package com.hp.docker_base.service;


import com.hp.docker_base.bean.TreatmentResult;
import com.hp.docker_base.bean.dto.TreatmentResultDto;

/**
 * 诊断结果服务
 */
public interface ITreatmentService {

    /**
     * 新增自动诊断结果记录
     */
    int addTreatmentResultInfo(String medicalRecordId,
                               TreatmentResultDto treatmentResult,
                               Integer value, String userId);



    /**
     * 根据诊疗id获取结果
     */
    TreatmentResult queryResultByMedicalRecordId(String medicalRecordId,
                                                 Integer state);


    /**
     * 驳回诊断结果
     */
    int rejectTreatmentResult(String medicalRecordId, String userName);

    /**
     * 管理员接受诊断记录
     */
    int acceptTreatmentResult(String medicalRecordId, String userName);
}
