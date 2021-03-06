package com.hp.docker_base.service;

import com.hp.docker_base.bean.Role;
import com.hp.docker_base.bean.dto.RoleDto;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/4 21:51
 */

public interface IRoleService {

    /**
     * 获取所有角色
     * @param keywords
     */
    List<Role> findAllRoles(String keywords);

    /**
     * 删除角色
     */
    int deleteRoleInfo(String roleId,
                       String userName);

    /**
     * 根据角色编号获取角色
     */
    Role findRoleByRoleId(String roleId);

    /**
     * 新增角色
     */
    int addRoleInfo(RoleDto roleDto,
                    String userName);

    /**
     * 编辑角色
     */
    int modifyRoleInfo(RoleDto roleDto,
                       String userName);

    boolean queryRoleNameIsUnique(String roleId,
                                  String roleName);

    /**
     * 添加角色成员
     */
    int addRoleMember(String roleId,
                      List<String> memberIds,
                      String userName);


    /**
     * 添加账户角色
     */
   int addRoleMemberInfo(String userId,
                         String roleId,
                         String userName);
}
