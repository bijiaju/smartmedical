package com.hp.docker_base.service;

import com.hp.docker_base.bean.Menu;
import com.hp.docker_base.bean.dto.MenuDto;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/4 22:51
 */

public interface IMenuService {

    /**
     * 获取所有的菜单
     */
    List<Menu> queryAllMenuList();

    /**
     * 查询账户下的菜单
     */
    List<Menu> queryMenuListByUserId(String userId);

    /**
     * 新增菜单
     */
    MenuDto addMenuInfo(MenuDto menuDto,
                        String userName);

    /**
     * 获取菜单
     */
    Menu findMenuByUUID(String parentId);

    /**
     * 获取默认排序
     */
    int findDefaultMenuSort(String parentId);

    /**
     * 删除菜单
     */
    int deleteMenuInfo(String menuId,
                       String userName);

    /**
     * 编辑菜单
     */
    MenuDto modifyMenuInfo(MenuDto menuDto,
                       String userName);

    /**
     * 新增角色菜单的关系
     */
    int addRoleMenuInfo(String roleId,
                        List<String> resourceIds,
                        String userName);

    /**
     * 查询角色对应的菜单
     */
    List<Menu> queryMenuListByRoleId(String roleId);
}
