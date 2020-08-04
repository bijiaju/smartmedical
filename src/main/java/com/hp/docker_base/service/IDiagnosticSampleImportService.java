package com.hp.docker_base.service;

import org.apache.poi.ss.usermodel.Workbook;

import java.util.List; /**
 * @description: 诊断样本导入出服务api
 * @author: biyangqiang
 * @time: 2020/8/4 22:38
 */

public interface IDiagnosticSampleImportService {
    /**
     * 导出诊断样本数据
     */
    Workbook exportDiagnosticSampleData(List<Object> diagnosticSampleList);
}
