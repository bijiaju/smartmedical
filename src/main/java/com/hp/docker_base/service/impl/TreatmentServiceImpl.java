package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.TreatmentResult;
import com.hp.docker_base.bean.TreatmentResultExample;
import com.hp.docker_base.bean.TreatmentResult;
import com.hp.docker_base.bean.dto.TreatmentResultDto;
import com.hp.docker_base.bean.em.EnumTreatResultType;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.TreatmentResultMapper;
import com.hp.docker_base.service.ITreatmentService;
import com.hp.docker_base.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

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
        record.setTreatmentPlan(treatmentResult.getTreatmentPlan());

        record.setTreatmentId(medicalRecordId);

        record.setCreateTime(new Date());
        record.setUpdateTime(new Date());
        record.setCreateUser(userId);
        record.setUpdateUser(userId);
        record.setIsDelete(EnumDelete.NOT_DELETE.getCode());

        return treatmentResultMapper.insert(record);
    }

    @Override
    public TreatmentResult queryResultByMedicalRecordId(String medicalRecordId) {
        if(StringUtils.isEmpty(medicalRecordId)){
            return null;
        }

        TreatmentResultExample example = new TreatmentResultExample();
        TreatmentResultExample.Criteria criteria = example.createCriteria();

        criteria.andTreatmentIdEqualTo(medicalRecordId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        List<TreatmentResult> treatmentObjections = treatmentResultMapper.selectByExample(example);
        if(treatmentObjections !=null && treatmentObjections.size()>0){
            return treatmentObjections.get(0);
        }
        return null;
    }
}
