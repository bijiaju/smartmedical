package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.MDC1;
import com.hp.docker_base.bean.MDC1Example;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MDC1Mapper {
    int countByExample(MDC1Example example);

    int deleteByExample(MDC1Example example);

    int deleteByPrimaryKey(String id);

    int insert(MDC1 record);

    int insertSelective(MDC1 record);

    List<MDC1> selectByExample(MDC1Example example);

    MDC1 selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MDC1 record, @Param("example") MDC1Example example);

    int updateByExample(@Param("record") MDC1 record, @Param("example") MDC1Example example);

    int updateByPrimaryKeySelective(MDC1 record);

    int updateByPrimaryKey(MDC1 record);


    List<MDC1> selectSickList(@Param("departmentId")String departmentId);

    List<MDC1> selectFeatureList(@Param("departmentId")String departmentId);
}