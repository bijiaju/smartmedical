package com.hp.docker_base.util.convert;

import com.hp.docker_base.bean.user.User;
import com.hp.docker_base.bean.user.UserDto;
import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/4 16:20
 */
public class UserObjectConvert {

    public static UserDto convertUser2Dto(User user){
        UserDto dto = new UserDto();
        BeanUtils.copyProperties(user,dto);
        return dto;
    }


    public static User convertUserDto2User(UserDto dto){
        User user = new User();
        BeanUtils.copyProperties(dto,user);
        return user;
    }

    /**
     * List : Bo->Dto
     */
    public static List<UserDto> convertUserList2Dto(List<User> users) {
        // 判空
        if (CollectionUtils.isEmpty(users)) {
            return new ArrayList<>();
        }

        // 数据流转换
        return users.stream().map(UserObjectConvert::convertUser2Dto).collect(Collectors.toList());
    }

}
