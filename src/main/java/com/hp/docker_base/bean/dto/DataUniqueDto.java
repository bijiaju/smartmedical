package com.hp.docker_base.bean.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;

/**
 * @program: idaas
 * @description: 数据唯一性
 * @author: bee
 * @create: 2020-03-17 18:18
 **/
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("数据唯一性")
public class DataUniqueDto implements Serializable {
    private static final long serialVersionUID = 5838325396725812983L;

    @ApiModelProperty(value = "数据是否唯一（0/1）", example = "数据是否唯一，0:不唯一 | 1:唯一")
    private Integer unique;
}
