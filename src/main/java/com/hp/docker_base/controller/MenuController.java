package com.hp.docker_base.controller;


import com.hp.docker_base.bean.Menu;
import com.hp.docker_base.bean.dto.MenuDto;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IMenuService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.convert.MenuObjectConvert;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@RestController
@RequestMapping("/menu")
@Api(tags = "【前端开放】菜单相关API", description = "菜单相关API")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @ApiOperation(value = "查询账户对应的菜单", notes = "查询账户对应的应用资源")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "账户编号", paramType = "path", required = true),
    })
    @GetMapping("/{userId}/tree/list")
    public  Map<String,Object>  doQueryMenuTreeList(
            @PathVariable(value = "userId") String userId) {

        // 查询账户的菜单
        //List<Menu> menuList = menuService.queryAllMenuList();
        List<Menu> menuList = menuService.queryMenuListByUserId(userId);
        List<MenuDto> menuDtos1 = MenuObjectConvert.convertMenuList2Dto(menuList);
        List<MenuDto> menuDtos = MenuObjectConvert.buildMenuTreeList(menuDtos1);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),menuDtos);
    }


}