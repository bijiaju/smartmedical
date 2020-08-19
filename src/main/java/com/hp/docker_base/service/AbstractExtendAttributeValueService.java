package com.hp.docker_base.service;

import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.bean.bo.ExtendAttributeValueBo;
import com.hp.docker_base.bean.em.EnumExceptionCode;
import com.hp.docker_base.bean.em.EnumExtendAttributeCategory;
import com.hp.docker_base.bean.em.EnumUnique;
import com.hp.docker_base.bean.exception.DataException;
import com.hp.docker_base.util.ExtendAttributeUtils;
import com.hp.docker_base.util.ObjectConvertUtils;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @description: 各类型（组织机构、账户组、账户）扩展属性内容存储相关服务定义
 * @author: bee
 * @create: 2020-04-03 09:52
 **/
public abstract class AbstractExtendAttributeValueService {

    @Autowired
    public IExtendAttributeService extendAttributeService;

    /**
     * 新增实体（组织机构、账户组、账户）的扩展属性信息
     *
     * @param parentId            实体（组织机构、账户组、账户）的编号
     * @param extendAttributeInfo 扩展属性信息，包括扩展属性定义和具体的值信息
     * @param createUserId        创建人员编号
     */
    protected abstract void addExtendAttributeValueInfo(String parentId,
                                                        ExtendAttributeValueBo extendAttributeInfo,
                                                        String createUserId);

    /**
     * 更新实体（组织机构、账户组、账户）的扩展属性信息
     *
     * @param parentId            实体（组织机构、账户组、账户）的编号
     * @param extendAttributeInfo 扩展属性信息，包括扩展属性定义和具体的值信息
     * @param updateUserId        更新人员编号
     */
    protected abstract int modifyExtendAttributeValueInfo(String parentId,
                                                          ExtendAttributeValueBo extendAttributeInfo,
                                                          String updateUserId);

    /**
     * 删除实体对应的扩展属性值
     *
     * @param parentId        实体（组织机构、账户组、账户）的编号
     * @param attributeIdList 扩展属性编号列表
     * @param deleteUserId    删除用户编号
     */
    public abstract void removeExtendAttributeValueInfo(String parentId,
                                                        List<String> attributeIdList,
                                                        String deleteUserId);

    /**
     * 查询实体的扩展属性信息
     *
     * @param tenantId 租户编号
     * @param parentId 实体编号
     */
    public abstract List<ExtendAttributeBo> findExtendAttributeValueInfoById(String tenantId,
                                                                             String parentId);

    /**
     * 查询实体的扩展属性信息
     *
     * @param tenantId     租户编号
     * @param parentIdList 实体编号列表
     */
    public abstract Map<String, List<ExtendAttributeBo>> findExtendAttributeValueMapByIdList(String tenantId,
                                                                                             List<String> parentIdList);

    /**
     * 通过扩展属性字段名和属性值查询父级（组织机构、账户、账户组）编号
     *
     * @param tenantId            租户编号
     * @param attributeFieldName  扩展属性字段名
     * @param attributeFieldValue 扩展属性值
     */
    public abstract List<String> findParentIdByAttributeNameAndValue(String tenantId,
                                                                     String attributeFieldName,
                                                                     String attributeFieldValue);

    /**
     * 校验扩展属性的值是否唯一
     *
     * @param tenantId            租户编号
     * @param parentId            父级编号
     * @param attributeId         扩展属性编号
     * @param attributeFieldValue 扩展属性内容
     */
    public abstract boolean isExtendAttributeValueUnique(String tenantId,
                                                         String parentId,
                                                         String attributeId,
                                                         String attributeFieldValue);

    /**
     * 保存实体（组织机构、账户组、账户）的扩展属性信息
     *
     * @param tenantId                 租户编号
     * @param parentId                 实体（组织机构、账户组、账户）的编号
     * @param attributeCategory        扩展属性所属分类，组织机构 | 账户组 | 账户
     * @param extendAttributeValueList 扩展属性具体的值信息
     * @param operateUserId            操作人员编号
     */
    public void saveExtendAttributeValueInfo(String tenantId,
                                             String parentId,
                                             EnumExtendAttributeCategory attributeCategory,
                                             List<ExtendAttributeValueBo> extendAttributeValueList,
                                             String operateUserId) {

        if (StringUtils.isEmpty(tenantId)
                || StringUtils.isEmpty(parentId)
                || attributeCategory == null
                || StringUtils.isEmpty(operateUserId)) {
            return;
        }

        // 1、获取该实体有效的扩展属性列表
        List<ExtendAttributeBo> extendAttributeList = extendAttributeService.findExtendAttributeListByCategory(
                tenantId, attributeCategory.getCode());

        // 2、去除无关的扩展属性
        ExtendAttributeUtils.removeIrrelevantExtendAttributeValue(extendAttributeList, extendAttributeValueList);

        // 3、检查扩展属性值的完整性和正确性
        checkExtendAttributeInfo(tenantId, parentId, extendAttributeList, extendAttributeValueList);

        // 4、识别需要增加、更新的扩展属性值，先进行更新，无更新的数据再增加
        for (ExtendAttributeValueBo extendAttributeValue : extendAttributeValueList) {
            extendAttributeValue.setTenantId(tenantId);
            int count = modifyExtendAttributeValueInfo(parentId, extendAttributeValue, operateUserId);
            if (count == 0) {
                addExtendAttributeValueInfo(parentId, extendAttributeValue, operateUserId);
            }
        }
    }

    /**
     * 检查扩展属性值的完整性和正确性
     *
     * @param tenantId                 租户编号
     * @param parentId                 父级编号，可以是组织机构编号、账户编号或账户组编号
     * @param extendAttributeList      分类（组织机构、账户组、账户）下自定义的扩展属性列表
     * @param extendAttributeValueList 要保存的扩展属性值列表
     */
    private void checkExtendAttributeInfo(String tenantId,
                                          String parentId,
                                          List<ExtendAttributeBo> extendAttributeList,
                                          List<ExtendAttributeValueBo> extendAttributeValueList) {

        if (StringUtils.isEmpty(tenantId) || CollectionUtils.isEmpty(extendAttributeList)) {
            return;
        }

        Map<String, List<ExtendAttributeValueBo>> extendAttributeValueMap = extendAttributeValueList
                .stream()
                .collect(Collectors.groupingBy(ExtendAttributeValueBo::getAttributeId));

        // 编辑检查扩展属性值的正确性，包括必填项检查、唯一项检查、格式检查、取值范围检查等
        for (ExtendAttributeBo extendAttributeValueInfo : extendAttributeList) {

            ExtendAttributeValueBo extendAttributeValue = ObjectConvertUtils.getFirstElementOfList(
                    extendAttributeValueMap.get(extendAttributeValueInfo.getUuid())
            );

            if (extendAttributeValue != null) {
                extendAttributeValueInfo.setAttributeFieldValue(extendAttributeValue.getAttributeFieldValue());
            }

            // 开始检查
            checkExtendAttributeInfo(tenantId, parentId, extendAttributeValueInfo);
        }
    }

    /**
     * 检查扩展属性值的完整性和正确性
     *
     * @param extendAttributeValueInfo 扩展属性值信息
     */
    private void checkExtendAttributeInfo(String tenantId,
                                          String parentId,
                                          ExtendAttributeBo extendAttributeValueInfo) {
        if (extendAttributeValueInfo == null) {
            return;
        }

        // 1、必填属性值校验
        ExtendAttributeUtils.checkExtendAttributeInfoIntegrity(extendAttributeValueInfo);

        // 2、属性值正确性（格式、范围）校验
        ExtendAttributeUtils.checkExtendAttributeInfoValidity(extendAttributeValueInfo);

        // 3、唯一属性值校验
        if (extendAttributeValueInfo.getIsUnique() == EnumUnique.YES.getCode()
                && !isExtendAttributeValueUnique(tenantId, parentId, extendAttributeValueInfo.getUuid(),
                extendAttributeValueInfo.getAttributeFieldValue())) {

            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_NOT_UNIQUE.getCode(),
                    String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_NOT_UNIQUE.getMessage(),
                            extendAttributeValueInfo.getAttrName()));
        }
    }

}
