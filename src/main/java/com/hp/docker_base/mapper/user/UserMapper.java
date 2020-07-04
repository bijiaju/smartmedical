package com.hp.docker_base.mapper.user;


import com.hp.docker_base.bean.user.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("SELECT * FROM tb_user WHERE is_delete=0")
    List<User> selectAllUsers();

    int insertUserInfo(User user);
}