package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.TreatmentInputData;
import com.hp.docker_base.bean.TreatmentInputDataExample;
import com.hp.docker_base.bean.TreatmentObjection;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.TreatmentInputDataMapper;
import com.hp.docker_base.service.ITreatmentInputDataService;
import com.hp.docker_base.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Desc 诊断输入参数接口服务实现
 * @Author 24763
 * @Date 2020/12/1 10:04
 */
@Service
public class TreatmentInputDataServiceImpl implements ITreatmentInputDataService {

    @Autowired
    private TreatmentInputDataMapper inputDataMapper;

    @Override
    public int addTreatmentInputData(TreatmentInputData record) {

        record.setUuid(CommonUtil.generateUUID());
        //待修改

        record.setCreateTime(new Date());
        record.setUpdateTime(new Date());
        record.setCreateUser(record.getUpdateUser());
        record.setUpdateUser(record.getUpdateUser());
        record.setIsDelete(EnumDelete.NOT_DELETE.getCode());

        return inputDataMapper.insert(record);
    }

    @Override
    public TreatmentInputData getTreatmentInputDataByTreamentId(String treatmentId) {
        if(StringUtils.isEmpty(treatmentId)){
            return null;
        }
        TreatmentInputDataExample example = new TreatmentInputDataExample();
        TreatmentInputDataExample.Criteria criteria = example.createCriteria();

        criteria.andTreatmentIdEqualTo(treatmentId);

        List<TreatmentInputData> treatmentInputData = inputDataMapper.selectByExample(example);

        TreatmentInputData treatmentInputData1 = treatmentInputData.stream().findFirst().orElse(null);
        return treatmentInputData1;
    }
}
