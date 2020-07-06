package com.hp.docker_base.controller;


import com.hp.docker_base.bean.Department;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.IDiagnosticFeatureService;
import com.hp.docker_base.util.CommonUtil;
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
@RequestMapping("/feature")
@Api(tags = "【前端开放】诊断特征API", description = "诊断特征API")
public class DiagnosticFeatureController {

    @Autowired
    private IDiagnosticFeatureService featureService;

    @ApiOperation(value = "查询科室的通用诊断特征", notes = "查询科室的通用诊断特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true)
    })
    @GetMapping("/base/{departmentId}")
    public  Map<String,Object>  doQueryDiagnosticFeatureList(@PathVariable(value = "departmentId")
                                                                         String departmentId) {

        // 查询所有的科室
       /// List<Department>  departmentList = departmentService.queryAllDepartmentList();
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }


}