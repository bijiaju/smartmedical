package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.Menu;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.dto.MenuDto;
import com.hp.docker_base.bean.dto.RoleDto;
import com.hp.docker_base.bean.dto.SortDto;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IMenuService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.convert.MenuObjectConvert;
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

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@RestController
@RequestMapping("/menu")
@Api(tags = "【前端开放】菜单相关API", description = "菜单相关API")
public class MenuController extends BaseController{

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
        List<MenuDto> menuDtos1 = MenuObjectConvert.convertMenu2DtoList(menuList);
        List<MenuDto> menuDtos = MenuObjectConvert.buildMenuTreeList(menuDtos1);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),menuDtos);
    }


    @ApiOperation(value = "新增菜单信息", notes = "新增菜单信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "resourceJsonStr", paramType = "query", required = true,
                    value = "应用权限资源信息（Json字符串）\n{\n" +
                            "  \"name\": \"必填，资源名称\",\n" +
                            "  \"parentId\": \"父级编号\",\n" +
                            "  \"sort\": 1\n" +
                            "}")
    })
    @PostMapping("/new")
    public Map<String,Object> doPostNewApplicationResource(
            @RequestParam(value = "resourceJsonStr") String resourceJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        MenuDto applicationResourceDto = JSONObject.parseObject(resourceJsonStr, MenuDto.class);

        // 3、新增应用权限资源
        ValidateUtils.validateGroup(applicationResourceDto, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验
        MenuDto retApplicationResourceDto = menuService.addMenuInfo(
                applicationResourceDto,
                currentUser.getUserName());

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                retApplicationResourceDto);
    }

    @ApiOperation(value = "编辑菜单信息", notes = "编辑菜单信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "menuId", value = "应用角色编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "resourceJsonStr", paramType = "query", required = true,
                    value = "应用权限资源信息（Json字符串）\n{\n" +
                            "  \"name\": \"必填，资源名称\",\n" +
                            "  \"parentId\": \"父级编号\",\n" +
                            "  \"sort\": 1\n" +
                            "}")
    })
    @PutMapping("/{menuId}")
    public Map<String,Object> doPostNewApplicationRoleInfo(
            @PathVariable(value = "menuId") String menuId,
            @RequestParam(value = "resourceJsonStr") String resourceJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        MenuDto applicationResourceDto = JSONObject.parseObject(resourceJsonStr, MenuDto.class);
        ValidateUtils.validateGroup(applicationResourceDto, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑角色
        applicationResourceDto.setUuid(menuId);
        MenuDto menuDto = menuService.modifyMenuInfo(
                applicationResourceDto,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                menuDto);
    }

    @ApiOperation(value = "获取菜单默认排序值", notes = "获取菜单默认排序值，然后+1返回")
    @GetMapping("/sort")
    public  Map<String,Object> doQueryDefaultMenuSort(
            @RequestParam(value = "parentId") String parentId
    ) {

        // 1、获取新增账户的默认排序值
        int defaultSort = menuService.findDefaultMenuSort(parentId);

        SortDto sortDto = new SortDto();
        sortDto.setSort(defaultSort);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                sortDto);
    }

    @ApiOperation(value = "删除菜单")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "menuId", value = "菜单编号", paramType = "path", required = true)
    })
    @DeleteMapping("/{menuId}")
    public Map<String,Object> doDeleteMenu(
            @PathVariable(value = "menuId") String menuId,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、删除菜单
        int count = menuService.deleteMenuInfo(
                menuId,
                currentUser.getUserName()
        );

        if (count == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),"删除菜单失败!",null);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                null);
    }


}