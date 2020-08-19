package com.hp.docker_base.bean.dto.extend;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;

/**
 * @program: idaas
 * @description: 数字类扩展属性的配置信息
 * @author: bee
 * @create: 2020-03-19 09:03
 **/
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("数字类扩展属性的配置信息")
public class NumberExtendAttributeConfigDto extends AbstractExtendAttributeConfigDto implements Serializable {
    private static final long serialVersionUID = 8123399767876801250L;

    @ApiModelProperty(value = "单位", example = "单位")
    private String unit;

    @ApiModelProperty(value = "最小值", example = "最小值")
    private String minValue;

    @ApiModelProperty(value = "最大值", example = "最大值")
    private String maxValue;

    @ApiModelProperty(value = "默认值", example = "默认值")
    private String defaultValue;
}
