package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Role;
import com.hp.docker_base.mapper.RoleMapper;
import com.hp.docker_base.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description: 获取角色实现
 * @author: biyangqiang
 * @time: 2020/7/4 22:15
 */
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> findAllRoles() {
        return roleMapper.selectAllRoles();
    }
}
