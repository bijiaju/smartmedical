package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.*;
import com.hp.docker_base.bean.MedicalRecord;
import com.hp.docker_base.bean.algorithm.*;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.bo.MedicalRecordBo;
import com.hp.docker_base.bean.dto.MedicalRecordDto;
import com.hp.docker_base.bean.dto.MedicalRecordDto2;
import com.hp.docker_base.bean.dto.SortDto;
import com.hp.docker_base.bean.dto.TreatmentResultDto;
import com.hp.docker_base.bean.em.EnumTreatState;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.*;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.PageUtil;
import com.hp.docker_base.util.convert.MedicalRecordObjectConvert;
import com.hp.docker_base.util.validate.ValidateUtils;
import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
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

    @Autowired
    private ITreatmentService treatmentService;

    @Autowired
    private ITreatmentObjectionService treatmentObjectionService;

    @Autowired
    private ITreatmentInputDataService inputDataService;




    @ApiOperation(value = "新增就诊记录信息", notes = "新增就诊记录信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordJsonStr", paramType = "query", required = true,
                    value = "" +
                            "就诊记录信息（Json字符串）\n{\n" +
                            "  \"patientId\": \"病人id\",\n" +
                            "  \"doctorId\": \"医生编号\",\n" +
                            "  \"record\": \"记录\",\n" +
                            "  \"treatmentPlan\": \"治疗方案\",\n" +
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
        MedicalRecord ret = medicalRecordService.addMedicalRecordInfo(
                medicalRecord,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                ret);
    }



    @ApiOperation(value = "查询分页就诊记录", notes = "查询分页就诊记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "postId", value = "身份证号", paramType = "query"),
            @ApiImplicitParam(name = "keywords", value = "支持姓名查询", paramType = "query", required = false),
            @ApiImplicitParam(name = "pageNum", paramType = "query", required = true,
                    value = "1 就是查第一页，每页10条记录"),
    })
    @GetMapping("/page/list")
    public  Map<String,Object>  doQueryMedicalRecordPageList(
            @RequestParam(value = "postId",required = false) String postId,
            @RequestParam(value = "keywords",required = false) String keywords,
            @RequestParam(value = "pageNum") int pageNum) {

        PageUtil.startPage(pageNum);

        // 查询所有的就诊记录
        List<MedicalRecordBo>  medicalRecordList = medicalRecordService.queryMedicalRecordPageList(postId,keywords);
        List<MedicalRecordDto2> medicalRecordDto2s = MedicalRecordObjectConvert.convertMedicalRecordList2Dto(medicalRecordList);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),new PageInfo(medicalRecordDto2s));
    }

    @ApiOperation(value = "查询医生分页就诊记录", notes = "查询医生看了几个病人记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "startDate", paramType = "query", required = false,
                    value = "开始日期 2020-08-15 02:39:53"),
            @ApiImplicitParam(name = "endDate", paramType = "query", required = false,
                    value = "结束日期 2020-08-15 02:39:53"),
            @ApiImplicitParam(name = "keywords", value = "支持姓名查询", paramType = "query", required = false),
            @ApiImplicitParam(name = "type", value = "查询状态", paramType = "query", required = false),
            @ApiImplicitParam(name = "pageNum", paramType = "query", required = true,
                    value = "1 就是查第一页，每页10条记录"),
    })
    @GetMapping("/user/page/list")
    public  Map<String,Object>  doQueryUserMedicalRecordPageList(
            @RequestParam(value = "startDate",required = false) String startDate,
            @RequestParam(value = "endDate",required = false) String endDate,
            @RequestParam(value = "keywords",required = false) String keywords,
            @RequestParam(value = "type",required = false) Integer type,
            @RequestParam(value = "pageNum") int pageNum,
            HttpServletRequest request
          ) {
        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        PageUtil.startPage(pageNum);

        // 查询所有的就诊记录
        List<MedicalRecordBo>  medicalRecordList = medicalRecordService.queryDoctorMedicalRecordPageList(currentUser.getUuid(),
                keywords,
                type,
                startDate,
                endDate);
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),new PageInfo(medicalRecordList));
    }

    @ApiOperation(value = "查询单个就诊记录信息", notes = "查询单个就诊记录信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = false),
            @ApiImplicitParam(name = "type", value = "类型,1是算法，2是修改", paramType = "query", required = false),
    })
    @GetMapping("/{medicalRecordId}")
    public Map<String,Object> doGetAccount(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "type",defaultValue = "1") int type,
            HttpServletRequest request) {
        MedicalRecordDto medicalRecordDto = new MedicalRecordDto();
        MedicalRecord medicalRecord = medicalRecordService.queryMedicalRecordByUUID(medicalRecordId);
        if(medicalRecord != null ){
            BeanUtils.copyProperties(medicalRecord,medicalRecordDto);
        }

        FidOutDto medicalResult = getMedicalResult(medicalRecordId,type);
        medicalRecordDto.setActivedRules(medicalResult.getActivedRules());
        medicalRecordDto.setResult(medicalResult.getResult());
        medicalRecordDto.setDisease(medicalResult.getDisease());
        medicalRecordDto.setTreatmentResultPlan(medicalResult.getTreatmentPlan());

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),medicalRecordDto);
    }

    @ApiOperation(value = "查询诊断输入参数和诊断所有结果", notes = "查询诊断输入参数和诊断所有结果")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = false),
    })
    @GetMapping("/treatment/result/{medicalRecordId}")
    public Map<String,Object> doGetResult(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            HttpServletRequest request) {

        TreatmentResult treatmentResult = treatmentService.queryResultByMedicalRecordId(medicalRecordId, EnumTreatState.COMMON.getValue());
        TreatmentResult treatmentObjection = treatmentService.queryResultByMedicalRecordId(medicalRecordId, EnumTreatState.MODIFY.getValue());
        TreatmentInputData treatmentInputData = inputDataService.getTreatmentInputDataByTreamentId(medicalRecordId);

        TreatmentProcessDetailDto processDetailDto = new TreatmentProcessDetailDto();

        // 设置输入参数
        if(treatmentInputData != null){
            FidInDto fidIn = new FidInDto();
            fidIn.setRecId(treatmentInputData.getTreatmentId());
            fidIn.setDeptId(treatmentInputData.getDepartmentId());

            List<DataInDto> dataInDtos = JSON.parseArray(treatmentInputData.getDataInJson(), DataInDto.class);
            fidIn.setDataIn(dataInDtos);
            processDetailDto.setFidInDto(fidIn);
        }

        // 设置自动诊断结果
        FidOutDto autoRet = new FidOutDto();
        if(treatmentResult != null){
            String activeRuleJson = treatmentResult.getActiveRuleJson();
            String outFeatureJson = treatmentResult.getOutFeatureJson();

            List<DataOutDto> dataOutDtos = JSONObject.parseArray(outFeatureJson, DataOutDto.class);
            List<ActivedRulesDto> activedRulesDtos = JSONObject.parseArray(activeRuleJson, ActivedRulesDto.class);

            autoRet.setResult(dataOutDtos);
            autoRet.setActivedRules(activedRulesDtos);
            autoRet.setDisease(treatmentResult.getDiagnosisResult());
            autoRet.setTreatmentPlan(treatmentResult.getTreatmentPlan());

            processDetailDto.setCommonResult(autoRet);
        }

        // 设置修改自动诊断结果
        FidOutDto updateRet = new FidOutDto();
        if(treatmentObjection != null){
            String activeRuleJson = treatmentObjection.getActiveRuleJson();
            String outFeatureJson = treatmentObjection.getOutFeatureJson();

            List<DataOutDto> dataOutDtos = JSONObject.parseArray(outFeatureJson, DataOutDto.class);
            List<ActivedRulesDto> activedRulesDtos = JSONObject.parseArray(activeRuleJson, ActivedRulesDto.class);

            updateRet.setResult(dataOutDtos);
            updateRet.setActivedRules(activedRulesDtos);
            updateRet.setDisease(treatmentObjection.getDiagnosisResult());
            updateRet.setTreatmentPlan(treatmentObjection.getTreatmentPlan());

            processDetailDto.setModifyResult(updateRet);
        }
        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),processDetailDto);
    }

    private FidOutDto getMedicalResult(String medicalRecordId, int type){
        FidOutDto ret = new FidOutDto();

        TreatmentResult treatmentResult = treatmentService.queryResultByMedicalRecordId(medicalRecordId, type);
       // TreatmentResult treatmentObjection = treatmentService.queryResultByMedicalRecordId(medicalRecordId, EnumTreatState.MODIFY.getValue());

        if(treatmentResult != null){
            String activeRuleJson = treatmentResult.getActiveRuleJson();
            String outFeatureJson = treatmentResult.getOutFeatureJson();

            List<DataOutDto> dataOutDtos = JSONObject.parseArray(outFeatureJson, DataOutDto.class);
            List<ActivedRulesDto> activedRulesDtos = JSONObject.parseArray(activeRuleJson, ActivedRulesDto.class);

            ret.setResult(dataOutDtos);
            ret.setActivedRules(activedRulesDtos);
            ret.setDisease(treatmentResult.getDiagnosisResult());
            ret.setTreatmentPlan(treatmentResult.getTreatmentPlan());
        }

       /* if(treatmentObjection != null){
            String activeRuleJson = treatmentObjection.getActiveRuleJson();
            String outFeatureJson = treatmentObjection.getOutFeatureJson();

            List<DataOutDto> dataOutDtos = JSONObject.parseArray(outFeatureJson, DataOutDto.class);
            List<ActivedRulesDto> activedRulesDtos = JSONObject.parseArray(activeRuleJson, ActivedRulesDto.class);

            ret.setResult(dataOutDtos);
            ret.setActivedRules(activedRulesDtos);
            ret.setDisease(treatmentObjection.getDiagnosisResult());
            ret.setTreatmentPlan(treatmentObjection.getTreatmentPlan());
        }*/

        return ret;
    }


  

    @ApiOperation(value = "编辑就诊记录", notes = "编辑就诊记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "medicalRecordJsonStr", paramType = "query", required = true,
                    value = "" +
                            "就诊记录信息（Json字符串）\n{\n" +
                            "  \"patientId\": \"病人id\",\n" +
                            "  \"doctorId\": \"医生编号\",\n" +
                            "  \"record\": \"记录\",\n" +
                            "  \"treatmentPlan\": \"治疗方案\",\n" +
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

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }


}