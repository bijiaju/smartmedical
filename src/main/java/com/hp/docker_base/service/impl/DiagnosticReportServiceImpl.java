package com.hp.docker_base.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.algorithm.FidOutDto;
import com.hp.docker_base.bean.constant.ReportServiceContants;
import com.hp.docker_base.bean.em.EnumExceptionCode;
import com.hp.docker_base.bean.exception.DataException;
import com.hp.docker_base.service.IDiagnosticReportService;
import com.hp.docker_base.service.IDiagnosticSampleImportService;
import com.hp.docker_base.util.ResultVo;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/6 17:34
 */
@Service
public class DiagnosticReportServiceImpl implements IDiagnosticReportService {

    @Autowired
    private RestTemplate restTemplate;

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

    @Override
    public FidOutDto queryDignosticResultInfo( String RecId,
                                               String DeptId,
                                               String DataIn) {

        // 1、设置调用url
        String url = ReportServiceContants.BASE_URL+"?DataIn={DataIn}&DeptId={DeptId}&RecId={RecId}";

        // 2、设置token
        HttpEntity<String> requestEntity = getTokenHttpHeaders(null);

        // 3、设置查询参数
        Map<String, Object> params = new HashMap<>();
        params.put("DataIn", DataIn);
        params.put("DeptId", DeptId);
        params.put("RecId", RecId);

        // 4、获取结果
        ResponseEntity<String> responseEntity = restTemplate.exchange(url,
                HttpMethod.POST,
                requestEntity,
                String.class,
                params);

        // 5、校验是否调用成功,并返回正确结果
        String data = getMedicalServerResponseBody(responseEntity);

        FidOutDto fidOutDto = parseFidOutDtoInfo(data);

        return fidOutDto;
    }

    /**
     * 解析转换
     */
    private FidOutDto parseFidOutDtoInfo(String data) {
        FidOutDto fidOutDto = JSONObject.parseObject(data, FidOutDto.class);
        return fidOutDto;
    }

    /**
     * 获取统一身份调用结果
     */
    private String getMedicalServerResponseBody(ResponseEntity<String> responseEntity) {
        // 调用成功校验
        if (responseEntity.getStatusCodeValue() != 200) {
            throw new DataException(EnumExceptionCode.ERROR_NET_NULL.getCode(),
                   EnumExceptionCode.ERROR_NET_NULL.getMessage());
        }

        // 调用结果校验
        ResultVo resultVo = JSONObject.parseObject(responseEntity.getBody(), ResultVo.class);
        if (resultVo.getCode() != 0) {
            throw new DataException(EnumExceptionCode.ERROR_IDAAS_ACCESS_ERROR.getCode(),
                    resultVo.getMessage());
        }

        // System.out.println("entity.getBody()" + responseEntity.getBody());
        return resultVo.getData();
    }

    /**
     * 获取Token Header
     */
    private HttpEntity<String> getTokenHttpHeaders(String authorization) {
        HttpHeaders headers = new HttpHeaders();
       // headers.add("Authorization", authorization);

        HttpEntity<String> requestEntity = new HttpEntity<String>(null, headers);
        return requestEntity;
    }



}
