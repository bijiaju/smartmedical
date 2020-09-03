package com.hp.docker_base.bean.dto;

import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/9/3 22:48
 */
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data
public class CategoryExtendAttributeDto {

   /* BASIC_INFO(0, "基础信息及病史"),
    DIAGNOSIS(1, "临床诊断"),
    IMAGE(2, "医学图像特征");*/

    @ApiModelProperty(value = "基础信息及病史")
    private List<ExtendAttributeDto> basicInfoList;

    @ApiModelProperty(value = "临床诊断")
    private List<ExtendAttributeDto> diagnosisList;

    @ApiModelProperty(value = "医学图像特征")
    private List<ExtendAttributeDto> imageList;
}
