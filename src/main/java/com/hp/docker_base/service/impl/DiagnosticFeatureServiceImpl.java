package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.service.IDiagnosticFeatureExtService;
import com.hp.docker_base.service.IDiagnosticFeatureService;
import com.hp.docker_base.util.convert.ExtendAttributeObjectTypeConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/6 17:30
 */
@Service
public class DiagnosticFeatureServiceImpl implements IDiagnosticFeatureService {

    @Autowired
    private IDiagnosticFeatureExtService featureExtService;


    @Override
    public List<ExtendAttributeDto> queryAccountExtendAttributeInfo(String departmentId,
                                                                    String userId) {

        if(StringUtils.isEmpty(departmentId)){
            List<ExtendAttributeBo> extendAttributeBoList = featureExtService.findAccountExtendAttributeInfoById(departmentId, userId);
            return extendAttributeBoList.stream()
                    .map(ExtendAttributeObjectTypeConvertUtils::convertExtendAttributeBoToDto)
                    .collect(Collectors.toList());
        }
        return null;
    }
}
