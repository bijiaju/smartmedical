package com.hp.docker_base.controller;


import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.Menu;
import com.hp.docker_base.bean.dto.MenuDto;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.IMenuService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.convert.MenuObjectConvert;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;

    @ApiOperation(value = "查询所有的科室", notes = "查询所有的科室")
    @GetMapping("/list")
    public  Map<String,Object>  doQueryDepartmentList() {

        // 查询所有的科室
        List<Department>  departmentList = departmentService.queryAllDepartmentList();
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),departmentList);
    }


}