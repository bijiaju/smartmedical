package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.bo.SelectionContentBo;
import com.hp.docker_base.bean.bo.SelectionExtendAttributeConfigBo;
import com.hp.docker_base.bean.extend.ExtendSelectionAttributeConfig;
import com.hp.docker_base.bean.extend.ExtendSelectionAttributeConfigExample;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.ExtendSelectionAttributeConfigMapper;
import com.hp.docker_base.service.IExtendAttributeTypeConfigService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.convert.ExtendAttributeObjectTypeConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 17:04
 */
@Service
public class SelectionExtendAttributeConfigServiceImpl implements IExtendAttributeTypeConfigService<SelectionExtendAttributeConfigBo> {

    @Autowired
    private ExtendSelectionAttributeConfigMapper extendSelectionAttributeConfigMapper;



    @Override
    public void addExtendAttributeConfigInfo(String attributeId,
                                             SelectionExtendAttributeConfigBo extendAttributeConfigInfo,
                                             String createUserId) {
        if (StringUtils.isEmpty(attributeId)
                || extendAttributeConfigInfo == null
                || CollectionUtils.isEmpty(extendAttributeConfigInfo.getSelectionList())
                || StringUtils.isEmpty(createUserId)) {
            return;
        }

        // 1、先删除已有选项信息
        removeExtendAttributeConfigInfoById(attributeId, createUserId);

        // 2、添加新的选项信息
        addExtendAttributeSelectionContent(attributeId, extendAttributeConfigInfo.getSelectionList(), createUserId);
    }

    /**
     * 新增多个选项内容
     *
     * @param attributeId          属性编号
     * @param selectionContentList 选项列表
     * @param createUserId         创建人员编号
     */
    private void addExtendAttributeSelectionContent(String attributeId,
                                                    List<SelectionContentBo> selectionContentList,
                                                    String createUserId) {
        if (StringUtils.isEmpty(attributeId)
                || CollectionUtils.isEmpty(selectionContentList)
                || StringUtils.isEmpty(createUserId)) {
            return;
        }


        for (int index = 0; index < selectionContentList.size(); ++index) {
            SelectionContentBo selectionContentInfo = selectionContentList.get(index);
            ExtendSelectionAttributeConfig record = ExtendAttributeObjectTypeConvertUtils.
                    convertSelectionExtendAttributeBoToDao(attributeId, selectionContentInfo);
            record.setUuid(CommonUtil.generateUUID());
            record.setSort(index + 1);
            record.setIsDelete(EnumDelete.NOT_DELETE.getCode());
            record.setCreateTime(new Date());
            record.setCreateNumber(createUserId);
            record.setUpdateTime(new Date());
            record.setUpdateNumber(createUserId);

            extendSelectionAttributeConfigMapper.insert(record);
        }
    }

    @Override
    public void modifyExtendAttributeConfigInfo(String attributeId,
                                                SelectionExtendAttributeConfigBo extendAttributeConfigInfo,
                                                String updateUserId) {
        if (StringUtils.isEmpty(attributeId)
                || extendAttributeConfigInfo == null
                || StringUtils.isEmpty(updateUserId)) {
            return;
        }

        // 1、如果选项类别为空，则清空现有的选项记录
        if (CollectionUtils.isEmpty(extendAttributeConfigInfo.getSelectionList())) {
            removeExtendAttributeConfigInfoById(attributeId, updateUserId);
            return;
        }

        // 2、循环遍历识别新增、删除、更新的选项记录
        // >> 2-1、获取已存在选项记录的编号列表
        SelectionExtendAttributeConfigBo existRecord = findExtendAttributeConfigInfoById(attributeId);
        Set<String> existUuidSet = existRecord.getSelectionList()
                .stream()
                .map(SelectionContentBo::getUuid)
                .collect(Collectors.toSet());

        // >> 2-2、重新整理选项记录的排序值
        for (int index = 0; index < extendAttributeConfigInfo.getSelectionList().size(); ++index) {
            SelectionContentBo selectionContentInfo = extendAttributeConfigInfo.getSelectionList().get(index);
            selectionContentInfo.setSort(index + 1);
        }

        // >> 2-2、识别新增的选项，新增的选项的uuid为空
        List<SelectionContentBo> addSelectionContentList = new ArrayList<>();
        Iterator<SelectionContentBo> iterator = extendAttributeConfigInfo.getSelectionList().iterator();
        while (iterator.hasNext()) {
            SelectionContentBo record = iterator.next();
            if (StringUtils.isEmpty(record.getUuid())) {
                addSelectionContentList.add(record);
                iterator.remove();
            }
        }
        addExtendAttributeSelectionContent(attributeId, addSelectionContentList, updateUserId);

        // >> 2-3、识别出要更新的选项
        for (SelectionContentBo selectionContent : extendAttributeConfigInfo.getSelectionList()) {
            if (existUuidSet.contains(selectionContent.getUuid())) {
                modifyExtendAttributeSelectionContentInfo(attributeId, selectionContent, updateUserId);
            }
        }

        // >> 2-4、识别要删除的选项
        Set<String> nowUuidSet = extendAttributeConfigInfo.getSelectionList()
                .stream()
                .map(SelectionContentBo::getUuid)
                .collect(Collectors.toSet());

        // 筛选出要删除的选项编号列表
        existUuidSet.removeAll(nowUuidSet);
        removeExtendAttributeSelectionContentByIdList(attributeId, new ArrayList<>(existUuidSet), updateUserId);
    }

    /**
     * 更新选项类扩展属性的选项信息
     *
     * @param attributeId      属性编号
     * @param selectionContent 选项内容
     * @param updateUserId     更新人员编号
     */
    private void modifyExtendAttributeSelectionContentInfo(String attributeId,
                                                           SelectionContentBo selectionContent,
                                                           String updateUserId) {
        if (StringUtils.isEmpty(attributeId)
                || selectionContent == null
                || StringUtils.isEmpty(updateUserId)) {
            return;
        }

        ExtendSelectionAttributeConfigExample example = new ExtendSelectionAttributeConfigExample();
        ExtendSelectionAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());
        criteria.andUuidEqualTo(selectionContent.getUuid());

        ExtendSelectionAttributeConfig record = ExtendAttributeObjectTypeConvertUtils.
                convertSelectionExtendAttributeBoToDao(attributeId, selectionContent);
        record.setUpdateTime(new Date());
        record.setUpdateNumber(updateUserId);

        extendSelectionAttributeConfigMapper.updateByExampleSelective(record, example);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeExtendAttributeConfigInfoById(String attributeId,
                                                   String deleteUserId) {
        if (StringUtils.isEmpty(attributeId) || StringUtils.isEmpty(deleteUserId)) {
            return 0;
        }

        ExtendSelectionAttributeConfigExample example = new ExtendSelectionAttributeConfigExample();
        ExtendSelectionAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        ExtendSelectionAttributeConfig record = new ExtendSelectionAttributeConfig();
        record.setIsDelete(EnumDelete.DELETE.getCode());
        record.setUpdateTime(new Date());
        record.setUpdateNumber(deleteUserId);

        return extendSelectionAttributeConfigMapper.updateByExampleSelective(record, example);
    }

    /**
     * 删除选项类扩展属性的选项记录
     *
     * @param attributeId     扩展属性编号
     * @param selectionIdList 选项编号列表
     * @param deleteUserId    删除人员编号
     */
    private void removeExtendAttributeSelectionContentByIdList(String attributeId,
                                                               List<String> selectionIdList,
                                                               String deleteUserId) {
        if (StringUtils.isEmpty(attributeId)
                || CollectionUtils.isEmpty(selectionIdList)
                || StringUtils.isEmpty(deleteUserId)) {
            return;
        }

        ExtendSelectionAttributeConfigExample example = new ExtendSelectionAttributeConfigExample();
        ExtendSelectionAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());
        criteria.andUuidIn(selectionIdList);

        ExtendSelectionAttributeConfig record = new ExtendSelectionAttributeConfig();
        record.setIsDelete(EnumDelete.DELETE.getCode());
        record.setUpdateTime(new Date());
        record.setUpdateNumber(deleteUserId);

        extendSelectionAttributeConfigMapper.updateByExampleSelective(record, example);
    }

    @Override
    public SelectionExtendAttributeConfigBo findExtendAttributeConfigInfoById(String attributeId) {
        if (StringUtils.isEmpty(attributeId)) {
            return null;
        }

        ExtendSelectionAttributeConfigExample example = new ExtendSelectionAttributeConfigExample();
        ExtendSelectionAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        example.setOrderByClause("sort asc");

        List<ExtendSelectionAttributeConfig> list = extendSelectionAttributeConfigMapper.selectByExample(example);

        return ExtendAttributeObjectTypeConvertUtils.convertSelectionExtendAttributeDaoToBo(list);
    }

    @Override
    public List<SelectionExtendAttributeConfigBo> findExtendAttributeConfigInfoByIdList(List<String> attributeIdList) {
        List<SelectionExtendAttributeConfigBo> list = new ArrayList<>();
        if (CollectionUtils.isEmpty(attributeIdList)) {
            return list;
        }

        ExtendSelectionAttributeConfigExample example = new ExtendSelectionAttributeConfigExample();
        ExtendSelectionAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdIn(attributeIdList);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        example.setOrderByClause("sort asc");

        List<ExtendSelectionAttributeConfig> selectionContentList = extendSelectionAttributeConfigMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(selectionContentList)) {
            return list;
        }

        // 按照选项所属扩展属性编号进行归类
        Map<String, List<ExtendSelectionAttributeConfig>> selectionContentMap = selectionContentList
                .stream()
                .collect(Collectors.groupingBy(ExtendSelectionAttributeConfig::getAttrId));

        for (String key : selectionContentMap.keySet()) {
            list.add(ExtendAttributeObjectTypeConvertUtils.convertSelectionExtendAttributeDaoToBo(selectionContentMap.get(key)));
        }

        return list;
    }

}
