package com.hp.docker_base.bean.dto.extend;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;

/**
 * @program: idaas
 * @description: 选项内容信息
 * @author: bee
 * @create: 2020-03-19 09:14
 **/
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("选项内容信息")
public class SelectionContentDto implements Serializable {
    private static final long serialVersionUID = 4959161704791132452L;

    @ApiModelProperty(value = "选项唯一编号", example = "选项唯一编号")
    private String uuid;

    @ApiModelProperty(value = "选项内容", example = "选项内容")
    private String content;

    @ApiModelProperty(value = "是否默认选中", example = "是否默认选中，1:默认选中 | 0:默认未选中")
    private Integer defaultSelection;

    @ApiModelProperty(value = "排序值", example = "排序值")
    private Integer sort;
}
