package com.hp.docker_base.controller;


import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.MedicalRecord;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.IMedicalRecordService;
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
@RequestMapping("/medical/record")
@Api(tags = "【前端开放】就诊记录API", description = "科室API")
public class MedicalRecordController {

    @Autowired
    private IMedicalRecordService medicalRecordService;

    @ApiOperation(value = "根据身份证查询某人的就诊记录", notes = "根据身份证查询某人的就诊记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "postId", value = "身份证号", paramType = "path", required = true),
    })
    @GetMapping("/postId/{postId}")
    @MyLog("根据身份证查询某人的就诊记录")
    public  Map<String,Object>  doQueryMedicalRecord(
            @PathVariable(value = "postId") String postId) {

        // 查询所有的科室
        List<MedicalRecord> medicalRecords = medicalRecordService.queryMedicalRecordByPostId(postId);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),medicalRecords);
    }


}