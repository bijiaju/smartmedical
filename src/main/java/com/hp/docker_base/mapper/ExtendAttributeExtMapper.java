package com.hp.docker_base.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @program: idaas
 * @description: 扩展属性增强SQL方法
 * @author: 姬同凯
 * @create: 2020-03-31 15:52
 **/
@Mapper
public interface ExtendAttributeExtMapper {
    /**
     * 获取最大排序值
     */
    Integer maxSort(@Param("tenantId") String tenantId);
}