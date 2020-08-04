package com.hp.docker_base.service.impl;

import com.hp.docker_base.service.IDiagnosticSampleImportService;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/4 22:40
 */
@Service
public class DiagnosticSampleImportServiceImpl implements IDiagnosticSampleImportService {

    // 列号
    private static final int EXPORT_SEQ_COL_NUM = 0;
    private static final int EXPORT_ACCOUNT_EXTERNAL_ID_COL_NUM = 1;
    private static final int EXPORT_NAME_COL_NUM = 2;
    private static final int EXPORT_ACCOUNT_NAME_COL_NUM = 3;
    private static final int EXPORT_EMAIL_COL_NUM = 4;
    private static final int EXPORT_TELEPHONE_COL_NUM = 5;
    private static final int EXPORT_ACCOUNT_PARENT_ID_COL_NUM = 6;
    private static final int EXPORT_ACCOUNT_PARENT_NAME_COL_NUM = 7;
    private static final int EXPORT_REMARK_COL_NUM = 8;
    private static final int EXPORT_SORT_COL_NUM = 9;

    // 标题名称
    private static final String EXPORT_ACCOUNT_DETAIL_SHEET = "账户列表";
    private static final String EXPORT_TITLE_SEQ = "序号";
    private static final String EXPORT_TITLE_ACCOUNT_EXTERNAL_ID = "编号";
    private static final String EXPORT_TITLE_NAME = "显示名称";
    private static final String EXPORT_TITLE_ACCOUNT_NAME = "账户名";
    private static final String EXPORT_TITLE_EMAIL = "邮箱";
    private static final String EXPORT_TITLE_TELEPHONE = "手机号";
    private static final String EXPORT_TITLE_ACCOUNT_PARENT_ID = "隶属组织机构编号";
    private static final String EXPORT_TITLE_ACCOUNT_PARENT_NAME = "隶属组织机构名称";
    private static final String EXPORT_TITLE_REMARK = "备注";
    private static final String EXPORT_TITLE_SORT = "排序号";

    @Override
    public Workbook exportDiagnosticSampleData(List<Object> diagnosticSampleList) {

        // 1、创建Excel表格
        HSSFWorkbook book = new HSSFWorkbook();

        // 2、诊断样本信息Sheet
        HSSFSheet sheet = book.createSheet();

        // 4、初始化表格标题
        initExportSheetHeader(book, sheet);

        // 5、导出诊断样本信息
        exportDiagnosticSample(book, sheet, diagnosticSampleList);

        return book;
    }

    private void exportDiagnosticSample(HSSFWorkbook book,
                                        HSSFSheet sheet,
                                        List<Object> diagnosticSampleList) {
        if (CollectionUtils.isEmpty(diagnosticSampleList)) {
            return;
        }

        HSSFCellStyle cellStyle = book.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        cellStyle.setBorderTop(BorderStyle.THIN);
        cellStyle.setBorderRight(BorderStyle.THIN);
        cellStyle.setBorderBottom(BorderStyle.THIN);
        cellStyle.setBorderLeft(BorderStyle.THIN);
        cellStyle.setWrapText(true);

        int index = 1;
        for (Object accountInfo : diagnosticSampleList) {
            Row row = sheet.createRow(index);
            row.setHeightInPoints(30);

            // 序号
            setCellValue(row, EXPORT_SEQ_COL_NUM, String.valueOf(index), cellStyle);

            index++;
        }
    }

    /**
     * 设置单元格内容
     *
     * @param row       行
     * @param colNum    列
     * @param value     值
     * @param cellStyle 单元格格式
     */
    private void setCellValue(Row row, int colNum, String value, CellStyle cellStyle) {
        Cell cell = row.createCell(colNum);
        cell.setCellValue(value != null ? value : "");
        cell.setCellStyle(cellStyle);
    }

    /**
     *  初始化表格标题
     */
    private void initExportSheetHeader(HSSFWorkbook book,
                                       HSSFSheet sheet) {
        // 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
        Row titleRow = sheet.createRow(0);
        titleRow.setHeightInPoints(40);
        CellStyle titleCellStyle = book.createCellStyle();
        titleCellStyle.setAlignment(HorizontalAlignment.CENTER);
        titleCellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        titleCellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        titleCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        titleCellStyle.setBorderTop(BorderStyle.THIN);
        titleCellStyle.setBorderRight(BorderStyle.THIN);
        titleCellStyle.setBorderBottom(BorderStyle.THIN);
        titleCellStyle.setBorderLeft(BorderStyle.THIN);
        titleCellStyle.setWrapText(true);

        // 初始化固定的表头
        initExportFixedSheetHeader(sheet, titleRow, titleCellStyle);

        // 固定首行
        sheet.createFreezePane(0, 1);
    }

    /**
     * 初始化固定的表格表头
     */
    private void initExportFixedSheetHeader(HSSFSheet sheet,
                                            Row titleRow,
                                            CellStyle titleCellStyle) {
        // 序号
        Cell cell0 = titleRow.createCell(EXPORT_SEQ_COL_NUM);
        cell0.setCellValue(EXPORT_TITLE_SEQ);
        cell0.setCellStyle(titleCellStyle);
        sheet.setColumnWidth(EXPORT_SEQ_COL_NUM, 256 * 10);

        // 账户编号
        Cell cell1 = titleRow.createCell(EXPORT_ACCOUNT_EXTERNAL_ID_COL_NUM);
        cell1.setCellValue(EXPORT_TITLE_ACCOUNT_EXTERNAL_ID);
        cell1.setCellStyle(titleCellStyle);
        sheet.setColumnWidth(EXPORT_ACCOUNT_EXTERNAL_ID_COL_NUM, 256 * 30);

        // 账户显示名称
        Cell cell2 = titleRow.createCell(EXPORT_NAME_COL_NUM);
        cell2.setCellValue(EXPORT_TITLE_NAME);
        cell2.setCellStyle(titleCellStyle);
        sheet.setColumnWidth(EXPORT_NAME_COL_NUM, 256 * 20);

        // 账户名
        Cell cell3 = titleRow.createCell(EXPORT_ACCOUNT_NAME_COL_NUM);
        cell3.setCellValue(EXPORT_TITLE_ACCOUNT_NAME);
        cell3.setCellStyle(titleCellStyle);
        sheet.setColumnWidth(EXPORT_ACCOUNT_NAME_COL_NUM, 256 * 30);

        // 邮箱
        Cell cell4 = titleRow.createCell(EXPORT_EMAIL_COL_NUM);
        cell4.setCellValue(EXPORT_TITLE_EMAIL);
        cell4.setCellStyle(titleCellStyle);
        sheet.setColumnWidth(EXPORT_EMAIL_COL_NUM, 256 * 30);
    }
}
