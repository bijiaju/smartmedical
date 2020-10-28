package com.hp.docker_base.service;

import com.hp.docker_base.bean.bo.AbstractExtendAttributeConfigBo;
import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.bean.em.EnumExtendAttributeType;
import com.hp.docker_base.bean.extend.ExtendAttribute;
import com.hp.docker_base.bean.response.Page;

import java.util.List;
import java.util.Map;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:44
 */
public interface IExtendAttributeService {

    /**
     * 添加扩展属性的基础信息，不包括文本类、数字类和选项类扩展属性的个性化配置信息
     *
     * @param tenantId                租户编号
     * @param extendAttributeBaseInfo 扩展属性的基础信息
     * @param createUserId            创建人员编号
     */
    void addExtendAttributeBaseInfo(String tenantId,
                                    ExtendAttribute extendAttributeBaseInfo,
                                    String createUserId);

    /**
     * 新增扩展属性的配置信息，包括文本类、数字类和选项类的扩展属性
     *
     * @param attributeId               属性编号
     * @param extendAttributeConfigInfo 扩展属性配置信息
     * @param createUserId              创建人员编号
     */
    void addExtendAttributeConfigInfo(String attributeId,
                                      AbstractExtendAttributeConfigBo extendAttributeConfigInfo,
                                      String createUserId);


    /**
     * 更新扩展属性的基础信息，不包括文本类、数字类和选项类扩展属性的个性化配置信息
     *
     * @param extendAttributeBaseInfo 扩展属性的基础信息
     * @param updateUserId            更新人员编号
     */
    void modifyExtendAttributeBaseInfo(ExtendAttribute extendAttributeBaseInfo,
                                       String updateUserId);

    /**
     * 更新扩展属性的配置信息，包括文本类、数字类和选项类扩展属性的个性化配置信息
     *
     * @param attributeId               扩展属性编号
     * @param extendAttributeConfigInfo 扩展属性的配置信息
     * @param updateUserId              更新人员编号
     */
    void modifyExtendAttributeConfigInfo(String attributeId,
                                         AbstractExtendAttributeConfigBo extendAttributeConfigInfo,
                                         String updateUserId);


    /**
     * 删除扩展属性的基本信息，不包括文本类、数字类和选项类扩展属性的个性配置信息
     *
     * @param attributeId  扩展属性编号
     * @param deleteUserId 删除人员编号
     */
    void removeExtendAttributeBaseInfoById(String attributeId,
                                           String deleteUserId);

    /**
     * 删除扩展属性的配置信息，不包括文本类、数字类和选项类扩展属性的个性配置信息
     *
     * @param attributeId   扩展属性编号
     * @param attributeType 扩展属性类型
     * @param deleteUserId  删除人员编号
     */
    void removeExtendAttributeConfigInfoById(String attributeId,
                                             EnumExtendAttributeType attributeType,
                                             String deleteUserId);


    /**
     * 查询扩展属性的基础信息，不包括文本类、数字类和选项类扩展属性的配置信息
     *
     * @param attributeId 扩展属性编号
     */
    ExtendAttribute findExtendAttributeBaseInfoById(String attributeId);

    /**
     * 查询扩展属性基础属性，通过类型和属性字段名称
     *
     * @param attributeCategory  扩展属性所属分类（组织机构 / 用户组 / 账号）
     * @param attributeFieldName 扩展属性字段名称
     */
    ExtendAttribute findExtendAttributeConfigInfoByFiledName(String tenantId,
                                                             int attributeCategory,
                                                             String attributeFieldName);

    /**
     * 查询扩展属性的配置信息，包括文本类、数字类和选项类的扩展属性
     *
     * @param attributeId   扩展属性编号
     * @param attributeType 扩展属性类型
     */
    AbstractExtendAttributeConfigBo findExtendAttributeConfigInfoById(String attributeId,
                                                                      EnumExtendAttributeType attributeType);

    /**
     * 查询自定义扩展属性列表，支持通过扩展属性分类、扩展属性名称进行分页查询
     *
     * @param tenantId                租户编号
     * @param attributeCategory       扩展属性所属分类（组织机构 | 账户组 | 账户）
     * @param includeInvalidAttribute 是否包含无效的扩展属性
     * @param keywords                关键字，支持属性名称模糊查询
     * @param offset                  分页数据偏移量，注意不是页数
     * @param limit                   每页数据个数
     */
    Page<ExtendAttributeBo> findExtendAttributeListByPage(String tenantId,
                                                          int attributeCategory,
                                                          boolean includeInvalidAttribute,
                                                          String keywords,
                                                          int offset,
                                                          int limit);

    /**
     * 获取某分类下有效的扩展属性列表
     *
     * @param tenantId          租户编号
     * @param attributeCategory 扩展属性所属分类（组织机构、账户组、账户）
     */
    List<ExtendAttributeBo> findExtendAttributeListByCategory(String tenantId,
                                                              Integer attributeCategory);

    /**
     * 启用/禁用自定义扩展属性
     *
     * @param attributeId  扩展属性编号
     * @param validState   启用/禁用扩展属性，0：禁用 | 1：启用
     * @param updateUserId 更新人员编号
     */
    void modifyExtendAttributeValidStateById(String attributeId,
                                             int validState,
                                             String updateUserId);

    /**
     * 获取新增自定义扩展属性的默认排序值
     * 首先获取当前租户下的所有自定义扩展属性的最大排序值，然后+1返回
     *
     * @param tenantId 租户编号
     */
    int findDefaultSort(String tenantId);

    /**
     * 获取转换的map
     */
    Map<String,String> queryAttrTransMap();


}
