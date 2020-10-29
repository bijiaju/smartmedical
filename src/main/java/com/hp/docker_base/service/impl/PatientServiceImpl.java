package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Patient;
import com.hp.docker_base.bean.dto.PatientDto;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.mapper.PatientMapper;
import com.hp.docker_base.service.IPatientService;
import com.hp.docker_base.util.convert.PatientObjectConvert;
import com.hp.docker_base.util.validate.ErrorParamException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @description: 病人信息实现
 * @author: biyangqiang
 * @time: 2020/7/5 18:13
 */
@Service
public class PatientServiceImpl implements IPatientService{

    @Autowired
    private PatientMapper patientMapper;

    @Override
    public Patient addPatientInfo(PatientDto patientDto,
                                  String userName) {
        // 新增账户
        Patient patient = PatientObjectConvert.convertPatientDto2Dao(patientDto);

        String uuid = UUID.randomUUID().toString();
        patient.setUuid(uuid);

        // 查看病人是否已经存在
        checkPatientValidity(patient);

        patient.setCreateTime(new Date());
        patient.setUpdateTime(new Date());
        patient.setCreateUser(userName);
        patient.setUpdateUser(userName);
        patient.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        patient.setSort(1);
        patientMapper.insertPatientInfo(patient);

        return queryPatientByUUID(uuid);
    }

    private void checkPatientValidity(Patient patient) {
        boolean isNotExist = queryPostIdIsUnique(patient.getUuid(), patient.getPostId());
        if(!isNotExist){
            throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"此病人已经存在");
        }
    }

    @Override
    public int modifyPatientInfo(PatientDto newPatientDto,
                                 String userName) {
        Patient oldPatient = patientMapper.queryPatientByUUID(newPatientDto.getUuid());

        oldPatient.setSex(newPatientDto.getSex());
        oldPatient.setName(newPatientDto.getName());
        oldPatient.setPostId(newPatientDto.getPostId());
        oldPatient.setMedicalHistory(newPatientDto.getMedicalHistory());

        oldPatient.setUpdateTime(new Date());
        oldPatient.setUpdateUser(userName);

        // 校验病人有消息
        checkPatientValidity(oldPatient);

        return patientMapper.updatePatientInfo(oldPatient);
    }

    @Override
    public Patient queryPatientByPostId(String postId) {
        return patientMapper.selectPatientByPostId(postId);
    }

    @Override
    public Patient queryPatientByUUID(String uuid) {
        if(StringUtils.isNotEmpty(uuid)){
            return patientMapper.queryPatientByUUID(uuid);
        }
        return null;
    }

    @Override
    public boolean queryPostIdIsUnique(String uuid,
                                      String postId) {
        Patient user = patientMapper.selectPatientByPostId(postId);
        if(user == null){
            return true;
        }else {
            // 1-2 找到账户，如果是当前编辑账户的话，则认为账户名也是唯一的
            return StringUtils.isNotEmpty(uuid) && user.getUuid().equals(uuid);
        }
    }

    @Override
    public List<Patient> findPatients(String keywords) {
         return patientMapper.selectPatients(keywords);
    }
}
