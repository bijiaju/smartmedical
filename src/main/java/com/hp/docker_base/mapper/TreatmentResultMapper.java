package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.TreatmentResult;
import com.hp.docker_base.bean.TreatmentResultExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface TreatmentResultMapper {
    int countByExample(TreatmentResultExample example);

    int deleteByExample(TreatmentResultExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TreatmentResult record);

    int insertSelective(TreatmentResult record);

    List<TreatmentResult> selectByExample(TreatmentResultExample example);

    TreatmentResult selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TreatmentResult record, @Param("example") TreatmentResultExample example);

    int updateByExample(@Param("record") TreatmentResult record, @Param("example") TreatmentResultExample example);

    int updateByPrimaryKeySelective(TreatmentResult record);

    int updateByPrimaryKey(TreatmentResult record);
}