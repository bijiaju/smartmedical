package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.RoleUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RoleUserMapper {


    List<String> selectRoleUserByRoleId(@Param("roleId") String roleId);


    int insertRoleUser(RoleUser roleUser);
}