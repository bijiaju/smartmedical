package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.dto.DataUniqueDto;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.dto.UserDto;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.em.EnumYesOrNo;
import com.hp.docker_base.service.IRoleUserService;
import com.hp.docker_base.service.IUserService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.MD5Utils;
import com.hp.docker_base.util.convert.UserObjectConvert;
import com.hp.docker_base.util.validate.ValidateUtils;
import com.hp.docker_base.util.validate.group.MiniValidation;
import com.hp.docker_base.util.validate.group.UpdateValidation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@Api(tags = "【前端开放】4-账户相关API", description = "账户相关API")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleUserService roleUserService;

    /**
     * 获取所有的账户
     */
    @ApiOperation(value = "获取账户列表", notes = "获取账户列表")
    @GetMapping("/list")
    public Map<String,Object> doQueryAccountList() {

        List<User> allUsers = userService.findAllUsers();

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(), UserObjectConvert.convertUserList2Dto(allUsers));
    }


    @ApiOperation(value = "注册账户", notes = "新增账户信息")
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

        ValidateUtils.validateGroup(userInfo, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 2、新增账户各属性信息记录
        int addCount = userService.addUserInfo(userInfo);
        if(addCount != 1){
            CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"插入失败",null);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }

    @ApiOperation(value = "查询账户名是否唯一，唯一返回1，不唯一返回0")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userName", value = "账户名称", paramType = "path", required = true),
            @ApiImplicitParam(name = "userId", value = "账户id,新增传null", paramType = "query", required = true)
    })
    @GetMapping("/name/{userName}")
    public Map<String,Object> doQueryUserNameIsUnique(
            @PathVariable(value = "userName") String userName,
            @RequestParam(value = "userId") String userId) {

        boolean isUnique = userService.queryRoleNameIsUnique(userId,userName);

        DataUniqueDto dataUniqueInfo = new DataUniqueDto();
        dataUniqueInfo.setUnique(isUnique ? EnumYesOrNo.YES.getCode() : EnumYesOrNo.NO.getCode());

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                dataUniqueInfo);
    }

    @ApiOperation(value = "查询手机号是否唯一，唯一返回1，不唯一返回0")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "phone", value = "手机号", paramType = "path", required = true),
            @ApiImplicitParam(name = "userId", value = "账户id,新增传null", paramType = "query", required = true)
    })
    @GetMapping("/phone/{phone}")
    public Map<String,Object> doQueryPhoneIsUnique(
            @PathVariable(value = "phone") String phone,
            @RequestParam(value = "userId") String userId) {

        boolean isUnique = userService.queryPhoneIsUnique(userId,phone);

        DataUniqueDto dataUniqueInfo = new DataUniqueDto();
        dataUniqueInfo.setUnique(isUnique ? EnumYesOrNo.YES.getCode() : EnumYesOrNo.NO.getCode());

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                dataUniqueInfo);
    }

    @ApiOperation(value = "查询邮箱号是否唯一，唯一返回1，不唯一返回0")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "email", value = "邮箱", paramType = "path", required = true),
            @ApiImplicitParam(name = "userId", value = "账户id,新增传null", paramType = "query", required = true)
    })
    @GetMapping("/email/{email}")
    public Map<String,Object> doQueryEmailIsUnique(
            @PathVariable(value = "email") String email,
            @RequestParam(value = "userId") String userId) {

        boolean isUnique = userService.queryEmailIsUnique(userId,email);

        DataUniqueDto dataUniqueInfo = new DataUniqueDto();
        dataUniqueInfo.setUnique(isUnique ? EnumYesOrNo.YES.getCode() : EnumYesOrNo.NO.getCode());

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                dataUniqueInfo);
    }

    // region 新增类方法
    @ApiOperation(value = "登录验证" , notes = "登录验证")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userName", value = "帐户名", paramType = "query", required = true),
            @ApiImplicitParam(name = "roleId", value = "帐户名", paramType = "query", required = true),
            @ApiImplicitParam(name = "password", paramType = "query", required = true, value = "密码")
    })
    @PostMapping("/login")
    public Map<String,Object> doPostNewApplicationResource(
            @RequestParam(value = "userName") String userName,
            @RequestParam(value = "roleId") String roleId,
            @RequestParam(value = "password") String password,
            HttpServletRequest request) {
        // 1、获取用户信息
        User user = userService.queryUserByNameAndPassword(userName, MD5Utils.string2MD5(password));
        if(user == null){
           return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"账户或密码错误",null);
        }else{
            // 根据roleID获取账户列表
            List<String> userIds = roleUserService.queryRoleUserByRoleId(roleId);
            if(!userIds.contains(user.getUuid())){
                return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"账户无此角色",null);
            }
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),UserObjectConvert.convertUser2Dto(user));
    }


    @ApiOperation(value = "退出登录" , notes = "退出登录")
    @PostMapping("/loginout")
    public Map<String,Object> loginout(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.removeAttribute("user");
        session.invalidate();
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }


}