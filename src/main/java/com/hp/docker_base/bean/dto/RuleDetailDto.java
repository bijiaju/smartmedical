package com.hp.docker_base.bean.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: biyangqiang
 * @Description:
 * @Date: Created in 22:22 2021/1/13
 * @Modify By:
 */

@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("角色规则信息")
public class RuleDetailDto implements Serializable {


    @ApiModelProperty(value = "规则编号",example = "规则编号")
    private Integer ruleId;

    @ApiModelProperty(value = "规则列表",example = "规则列表")
    private List<ReferenceDto> ruleList;

    @ApiModelProperty(value = "疾病列表",example = "疾病列表")
    private List<BeliefDto> sickList;

}
