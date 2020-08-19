package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.extend.ExtendNumberAttributeConfig;
import com.hp.docker_base.bean.extend.ExtendNumberAttributeConfigExample;
import com.hp.docker_base.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ExtendNumberAttributeConfigMapper extends BaseMapper<ExtendNumberAttributeConfig, Integer, ExtendNumberAttributeConfigExample> {
    long countByExample(ExtendNumberAttributeConfigExample example);

    int deleteByExample(ExtendNumberAttributeConfigExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExtendNumberAttributeConfig record);

    int insertSelective(ExtendNumberAttributeConfig record);

    List<ExtendNumberAttributeConfig> selectByExample(ExtendNumberAttributeConfigExample example);

    ExtendNumberAttributeConfig selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExtendNumberAttributeConfig record, @Param("example") ExtendNumberAttributeConfigExample example);

    int updateByExample(@Param("record") ExtendNumberAttributeConfig record, @Param("example") ExtendNumberAttributeConfigExample example);

    int updateByPrimaryKeySelective(ExtendNumberAttributeConfig record);

    int updateByPrimaryKey(ExtendNumberAttributeConfig record);
}