package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.MedicalRecord;

import java.util.List;

import com.hp.docker_base.bean.MedicalRecordExample;
import com.hp.docker_base.bean.bo.MedicalRecordBo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MedicalRecordMapper {



    List<MedicalRecordBo> selectMedicalRecordByDoctorId(@Param("doctorId") String doctorId,
                                                      @Param("keywords") String keywords);

    List<MedicalRecordBo> selectMedicalRecordByPostId(@Param("postId") String postId,
                                                      @Param("keywords") String keywords);

    MedicalRecord findMedicalRecordByUUID(@Param("uuid")String medicalRecordId);


    int countByExample(MedicalRecordExample example);

    int deleteByExample(MedicalRecordExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MedicalRecord record);

    int insertSelective(MedicalRecord record);

    List<MedicalRecord> selectByExample(MedicalRecordExample example);

    MedicalRecord selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MedicalRecord record, @Param("example") MedicalRecordExample example);

    int updateByExample(@Param("record") MedicalRecord record, @Param("example") MedicalRecordExample example);

    int updateByPrimaryKeySelective(MedicalRecord record);

    int updateByPrimaryKey(MedicalRecord record);


}