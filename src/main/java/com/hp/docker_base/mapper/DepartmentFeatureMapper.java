package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.DepartmentFeature;
import com.hp.docker_base.bean.DepartmentFeatureExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DepartmentFeatureMapper {
    int countByExample(DepartmentFeatureExample example);

    int deleteByExample(DepartmentFeatureExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(DepartmentFeature record);

    int insertSelective(DepartmentFeature record);

    List<DepartmentFeature> selectByExample(DepartmentFeatureExample example);

    DepartmentFeature selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DepartmentFeature record, @Param("example") DepartmentFeatureExample example);

    int updateByExample(@Param("record") DepartmentFeature record, @Param("example") DepartmentFeatureExample example);

    int updateByPrimaryKeySelective(DepartmentFeature record);

    int updateByPrimaryKey(DepartmentFeature record);
}