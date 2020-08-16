package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface RoleMapper {

    List<Role> selectAllRoles(@Param("keywords") String keywords);


    Role findRoleByRoleId(@Param("roleId") String roleId);


    int addRoleInfo(Role role);


    int updateRole(Role newRole);

    Role selectRoleByName(@Param("roleName")String roleName);
}