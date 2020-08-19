package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.extend.ExtendTextAttributeConfig;
import com.hp.docker_base.bean.extend.ExtendTextAttributeConfigExample;
import com.hp.docker_base.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import java.util.List;


@Mapper
public interface ExtendTextAttributeConfigMapper extends BaseMapper<ExtendTextAttributeConfig, Integer, ExtendTextAttributeConfigExample> {
    long countByExample(ExtendTextAttributeConfigExample example);

    int deleteByExample(ExtendTextAttributeConfigExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExtendTextAttributeConfig record);

    int insertSelective(ExtendTextAttributeConfig record);

    List<ExtendTextAttributeConfig> selectByExample(ExtendTextAttributeConfigExample example);

    ExtendTextAttributeConfig selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExtendTextAttributeConfig record, @Param("example") ExtendTextAttributeConfigExample example);

    int updateByExample(@Param("record") ExtendTextAttributeConfig record, @Param("example") ExtendTextAttributeConfigExample example);

    int updateByPrimaryKeySelective(ExtendTextAttributeConfig record);

    int updateByPrimaryKey(ExtendTextAttributeConfig record);
}