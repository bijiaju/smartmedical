package com.hp.docker_base.service;

import com.hp.docker_base.bean.dto.RoleDto;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/5 12:16
 */

public interface IRoleUserService {

    /**
     *  根据roleId获取所有的账户id
     * @param roleId 角色id
     * @return 账户id
     */
    List<String> queryRoleUserByRoleId(String roleId);


    RoleDto queryRoleIdByUserId(String uuid);
}
