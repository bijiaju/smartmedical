package com.hp.docker_base.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.Role;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.dto.DataUniqueDto;
import com.hp.docker_base.bean.dto.RoleDto;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.em.EnumYesOrNo;
import com.hp.docker_base.service.IRoleService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.PageUtil;
import com.hp.docker_base.util.convert.CommonObjectTypeConvertUtils;
import com.hp.docker_base.util.validate.ValidateUtils;
import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/role")
@Api(tags = "【前端开放】角色相关API", description = "角色相关API")
public class RoleController extends BaseController{

    @Autowired
    private IRoleService roleService;

    @ApiOperation(value = "获取所有的角色", notes = "获取所有的角色")
    @GetMapping("/list")
    @MyLog("获取所有的角色")
    public Map<String,Object> doQueryRoleList() {

        List<Role> allRoles = roleService.findAllRoles(null);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),allRoles);
    }

    @ApiOperation(value = "获取分页角色", notes = "获取分页角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "keywords", value = "关键字，支持角色名称查询", paramType = "query", required = false)
    })
    @GetMapping("/page/list")
    @MyLog("获取分页角色")
    public Map<String,Object> doQueryRolePageList(
            @RequestParam(value = "keywords",required = false) String keywords,
            @RequestParam(value = "pageNum") int pageNum) {

        PageUtil.startPage(pageNum);
        List<Role> allRoles = roleService.findAllRoles(keywords);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(), new PageInfo(allRoles));
    }

    @ApiOperation(value = "查询单个角色信息", notes = "查询单个角色信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleId", value = "角色编号", paramType = "path", required = true)
    })
    @GetMapping("/{roleId}")
    @MyLog("查询单个角色信息")
    public Map<String,Object> doGetRole(
            @PathVariable(value = "roleId") String roleId,
            HttpServletRequest request) {

        Role role = roleService.findRoleByRoleId(roleId);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),role);
    }



    @ApiOperation(value = "删除角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleId", value = "应用角色编号", paramType = "path", required = true)
    })
    @DeleteMapping("/{roleId}")
    @MyLog("删除角色")
    public Map<String,Object> doDeleteApplicationRole(
            @PathVariable(value = "roleId") String roleId,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、删除角色
        int count = roleService.deleteRoleInfo(
                roleId,
                currentUser.getUserName()
        );

        if (count == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),"删除应用角色失败!",null);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }


    @ApiOperation(value = "新增应用角色信息", notes = "新增应用角色信息，包括应用角色名称、编码、描述等信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleJsonStr", paramType = "query", required = true,
                    value = "应用角色信息（Json字符串）\n{\n" +
                            "  \"roleName\": \"应用角色名称\",\n" +
                            "  \"roleCode\": \"应用角色编码\",\n" +
                            "  \"remark\": \"应用角色描述\"\n" +
                            "}")
    })
    @PostMapping("/new")
    @MyLog("新增角色信息")
    public Map<String,Object> doPostNewApplicationRoleInfo(
            @RequestParam(value = "roleJsonStr") String roleJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        RoleDto roleDto = JSONObject.parseObject(roleJsonStr,RoleDto.class);
        ValidateUtils.validateGroup(roleDto, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、新增角色
        int addCount = roleService.addRoleInfo(
                roleDto,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }


    @ApiOperation(value = "编辑应用角色信息", notes = "新增应用角色信息，包括应用角色名称、编码、描述等信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleId", value = "应用角色编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "roleJsonStr", paramType = "query", required = true,
                    value = "应用角色信息（Json字符串）\n{\n" +
                            "  \"roleName\": \"应用角色名称\",\n" +
                            "  \"roleCode\": \"应用角色编码\",\n" +
                            "  \"remark\": \"应用角色描述\"\n" +
                            "}")
    })
    @PutMapping("/{roleId}")
    @MyLog("编辑角色信息")
    public Map<String,Object> doPostNewApplicationRoleInfo(
            @PathVariable(value = "roleId") String roleId,
            @RequestParam(value = "roleJsonStr") String roleJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        RoleDto roleDto = JSONObject.parseObject(roleJsonStr,RoleDto.class);
        ValidateUtils.validateGroup(roleDto, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑角色
        roleDto.setUuid(roleId);
        int addCount = roleService.modifyRoleInfo(
                roleDto,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                null);
    }

    @ApiOperation(value = "添加应用角色下的多个成员账户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleId", value = "应用角色编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "accountMemberIdStr", value = "账户编号，多个编号间以','隔开", paramType = "query", required = true)
    })
    @PostMapping("/{roleId}/member")
    @MyLog("添加角色下的多个成员账户")
    public Map<String,Object> doPostApplicationRoleMember(
            @PathVariable(value = "roleId") String roleId,
            @RequestParam(value = "accountMemberIdStr") String accountMemberIdStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 成员编号集合
        List<String> memberIds = CommonObjectTypeConvertUtils.convertStrToStrList(accountMemberIdStr);

        // 2、 添加应用角色下的多个成员账户
        int addCount = roleService.addRoleMember(
                roleId,
                memberIds,
                currentUser.getUserName()
        );

        if (addCount == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                    EnumOKOrNG.NG.getValue(),
                    null);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                "添加角色成员成功！",
                null);
    }

    @ApiOperation(value = "查询角色名是否唯一，唯一返回1，不唯一返回0")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "roleName", value = "角色名", paramType = "path", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色id,新增传null", paramType = "query", required = true)
    })
    @GetMapping("/rolename/{roleName}")
    public Map<String,Object> doQueryRoleNameIsUnique(
            @PathVariable(value = "roleName") String roleName,
            @RequestParam(value = "roleId") String roleId) {

        boolean isUnique = roleService.queryRoleNameIsUnique(roleId,roleName);

        DataUniqueDto dataUniqueInfo = new DataUniqueDto();
        dataUniqueInfo.setUnique(isUnique ? EnumYesOrNo.YES.getCode() : EnumYesOrNo.NO.getCode());

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                dataUniqueInfo);
    }

}
