package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.Mdc2;
import com.hp.docker_base.bean.Mdc2Example;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface Mdc2Mapper {
    int countByExample(Mdc2Example example);

    int deleteByExample(Mdc2Example example);

    int deleteByPrimaryKey(Integer rule);

    int insert(Mdc2 record);

    int insertSelective(Mdc2 record);

    List<Mdc2> selectByExample(Mdc2Example example);

    Mdc2 selectByPrimaryKey(Integer rule);

    int updateByExampleSelective(@Param("record") Mdc2 record, @Param("example") Mdc2Example example);

    int updateByExample(@Param("record") Mdc2 record, @Param("example") Mdc2Example example);

    int updateByPrimaryKeySelective(Mdc2 record);

    int updateByPrimaryKey(Mdc2 record);
}