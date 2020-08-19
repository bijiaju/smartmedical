package com.hp.docker_base.bean.bo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;

/**
 * @program: idaas
 * @description: 选项内容信息
 * @author: 姬同凯
 * @create: 2020-03-19 09:14
 **/
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

public class SelectionContentBo implements Serializable {
    private static final long serialVersionUID = 4959161704791132452L;

    /**
     * 选项唯一编号
     */
    private String uuid;

    /**
     * 选项内容
     */
    private String content;

    /**
     * 是否默认选中，1:默认选中 | 0:默认未选中
     */
    private Integer defaultSelection;

    /**
     * 排序值
     */
    private Integer sort;
}
