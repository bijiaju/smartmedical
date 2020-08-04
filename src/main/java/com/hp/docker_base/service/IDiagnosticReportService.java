package com.hp.docker_base.service;

import org.apache.poi.ss.usermodel.Workbook;

/**
 * @Desc 诊断报告
 * @Author 24763
 * @Date 2020/7/6 17:34
 */
public interface IDiagnosticReportService {

    /**
     *  根据日期导出样本数据
     * @param date 日期
     */
    Workbook exportDiagnosticSampleData(String date);
}
