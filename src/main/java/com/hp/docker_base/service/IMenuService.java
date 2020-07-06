package com.hp.docker_base.service;

import com.hp.docker_base.bean.Menu;

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
}
