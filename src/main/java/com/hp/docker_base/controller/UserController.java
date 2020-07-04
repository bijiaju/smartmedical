package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.user.User;
import com.hp.docker_base.bean.user.UserDto;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IUserService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.convert.UserObjectConvert;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    /**
     * 获取所有的账户
     */
    @ApiOperation(value = "获取账户列表", notes = "获取账户列表")
    @GetMapping("/list")
    public Map<String,Object> doQueryAccountList() {

        List<User> allUsers = userService.findAllUsers();

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(), UserObjectConvert.convertUserList2Dto(allUsers));
    }


    @ApiOperation(value = "新增账户信息", notes = "新增账户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accountJsonStr", paramType = "query", required = true,
                    value = "账户信息（Json字符串）\n{\n" +
                            "  \"userName\": \"账户名称，必填\",\n" +
                            "  \"password\": \"账户密码，未加密，如不传，则由系统按照规则自动生成\",\n" +
                            "  \"email\": \"账户邮箱\",\n" +
                            "  \"phone\": \"账户手机号\",\n" +
                            "}"),
    })
    @PostMapping("/new")
    public Map<String,Object> doPostNewUserInfo(
            @RequestParam(value = "accountJsonStr") String accountJsonStr){

        // 1、解析账户Json字符串参数
        UserDto userInfo = JSONObject.parseObject(accountJsonStr, UserDto.class);

        // 2、新增账户各属性信息记录
        int addCount = userService.addUserInfo(userInfo);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),"请求成功",null);
    }
}