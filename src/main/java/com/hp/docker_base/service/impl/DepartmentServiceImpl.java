package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.Menu;
import com.hp.docker_base.mapper.DepartmentMapper;
import com.hp.docker_base.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/6 16:59
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> queryAllDepartmentList() {
        return departmentMapper.selectAllDepartmentList();
    }
}
