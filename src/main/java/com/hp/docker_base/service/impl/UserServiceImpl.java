package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.user.User;
import com.hp.docker_base.bean.user.UserDto;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.user.UserMapper;
import com.hp.docker_base.service.IUserService;
import com.hp.docker_base.util.convert.UserObjectConvert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/4 15:14
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findAllUsers() {
        return userMapper.selectAllUsers();
    }

    @Override
    public int addUserInfo(UserDto userInfo) {
        User user = UserObjectConvert.convertUserDto2User(userInfo);

        user.setUuid(UUID.randomUUID().toString());
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setCreateUser(userInfo.getUserName());
        user.setUpdateUser(userInfo.getUserName());
        user.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        return userMapper.insertUserInfo(user);
    }
}
