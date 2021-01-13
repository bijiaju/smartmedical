package com.hp.docker_base.bean.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;

/**
 * @Author: biyangqiang
 * @Description:
 * @Date: Created in 22:48 2021/1/13
 * @Modify By:
 */

@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("规则信息")
public class BeliefDto implements Serializable {

    @ApiModelProperty(value = "疾病id",example = "疾病id")
    private String id;


    @ApiModelProperty(value = "疾病value",example = "疾病value")
    private String value;


}
