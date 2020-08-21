package com.hp.docker_base.controller;


import com.hp.docker_base.bean.dto.FeatureCategoryDto;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.em.EnumExtendAttributeCategory;
import com.hp.docker_base.bean.em.EnumExtendAttributeType;
import com.hp.docker_base.bean.response.ResponseVo;
import com.hp.docker_base.em.EnumOKOrNG;
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

import java.util.ArrayList;
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

    @ApiOperation(value = "根据科室查诊断特征", notes = "查询科室的通用诊断特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true)
    })
    @GetMapping("/base/{departmentId}")
    public  Map<String,Object>  doQueryDiagnosticFeatureList(@PathVariable(value = "departmentId")
                                                                         String departmentId) {

        // 查询所有的科室
       /// List<Department>  departmentList = departmentService.queryAllDepartmentList();
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                null);
    }

    /**
     * 获取所有的账户
     */
    @ApiOperation(value = "获取特征分类列表", notes = "获取特征分类列表")
    @GetMapping("/category/list")
    public Map<String,Object> doQueryFeatureCategoryList() {

        EnumExtendAttributeCategory[] values = EnumExtendAttributeCategory.values();

        List<FeatureCategoryDto> retList = new ArrayList<>();
        for(int i=0;i<values.length;i++){
            FeatureCategoryDto categoryDto = new FeatureCategoryDto();

            categoryDto.setCategory(values[i].getCode());
            categoryDto.setCategoryName(values[i].getDescription());
            retList.add(categoryDto);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(), retList);
    }

    @ApiOperation(value = "获取的基础病史特征信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true)
    })
    @GetMapping("/{departmentId}/extend/attribute")
    public ResponseVo<ExtendAttributeDto> doQueryAccountExtendAttributeInfo(
            @PathVariable(value = "departmentId") String departmentId) {

        // 1、查询账户扩展属性信息
        List<ExtendAttributeDto> accountExtendAttributeList = featureService.queryAccountExtendAttributeInfo(
                departmentId, EnumExtendAttributeCategory.BASIC_INFO.getCode()+"");

        return ResponseVo.ok(accountExtendAttributeList);
    }


}