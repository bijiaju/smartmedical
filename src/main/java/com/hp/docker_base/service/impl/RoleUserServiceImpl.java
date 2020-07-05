package com.hp.docker_base.service.impl;

import com.hp.docker_base.mapper.RoleUserMapper;
import com.hp.docker_base.service.IRoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/5 12:20
 */
@Service
public class RoleUserServiceImpl implements IRoleUserService{

    @Autowired
    private RoleUserMapper roleUserMapper;

    @Override
    public List<String> queryRoleUserByRoleId(String roleId) {
        return roleUserMapper.selectRoleUserByRoleId(roleId);
    }
}
