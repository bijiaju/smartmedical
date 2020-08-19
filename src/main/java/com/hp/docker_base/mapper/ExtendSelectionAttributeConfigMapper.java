package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.extend.ExtendSelectionAttributeConfig;
import com.hp.docker_base.bean.extend.ExtendSelectionAttributeConfigExample;
import com.hp.docker_base.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import java.util.List;


@Mapper
public interface ExtendSelectionAttributeConfigMapper extends BaseMapper<ExtendSelectionAttributeConfig, Integer, ExtendSelectionAttributeConfigExample> {
    long countByExample(ExtendSelectionAttributeConfigExample example);

    int deleteByExample(ExtendSelectionAttributeConfigExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExtendSelectionAttributeConfig record);

    int insertSelective(ExtendSelectionAttributeConfig record);

    List<ExtendSelectionAttributeConfig> selectByExample(ExtendSelectionAttributeConfigExample example);

    ExtendSelectionAttributeConfig selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExtendSelectionAttributeConfig record, @Param("example") ExtendSelectionAttributeConfigExample example);

    int updateByExample(@Param("record") ExtendSelectionAttributeConfig record, @Param("example") ExtendSelectionAttributeConfigExample example);

    int updateByPrimaryKeySelective(ExtendSelectionAttributeConfig record);

    int updateByPrimaryKey(ExtendSelectionAttributeConfig record);
}