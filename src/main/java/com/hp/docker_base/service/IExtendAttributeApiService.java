package com.hp.docker_base.service;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:23
 */

import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.response.Page;

import java.util.List;

/**
 * @program: idaas
 * @description: 自定义扩展属性相关API服务
 * @author: bee
 * @create: 2020-03-31 11:41
 **/
public interface IExtendAttributeApiService {

    /**
     * 新增自定义扩展属性信息
     *
     * @param tenantId            租户编号
     * @param extendAttributeInfo 扩展属性信息
     * @param createUserId        创建人员编号
     */
    ExtendAttributeDto addExtendAttributeInfo(String tenantId,
                                              ExtendAttributeDto extendAttributeInfo,
                                              String createUserId);

    /**
     * 更新自定义扩展属性信息
     *
     * @param extendAttributeDto 扩展属性信息
     * @param updateUserId       更新人员编号
     */
    ExtendAttributeDto editExtendAttributeInfo(ExtendAttributeDto extendAttributeDto,
                                               String updateUserId);

    /**
     * 删除自定义扩展属性
     *
     * @param attributeId  扩展属性编号
     * @param deleteUserId 删除人员编号
     */
    void deleteExtendAttributeInfoById(String attributeId,
                                       String deleteUserId);

    /**
     * 查询自定义扩展属性信息
     *
     * @param attributeId 扩展属性编号
     */
    ExtendAttributeDto queryExtendAttributeInfoById(String attributeId);

    /**
     * 查询自定义扩展属性列表，支持通过扩展属性分类、扩展属性名称进行分页查询
     *
     * @param tenantId                租户编号
     * @param attributeCategory       扩展属性所属分类（组织机构 | 账户组 | 账户）
     * @param includeInvalidAttribute 是否包含未启用的扩展属性
     * @param keywords                关键字，支持属性名称模糊查询
     * @param offset                  分页数据偏移量，注意不是页数
     * @param limit                   每页数据个数
     */
    Page<ExtendAttributeDto> queryExtendAttributeListByPage(String tenantId,
                                                            int attributeCategory,
                                                            boolean includeInvalidAttribute,
                                                            String keywords,
                                                            int offset,
                                                            int limit);

    /**
     * 获取某分类下有效的扩展属性列表
     *
     * @param attributeCategory 扩展属性所属分类（组织机构、账户组、账户）
     * @param tenantId          租户编号
     */
    List<ExtendAttributeDto> queryExtendAttributeListByCategory(String tenantId,
                                                                int attributeCategory);

    /**
     * 启用/禁用自定义扩展属性
     *
     * @param attributeId  扩展属性编号
     * @param validState   启用/禁用扩展属性，0：禁用 | 1：启用
     * @param updateUserId 更新人员编号
     */
    void updateExtendAttributeValidStateById(String attributeId,
                                             int validState,
                                             String updateUserId);

    /**
     * 获取新增自定义扩展属性的默认排序值
     * 首先获取当前租户下的所有自定义扩展属性的最大排序值，然后+1返回
     *
     * @param tenantId 租户编号
     */
    int queryDefaultSort(String tenantId);
}