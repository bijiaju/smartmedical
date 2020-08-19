package com.hp.docker_base.bean.dto.extend;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * @program: idaas
 * @description: 扩展属性配置信息
 * @author: bee
 * @create: 2020-03-19 09:19
 **/
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("【抽象】扩展属性配置信息")
public abstract class AbstractExtendAttributeConfigDto {
    @ApiModelProperty(value = "扩展属性编号", example = "扩展属性编号")
    private String attributeId;
}
