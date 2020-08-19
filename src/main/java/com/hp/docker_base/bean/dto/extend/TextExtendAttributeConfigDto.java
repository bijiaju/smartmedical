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
 * @description: 文本类扩展属性的配置信息
 * @author: bee
 * @create: 2020-03-19 09:00
 **/
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("文本类扩展属性的配置信息")
public class TextExtendAttributeConfigDto extends AbstractExtendAttributeConfigDto implements Serializable {
    private static final long serialVersionUID = -1045017853923690209L;

    @ApiModelProperty(value = "最大字符数", example = "最大字符数")
    private Integer maxCharacterCount;

    @ApiModelProperty(value = "默认值", example = "默认值")
    private String defaultValue;
}
