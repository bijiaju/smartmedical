package com.hp.docker_base.service;

import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;

import java.util.List;

/**
 * @Desc 诊断特征api
 * @Author 24763
 * @Date 2020/7/6 17:29
 */
public interface IDiagnosticFeatureService {

    /**
     * 查询账户拓展属性的值
     */
    List<ExtendAttributeDto> queryAccountExtendAttributeInfo(String departmentId,
                                                             String userId);
}
