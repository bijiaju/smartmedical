package com.hp.docker_base.controller;



import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.annotation.SysLog;
import com.hp.docker_base.bean.dto.DataUniqueDto;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.dto.UserDto;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.em.EnumYesOrNo;
import com.hp.docker_base.service.IRoleUserService;
import com.hp.docker_base.service.ISysLogService;
import com.hp.docker_base.service.IUserService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.IPUtils;
import com.hp.docker_base.util.MD5Utils;
import com.hp.docker_base.util.PageUtil;
import com.hp.docker_base.util.convert.UserObjectConvert;
import com.hp.docker_base.util.validate.ValidateUtils;
import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@Api(tags = "【前端开放】账户相关API", description = "账户相关API")
@RestController
@RequestMapping("/user")
public class UserController extends BaseController{

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleUserService roleUserService;

    @Autowired
    public ISysLogService sysLogService;

    /**
     * 获取所有的账户
     */
    @ApiOperation(value = "获取账户列表", notes = "获取账户列表")
    @GetMapping("/list")
    @MyLog("获取账户列表")
    public Map<String,Object> doQueryAccountList() {

        List<User> allUsers = userService.findAllUsers(null,
                null);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(), UserObjectConvert.convertUserList2Dto(allUsers));
    }

    @ApiOperation(value = "查询单个账户信息", notes = "查询单个账户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accountId", value = "账户编号", paramType = "path", required = true)
    })
    @GetMapping("/{accountId}")
    @MyLog("查询单个账户信息")
    public Map<String,Object> doGetAccount(
            @PathVariable(value = "accountId") String accountId,
            HttpServletRequest request) {

        User user = userService.findUserByUUID(accountId);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),user);
    }


    @ApiOperation(value = "分页获取账户列表", notes = "分页获取账户列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "query", required = false),
            @ApiImplicitParam(name = "keywords", value = "支持名称、手机号、邮箱", paramType = "query", required = false),
            @ApiImplicitParam(name = "pageNum", paramType = "query", required = true,
                    value = "1 就是查第一页，每页10条记录"),
    })
    @GetMapping("/page/list")
    @MyLog("分页获取账户列表")
    public Map<String,Object> doQueryAccountPageList(
            @RequestParam(value = "departmentId",required = false) String departmentId,
            @RequestParam(value = "keywords",required = false) String keywords,
            @RequestParam(value = "pageNum") int pageNum) {

        PageUtil.startPage(pageNum);
        List<User> allUsers = userService.findAllUsers(departmentId,keywords);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(), new PageInfo(allUsers));
    }


    @ApiOperation(value = "注册账户", notes = "新增账户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accountJsonStr", paramType = "query", required = true,
                    value = "账户信息（Json字符串）\n{\n" +
                            "  \"userName\": \"账户名称，必填\",\n" +
                            "  \"password\": \"账户密码，未加密，如不传，则由系统按照规则自动生成\",\n" +
                            "  \"email\": \"账户邮箱\",\n" +
                            "  \"departmentId\": \"科室编号\",\n" +
                            "  \"phone\": \"账户手机号\",\n" +
                            "}"),
    })
    @PostMapping("/new")
    @MyLog("注册账户")
    public Map<String,Object> doPostNewUserInfo(
            @RequestParam(value = "accountJsonStr") String accountJsonStr){

        // 1、解析账户Json字符串参数
        UserDto userInfo = JSONObject.parseObject(accountJsonStr, UserDto.class);

        ValidateUtils.validateGroup(userInfo, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 2、新增账户各属性信息记录
        int addCount = userService.addUserInfo(userInfo);
        if(addCount != 1){
            return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"插入失败",null);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }

    @ApiOperation(value = "编辑账户", notes = "编辑账户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accountId", value = "账户编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "accountJsonStr", paramType = "query", required = true,
                    value = "账户信息（Json字符串）\n{\n" +
                            "  \"userName\": \"账户名称，必填\",\n" +
                            "  \"password\": \"账户密码，未加密，如不传，则由系统按照规则自动生成\",\n" +
                            "  \"email\": \"账户邮箱\",\n" +
                            "  \"departmentId\": \"科室编号\",\n" +
                            "  \"phone\": \"账户手机号\",\n" +
                            "}"),
    })
    @PutMapping("/{accountId}")
    @MyLog("编辑账户")
    public Map<String,Object> doPutAccountAllInfo(
            @PathVariable(value = "accountId") String accountId,
            @RequestParam(value = "accountJsonStr") String accountJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        UserDto userInfo = JSONObject.parseObject(accountJsonStr, UserDto.class);

        // 2、解析账户Json字符串参数
        ValidateUtils.validateGroup(userInfo, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑账户基础属性信息记录
        UserDto retAccountInfo = userService.editAccountInfo(
                accountId,
                userInfo,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),retAccountInfo);
    }

    @ApiOperation(value = "重置密码", notes = "重置密码")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accountId", value = "账户编号", paramType = "path", required = true),
    })
    @PutMapping("/{accountId}/password")
    @MyLog("重置密码")
    public Map<String,Object> doPutAccountAllInfo(
            @PathVariable(value = "accountId") String accountId,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 3、编辑账户基础属性信息记录
        userService.editAccountPassword(
                accountId,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }

    @ApiOperation(value = "删除单个账户信息", notes = "管理员手动删除单个账户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accountId", value = "账户编号", paramType = "path", required = true)
    })
    @DeleteMapping("/{accountId}")
    @MyLog("删除单个账户信息")
    public Map<String,Object> doDeleteAccount(
            @PathVariable(value = "accountId") String accountId,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、删除单个账户信息
        int count = userService.deleteAccountByAccountId(accountId,
                currentUser.getUserName());

        if (count == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"删除用户失败",null);
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

    // region 登录类方法
    @ApiOperation(value = "登录验证" , notes = "登录验证")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userName", value = "帐户名", paramType = "query", required = true),
            @ApiImplicitParam(name = "roleId", value = "帐户名", paramType = "query", required = true),
            @ApiImplicitParam(name = "password", paramType = "query", required = true, value = "密码")
    })
    @PostMapping("/login")
    @MyLog("登录平台")
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

        User user = (User) session.getAttribute("user");
        if(user != null){
            // 插入退出日志
            SysLog sysLog = new SysLog();
            sysLog.setUsername(user.getUserName());
            sysLog.setCreateDate(new Date());
            sysLog.setOperation("退出平台");
            sysLog.setMethod("loginOut");
            sysLog.setIp(IPUtils.getIpAddress(request));
            sysLog.setParams("[]");
            sysLogService.save(sysLog);
        }

        session.removeAttribute("user");
        session.invalidate();
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }
    // endregion

}