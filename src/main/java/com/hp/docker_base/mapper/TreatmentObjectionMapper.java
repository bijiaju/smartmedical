package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.TreatmentObjection;
import com.hp.docker_base.bean.TreatmentObjectionExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TreatmentObjectionMapper {
    int countByExample(TreatmentObjectionExample example);

    int deleteByExample(TreatmentObjectionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TreatmentObjection record);

    int insertSelective(TreatmentObjection record);

    List<TreatmentObjection> selectByExample(TreatmentObjectionExample example);

    TreatmentObjection selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TreatmentObjection record, @Param("example") TreatmentObjectionExample example);

    int updateByExample(@Param("record") TreatmentObjection record, @Param("example") TreatmentObjectionExample example);

    int updateByPrimaryKeySelective(TreatmentObjection record);

    int updateByPrimaryKey(TreatmentObjection record);
}