package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.bo.ExtendAttributeValueBo;
import com.hp.docker_base.bean.dto.FeatureCategoryDto;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeValueDto;
import com.hp.docker_base.bean.em.EnumExtendAttributeCategory;
import com.hp.docker_base.bean.em.EnumExtendAttributeType;
import com.hp.docker_base.bean.response.ResponseVo;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDiagnosticFeatureService;
import com.hp.docker_base.util.CommonUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
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
public class DiagnosticFeatureController extends BaseController {

    @Autowired
    private IDiagnosticFeatureService featureService;

  /*  @ApiOperation(value = "根据科室查诊断特征", notes = "查询科室的通用诊断特征")
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
    }*/



    @ApiOperation(value = "获取的就诊记录特征值")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "query", required = true),
           // @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true)
    })
    @GetMapping("/{medicalRecordId}/extend/attribute")
    public ResponseVo<ExtendAttributeDto> doQueryAccountExtendAttributeInfo(
           // @RequestParam(value = "category") String category,
            @PathVariable(value = "medicalRecordId") String medicalRecordId) {

        // 1、查询账户扩展属性信息
        List<ExtendAttributeDto> accountExtendAttributeList = featureService.queryAccountExtendAttributeInfo(
                null, medicalRecordId);

        return ResponseVo.ok(accountExtendAttributeList);
    }

    @ApiOperation(value = "新增特征值", notes = "新增特征值")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "extendJsonStr", paramType = "query", required = false,
                    value = "账户机构扩展属性信息（Json字符串）\n[{\n" +
                            "  \"attributeId\": \"扩展属性编号\",\n" +
                            "  \"attributeFieldName\": \"扩展属性字段名\",\n" +
                            "  \"attributeFieldValue\": \"扩展属性字段值\"\n" +
                            "}]"),
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "query", required = false),
            @ApiImplicitParam(name = "category", value = "分类编号", paramType = "query", required = true)
    })
    @PostMapping("/new")
    public ResponseVo<ExtendAttributeValueBo> doPostNewAccountExtAttributeInfo(
            @RequestParam(value = "extendJsonStr") String extendJsonStr,
            @RequestParam(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "category") String category,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 3、账户扩展属性信息
        List<ExtendAttributeValueDto> extendAttributeInfoList = JSONObject.parseArray(extendJsonStr, ExtendAttributeValueDto.class);

        // 5、新增账户各属性信息记录
        featureService.addAccountExtendAttribute(
                medicalRecordId,
                category,
                extendAttributeInfoList,
                currentUser.getUserName()
        );

        return ResponseVo.ok(null);
    }

    @ApiOperation(value = "编辑账户的扩展属性信息", notes = "由平台租户管理员编辑管理下的某个账户的扩展属性信息，扩展属性由租户管理员自定义")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accountExtendJsonStr", paramType = "query", required = false,
                    value = "账户机构扩展属性信息（Json字符串）\n[{\n" +
                            "  \"attributeId\": \"扩展属性编号\",\n" +
                            "  \"attributeFieldName\": \"扩展属性字段名\",\n" +
                            "  \"attributeFieldValue\": \"扩展属性字段值\"\n" +
                            "}]"),
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "query", required = false),
            @ApiImplicitParam(name = "category", value = "分类编号", paramType = "query", required = true)
    })
    @PutMapping("/edit/extend")
    public ResponseVo<ExtendAttributeDto> doPutAccountExtendInfo(
            @RequestParam(value = "extendJsonStr") String extendJsonStr,
            @RequestParam(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "category") String category,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 3、账户扩展属性信息
        List<ExtendAttributeValueDto> extendAttributeInfoList = JSONObject.parseArray(extendJsonStr, ExtendAttributeValueDto.class);

        // 3、编辑账户扩展属性信息记录
        List<ExtendAttributeDto> ret = featureService.editAccountExtendAttributeInfo(
                medicalRecordId,
                category,
                extendAttributeInfoList,
                currentUser.getUserName()
        );

        return ResponseVo.ok(ret);
    }


    @ApiOperation(value = "删除就诊记录的特征值", notes = "删除就诊记录的特征值")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "attributeIdStr", value = "互斥账户组编号字符串，中间以','隔开", paramType = "query", required = true)
    })
    @DeleteMapping("/delete")
    @MyLog("删除就诊记录的特征值")
    public ResponseVo doDeleteAccount(
            @RequestParam(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "attributeIdStr") String attributeIdStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        List<String> memberList = Arrays.asList(attributeIdStr.split(","));
        // 2、删除单个账户信息
        int count = featureService.deleteAccountByAccountId(medicalRecordId,memberList, currentUser.getUserName());

        if (count == 0) {
            return ResponseVo.error("删除账户失败!");
        }

        return ResponseVo.ok("删除账户成功！");
    }

}