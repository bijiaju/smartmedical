package com.hp.docker_base.bean.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/12/1 9:29
 */
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("数据唯一性")
public class EnumTreatStateDto implements Serializable {

    @ApiModelProperty(value = "状态码", example = "状态码")
    private Integer code;

    @ApiModelProperty(value = "描述", example = "描述")
    private String desc;


}
