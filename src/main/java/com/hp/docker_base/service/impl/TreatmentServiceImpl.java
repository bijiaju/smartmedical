package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.TreatmentResult;
import com.hp.docker_base.bean.dto.TreatmentResultDto;
import com.hp.docker_base.bean.em.EnumTreatResultType;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.TreatmentResultMapper;
import com.hp.docker_base.service.ITreatmentService;
import com.hp.docker_base.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/10/27 16:40
 */

@Service
public class TreatmentServiceImpl implements ITreatmentService {

    @Autowired
    private TreatmentResultMapper treatmentResultMapper;


    @Override
    public int addTreatmentResultInfo(String medicalRecordId,
                                      TreatmentResultDto treatmentResult,
                                      String userId) {
        TreatmentResult record = new TreatmentResult();
        record.setUuid(CommonUtil.generateUUID());

        //待修改
        record.setDiagnosisResult(treatmentResult.getDiagnosisResult());
        record.setOutFeatureJson(treatmentResult.getOutFeatureJson());
        record.setActiveRuleJson(treatmentResult.getActiveRuleJson());
        record.setType(EnumTreatResultType.AUTO.getCode());

        record.setTreatmentId(medicalRecordId);

        record.setCreateTime(new Date());
        record.setUpdateTime(new Date());
        record.setCreateUser(userId);
        record.setUpdateUser(userId);
        record.setIsDelete(EnumDelete.NOT_DELETE.getCode());

        return treatmentResultMapper.insert(record);
    }
}
