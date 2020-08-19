package com.hp.docker_base.bean.bo;

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

public class SelectionExtendAttributeConfigBo extends AbstractExtendAttributeConfigBo implements Serializable {
    private static final long serialVersionUID = 8346215073795577538L;

    /**
     * 选项列表
     */
    private List<SelectionContentBo> selectionList;
}
