package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.MedicalRecord;
import com.hp.docker_base.mapper.MedicalRecordMapper;
import com.hp.docker_base.service.IMedicalRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/8 21:19
 */
@Service
public class MedicalRecordServiceImpl implements IMedicalRecordService {

    @Autowired
    private MedicalRecordMapper medicalRecordMapper;

    @Override
    public List<MedicalRecord> queryMedicalRecordByPostId(String postId) {
        return medicalRecordMapper.selectMedicalRecordByPostId(postId);
    }
}
