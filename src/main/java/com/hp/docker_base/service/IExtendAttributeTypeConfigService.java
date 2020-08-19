package com.hp.docker_base.service;


import java.util.List;

/**
 * @description: 扩展属性的配置信息相关服务
 * @author: bee
 * @create: 2020-03-31 15:42
 **/
public interface IExtendAttributeTypeConfigService<T> {
    /**
     * 新增扩展属性的配置信息，包括文本类、数字类和选项类
     *
     * @param attributeId               扩展属性编号
     * @param extendAttributeConfigInfo 扩展属性的配置信息
     * @param createUserId              创建人员编号
     */
    void addExtendAttributeConfigInfo(
            String attributeId,
            T extendAttributeConfigInfo,
            String createUserId
    );

    /**
     * 更新扩展属性的配置信息，包括文本类、数字类和选项类
     *
     * @param attributeId               扩展属性编号
     * @param extendAttributeConfigInfo 扩展属性的配置信息
     * @param updateUserId              更新人员编号
     */
    void modifyExtendAttributeConfigInfo(
            String attributeId,
            T extendAttributeConfigInfo,
            String updateUserId
    );

    /**
     * 删除扩展属性的配置信息，包括文本类、数字类和选项类
     *
     * @param attributeId  扩展属性编号
     * @param deleteUserId 删除人员编号
     */
    int removeExtendAttributeConfigInfoById(
            String attributeId,
            String deleteUserId
    );

    /**
     * 查询单个扩展属性的配置信息，包括文本类、数字类和选项类
     *
     * @param attributeId 扩展属性编号
     */
    T findExtendAttributeConfigInfoById(
            String attributeId
    );

    /**
     * 查询多个扩展属性的配置信息，包括文本类、数字类和选项类
     *
     * @param attributeIdList 扩展属性编号
     */
    List<T> findExtendAttributeConfigInfoByIdList(
            List<String> attributeIdList
    );
}
