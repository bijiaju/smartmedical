package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.RoleUser;
import com.hp.docker_base.bean.dto.RoleDto;
import com.hp.docker_base.em.EnumRole;
import com.hp.docker_base.mapper.RoleMapper;
import com.hp.docker_base.mapper.RoleUserMapper;
import com.hp.docker_base.service.IRoleUserService;
import org.apache.commons.lang3.StringUtils;
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

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<String> queryRoleUserByRoleId(String roleId) {
        return roleUserMapper.selectRoleUserByRoleId(roleId);
    }

    @Override
    public RoleDto queryRoleIdByUserId(String uuid) {

        if(StringUtils.isEmpty(uuid)){
            return null;
        }

        RoleUser roleUser = roleUserMapper.selectRoleUserByUserId(uuid);
        if(roleUser != null){
            RoleDto roleDto = new RoleDto();
            if(roleUser.getRoleId().equals(EnumRole.DOCTOR.getCode())){
                roleDto.setRoleCode(EnumRole.DOCTOR.getCode());
                roleDto.setRoleName(EnumRole.DOCTOR.getValue());
            }else if(roleUser.getRoleId().equals(EnumRole.ADMIN.getCode())){
                roleDto.setRoleCode(EnumRole.ADMIN.getCode());
                roleDto.setRoleName(EnumRole.ADMIN.getValue());
            }else{
                roleDto.setRoleCode(roleUser.getRoleId());
                roleDto.setRoleName(roleMapper.findRoleByRoleId(roleUser.getRoleId()).getRoleName());
            }
            return roleDto;
        }
        return null;
    }
}
