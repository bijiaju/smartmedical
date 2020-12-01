package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.TreatmentInputData;
import com.hp.docker_base.bean.TreatmentInputDataExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TreatmentInputDataMapper {
    int countByExample(TreatmentInputDataExample example);

    int deleteByExample(TreatmentInputDataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TreatmentInputData record);

    int insertSelective(TreatmentInputData record);

    List<TreatmentInputData> selectByExample(TreatmentInputDataExample example);

    TreatmentInputData selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TreatmentInputData record, @Param("example") TreatmentInputDataExample example);

    int updateByExample(@Param("record") TreatmentInputData record, @Param("example") TreatmentInputDataExample example);

    int updateByPrimaryKeySelective(TreatmentInputData record);

    int updateByPrimaryKey(TreatmentInputData record);
}