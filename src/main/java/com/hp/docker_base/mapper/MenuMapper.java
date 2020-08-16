package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MenuMapper {

    /**
     * 查询菜单列表MenuMapper.xml
     */
    List<Menu> selectAllMenuList();


    List<Menu> findMenuListByUserId(@Param("userId") String userId);

    Menu selectMenuByUUID(@Param("uuid")String uuid);

    List<Menu> selectMenuListByParentId(@Param("parentId") String parentId);


    int updateMenuInfo(Menu oldMenu);


    int insertMenuInfo(Menu menu);

    /**
     * 根据菜单编号集合查找菜单
     */
    List<Menu> selectMenuByIdList(@Param("menuIdList")List<String> menuIdList);
}