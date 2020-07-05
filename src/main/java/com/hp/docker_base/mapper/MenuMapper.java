package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {

    /**
     * 查询菜单列表MenuMapper.xml
     */
    List<Menu> selectAllMenuList();
}