package com.hp.docker_base.mapper;


import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.condition.UserCondition;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {


    List<User> selectAllUsers(@Param("condition") UserCondition condition);

    int insertUserInfo(User user);

    User findUserByNameAndPassword(@Param("userName") String userName,
                                   @Param("password") String password);


    User selectUserByUserName(@Param("userName") String userName);


    User selectUserByPhone(@Param("phone") String phone);

    User selectUserByEmail(@Param("email") String email);

    User selectUserByUUID(@Param("uuid") String uuid);

    int updateUser(User user);

}