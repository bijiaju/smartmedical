package com.hp.docker_base.service.impl;

import com.hp.docker_base.service.IDiagnosticReportService;
import com.hp.docker_base.service.IDiagnosticSampleImportService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/6 17:34
 */
@Service
public class DiagnosticReportServiceImpl implements IDiagnosticReportService {

    // 诊断样本导入服务
    @Autowired
    private IDiagnosticSampleImportService diagnosticSampleImportService;

    @Override
    public Workbook exportDiagnosticSampleData(String date) {

        // 1、根据日期查询诊断样本
        List<Object> diagnosticSampleList = new ArrayList<>();

        // 2、导出数据
        return diagnosticSampleImportService.exportDiagnosticSampleData(diagnosticSampleList);
    }
}
