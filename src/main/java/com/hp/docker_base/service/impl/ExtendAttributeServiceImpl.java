package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.bo.*;
import com.hp.docker_base.bean.em.EnumExtendAttributeCategory;
import com.hp.docker_base.bean.em.EnumExtendAttributeType;
import com.hp.docker_base.bean.em.EnumValid;
import com.hp.docker_base.bean.extend.ExtendAttribute;
import com.hp.docker_base.bean.extend.ExtendAttributeExample;
import com.hp.docker_base.bean.response.Page;
import com.hp.docker_base.bean.response.PageQueryTemplate;
import com.hp.docker_base.bean.response.PageUtils;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.ExtendAttributeExtMapper;
import com.hp.docker_base.mapper.ExtendAttributeMapper;
import com.hp.docker_base.service.IExtendAttributeService;
import com.hp.docker_base.util.convert.ExtendAttributeObjectTypeConvertUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:46
 */
@Service
public class ExtendAttributeServiceImpl implements IExtendAttributeService {

    @Autowired
    private ExtendAttributeMapper extendAttributeMapper;

    @Autowired
    private ExtendAttributeExtMapper extendAttributeExtMapper;

    @Autowired
    private TextExtendAttributeConfigServiceImpl textExtendAttributeConfigService;

    @Autowired
    private NumberExtendAttributeConfigServiceImpl numberExtendAttributeConfigService;

    @Autowired
    private SelectionExtendAttributeConfigServiceImpl selectionExtendAttributeConfigService;

    // region 新增扩展属性信息
    @Override
    public void addExtendAttributeBaseInfo(String tenantId,
                                           ExtendAttribute extendAttributeBaseInfo,
                                           String createUserId) {
        if ( extendAttributeBaseInfo == null || StringUtils.isEmpty(createUserId)) {
            return;
        }

        // 默认非必填
        if (extendAttributeBaseInfo.getIsFill() == null) {
            extendAttributeBaseInfo.setIsFill(0);
        }

        // 默认不可修改
        if (extendAttributeBaseInfo.getIsModify() == null) {
            extendAttributeBaseInfo.setIsModify(0);
        }

        // 默认不唯一
        if (extendAttributeBaseInfo.getIsUnique() == null) {
            extendAttributeBaseInfo.setIsUnique(0);
        }

        // 默认禁用
        if (extendAttributeBaseInfo.getIsValid() == null) {
            extendAttributeBaseInfo.setIsValid(0);
        }

        // 如果没有设定排序值，则使用系统默认排序
        if (extendAttributeBaseInfo.getSort() == null) {
            extendAttributeBaseInfo.setSort(findDefaultSort(tenantId));
        }

        extendAttributeBaseInfo.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        extendAttributeBaseInfo.setCreateTime(new Date());
        extendAttributeBaseInfo.setCreateNumber(createUserId);
        extendAttributeBaseInfo.setUpdateTime(new Date());
        extendAttributeBaseInfo.setUpdateNumber(createUserId);

        extendAttributeMapper.insert(extendAttributeBaseInfo);
    }

    @Override
    public void addExtendAttributeConfigInfo(String attributeId,
                                             AbstractExtendAttributeConfigBo extendAttributeConfigInfo,
                                             String createUserId) {
        if (extendAttributeConfigInfo == null || StringUtils.isEmpty(createUserId)) {
            return;
        }

        if (extendAttributeConfigInfo instanceof TextExtendAttributeConfigBo) {
            // 新增文本类扩展属性配置信息，包括默认值、最大字符数等
            textExtendAttributeConfigService.addExtendAttributeConfigInfo(
                    attributeId,
                    (TextExtendAttributeConfigBo) extendAttributeConfigInfo,
                    createUserId
            );
        } else if (extendAttributeConfigInfo instanceof NumberExtendAttributeConfigBo) {
            // 新增数字类扩展属性配置信息，包括默认值、单位、范围
            numberExtendAttributeConfigService.addExtendAttributeConfigInfo(
                    attributeId,
                    (NumberExtendAttributeConfigBo) extendAttributeConfigInfo,
                    createUserId
            );
        } else if (extendAttributeConfigInfo instanceof SelectionExtendAttributeConfigBo) {
            // 新增选项类扩展属性配置信息，包括具体的选项配置
            selectionExtendAttributeConfigService.addExtendAttributeConfigInfo(
                    attributeId,
                    (SelectionExtendAttributeConfigBo) extendAttributeConfigInfo,
                    createUserId
            );
        }
    }

    @Override
    public int findDefaultSort(String tenantId) {
        Integer maxSort = extendAttributeExtMapper.maxSort(tenantId);
        if (maxSort == null) {
            maxSort = 0;
        }

        return maxSort + 1;
    }
    // endregion

    // region 编辑扩展属性信息
    @Override
    public void modifyExtendAttributeBaseInfo(ExtendAttribute extendAttributeBaseInfo,
                                              String updateUserId) {
        if (extendAttributeBaseInfo == null
                || StringUtils.isEmpty(updateUserId)) {
            return;
        }

        extendAttributeBaseInfo.setUpdateTime(new Date());
        extendAttributeBaseInfo.setUpdateNumber(updateUserId);

        ExtendAttributeExample example = new ExtendAttributeExample();
        ExtendAttributeExample.Criteria criteria = example.createCriteria();
        criteria.andUuidEqualTo(extendAttributeBaseInfo.getUuid());
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        extendAttributeMapper.updateByExampleSelective(extendAttributeBaseInfo, example);
    }


    @Override
    public void modifyExtendAttributeConfigInfo(String attributeId,
                                                AbstractExtendAttributeConfigBo extendAttributeConfigInfo,
                                                String updateUserId) {
        if (extendAttributeConfigInfo == null
                || StringUtils.isEmpty(updateUserId)) {
            return;
        }

        if (extendAttributeConfigInfo instanceof TextExtendAttributeConfigBo) {
            // 更新文本类扩展属性配置信息，包括默认值、最大字符数等
            textExtendAttributeConfigService.modifyExtendAttributeConfigInfo(
                    attributeId,
                    (TextExtendAttributeConfigBo) extendAttributeConfigInfo,
                    updateUserId
            );
        } else if (extendAttributeConfigInfo instanceof NumberExtendAttributeConfigBo) {
            // 更新数字类扩展属性配置信息，包括默认值、单位、范围
            numberExtendAttributeConfigService.modifyExtendAttributeConfigInfo(
                    attributeId,
                    (NumberExtendAttributeConfigBo) extendAttributeConfigInfo,
                    updateUserId
            );
        } else if (extendAttributeConfigInfo instanceof SelectionExtendAttributeConfigBo) {
            // 更新选项类扩展属性配置信息，包括具体的选项配置
            selectionExtendAttributeConfigService.modifyExtendAttributeConfigInfo(
                    attributeId,
                    (SelectionExtendAttributeConfigBo) extendAttributeConfigInfo,
                    updateUserId
            );
        }
    }

    // endregion

    // region 删除扩展属性信息
    @Override
    public void removeExtendAttributeBaseInfoById(String attributeId, String deleteUserId) {
        if (StringUtils.isEmpty(attributeId) || StringUtils.isEmpty(deleteUserId)) {
            return;
        }

        ExtendAttributeExample example = new ExtendAttributeExample();
        ExtendAttributeExample.Criteria criteria = example.createCriteria();
        criteria.andUuidEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        ExtendAttribute record = new ExtendAttribute();
        record.setIsDelete(EnumDelete.DELETE.getCode());
        record.setUpdateTime(new Date());
        record.setUpdateNumber(deleteUserId);

        extendAttributeMapper.updateByExampleSelective(record, example);
    }

    /**
     * 删除扩展属性的配置信息，包括文本类、数字类和选选项类的扩展属性
     *
     * @param attributeId   扩展属性编号
     * @param attributeType 扩展属性类型
     * @param deleteUserId  删除人员编号
     */
    @Override
    public void removeExtendAttributeConfigInfoById(String attributeId,
                                                    EnumExtendAttributeType attributeType,
                                                    String deleteUserId) {
        if (StringUtils.isEmpty(attributeId) || StringUtils.isEmpty(deleteUserId)) {
            return;
        }

        if (EnumExtendAttributeType.isTextAttributeType(attributeType)) {
            // 删除文本类扩展属性的配置信息
            textExtendAttributeConfigService.removeExtendAttributeConfigInfoById(attributeId, deleteUserId);
        } else if (EnumExtendAttributeType.isNumberAttributeType(attributeType)) {
            // 删除数字类扩展属性的配置信息
            numberExtendAttributeConfigService.removeExtendAttributeConfigInfoById(attributeId, deleteUserId);
        } else if (EnumExtendAttributeType.isSelectionAttributeType(attributeType)) {
            // 删除选项类扩展属性的配置信息
            selectionExtendAttributeConfigService.removeExtendAttributeConfigInfoById(attributeId, deleteUserId);
        }
    }

    // endregion

    // region 查询扩展属性信息
    @Override
    public ExtendAttribute findExtendAttributeBaseInfoById(String attributeId) {
        if (StringUtils.isEmpty(attributeId)) {
            return null;
        }

        ExtendAttributeExample example = new ExtendAttributeExample();
        ExtendAttributeExample.Criteria criteria = example.createCriteria();
        criteria.andUuidEqualTo(attributeId);

        List<ExtendAttribute> list = extendAttributeMapper.selectByExample(example);
        return CollectionUtils.isNotEmpty(list) ? list.get(0) : null;
    }

    @Override
    public ExtendAttribute findExtendAttributeConfigInfoByFiledName(String tenantId,
                                                                    int attributeCategory,
                                                                    String attributeFieldName) {
        if (StringUtils.isEmpty(attributeFieldName) ) {
            return null;
        }

        ExtendAttributeExample example = new ExtendAttributeExample();
        ExtendAttributeExample.Criteria criteria = example.createCriteria();
        if(StringUtils.isNotEmpty(tenantId)){
            criteria.andTenantIdEqualTo(tenantId);
        }

        criteria.andCategoryEqualTo(attributeCategory);
        criteria.andFieldNameEqualTo(attributeFieldName);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return Optional.ofNullable(extendAttributeMapper.selectByExample(example))
                .flatMap(list -> list.stream().findFirst())
                .orElse(null);
    }

    @Override
    public AbstractExtendAttributeConfigBo findExtendAttributeConfigInfoById(String attributeId,
                                                                             EnumExtendAttributeType attributeType) {
        if (StringUtils.isEmpty(attributeId)) {
            return null;
        }

        AbstractExtendAttributeConfigBo extendAttributeConfigBo = null;

        if (EnumExtendAttributeType.isTextAttributeType(attributeType)) {
            // 获取文本类扩展属性的配置信息
            extendAttributeConfigBo = textExtendAttributeConfigService.findExtendAttributeConfigInfoById(attributeId);
        } else if (EnumExtendAttributeType.isNumberAttributeType(attributeType)) {
            // 获取数字类扩展属性的配置信息
            extendAttributeConfigBo = numberExtendAttributeConfigService.findExtendAttributeConfigInfoById(attributeId);
        } else if (EnumExtendAttributeType.isSelectionAttributeType(attributeType)) {
            // 获取选项类扩展属性的配置信息
            extendAttributeConfigBo = selectionExtendAttributeConfigService.findExtendAttributeConfigInfoById(attributeId);
        }

        if (extendAttributeConfigBo != null) {
            extendAttributeConfigBo.setAttributeId(attributeId);
        }

        return extendAttributeConfigBo;
    }

    @Override
    public Page<ExtendAttributeBo> findExtendAttributeListByPage(String tenantId,
                                                                 int attributeCategory,
                                                                 boolean includeInvalidAttribute,
                                                                 String keywords,
                                                                 int offset,
                                                                 int limit) {
        Page<ExtendAttributeBo> page = PageUtils.makePage(offset, limit);


        // 1、分页获取扩展属性的基础信息
        page = PageQueryTemplate.selectByPage(
                page,
                pagingBounds -> {
                    ExtendAttributeExample example = new ExtendAttributeExample();
                    ExtendAttributeExample.Criteria criteria = example.createCriteria();
                    if(StringUtils.isNotEmpty(tenantId)){
                        criteria.andTenantIdEqualTo(tenantId);
                    }

                    if (EnumExtendAttributeCategory.getExtendAttributeCategory(attributeCategory) != null) {
                        criteria.andCategoryEqualTo(attributeCategory);
                    }

                    if (!includeInvalidAttribute) {
                        criteria.andIsValidEqualTo(EnumValid.VALID.getValue());
                    }

                    if (StringUtils.isNotEmpty(keywords)) {
                        criteria.andAttrNameLike("%" + keywords + "%");
                    }

                    criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

                    example.setOrderByClause("sort asc, create_time desc");

                    List<ExtendAttribute> recordList = extendAttributeMapper.selectByExample(example, pagingBounds);
                    List<ExtendAttributeBo> list = new ArrayList<>();
                    for (ExtendAttribute record : recordList) {
                        list.add(ExtendAttributeObjectTypeConvertUtils.convertExtendAttributeDaoToBo(record));
                    }

                    return list;
                }
        );

        // 2、分页获取扩展属性的配置信息
        List<String> attributeIdList = page.getRecords()
                .stream()
                .map(ExtendAttribute::getUuid)
                .distinct()
                .collect(Collectors.toList());

        List<AbstractExtendAttributeConfigBo> extendAttributeConfigList = findExtendAttributeConfigByIdList(attributeIdList);
        Map<String, List<AbstractExtendAttributeConfigBo>> extendAttributeConfigMap = extendAttributeConfigList
                .stream()
                .collect(Collectors.groupingBy(AbstractExtendAttributeConfigBo::getAttributeId));

        // 3、组织返回结果
        for (ExtendAttributeBo record : page.getRecords()) {
            List<AbstractExtendAttributeConfigBo> configList = extendAttributeConfigMap.get(record.getUuid());
            record.setAttributeConfigInfo(CollectionUtils.isNotEmpty(configList) ? configList.get(0) : null);
        }

        return page;
    }

    /**
     * 查询扩展属性的配置信息列表，包括文本类、数字类和选项类的扩展属性
     *
     * @param attributeIdList 扩展属性编号列表
     */
    private List<AbstractExtendAttributeConfigBo> findExtendAttributeConfigByIdList(List<String> attributeIdList) {
        List<AbstractExtendAttributeConfigBo> list = new ArrayList<>();
        if (CollectionUtils.isEmpty(attributeIdList)) {
            return list;
        }

        // 1、获取文本类扩展属性的配置信息列表
        List<TextExtendAttributeConfigBo> textExtendAttributeConfigList = textExtendAttributeConfigService.
                findExtendAttributeConfigInfoByIdList(attributeIdList);
        list.addAll(textExtendAttributeConfigList);

        // 2、获取数字类扩展属性的配置信息列表
        List<NumberExtendAttributeConfigBo> numberExtendAttributeConfigList = numberExtendAttributeConfigService.
                findExtendAttributeConfigInfoByIdList(attributeIdList);
        list.addAll(numberExtendAttributeConfigList);

        // 3、获取选项类扩展属性的配置信息列表
        List<SelectionExtendAttributeConfigBo> selectionExtendAttributeConfigList = selectionExtendAttributeConfigService.
                findExtendAttributeConfigInfoByIdList(attributeIdList);
        list.addAll(selectionExtendAttributeConfigList);

        return list;
    }

    @Override
    public List<ExtendAttributeBo> findExtendAttributeListByCategory(String tenantId, Integer attributeCategory) {
        List<ExtendAttributeBo> extendAttributeList = new ArrayList<>();

        // 1、查询相应分类下有效的扩展属性基础信息列表
        ExtendAttributeExample example = new ExtendAttributeExample();
        ExtendAttributeExample.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(tenantId)) {
            criteria.andTenantIdEqualTo(tenantId);
        }

        if(attributeCategory != null){
            if (EnumExtendAttributeCategory.getExtendAttributeCategory(attributeCategory) != null) {
                criteria.andCategoryEqualTo(attributeCategory);
            }
        }

        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());
        criteria.andIsValidEqualTo(EnumValid.VALID.getValue());

        List<ExtendAttribute> list = extendAttributeMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(list)) {
            return extendAttributeList;
        }

        // 2、查询扩展属性对应的配置信息
        for (ExtendAttribute extendAttribute : list) {
            AbstractExtendAttributeConfigBo extendAttributeConfig = findExtendAttributeConfigInfoById(
                    extendAttribute.getUuid(),
                    EnumExtendAttributeType.getExtendAttributeType(extendAttribute.getFieldType())
            );

            ExtendAttributeBo extendAttributeInfo = ExtendAttributeObjectTypeConvertUtils.
                    convertExtendAttributeDaoToBo(extendAttribute);

            extendAttributeInfo.setAttributeConfigInfo(extendAttributeConfig);
            extendAttributeList.add(extendAttributeInfo);
        }

        return extendAttributeList;
    }

    // endregion

    // region 启用/禁用扩展属性信息
    @Override
    public void modifyExtendAttributeValidStateById(String attributeId, int validState, String updateUserId) {
        if (StringUtils.isEmpty(attributeId)
                || EnumValid.getValidState(validState) == null
                || StringUtils.isEmpty(updateUserId)) {
            return;
        }

        ExtendAttribute record = new ExtendAttribute();
        record.setIsValid(validState);
        record.setUpdateTime(new Date());
        record.setUpdateNumber(updateUserId);

        ExtendAttributeExample example = new ExtendAttributeExample();
        ExtendAttributeExample.Criteria criteria = example.createCriteria();
        criteria.andUuidEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        extendAttributeMapper.updateByExampleSelective(record, example);
    }
    // endregion

}
