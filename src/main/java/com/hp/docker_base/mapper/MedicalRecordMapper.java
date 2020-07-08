package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.MedicalRecord;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MedicalRecordMapper {


    List<MedicalRecord> selectMedicalRecordByPostId(@Param("postId") String postId);
}