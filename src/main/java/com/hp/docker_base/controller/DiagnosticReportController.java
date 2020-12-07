package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.Disease;
import com.hp.docker_base.bean.MDC1;
import com.hp.docker_base.bean.TreatmentInputData;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.algorithm.*;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.dto.EnumTreatStateDto;
import com.hp.docker_base.bean.dto.TreatmentObjectionDto;
import com.hp.docker_base.bean.dto.TreatmentResultDto;
import com.hp.docker_base.bean.em.EnumTreatState;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.*;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.validate.ErrorParamException;
import com.hp.docker_base.util.validate.ValidateUtils;
import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@RestController
@RequestMapping("/report")
@Api(tags = "【前端开放】诊断报告API", description = "诊断报告API")
public class DiagnosticReportController extends BaseController {

    @Autowired
    private IDiagnosticReportService reportService;


    @Autowired
    private IMDC1Service imdc1Service;

    @Autowired
    private ITreatmentService treatmentService;

    @Autowired
    private ITreatmentObjectionService treatmentObjectionService;

    @Autowired
    private IExtendAttributeService extendAttributeService;

    @Autowired
    private IDiseaseService diseaseService;

    @Autowired
    private ITreatmentInputDataService inputDataService;

    @ApiOperation(value = "获取诊断状态列表", notes = "获取诊断状态列表")
    @GetMapping("/treat/state")
    public Map<String,Object> doGetTreatmentState() {

        EnumTreatState[] values = EnumTreatState.values();

        List<EnumTreatStateDto> enumTreatStates = new ArrayList<>();
        for(EnumTreatState state: values){
            EnumTreatStateDto stateDto = new EnumTreatStateDto();

            stateDto.setCode(state.getValue());
            stateDto.setDesc(state.getDescription());
            enumTreatStates.add(stateDto);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                enumTreatStates);
    }

    @ApiOperation(value = "驳回修改诊断", notes = "驳回修改诊断")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true)
    })
    @PutMapping("/reject/{medicalRecordId}")
    @MyLog("管理员驳回修改诊断")
    public Map<String,Object> doPostNegativeMedicalInfo(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、驳回诊断结果
        int retAccountInfo = treatmentService.rejectTreatmentResult(
                medicalRecordId,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                retAccountInfo);
    }

    @ApiOperation(value = "接受修改记录", notes = "否定自动诊断记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "ruleJsonStr", paramType = "query", required = false,
                    value = "" +
                    "[{reference:[40,1,1,1,1,0,1,0,0,0,0,0,1,0,0,1],"
                    + "belief:[1,0,0]}]")
    })
    @PutMapping("/accept/{medicalRecordId}")
    @MyLog("管理员接受修改诊断")
    public Map<String,Object> doPutNegativeMedicalInfo(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "ruleJsonStr") String ruleJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、管理员接受修改诊断
        int retAccountInfo = treatmentService.acceptTreatmentResult(
                medicalRecordId,
                currentUser.getUserName(),
                ruleJsonStr
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                retAccountInfo);
    }

  /*  @ApiOperation(value = "否定自动诊断记录", notes = "否定自动诊断记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "treatmentJsonStr", paramType = "query", required = true,
                    value = "" +
                            "就诊结果信息（Json字符串）\n{\n" +
                            "  \"diagnosisResult\": \"诊断结果\",\n" +
                            "  \"treatmentPlan\": \"治疗方案\",\n" +
                            "  \"outFeatureJson\": \"输出特征Json字符串\",\n" +
                            "  \"activeRuleJson\": \"激活规则Json字符串\",\n" +
                            "  \"reason\": \"修改理由\"\n" +
                            "}")
    })
    @PostMapping("/negative/{medicalRecordId}")
    @MyLog("否定诊断记录")
    public Map<String,Object> doPostNegativeMedicalInfo(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "treatmentJsonStr") String treatmentJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        TreatmentObjectionDto treatmentResult = JSONObject.parseObject(treatmentJsonStr, TreatmentObjectionDto.class);
        ValidateUtils.validateGroup(treatmentJsonStr, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑账户基础属性信息记录
        int retAccountInfo = treatmentObjectionService.addTreatmentObjectInfo(
                medicalRecordId,
                treatmentResult,
                currentUser.getUserName()
        );

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                retAccountInfo);
    }*/




    @ApiOperation(value = "插入新增和修改就诊结果", notes = "插入新增和修改就诊结果")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "autoTreatmentJsonStr", paramType = "query", required = false,
                    value = "" +
                            "自动就诊结果信息（Json字符串）\n{\n" +
                            "  \"diagnosisResult\": \"诊断结果\",\n" +
                            "  \"treatmentPlan\": \"治疗方案\",\n" +
                            "  \"outFeatureJson\": \"输出特征Json字符串\",\n" +
                            "  \"activeRuleJson\": \"激活规则Json字符串\",\n" +
                            "}"),
            @ApiImplicitParam(name = "rejectTreatmentJsonStr", paramType = "query", required = false,
                    value = "" +
                            "否定就诊结果信息（Json字符串）\n{\n" +
                            "  \"diagnosisResult\": \"诊断结果\",\n" +
                            "  \"treatmentPlan\": \"治疗方案\",\n" +
                            "  \"outFeatureJson\": \"输出特征Json字符串\",\n" +
                            "  \"activeRuleJson\": \"激活规则Json字符串\",\n" +
                            "  \"reason\": \"修改理由\"\n" +
                            "}")
    })
    @PostMapping("/insert/{medicalRecordId}")
    @MyLog("插入新增和修改就诊结果")
    public Map<String,Object> doPostSureMedicalInfo(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "rejectTreatmentJsonStr") String rejectTreatmentJsonStr,
            @RequestParam(value = "autoTreatmentJsonStr") String autoTreatmentJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        TreatmentResultDto treatmentResult = JSONObject.parseObject(autoTreatmentJsonStr, TreatmentResultDto.class);
        ValidateUtils.validateGroup(treatmentResult, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 2、解析组Json字符串参数
        TreatmentResultDto modfiyResult = JSONObject.parseObject(rejectTreatmentJsonStr, TreatmentResultDto.class);
        ValidateUtils.validateGroup(modfiyResult, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、新增诊断结果
        int retAccountInfo = 0;
        if(treatmentResult != null){
             retAccountInfo = treatmentService.addTreatmentResultInfo(
                    medicalRecordId,
                    treatmentResult,
                    EnumTreatState.COMMON.getValue(),
                    currentUser.getUserName()
            );
        }

        if(modfiyResult != null){
            retAccountInfo = treatmentService.addTreatmentResultInfo(
                    medicalRecordId,
                    treatmentResult,
                    EnumTreatState.MODIFY.getValue(),
                    currentUser.getUserName()
            );
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                retAccountInfo);
    }





    @ApiOperation(value = "获取诊断结果", notes = "获取诊断结果")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "RecId", value = "诊断编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "DeptId", value = "科室编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "DataIn", value = "[{FidIn:\"输入特征Id1\", Value:\"特征数值\"}, \n" +
                    "               {FidIn:\"输入特征Id2\", Value:\"特征数值\"}, \n" +
                    "               {FidIn:\"输入特征Id3\", Value:\"特征数值\"}", paramType = "query", required = true)
    })
    @PostMapping("/diagnostic/result")
    @MyLog("获取诊断结果")
    public  Map<String,Object>  doQueryDiagnosticFeatureList(@RequestParam(value = "RecId") String RecId,
                                                             @RequestParam(value = "DeptId") String DeptId,
                                                             @RequestParam(value = "DataIn") String DataIn,
                                                             HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 1、获取某个科室下的疾病
        List<MDC1> sickList = imdc1Service.querySickList(null);
        Map<String, String> sickMap = null;
        if(sickList != null && sickList.size() > 0){
            sickMap = sickList.stream().collect(Collectors.toMap(MDC1::getId, MDC1::getFeature));
        }

        // 2、转换请求参数
        Map<String, String> selectMap = extendAttributeService.queryAttrSelectMap();//选择框map

        List<DataInDto> dataInDtos = JSON.parseArray(DataIn, DataInDto.class);
        if(!dataInDtos.isEmpty()){
            for(DataInDto dataInDto:dataInDtos){
                String selectFid = selectMap.get(dataInDto.getFidIn());
                if(StringUtils.isNotEmpty(selectFid)){
                    dataInDto.setFidIn(selectFid);
                }
            }
        }

        // 2-1、转参数为字符串
        String transDataIn = JSON.toJSONString(dataInDtos);

        FidOutDto retList = reportService.queryDignosticResultInfo(RecId,DeptId,transDataIn);
        if(retList == null){
            throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"未获得诊断结果！");
        }

        retList.setRecId(RecId);
        retList.setDeptId(DeptId);

        // 1、保证百分数
        List<DataOutDto> result = retList.getResult();
        if(result !=null && result.size() > 0){

            double total = 0.00;
            for(int i = 0;i<result.size() -1 ;i++){
                DataOutDto data = result.get(i);

                String percentFormat = CommonUtil.getPercentFormat(Double.parseDouble(data.getValue()), 2, 2);
                total+=Double.parseDouble(percentFormat);

                // 设置百分数
                data.setValue(percentFormat);

                // 设置疾病的名称
                if(sickList != null && sickList.size() > 0){
                    data.setFidOutName(sickMap.get(data.getFidOut()));
                }

            }
            total = Double.parseDouble(String.valueOf(total));
            result.get(result.size()-1).setValue(String.valueOf((100-total)));
            result.get(result.size()-1).setFidOutName(sickMap.get(result.get(result.size()-1).getFidOut()));
        }

        // 激活规则
        List<ActivedRulesDto> activedRules = retList.getActivedRules();
        if(activedRules !=null && activedRules.size() > 0){
            for(ActivedRulesDto activedRulesDto:activedRules){
                activedRulesDto.setWeight(new BigDecimal(activedRulesDto.getWeight()).setScale(2,BigDecimal.ROUND_HALF_UP).toString());
            }
        }

        // 获取结果中的最大值
        Double max = 0.00;
        for(int i = 0;i<result.size() ;i++){
            DataOutDto tmp = result.get(i);
            if(Double.parseDouble(tmp.getValue()) > max){
                max = Double.parseDouble(tmp.getValue());
            }
        }
        String maxStr = max.toString();

        List<DataOutDto> collect = result.stream().filter(u -> maxStr.equals(u.getValue())).collect(Collectors.toList());
        DataOutDto maxDataOutDto = collect.get(0);//疾病

        retList.setDisease(maxDataOutDto.getFidOutName());

        Disease disease = diseaseService.queryDiseaseByForeignId(maxDataOutDto.getFidOut());
        if(disease!=null){
            retList.setTreatmentPlan(disease.getTreatment());
        }

        // 插入诊断输入参数
        TreatmentInputData inputData = new TreatmentInputData();
        inputData.setTreatmentId(RecId);
        inputData.setDepartmentId(DeptId);
        inputData.setDataInJson(DataIn);
        inputData.setUpdateUser(currentUser.getUuid());
        inputData.setCreateUser(currentUser.getUuid());
        inputDataService.addTreatmentInputData(inputData);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),retList);
    }

    @ApiOperation(value = "导出诊断样本（Excel文件）", notes = "导出诊断样本")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "date", value = "日期：2020-01-01", paramType = "query", required = true),
          /*  @ApiImplicitParam(name = "includeAllSubLevels", value = "是否包含所有子层级的账户下的账户，\n 0:否，只获取根级账户下的账户 | 1:是，获取所有子层级的账户下的账户",
                    dataType = "int", paramType = "query", required = false, defaultValue = "1",
                    example = "0:否，只获取根级账户下的账户 | 1:是，获取所有子层级的账户下的账户"),*/
    })
    @GetMapping("/file/export")
    @MyLog("导出诊断样本")
    public Map<String,Object> doExportAccountList(
            @RequestParam(value = "date") String date,
            HttpServletResponse response) {

        // 1、导出信息
        Workbook book = reportService.exportDiagnosticSampleData(date);

        // 2、输出Excel文件
        try {
            String dateTime = DateTimeFormatter.ofPattern("yyyyMMdd").format(LocalDate.now());
            String fileName = URLEncoder.encode("正确诊断列表", "UTF-8") + "-" + dateTime + ".xls";

            OutputStream output = response.getOutputStream();
            response.reset();
            response.setHeader("Content-disposition", "attachment; filename=" + fileName);
            response.setContentType("application/msexcel");
            book.write(output);
            output.close();
        } catch (Exception e) {
            return CommonUtil.setReturnMap(EnumOKOrNG.NG.getCode(),
                    "导出文件失败",
                    null);
        }

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                "导出文件成功",
                null);
    }
}