package com.hp.docker_base.bean.bo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;

/**
 * @program: idaas
 * @description: 各类型（组织机构、账户组、账户）扩展属性值信息
 * @author: 姬同凯
 * @create: 2020-04-03 10:02
 **/
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data
public class ExtendAttributeValueBo implements Serializable {
    private static final long serialVersionUID = 1516584890195046738L;

    /**
     * 租户编号
     */
    private String tenantId;

    /**
     * 所属实体（组织机构、账户组、账户）的编号
     */
    private String parentId;

    /**
     * 扩展属性编号
     */
    private String attributeId;

    /**
     * 扩展属性字段名
     */
    private String attributeFieldName;

    /**
     * 扩展属性字段值
     */
    private String attributeFieldValue;
}
