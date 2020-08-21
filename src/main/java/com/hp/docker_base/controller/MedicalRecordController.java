package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.MedicalRecord;
import com.hp.docker_base.bean.MedicalRecord;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.dto.SortDto;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.IMedicalRecordService;
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
@RequestMapping("/medical/record")
@Api(tags = "【前端开放】就诊记录API", description = "科室API")
public class MedicalRecordController extends BaseController {

    @Autowired
    private IMedicalRecordService medicalRecordService;



    @ApiOperation(value = "新增就诊记录信息", notes = "新增就诊记录信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordJsonStr", paramType = "query", required = true,
                    value = "" +
                            "就诊记录信息（Json字符串）\n{\n" +
                            "  \"patientId\": \"病人id\",\n" +
                            "  \"doctorId\": \"医生编号\",\n" +
                            "  \"record\": \"简介\",\n" +
                            "  \"treatmentPlan\": \"部门编号\",\n" +
                            "  \"sort\": \"排序\"\n" +
                            "}")
    })
    @PostMapping("/new")
    @MyLog("新增就诊记录信息")
    public Map<String,Object> doPostNewMedicalRecordInfo(
            @RequestParam(value = "medicalRecordJsonStr") String medicalRecordJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        MedicalRecord medicalRecord = JSONObject.parseObject(medicalRecordJsonStr,MedicalRecord.class);
        ValidateUtils.validateGroup(medicalRecord, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、新增就诊记录信息
        int addCount = medicalRecordService.addMedicalRecordInfo(
                medicalRecord,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                null);
    }



    @ApiOperation(value = "查询分页就诊记录", notes = "查询分页就诊记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "postId", value = "身份证号", paramType = "query", required = true),
            @ApiImplicitParam(name = "keywords", value = "支持名称、手机号、邮箱", paramType = "query", required = false),
            @ApiImplicitParam(name = "pageNum", paramType = "query", required = true,
                    value = "1 就是查第一页，每页10条记录"),
    })
    @GetMapping("/page/list")
    @MyLog("查询分页就诊记录")
    public  Map<String,Object>  doQueryMedicalRecordPageList(
            @RequestParam(value = "postId") String postId,
            @RequestParam(value = "keywords",required = false) String keywords,
            @RequestParam(value = "pageNum") int pageNum) {

        PageUtil.startPage(pageNum);

        // 查询所有的就诊记录
        List<MedicalRecord>  medicalRecordList = medicalRecordService.queryMedicalRecordPageList(postId,keywords);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),new PageInfo(medicalRecordList));
    }

    @ApiOperation(value = "查询单个就诊记录信息", notes = "查询单个就诊记录信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = false),
    })
    @GetMapping("/{medicalRecordId}")
    @MyLog("查询单个账户信息")
    public Map<String,Object> doGetAccount(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            HttpServletRequest request) {

        MedicalRecord medicalRecord = medicalRecordService.queryMedicalRecordByUUID(medicalRecordId);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),medicalRecord);
    }

  

    @ApiOperation(value = "编辑就诊记录", notes = "编辑就诊记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "medicalRecordJsonStr", paramType = "query", required = true,
                    value = "" +
                            "就诊记录信息（Json字符串）\n{\n" +
                            "  \"patientId\": \"病人id\",\n" +
                            "  \"doctorId\": \"医生编号\",\n" +
                            "  \"record\": \"简介\",\n" +
                            "  \"treatmentPlan\": \"部门编号\",\n" +
                            "  \"sort\": \"排序\"\n" +
                            "}")
    })
    @PutMapping("/{medicalRecordId}")
    @MyLog("编辑就诊记录")
    public Map<String,Object> doPutAccountAllInfo(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "medicalRecordJsonStr") String medicalRecordJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        MedicalRecord medicalRecord = JSONObject.parseObject(medicalRecordJsonStr,MedicalRecord.class);
        ValidateUtils.validateGroup(medicalRecord, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑账户基础属性信息记录
        int retAccountInfo = medicalRecordService.editMedicalRecordInfo(
                medicalRecordId,
                medicalRecord,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                retAccountInfo);
    }


    @ApiOperation(value = "获取就诊记录默认排序值", notes = "获取就诊记录默认排序值，然后+1返回")
    @GetMapping("/sort")
    public  Map<String,Object> doQueryDefaultSort() {

        // 1、获取新增账户的默认排序值
        int defaultSort = medicalRecordService.findDefaultSort();

        SortDto sortDto = new SortDto();
        sortDto.setSort(defaultSort);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                sortDto);
    }


    @ApiOperation(value = "删除就诊记录信息", notes = "删除就诊记录信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true)
    })
    @DeleteMapping("/{medicalRecordId}")
    @MyLog("删除就诊记录信息")
    public Map<String,Object> doDeleteMedicalRecord(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、删除单个账户信息
        int count = medicalRecordService.deleteMedicalRecordInfo(medicalRecordId,
                currentUser.getUserName());

        if (count == 0) {
            return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),"删除就诊记录信息失败",null);
        }
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }


}