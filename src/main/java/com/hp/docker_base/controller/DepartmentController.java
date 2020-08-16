package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.dto.SortDto;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.PageUtil;
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
@RequestMapping("/department")
@Api(tags = "【前端开放】科室API", description = "科室API")
public class DepartmentController extends BaseController{

    @Autowired
    private IDepartmentService departmentService;

    @ApiOperation(value = "查询所有的科室", notes = "查询所有的科室")
    @GetMapping("/list")
    @MyLog("查询所有的科室")
    public  Map<String,Object>  doQueryDepartmentList() {

        // 查询所有的科室
        List<Department>  departmentList = departmentService.queryAllDepartmentList(null);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),departmentList);
    }

    @ApiOperation(value = "查询分页科室", notes = "查询分页科室")
    @ApiImplicitParams({

            @ApiImplicitParam(name = "keywords", value = "支持名称、手机号、邮箱", paramType = "query", required = false),
            @ApiImplicitParam(name = "pageNum", paramType = "query", required = true,
                    value = "1 就是查第一页，每页10条记录"),
    })
    @GetMapping("/page/list")
    @MyLog("查询分页科室")
    public  Map<String,Object>  doQueryDepartmentPageList(
            @RequestParam(value = "keywords",required = false) String keywords,
            @RequestParam(value = "pageNum") int pageNum) {

        PageUtil.startPage(pageNum);

        // 查询所有的科室
        List<Department>  departmentList = departmentService.queryAllDepartmentList(keywords);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),new PageInfo(departmentList));
    }

    @ApiOperation(value = "查询单个科室信息", notes = "查询单个科室信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = false),
    })
    @GetMapping("/{departmentId}")
    @MyLog("查询单个账户信息")
    public Map<String,Object> doGetAccount(
            @PathVariable(value = "departmentId") String departmentId,
            HttpServletRequest request) {

        Department department = departmentService.queryDepartmentByUUID(departmentId);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),department);
    }

    @ApiOperation(value = "新增科室信息", notes = "新增科室信息，包括应用名称、排序、备注")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentJsonStr", paramType = "query", required = true,
                    value = "" +
                            "科室信息（Json字符串）\n{\n" +
                            "  \"name\": \"名称\",\n" +
                            "  \"sort\": \"排序\",\n" +
                            "  \"remark\": \"备注\"\n" +
                            "}")
    })
    @PostMapping("/new")
    @MyLog("新增科室信息")
    public Map<String,Object> doPostNewDepartmentInfo(
            @RequestParam(value = "departmentJsonStr") String departmentJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        Department department = JSONObject.parseObject(departmentJsonStr,Department.class);
        ValidateUtils.validateGroup(department, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、新增科室信息
        int addCount = departmentService.addDepartmentInfo(
                department,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                null);
    }

    @ApiOperation(value = "编辑科室", notes = "编辑科室")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "departmentJsonStr", paramType = "query", required = true,
                    value = "科室信息（Json字符串）\n{\n" +
                            "  \"name\": \"名称\",\n" +
                            "  \"sort\": \"排序\",\n" +
                            "  \"remark\": \"备注\"\n" +
                            "}")
    })
    @PutMapping("/{departmentId}")
    @MyLog("编辑科室")
    public Map<String,Object> doPutAccountAllInfo(
            @PathVariable(value = "departmentId") String departmentId,
            @RequestParam(value = "departmentJsonStr") String departmentJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        Department department = JSONObject.parseObject(departmentJsonStr,Department.class);
        ValidateUtils.validateGroup(department, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑账户基础属性信息记录
        Department retAccountInfo = departmentService.editDepartmentInfo(
                departmentId,
                department,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),retAccountInfo);
    }


    @ApiOperation(value = "获取科室默认排序值", notes = "获取科室默认排序值，然后+1返回")
    @GetMapping("/sort")
    public  Map<String,Object> doQueryDefaultSort() {

        // 1、获取新增账户的默认排序值
        int defaultSort = departmentService.findDefaultSort();

        SortDto sortDto = new SortDto();
        sortDto.setSort(defaultSort);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                sortDto);
    }


    @ApiOperation(value = "删除科室信息", notes = "删除科室信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true)
    })
    @DeleteMapping("/{departmentId}")
    @MyLog("删除科室信息")
    public Map<String,Object> doDeleteDepartment(
            @PathVariable(value = "departmentId") String departmentId,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、删除单个账户信息
        int count = departmentService.deleteDepartmentInfo(departmentId,
                currentUser.getUserName());

        if (count == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"删除科室信息失败",null);
        }
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }

}