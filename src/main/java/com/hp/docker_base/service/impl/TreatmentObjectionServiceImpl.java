package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.TreatmentObjection;
import com.hp.docker_base.bean.TreatmentObjectionExample;
import com.hp.docker_base.bean.TreatmentResult;
import com.hp.docker_base.bean.dto.TreatmentObjectionDto;
import com.hp.docker_base.bean.em.EnumTreatResultType;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.TreatmentObjectionMapper;
import com.hp.docker_base.mapper.TreatmentResultMapper;
import com.hp.docker_base.service.ITreatmentObjectionService;
import com.hp.docker_base.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/10/27 17:15
 */
@Service
public class TreatmentObjectionServiceImpl implements ITreatmentObjectionService {

    @Autowired
    private TreatmentObjectionMapper treatmentObjectionMapper;

    @Override
    public int addTreatmentObjectInfo(String medicalRecordId,
                                      TreatmentObjectionDto treatmentResult,
                                      String userId) {
        TreatmentObjection record = new TreatmentObjection();
        record.setUuid(CommonUtil.generateUUID());

        //待修改
        record.setDiagnosisResult(treatmentResult.getDiagnosisResult());
        record.setOutFeatureJson(treatmentResult.getOutFeatureJson());
        record.setActiveRuleJson(treatmentResult.getActiveRuleJson());
        record.setReason(treatmentResult.getReason());
        record.setTreatmentPlan(treatmentResult.getTreatmentPlan());

        record.setTreatmentId(medicalRecordId);

        record.setCreateTime(new Date());
        record.setUpdateTime(new Date());
        record.setCreateUser(userId);
        record.setUpdateUser(userId);
        record.setIsDelete(EnumDelete.NOT_DELETE.getCode());

        return treatmentObjectionMapper.insert(record);
    }

    @Override
    public TreatmentObjection queryTreatmentObjectionByMedicalRecordId(String medicalRecordId) {
        if(StringUtils.isEmpty(medicalRecordId)){
            return null;
        }

        TreatmentObjectionExample example = new TreatmentObjectionExample();
        TreatmentObjectionExample.Criteria criteria = example.createCriteria();

        criteria.andTreatmentIdEqualTo(medicalRecordId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        List<TreatmentObjection> treatmentObjections = treatmentObjectionMapper.selectByExample(example);
        if(treatmentObjections !=null && treatmentObjections.size()>0){
            return treatmentObjections.get(0);
        }
        return null;
    }
}
