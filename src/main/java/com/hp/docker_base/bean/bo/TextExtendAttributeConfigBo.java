package com.hp.docker_base.bean.bo;

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

public class TextExtendAttributeConfigBo extends AbstractExtendAttributeConfigBo implements Serializable {
    private static final long serialVersionUID = -1045017853923690209L;

    /**
     * 最大字符数
     */
    private Integer maxCharacterCount;

    /**
     * 默认值
     */
    private String defaultValue;
}
