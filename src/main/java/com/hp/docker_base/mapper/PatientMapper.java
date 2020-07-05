package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.Patient;

import java.util.List;

import com.hp.docker_base.bean.PatientExample;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PatientMapper {


    int insertPatientInfo(Patient patient);



    Patient selectPatientByPostId(@Param("postId") String postId);

    int updatePatientInfo(Patient oldPatient);

    Patient queryPatientByUUID(@Param("uuid") String uuid);
}