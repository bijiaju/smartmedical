package com.hp.docker_base.bean.bo;

import com.hp.docker_base.bean.extend.ExtendAttribute;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @program: IDAAS
 * @description: 扩展属性完整信息
 * @author: 姬同凯
 * @create: 2020-04-18 15:42
 **/
@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = true)
public class ExtendAttributeBo extends ExtendAttribute implements Serializable {
    private static final long serialVersionUID = -2232230217283420490L;

    /**
     * 所属组织机构/账户/账户组编号
     */
    private String parentId;

    /**
     * 自定义属性值
     */
    private String attributeFieldValue;

    /**
     * 扩展属性配置信息，支持文本类、数字类和选项类扩展属性的配置
     */
    private AbstractExtendAttributeConfigBo attributeConfigInfo;
}
