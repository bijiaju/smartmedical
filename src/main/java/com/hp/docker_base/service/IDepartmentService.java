package com.hp.docker_base.service;

import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.Menu;

import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/6 16:58
 */
public interface IDepartmentService {
    /**
     * 查询所有的科室
     */
    List<Department> queryAllDepartmentList();
}
