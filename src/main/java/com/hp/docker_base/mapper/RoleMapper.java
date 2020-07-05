package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface RoleMapper {

    List<Role> selectAllRoles();
}