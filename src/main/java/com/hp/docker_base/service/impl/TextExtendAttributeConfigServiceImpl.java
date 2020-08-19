package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.bo.TextExtendAttributeConfigBo;
import com.hp.docker_base.bean.extend.ExtendTextAttributeConfig;
import com.hp.docker_base.bean.extend.ExtendTextAttributeConfigExample;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.ExtendTextAttributeConfigMapper;
import com.hp.docker_base.service.IExtendAttributeTypeConfigService;
import com.hp.docker_base.util.convert.ExtendAttributeObjectTypeConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 17:00
 */
@Service
public class TextExtendAttributeConfigServiceImpl implements IExtendAttributeTypeConfigService<TextExtendAttributeConfigBo> {

    @Autowired
    private ExtendTextAttributeConfigMapper extendTextAttributeConfigMapper;

    @Override
    public void addExtendAttributeConfigInfo(String attributeId,
                                             TextExtendAttributeConfigBo extendAttributeConfigInfo,
                                             String createUserId) {
        if (StringUtils.isEmpty(attributeId)
                || extendAttributeConfigInfo == null
                || StringUtils.isEmpty(createUserId)) {
            return;
        }

        extendAttributeConfigInfo.setAttributeId(attributeId);

        // 1、先删除已有记录
        removeExtendAttributeConfigInfoById(attributeId, createUserId);

        // 2、添加新的配置信息记录
        ExtendTextAttributeConfig record = ExtendAttributeObjectTypeConvertUtils.
                convertTextExtendAttributeBoToDao(extendAttributeConfigInfo);
        record.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        record.setCreateTime(new Date());
        record.setCreateNumber(createUserId);
        record.setUpdateTime(new Date());
        record.setUpdateNumber(createUserId);

        extendTextAttributeConfigMapper.insert(record);
    }

    @Override
    public void modifyExtendAttributeConfigInfo(String attributeId,
                                                TextExtendAttributeConfigBo extendAttributeConfigInfo,
                                                String updateUserId) {
        if (StringUtils.isEmpty(attributeId)
                || extendAttributeConfigInfo == null
                || StringUtils.isEmpty(updateUserId)) {
            return;
        }

        extendAttributeConfigInfo.setAttributeId(attributeId);

        // 更新扩展属性配置信息记录
        ExtendTextAttributeConfigExample example = new ExtendTextAttributeConfigExample();
        ExtendTextAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        ExtendTextAttributeConfig record = ExtendAttributeObjectTypeConvertUtils.
                convertTextExtendAttributeBoToDao(extendAttributeConfigInfo);
        record.setUpdateTime(new Date());
        record.setUpdateNumber(updateUserId);

        extendTextAttributeConfigMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int removeExtendAttributeConfigInfoById(String attributeId,
                                                   String deleteUserId) {
        if (StringUtils.isEmpty(attributeId) || StringUtils.isEmpty(deleteUserId)) {
            return 0;
        }

        ExtendTextAttributeConfigExample example = new ExtendTextAttributeConfigExample();
        ExtendTextAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        ExtendTextAttributeConfig record = new ExtendTextAttributeConfig();
        record.setIsDelete(EnumDelete.DELETE.getCode());
        record.setUpdateNumber(deleteUserId);
        record.setUpdateTime(new Date());

        return extendTextAttributeConfigMapper.updateByExampleSelective(record, example);
    }

    @Override
    public TextExtendAttributeConfigBo findExtendAttributeConfigInfoById(String attributeId) {
        if (StringUtils.isEmpty(attributeId)) {
            return null;
        }

        ExtendTextAttributeConfigExample example = new ExtendTextAttributeConfigExample();
        ExtendTextAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        example.setOrderByClause("create_time desc");

        List<ExtendTextAttributeConfig> list = extendTextAttributeConfigMapper.selectByExample(example);

        if (CollectionUtils.isEmpty(list)) {
            return null;
        }

        return ExtendAttributeObjectTypeConvertUtils.convertTextExtendAttributeDaoToBo(list.get(0));
    }

    @Override
    public List<TextExtendAttributeConfigBo> findExtendAttributeConfigInfoByIdList(List<String> attributeIdList) {
        List<TextExtendAttributeConfigBo> list = new ArrayList<>();

        if (CollectionUtils.isEmpty(attributeIdList)) {
            return list;
        }

        ExtendTextAttributeConfigExample example = new ExtendTextAttributeConfigExample();
        ExtendTextAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdIn(attributeIdList);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        List<ExtendTextAttributeConfig> textAttributeConfigList = extendTextAttributeConfigMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(textAttributeConfigList)) {
            return list;
        }

        for (ExtendTextAttributeConfig record : textAttributeConfigList) {
            list.add(ExtendAttributeObjectTypeConvertUtils.convertTextExtendAttributeDaoToBo(record));
        }

        return list;
    }

}
