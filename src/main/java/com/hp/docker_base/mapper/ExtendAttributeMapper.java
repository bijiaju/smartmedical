package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.extend.ExtendAttribute;
import com.hp.docker_base.bean.extend.ExtendAttributeExample;
import com.hp.docker_base.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ExtendAttributeMapper extends BaseMapper<ExtendAttribute, Integer, ExtendAttributeExample> {
    long countByExample(ExtendAttributeExample example);

    int deleteByExample(ExtendAttributeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExtendAttribute record);

    int insertSelective(ExtendAttribute record);

    List<ExtendAttribute> selectByExample(ExtendAttributeExample example);

    ExtendAttribute selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExtendAttribute record, @Param("example") ExtendAttributeExample example);

    int updateByExample(@Param("record") ExtendAttribute record, @Param("example") ExtendAttributeExample example);

    int updateByPrimaryKeySelective(ExtendAttribute record);

    int updateByPrimaryKey(ExtendAttribute record);
}