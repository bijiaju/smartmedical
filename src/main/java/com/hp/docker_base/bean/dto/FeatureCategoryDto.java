package com.hp.docker_base.bean.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor

@ApiModel("特征分类Dto")
public class FeatureCategoryDto implements Serializable {

    private static final long serialVersionUID = -695002978383121515L;

    @ApiModelProperty(value = "分类id", example = "分类id")
    private String category;

    @ApiModelProperty(value = "分类名称信息", example = "分类名称信息")
    private String categoryName;


}