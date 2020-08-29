package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DepartmentMapper {

    /**
     *  查询所有科室
     * @return
     * @param keywords
     */
    List<Department> selectAllDepartmentList(@Param("keywords")  String keywords);

    /**
     * 新增科室
     */
    int insertDepartmentInfo(Department department);


    Department selectDepartmentByUUID(@Param("uuid") String uuid);

    int updateDepartmentInfo(Department department);

    List<Department> findDepartmentListByIdList(@Param("departmentIdList")List<String> departmentIdList);
}