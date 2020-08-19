package com.hp.docker_base.bean.dto.extend;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;
import java.util.List;

/**
 * @program: idaas
 * @description: 选项类扩展属性的配置信息
 * @author: bee
 * @create: 2020-03-19 09:12
 **/
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("选项类扩展属性的配置信息")
public class SelectionExtendAttributeConfigDto extends AbstractExtendAttributeConfigDto implements Serializable {
    private static final long serialVersionUID = 8346215073795577538L;

    @ApiModelProperty(value = "选项列表")
    private List<SelectionContentDto> selectionList;
}
