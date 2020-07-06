package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Menu;
import com.hp.docker_base.mapper.MenuMapper;
import com.hp.docker_base.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/4 23:11
 */
@Service
public class MenuServiceImpl implements IMenuService{
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> queryAllMenuList() {
        return menuMapper.selectAllMenuList();
    }

    @Override
    public List<Menu> queryMenuListByUserId(String userId) {
        return menuMapper.findMenuListByUserId(userId);
    }
}
