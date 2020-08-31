package com.hp.docker_base.bean.algorithm;

import io.swagger.annotations.ApiModelProperty;

/**
 * @description: 激活规则
 * @author: biyangqiang
 * @time: 2020/8/31 17:36
 */

public class ActivedRulesDto {

    @ApiModelProperty(value = "规则id", example = "规则id")
    private String RId;

    @ApiModelProperty(value = "值", example = "值")
    private String Weight;
}
