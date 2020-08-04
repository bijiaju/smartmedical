package com.hp.docker_base.bean.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @description: 诊断结果
 * @author: biyangqiang
 * @time: 2020/8/4 23:02
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DignosticClassificaitionDto implements Serializable{

    @ApiModelProperty(value = "分类编号", example = "分类编号")
    private String classificationId;

    @ApiModelProperty(value = "分类名称", example = "分类名称")
    private String classificationName;

    /**
     *  占比
     */
    @ApiModelProperty(value = "占比", example = "2.7%")
    private double ratio;
}
