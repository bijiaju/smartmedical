package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.service.IDiagnosticFeatureExtService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 19:01
 */
@Service
public class DiagnosticFeatureExtServiceImpl implements IDiagnosticFeatureExtService {

    @Autowired
    private AccountExtendServiceImpl accountExtendService;


    @Override
    public List<ExtendAttributeBo> findAccountExtendAttributeInfoById(String departmentId, String accountId) {
        List<ExtendAttributeBo> accountExtendAttributeList = new ArrayList<>();

        if (StringUtils.isEmpty(accountId)) {
            return accountExtendAttributeList;
        }

        return accountExtendService.findExtendAttributeValueInfoById(departmentId, accountId);
    }
}
