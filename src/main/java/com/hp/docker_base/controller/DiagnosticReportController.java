package com.hp.docker_base.controller;


import com.alibaba.fastjson.JSON;
import com.hp.docker_base.bean.algorithm.*;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.dto.DignosticClassificaitionDto;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDiagnosticFeatureService;
import com.hp.docker_base.service.IDiagnosticReportService;
import com.hp.docker_base.util.CommonUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@RestController
@RequestMapping("/report")
@Api(tags = "【前端开放】诊断报告API", description = "诊断报告API")
public class DiagnosticReportController {

    @Autowired
    private IDiagnosticReportService reportService;

    /*@ApiOperation(value = "查询科室的通用诊断特征", notes = "查询科室的通用诊断特征")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true)
    })
    @GetMapping("/base/{departmentId}")
    public  Map<String,Object>  doQueryDiagnosticFeatureList(@PathVariable(value = "departmentId")
                                                                         String departmentId) {

        // 查询所有的科室
       /// List<Department>  departmentList = departmentService.queryAllDepartmentList();
       // return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }*/

   /* @ApiOperation(value = "获取诊断结果", notes = "获取诊断结果")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "RecId", value = "诊断编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "DeptId", value = "科室编号", paramType = "query", required = true),
            @ApiImplicitParam(name = "DataIn", value = "科室编号", paramType = "query", required = true)
    })
    @GetMapping("/base/{departmentId}")
    public  Map<String,Object>  doQueryDiagnosticFeatureList(@PathVariable(value = "departmentId")
                                                                         String departmentId) {

        // 查询所有的科室
       /// List<Department>  departmentList = departmentService.queryAllDepartmentList();
       // return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),EnumOKOrNG.OK.getValue(),null);
    }*/


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



        FidOutDto retList = reportService.queryDignosticResultInfo(RecId,DeptId,DataIn);
        // 查询诊断结果
       // List<DignosticClassificaitionDto> retList = new ArrayList();
        // 构建输入参数
      /*  FidInDto inDto = new FidInDto();
        inDto.setRecId(RecId);
        inDto.setDeptId(DeptId);

        List<DataInDto> dataInDtos = JSON.parseArray(DataIn, DataInDto.class);
        inDto.setDataIn(dataInDtos);

         FidOutDto retList = new FidOutDto();
         retList.setDeptId(DeptId);
         retList.setRecId(RecId);

        List<ActivedRulesDto> activedRulesDtoList = new ArrayList<>();
        ActivedRulesDto rulesDto = new ActivedRulesDto();
        rulesDto.setRId("11");
        rulesDto.setWeight("0.1");
        activedRulesDtoList.add(rulesDto);

        ActivedRulesDto rulesDto1 = new ActivedRulesDto();
        rulesDto1.setRId("12");
        rulesDto1.setWeight("0.4");
        activedRulesDtoList.add(rulesDto1);

        ActivedRulesDto rulesDto2 = new ActivedRulesDto();
        rulesDto2.setRId("13");
        rulesDto2.setWeight("0.5");
        activedRulesDtoList.add(rulesDto2);

         retList.setActivedRules(activedRulesDtoList);


        List<DataOutDto> rulesDtos = new ArrayList<>();
        DataOutDto data1 = new DataOutDto();
        data1.setFidOut("1");
        data1.setValue("0.1");
        rulesDtos.add(data1);

        DataOutDto data2 = new DataOutDto();
        data2.setFidOut("2");
        data2.setValue("0.4");
        rulesDtos.add(data2);

        DataOutDto data3 = new DataOutDto();
        data3.setFidOut("3");
        data3.setValue("0.5");
        rulesDtos.add(data3);

         retList.setResult(rulesDtos);*/
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