package com.hp.docker_base.bean.algorithm;

import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/31 17:39
 */

public class FidOutDto {

    @ApiModelProperty(value = "诊疗记录Id", example = "诊疗记录Id")
    private String RecId;

    @ApiModelProperty(value = "科室Id", example = "科室Id")
    private String DeptId;

    private List<DataOutDto> Result;

    private List<ActivedRulesDto> ActivedRules;

}
