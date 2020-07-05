package com.hp.docker_base.service;

import com.hp.docker_base.bean.Role;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/4 21:51
 */

public interface IRoleService {

    List<Role> findAllRoles();
}
