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
 * @description: 排序值
 * @author: 姬同凯
 * @create: 2020-03-18 18:07
 **/
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("排序值")
public class SortDto implements Serializable {
    private static final long serialVersionUID = 4720502018611624032L;

    @ApiModelProperty(value = "排序值", example = "排序值")
    private Integer sort;
}
