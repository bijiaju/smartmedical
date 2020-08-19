package com.hp.docker_base.bean.bo;

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
public abstract class AbstractExtendAttributeConfigBo {
    /**
     * 扩展属性编号
     */
    private String attributeId;
}
