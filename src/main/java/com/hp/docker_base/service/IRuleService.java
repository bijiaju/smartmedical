package com.hp.docker_base.service;

import com.hp.docker_base.bean.dto.RuleDetailDto;

import java.util.List;

/**
 * @Author: biyangqiang
 * @Description:
 * @Date: Created in 22:23 2021/1/13
 * @Modify By:
 */
public interface IRuleService {

    /**
     * 获取所有的规则
     */
    List<RuleDetailDto> findAllRules();
}
