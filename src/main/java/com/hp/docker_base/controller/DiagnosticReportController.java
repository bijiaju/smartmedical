package com.hp.docker_base.controller;


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



    @ApiOperation(value = "获取诊断结果", notes = "获取诊断结果")
   /* @ApiImplicitParams({
            @ApiImplicitParam(name = "departmentId", value = "科室编号", paramType = "path", required = true)
    })*/
    @GetMapping("/diagnostic/result")
    public  Map<String,Object>  doQueryDiagnosticFeatureList() {

        // 查询诊断结果
        List<DignosticClassificaitionDto> retList = new ArrayList();
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