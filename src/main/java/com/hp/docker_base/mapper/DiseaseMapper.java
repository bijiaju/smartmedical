package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.Disease;
import com.hp.docker_base.bean.DiseaseExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface DiseaseMapper {
    int countByExample(DiseaseExample example);

    int deleteByExample(DiseaseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Disease record);

    int insertSelective(Disease record);

    List<Disease> selectByExample(DiseaseExample example);

    Disease selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Disease record, @Param("example") DiseaseExample example);

    int updateByExample(@Param("record") Disease record, @Param("example") DiseaseExample example);

    int updateByPrimaryKeySelective(Disease record);

    int updateByPrimaryKey(Disease record);
}