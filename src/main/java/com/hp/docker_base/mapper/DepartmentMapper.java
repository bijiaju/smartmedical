package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DepartmentMapper {

    /**
     *  查询所有科室
     * @return
     */
    List<Department> selectAllDepartmentList();
}