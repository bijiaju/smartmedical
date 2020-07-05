package com.hp.docker_base.controller;

import com.hp.docker_base.bean.Role;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IRoleService;
import com.hp.docker_base.util.CommonUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/role")
@Api(tags = "【前端开放】角色相关API", description = "角色相关API")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @ApiOperation(value = "获取所有的角色", notes = "获取所有的角色")
    @GetMapping("/list")
    public Map<String,Object> doQueryRoleList() {

        List<Role> allRoles = roleService.findAllRoles();

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),allRoles);
    }


}
