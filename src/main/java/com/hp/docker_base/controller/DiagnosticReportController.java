package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.Disease;
import com.hp.docker_base.bean.MDC1;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.algorithm.*;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.dto.DignosticClassificaitionDto;
import com.hp.docker_base.bean.dto.TreatmentObjectionDto;
import com.hp.docker_base.bean.dto.TreatmentResultDto;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.mapper.DiseaseMapper;
import com.hp.docker_base.service.*;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.validate.ValidateUtils;
import com.hp.docker_base.util.validate.group.MiniValidation;
import com.sun.xml.internal.rngom.parse.host.Base;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
    private DiseaseMapper diseaseMapper;

    @Autowired
    private IMDC1Service imdc1Service;

    @Autowired
    private ITreatmentService treatmentService;

    @Autowired
    private ITreatmentObjectionService treatmentObjectionService;

    @ApiOperation(value = "确认自动诊断记录", notes = "确认自动诊断记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "treatmentJsonStr", paramType = "query", required = true,
                    value = "" +
                            "就诊结果信息（Json字符串）\n{\n" +
                            "  \"diagnosisResult\": \"诊断结果\",\n" +
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
    }

    @ApiOperation(value = "确认自动诊断记录", notes = "确认自动诊断记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "medicalRecordId", value = "就诊记录编号", paramType = "path", required = true),
            @ApiImplicitParam(name = "treatmentJsonStr", paramType = "query", required = true,
                    value = "" +
                            "就诊结果信息（Json字符串）\n{\n" +
                            "  \"diagnosisResult\": \"诊断结果\",\n" +
                            "  \"outFeatureJson\": \"输出特征Json字符串\",\n" +
                            "  \"activeRuleJson\": \"激活规则Json字符串\",\n" +
                            "}")
    })
    @PostMapping("/sure/{medicalRecordId}")
    @MyLog("认可自动诊断记录")
    public Map<String,Object> doPostSureMedicalInfo(
            @PathVariable(value = "medicalRecordId") String medicalRecordId,
            @RequestParam(value = "treatmentJsonStr") String treatmentJsonStr,
            HttpServletRequest request) {

        // 1、获取用户信息
        User currentUser = getCurrentUser(request);

        // 2、解析组Json字符串参数
        TreatmentResultDto treatmentResult = JSONObject.parseObject(treatmentJsonStr, TreatmentResultDto.class);
        ValidateUtils.validateGroup(treatmentJsonStr, MiniValidation.class);//后面的MiniValidation.class只是为了分组校验

        // 3、编辑账户基础属性信息记录
        int retAccountInfo = treatmentService.addTreatmentResultInfo(
                medicalRecordId,
                treatmentResult,
                currentUser.getUserName()
        );

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
                                                             @RequestParam(value = "DataIn") String DataIn) {

        // 获取某个科室下的疾病
        List<MDC1> sickList = imdc1Service.querySickList(DeptId);
        Map<String, String> sickMap = null;
        if(sickList != null && sickList.size() > 0){
            sickMap = sickList.stream().collect(Collectors.toMap(MDC1::getId, MDC1::getFeature));
        }

        FidOutDto retList = reportService.queryDignosticResultInfo(RecId,DeptId,DataIn);

        retList.setRecId(RecId);
        retList.setDeptId(DeptId);

        // 1、保证百分数
        List<DataOutDto> result = retList.getResult();
        if(result !=null && result.size() > 0){

            double total = 0;
            for(int i = 0;i<result.size() -1 ;i++){
                DataOutDto data = result.get(i);

                String percentFormat = CommonUtil.getPercentFormat(Double.parseDouble(data.getValue()), 2, 2);
                total+=Double.parseDouble(percentFormat.substring(0,percentFormat.length()-1));

                // 设置百分数
                data.setValue(percentFormat);

                // 设置疾病的名称
                if(sickList != null && sickList.size() > 0){
                    data.setFidOutName(sickMap.get(data.getFidOut()));
                }

            }
            total = Double.parseDouble(String.valueOf(total));
            result.get(result.size()-1).setValue(String.valueOf((100-total))+"%");
        }

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