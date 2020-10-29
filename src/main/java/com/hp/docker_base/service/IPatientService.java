package com.hp.docker_base.service;

import com.hp.docker_base.bean.Patient;
import com.hp.docker_base.bean.dto.PatientDto;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/5 18:11
 */

public interface IPatientService {

    /**
     * 录入病人信息
     * @param patientDto 病人信息
     * @param userName
     */
    Patient addPatientInfo(PatientDto patientDto, String userName);

    /**
     * 修改病人信息
     * @param patientDto 病人信息
     * @param userName
     */
    int modifyPatientInfo(PatientDto patientDto, String userName);

    Patient queryPatientByPostId(String postId);


    Patient queryPatientByUUID(String uuid);


    /**
     *  查询身份证是否唯一
     */
    boolean queryPostIdIsUnique(String uuid,
                                String postId);

    /**
     * 获取所有病人
     * @param keywords
     */
    List<Patient> findPatients(String keywords);
}
