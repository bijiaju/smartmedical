package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.Role;
import com.hp.docker_base.bean.RoleMenu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface RoleMenuMapper {

    List<String> findMenuIdListByRoleId(@Param("roleId") String roleId);

    int insert(RoleMenu record);

    @Delete(" delete from tb_role_menu\n" +
            "    where role_id=#{roleId,jdbcType=VARCHAR}\n" +
            "    AND  menu_id =#{menuId,jdbcType=VARCHAR}\n" +
            "      AND is_delete=0")
    int deleteRoleMenu(@Param("roleId") String roleId,
                       @Param("menuId") String menuId);


    /**
     * 查询角色下的菜单编号
     */
    RoleMenu findRoleMenu(@Param("roleId") String roleId,
                          @Param("menuId") String menuId);
/*
    List<Role> selectAllRoles(@Param("keywords") String keywords);


    Role findRoleByRoleId(@Param("roleId") String roleId);


    int addRoleInfo(Role role);


    int updateRole(Role newRole);

    Role selectRoleByName(@Param("roleName") String roleName);*/
}