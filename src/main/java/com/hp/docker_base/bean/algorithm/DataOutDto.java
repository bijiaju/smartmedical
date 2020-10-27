package com.hp.docker_base.bean.algorithm;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/31 17:29
 */
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

public class DataOutDto {

    @ApiModelProperty(value = "病id", example = "病id")
    private String FidOut;

    @ApiModelProperty(value = "值", example = "值")
    private String Value;

    @ApiModelProperty(value = "病的名称", example = "病的名称")
    private String fidOutName;

}
