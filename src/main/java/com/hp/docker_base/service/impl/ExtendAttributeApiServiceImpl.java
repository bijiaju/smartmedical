package com.hp.docker_base.service.impl;


import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.bo.AbstractExtendAttributeConfigBo;
import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.bean.dto.extend.AbstractExtendAttributeConfigDto;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.em.EnumExceptionCode;
import com.hp.docker_base.bean.em.EnumExtendAttributeCategory;
import com.hp.docker_base.bean.em.EnumExtendAttributeType;
import com.hp.docker_base.bean.exception.DataException;
import com.hp.docker_base.bean.extend.ExtendAttribute;
import com.hp.docker_base.bean.response.Page;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.IExtendAttributeApiService;
import com.hp.docker_base.service.IExtendAttributeService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.convert.ExtendAttributeObjectTypeConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @description: 扩展属性相关服务实现
 * @author: bee
 * @create: 2020-03-31 11:48
 **/
@Service
public class ExtendAttributeApiServiceImpl implements IExtendAttributeApiService {

    @Autowired
    private IExtendAttributeService extendAttributeConfigService;

    @Autowired
    private IDepartmentService departmentService;


    // region 新增扩展属性信息
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ExtendAttributeDto addExtendAttributeInfo(String tenantId,
                                                     ExtendAttributeDto extendAttributeInfo,
                                                     String createUserId) {
        if (extendAttributeInfo == null || StringUtils.isEmpty(createUserId)) {
            return null;
        }

        // 1、检查添加扩展属性时的信息完整性
        checkExtendAttributeDataIntegrity(extendAttributeInfo);

        // 2、检查扩展属性字段类型+名称是否唯一
        checkExtendAttributeIsUnique(
                tenantId,
                extendAttributeInfo.getAttributeCategory(),
                extendAttributeInfo.getAttributeFieldName()
        );

        // 3、添加扩展属性的基础信息
        String attributeId = addExtendAttributeBaseInfo(tenantId, extendAttributeInfo, createUserId);

        // 4、添加扩展属性的配置信息（文本类、数字类和选型类的扩展属性）
        addExtendAttributeConfigInfo(attributeId, extendAttributeInfo.getAttributeConfigInfo(), createUserId);

        // 5.查询扩展属性的完整信息
        return queryExtendAttributeInfoById(attributeId);
    }

    /**
     * 添加扩展属性的基础信息，不包括文本类、数字类和选项类扩展属性的个性化配置信息
     *
     * @param tenantId                租户编号
     * @param extendAttributeBaseInfo 扩展属性的基础信息
     * @param createUserId            创建人员编号
     * @return 新增扩展属性的唯一编号
     */
    private String addExtendAttributeBaseInfo(String tenantId,
                                              ExtendAttributeDto extendAttributeBaseInfo,
                                              String createUserId) {
        // 类型转换，DTO -> DAO
        ExtendAttribute record = ExtendAttributeObjectTypeConvertUtils.convertExtendAttributeDtoToDao(extendAttributeBaseInfo);
       // record.setUuid(CommonUtil.generateUUID());
        if(StringUtils.isEmpty(record.getUuid())){
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_UUID_NULL.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_UUID_NULL.getMessage());
        }

        record.setTenantId(tenantId);
        extendAttributeConfigService.addExtendAttributeBaseInfo(tenantId, record, createUserId);

        return record.getUuid();
    }

    /**
     * 添加扩展属性（文本类、数字类和选项类）的配置信息
     *
     * @param attributeId               扩展属性编号
     * @param extendAttributeConfigInfo 扩展属性的配置信息
     * @param createUserId              创建人员编号
     */
    private void addExtendAttributeConfigInfo(String attributeId,
                                              AbstractExtendAttributeConfigDto extendAttributeConfigInfo,
                                              String createUserId) {
        if (extendAttributeConfigInfo == null) {
            return;
        }

        // 类型转换，DTO -> BO
        AbstractExtendAttributeConfigBo extendAttributeConfigBo = ExtendAttributeObjectTypeConvertUtils.
                convertExtendAttributeConfigDtoToBo(extendAttributeConfigInfo);

        extendAttributeConfigService.addExtendAttributeConfigInfo(
                attributeId,
                extendAttributeConfigBo,
                createUserId
        );
    }

    @Override
    public int queryDefaultSort(String tenantId) {
        return extendAttributeConfigService.findDefaultSort(tenantId);
    }
    // endregion

    // region 编辑扩展属性信息
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ExtendAttributeDto editExtendAttributeInfo(String departmentId,
                                                      ExtendAttributeDto extendAttributeInfo,
                                                      String updateUserId) {
        if (StringUtils.isEmpty(updateUserId)
                || extendAttributeInfo == null
                || StringUtils.isEmpty(extendAttributeInfo.getUuid())) {
            return null;
        }

        // 1、检查扩展属性的信息完整性
        checkExtendAttributeDataIntegrity(extendAttributeInfo);

        // 2、检查扩展属性的信息正确性
        checkExtendAttributeInfoValidity(extendAttributeInfo);

        // 3、更新扩展属性的基础信息
        updateExtendAttributeBaseInfo(departmentId,extendAttributeInfo, updateUserId);

        // 4、更新扩展属性的配置信息（文本类、数字类和选型类的扩展属性）
        updateExtendAttributeConfigInfo(extendAttributeInfo.getUuid(), extendAttributeInfo.getAttributeConfigInfo(), updateUserId);

        // 5、查询扩展属性的完整信息
        return queryExtendAttributeInfoById(extendAttributeInfo.getUuid());
    }

    /**
     * 更新扩展属性的基础信息，不包括文本类、数字类和选项类扩展属性的个性化配置信息
     *
     * @param departmentId
     * @param extendAttributeBaseInfo 扩展属性的基础信息
     * @param updateUserId            更新人员编号
     */
    private void updateExtendAttributeBaseInfo(String departmentId,
                                               ExtendAttributeDto extendAttributeBaseInfo,
                                               String updateUserId) {
        // 类型转换，DTO -> DAO
      //  extendAttributeBaseInfo.setDepartmentId(departmentId);
        ExtendAttribute record = ExtendAttributeObjectTypeConvertUtils
                .convertExtendAttributeDtoToDao(extendAttributeBaseInfo);

        // 不支持更新扩展属性的字段名称、字段类型和所属分类
        record.setFieldName(null);
        record.setFieldType(null);
        record.setCategory(null);

        extendAttributeConfigService.modifyExtendAttributeBaseInfo(record, updateUserId);
    }

    /**
     * 更新扩展属性的配置信息，包括文本类、数字类和选项类扩展属性的个性化配置信息
     *
     * @param attributeId               扩展属性编号
     * @param extendAttributeConfigInfo 扩展属性的配置信息
     * @param updateUserId              更新人员编号
     */
    private void updateExtendAttributeConfigInfo(String attributeId,
                                                 AbstractExtendAttributeConfigDto extendAttributeConfigInfo,
                                                 String updateUserId) {

        // 类型转换，DTO -> BO
        AbstractExtendAttributeConfigBo extendAttributeConfigBo = ExtendAttributeObjectTypeConvertUtils
                .convertExtendAttributeConfigDtoToBo(extendAttributeConfigInfo);

        extendAttributeConfigService.modifyExtendAttributeConfigInfo(
                attributeId,
                extendAttributeConfigBo,
                updateUserId
        );
    }

    // endregion

    // region 删除扩展属性信息
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteExtendAttributeInfoById(String attributeId, String deleteUserId) {
        if (StringUtils.isEmpty(attributeId) || StringUtils.isEmpty(deleteUserId)) {
            return;
        }

        // 1、获取扩展属性的基础信息
        ExtendAttributeDto extendAttributeInfo = queryExtendAttributeBaseInfo(attributeId);
        if (extendAttributeInfo == null) {
            return;
        }

        // 2、删除扩展属性的基础信息
        deleteExtendAttributeBaseInfo(attributeId, deleteUserId);

        // 3、删除扩展属性的配置信息
        deleteExtendAttributeConfigInfo(
                attributeId,
                EnumExtendAttributeType.getExtendAttributeType(extendAttributeInfo.getAttributeFieldType()),
                deleteUserId
        );
    }

    /**
     * 删除扩展属性的基本信息，不包括文本类、数字类和选项类扩展属性的个性配置信息
     *
     * @param attributeId  扩展属性编号
     * @param deleteUserId 删除人员编号
     */
    private void deleteExtendAttributeBaseInfo(String attributeId, String deleteUserId) {
        extendAttributeConfigService.removeExtendAttributeBaseInfoById(attributeId, deleteUserId);
    }

    /**
     * 删除扩展属性的配置信息，不包括文本类、数字类和选项类扩展属性的个性配置信息
     *
     * @param attributeId   扩展属性编号
     * @param attributeType 扩展属性类型
     * @param deleteUserId  删除人员编号
     */
    private void deleteExtendAttributeConfigInfo(String attributeId,
                                                 EnumExtendAttributeType attributeType,
                                                 String deleteUserId) {

        extendAttributeConfigService.removeExtendAttributeConfigInfoById(
                attributeId,
                attributeType,
                deleteUserId
        );
    }
    // endregion

    // region 查询扩展属性信息
    @Override
    public ExtendAttributeDto queryExtendAttributeInfoById(String attributeId) {
        if (StringUtils.isEmpty(attributeId)) {
            return null;
        }

        // 1、查询扩展属性的基础信息
        ExtendAttributeDto extendAttributeInfo = queryExtendAttributeBaseInfo(attributeId);
        if (extendAttributeInfo == null) {
            return null;
        }

        // 2、查询扩展属性的配置信息
        AbstractExtendAttributeConfigDto extendAttributeConfigInfo = queryExtendAttributeConfigInfo(
                attributeId,
                EnumExtendAttributeType.getExtendAttributeType(extendAttributeInfo.getAttributeFieldType())
        );
        extendAttributeInfo.setAttributeConfigInfo(extendAttributeConfigInfo);

        return extendAttributeInfo;
    }

    /**
     * 查询扩展属性的基础信息，不包括文本类、数字类和选项类扩展属性的配置信息
     *
     * @param attributeId 扩展属性编号
     */
    private ExtendAttributeDto queryExtendAttributeBaseInfo(String attributeId) {
        // 获取所有的科室
        List<Department> departmentList = departmentService.queryAllDepartmentList(null);

        ExtendAttribute extendAttribute = extendAttributeConfigService.findExtendAttributeBaseInfoById(attributeId);
        if (extendAttribute == null) {
            return null;
        }

        return ExtendAttributeObjectTypeConvertUtils.convertExtendAttributeDaoToDto(extendAttribute,departmentList);
    }

    /**
     * 查询扩展属性配置信息，包括文本类、数字类和选项类扩展属性的配置信息
     *
     * @param attributeId   扩展属性编号
     * @param attributeType 扩展属性字段类型
     */
    private AbstractExtendAttributeConfigDto queryExtendAttributeConfigInfo(String attributeId,
                                                                            EnumExtendAttributeType attributeType) {

        AbstractExtendAttributeConfigBo extendAttributeConfigBo = extendAttributeConfigService.
                findExtendAttributeConfigInfoById(attributeId, attributeType);
        if (extendAttributeConfigBo == null) {
            return null;
        }

        return ExtendAttributeObjectTypeConvertUtils.convertExtendAttributeConfigBoToDto(extendAttributeConfigBo);
    }

    @Override
    public Page<ExtendAttributeDto> queryExtendAttributeListByPage(String tenantId,
                                                                   int attributeCategory,
                                                                   boolean includeInvalidAttribute,
                                                                   String keywords,
                                                                   int offset,
                                                                   int limit) {
        List<Department> departmentList = departmentService.queryAllDepartmentList(null);

        Page<ExtendAttributeBo> boPage = extendAttributeConfigService.findExtendAttributeListByPage(
                tenantId,
                attributeCategory,
                includeInvalidAttribute,
                keywords,
                offset,
                limit
        );

        Page<ExtendAttributeDto> dtoPage = Page.makePageByOffsetRecord(offset, limit);
        dtoPage.setTotal(extendAttributeConfigService.findExtendAttributeListByPage(
                tenantId,
                attributeCategory,
                includeInvalidAttribute,
                keywords,
                0,
                Integer.MAX_VALUE
        ).getRecords().size());
        dtoPage.setRecords(boPage.getRecords()
                .stream()
                .map(bo -> ExtendAttributeObjectTypeConvertUtils.convertExtendAttributeBoToDto(bo, departmentList))
                .collect(Collectors.toList()));

        return dtoPage;
    }

    @Override
    public List<ExtendAttributeDto> queryExtendAttributeListByCategory(String tenantId,
                                                                       int attributeCategory) {

        List<Department> departmentList = departmentService.queryAllDepartmentList(null);

    /*    if (StringUtils.isEmpty(tenantId)) {
            return new ArrayList<>();
        }*/

        return extendAttributeConfigService.findExtendAttributeListByCategory(tenantId, attributeCategory)
                .stream()
                .map(bo -> ExtendAttributeObjectTypeConvertUtils.convertExtendAttributeBoToDto(bo, departmentList))
                .collect(Collectors.toList());
    }

    // endregion

    // region 属性参数检查

    /**
     * 检查扩展属性时的信息完整性
     *
     * @param extendAttributeInfo 扩展属性信息
     */
    private void checkExtendAttributeDataIntegrity(ExtendAttributeDto extendAttributeInfo) {
        if (extendAttributeInfo == null) {
            return;
        }

        // 1、检查扩展属性名称是否为空
        if (StringUtils.isEmpty(extendAttributeInfo.getAttributeName())) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_NAME_NULL.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_NAME_NULL.getMessage());
        }

        // 2、检查扩展属性字段名称是否为空
        if (StringUtils.isEmpty(extendAttributeInfo.getAttributeFieldName())) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_NULL.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_NULL.getMessage());
        }

        // 3、检查是否选择了扩展属性的所属分类
        if (extendAttributeInfo.getAttributeCategory() == null
                || EnumExtendAttributeCategory.getExtendAttributeCategory(extendAttributeInfo.getAttributeCategory()) == null) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_CATEGORY_NULL.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_CATEGORY_NULL.getMessage());
        }

        // 4、检查是否选择了扩展属性的字段类型
        if (EnumExtendAttributeType.getExtendAttributeType(extendAttributeInfo.getAttributeFieldType()) == null) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_TYPE_NULL.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_TYPE_NULL.getMessage());
        }
    }


    /**
     * 检查扩展属性的正确性
     *
     * @param extendAttributeBaseInfo 扩展属性的基础信息
     */
    private void checkExtendAttributeInfoValidity(ExtendAttributeDto extendAttributeBaseInfo) {
        if (extendAttributeBaseInfo == null) {
            return;
        }

        // 1、检查是否存在扩展属性记录
        ExtendAttribute oldExtendAttributeInfo = extendAttributeConfigService.findExtendAttributeBaseInfoById(extendAttributeBaseInfo.getUuid());
        if (oldExtendAttributeInfo == null) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_NOT_EXIST.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_NOT_EXIST.getMessage());
        }

        // 2、检查扩展属性的所属分类是否发生变更
        if (oldExtendAttributeInfo.getCategory().intValue() != extendAttributeBaseInfo.getAttributeCategory()) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_CATEGORY_CHANGE.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_CATEGORY_CHANGE.getMessage());
        }

        // 3、检查扩展属性的字段名称是否发生变更
        if (!oldExtendAttributeInfo.getFieldName().equals(extendAttributeBaseInfo.getAttributeFieldName())) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_CHANGE.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_CHANGE.getMessage());
        }

        // 4、检查扩展属性的字段类型是否发生变更
        if (!oldExtendAttributeInfo.getFieldType().equals(extendAttributeBaseInfo.getAttributeFieldType())) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_TYPE_CHANGE.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_TYPE_CHANGE.getMessage());
        }
    }

    /**
     * 判断扩展属性字段名称是否唯一（类型 + 属性字段名称）
     *
     * @param tenantId           租户编号
     * @param attributeCategory  扩展属性所属分类（组织机构 / 用户组 / 账号）
     * @param attributeFieldName 扩展属性字段名称
     */
    private void checkExtendAttributeIsUnique(String tenantId,
                                              int attributeCategory,
                                              String attributeFieldName) {

        ExtendAttribute record = extendAttributeConfigService.findExtendAttributeConfigInfoByFiledName(
                tenantId, attributeCategory, attributeFieldName);

        if (record != null) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_REPEAT.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_NAME_REPEAT.getMessage());
        }
    }
    // endregion

    // region 启用/禁用扩展属性
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateExtendAttributeValidStateById(String attributeId,
                                                    int validState,
                                                    String updateUserId) {
        extendAttributeConfigService.modifyExtendAttributeValidStateById(
                attributeId,
                validState,
                updateUserId
        );
    }
    // endregion
}
