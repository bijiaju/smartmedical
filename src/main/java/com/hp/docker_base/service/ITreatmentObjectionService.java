package com.hp.docker_base.service;

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
}
