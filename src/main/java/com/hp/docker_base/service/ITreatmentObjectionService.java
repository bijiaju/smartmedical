package com.hp.docker_base.service;

import com.hp.docker_base.bean.TreatmentObjection;
import com.hp.docker_base.bean.dto.TreatmentObjectionDto;

/**
 * 诊断反对记录
 */
public interface ITreatmentObjectionService {


    /**
     * 诊断结果异议
     */
    int addTreatmentObjectInfo(String medicalRecordId,
                               TreatmentObjectionDto treatmentResult,
                               String userName);


    /**
     * 根据诊疗记录获取诊疗结果
     */
    TreatmentObjection queryTreatmentObjectionByMedicalRecordId(String medicalRecordId);

}
