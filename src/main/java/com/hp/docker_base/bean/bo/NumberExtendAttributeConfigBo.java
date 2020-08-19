package com.hp.docker_base.bean.bo;

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
public class NumberExtendAttributeConfigBo extends AbstractExtendAttributeConfigBo implements Serializable {
    private static final long serialVersionUID = 8123399767876801250L;

    /**
     * 单位
     */
    private String unit;

    /**
     * 最小值
     */
    private String minValue;

    /**
     * 最大值
     */
    private String maxValue;

    /**
     * 默认值
     */
    private String defaultValue;
}
