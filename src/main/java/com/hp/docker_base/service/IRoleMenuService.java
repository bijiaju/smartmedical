package com.hp.docker_base.service;

import com.hp.docker_base.bean.RoleMenu;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/16 10:38
 */

public interface IRoleMenuService {

    /**
     * 查询角色下的菜单编号
     */
    List<String> findMenuIdListByRoleId(String roleId);

    /**
     * 新增角色菜单
     */
    int saveRoleMenu(String roleId,
                     List<String> addResourceIds,
                     List<String> dataBaseResourceIds,
                     String userName);

    /**
     * 删除角色菜单
     */
    int removeRoleMenu(String roleId,
                       List<String> deleteResourceIds);


}
