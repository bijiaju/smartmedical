package com.hp.docker_base.service;

import com.hp.docker_base.bean.MDC1;

import java.util.List;

/**
 * 精神小活的代码
 */
public interface IMDC1Service {

    /**
     * 获取某个科室下病的结果
     */
    List<MDC1> querySickList(String departmentId);
}
