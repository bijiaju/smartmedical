package com.hp.docker_base.service;

import com.hp.docker_base.bean.bo.ExtendAttributeBo;

import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 19:00
 */
public interface IDiagnosticFeatureExtService {


    List<ExtendAttributeBo> findAccountExtendAttributeInfoById(String departmentId, String userId);
}
