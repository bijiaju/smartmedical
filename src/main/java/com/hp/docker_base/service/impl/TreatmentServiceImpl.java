package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.TreatmentResult;
import com.hp.docker_base.bean.TreatmentResultExample;
import com.hp.docker_base.bean.dto.TreatmentResultDto;
import com.hp.docker_base.bean.em.EnumTreatState;
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
                                      Integer state,
                                      String userId) {
        TreatmentResult record = new TreatmentResult();
        record.setUuid(CommonUtil.generateUUID());

        //待修改
        record.setDiagnosisResult(treatmentResult.getDiagnosisResult());
        record.setOutFeatureJson(treatmentResult.getOutFeatureJson());
        record.setActiveRuleJson(treatmentResult.getActiveRuleJson());
        record.setType(state);
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
    public TreatmentResult queryResultByMedicalRecordId(String medicalRecordId,Integer state) {
        if(StringUtils.isEmpty(medicalRecordId)){
            return null;
        }

        TreatmentResultExample example = new TreatmentResultExample();
        TreatmentResultExample.Criteria criteria = example.createCriteria();

        criteria.andTreatmentIdEqualTo(medicalRecordId);
        criteria.andTypeEqualTo(state);

        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        List<TreatmentResult> treatmentObjections = treatmentResultMapper.selectByExample(example);
        if(treatmentObjections !=null && treatmentObjections.size()>0){
            return treatmentObjections.get(0);
        }
        return null;
    }

    @Override
    public int rejectTreatmentResult(String medicalRecordId,
                                     String userName) {

        // 获取修改状态
        TreatmentResult treatmentResult = this.queryResultByMedicalRecordId(medicalRecordId, EnumTreatState.MODIFY.getValue());
        treatmentResult.setType(EnumTreatState.REJECT_MODIFY.getValue());

        return modifyTreatmentResultInfo(treatmentResult);
    }

    @Override
    public int acceptTreatmentResult(String medicalRecordId, String userName) {
        // 获取修改状态
        TreatmentResult treatmentResult = this.queryResultByMedicalRecordId(medicalRecordId, EnumTreatState.MODIFY.getValue());
        treatmentResult.setType(EnumTreatState.CONFIRM_MODIFY.getValue());

        return modifyTreatmentResultInfo(treatmentResult);
    }


    private int modifyTreatmentResultInfo(TreatmentResult treatmentResult) {
        TreatmentResultExample example = new TreatmentResultExample();
        TreatmentResultExample.Criteria criteria = example.createCriteria();

        criteria.andTreatmentIdEqualTo(treatmentResult.getTreatmentId());
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return treatmentResultMapper.updateByExample(treatmentResult,example);
    }
}
