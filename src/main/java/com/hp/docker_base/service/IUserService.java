package com.hp.docker_base.service;

import com.hp.docker_base.bean.user.User;
import com.hp.docker_base.bean.user.UserDto;

import java.util.List;

/**
 * @Desc 用户服务
 * @Author 24763
 * @Date 2020/7/4 15:13
 */
public interface IUserService {

    /**
     * 获取所有的账户
     */
    List<User> findAllUsers();

    /**
     *  添加账户信息
     * @param userInfo 账户信息
     * @return 账户信息
     */
    int addUserInfo(UserDto userInfo);
}
