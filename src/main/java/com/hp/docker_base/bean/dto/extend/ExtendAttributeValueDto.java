package com.hp.docker_base.bean.dto.extend;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @program: IDAAS
 * @description: 扩展属性值信息
 * @author: bee
 * @create: 2020-04-20 16:44
 **/
@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = false)
public class ExtendAttributeValueDto implements Serializable {

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
