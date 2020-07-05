package com.hp.docker_base.controller;

import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.dto.PatientDto;
import com.hp.docker_base.bean.dto.UserDto;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IPatientService;
import com.hp.docker_base.service.IRoleService;
import com.hp.docker_base.util.CommonUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/patient")
@Api(tags = "【前端开放】病人相关API", description = "病人相关API")
public class PatientController extends BaseController{

    @Autowired
    private IPatientService patientService;

    @ApiOperation(value = "新增病人信息", notes = "新增病人信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "patientJsonStr", paramType = "query", required = true,
                    value = "账户信息（Json字符串）\n{\n" +
                            "  \"name\": \"病人名，必填\",\n" +
                            "  \"postId\": \"病人身份证\",\n" +
                            "  \"sex\": \"性别\",\n" +
                            "  \"medicalHistory\": \"病史\"\n" +
                            "}"),
    })
    @PostMapping("/new")
    public Map<String,Object> doPostNewPatientInfo(
            @RequestParam(value = "patientJsonStr") String patientJsonStr,
            HttpServletRequest request
            ){

        User currentUser = getCurrentUser(request);
        // 1、解析账户Json字符串参数
        PatientDto patientDto = JSONObject.parseObject(patientJsonStr, PatientDto.class);

        // 2、新增病人各属性信息记录
        int addCount = patientService.addPatientInfo(patientDto,currentUser.getUserName());
        if(addCount != 1){
            CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"插入失败",null);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }


    @ApiOperation(value = "新增病人信息", notes = "新增病人信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "patientJsonStr", paramType = "query", required = true,
                    value = "账户信息（Json字符串）\n{\n" +
                            "  \"name\": \"病人名，必填\",\n" +
                            "  \"postId\": \"病人身份证\",\n" +
                            "  \"sex\": \"性别\",\n" +
                            "  \"medicalHistory\": \"病史\"\n" +
                            "}"),
    })
    @PutMapping("/{uuid}")
    public Map<String,Object> doPutPatientInfo(
            @PathVariable(value = "uuid") String uuid,
            @RequestParam(value = "patientJsonStr") String patientJsonStr,
            HttpServletRequest request
    ){

        User currentUser = getCurrentUser(request);
        // 1、解析账户Json字符串参数
        PatientDto patientDto = JSONObject.parseObject(patientJsonStr, PatientDto.class);
        patientDto.setUuid(uuid);

        // 2、新增病人各属性信息记录
        int addCount = patientService.modifyPatientInfo(patientDto,currentUser.getUserName());
        if(addCount != 1){
            CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"插入失败",null);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }


}
