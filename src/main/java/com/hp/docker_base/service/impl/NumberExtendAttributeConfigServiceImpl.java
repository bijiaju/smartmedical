package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.bo.NumberExtendAttributeConfigBo;
import com.hp.docker_base.bean.em.EnumExceptionCode;
import com.hp.docker_base.bean.exception.DataException;
import com.hp.docker_base.bean.extend.ExtendNumberAttributeConfig;
import com.hp.docker_base.bean.extend.ExtendNumberAttributeConfigExample;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.ExtendNumberAttributeConfigMapper;
import com.hp.docker_base.service.IExtendAttributeTypeConfigService;
import com.hp.docker_base.util.convert.ExtendAttributeObjectTypeConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 17:02
 */
@Service
public class NumberExtendAttributeConfigServiceImpl implements IExtendAttributeTypeConfigService<NumberExtendAttributeConfigBo> {

    @Autowired
    private ExtendNumberAttributeConfigMapper extendNumberAttributeConfigMapper;

    @Override
    public void addExtendAttributeConfigInfo(String attributeId,
                                             NumberExtendAttributeConfigBo extendAttributeConfigInfo,
                                             String createUserId) {
        if (StringUtils.isEmpty(attributeId)
                || extendAttributeConfigInfo == null
                || StringUtils.isEmpty(createUserId)) {
            return;
        }

        extendAttributeConfigInfo.setAttributeId(attributeId);

        // 1、校验数据格式
        checkExtendAttributeConfigInfoValidity(extendAttributeConfigInfo);

        // 2、先删除已有记录
        removeExtendAttributeConfigInfoById(attributeId, createUserId);

        // 3、添加新的配置信息记录
        ExtendNumberAttributeConfig record = ExtendAttributeObjectTypeConvertUtils.
                convertNumberExtendAttributeBoToDao(extendAttributeConfigInfo);
        record.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        record.setCreateTime(new Date());
        record.setCreateNumber(createUserId);
        record.setUpdateTime(new Date());
        record.setUpdateNumber(createUserId);

        extendNumberAttributeConfigMapper.insert(record);
    }

    @Override
    public void modifyExtendAttributeConfigInfo(String attributeId,
                                                NumberExtendAttributeConfigBo extendAttributeConfigInfo,
                                                String updateUserId) {
        if (StringUtils.isEmpty(attributeId)
                || extendAttributeConfigInfo == null
                || StringUtils.isEmpty(updateUserId)) {
            return;
        }

        extendAttributeConfigInfo.setAttributeId(attributeId);

        // 1、校验数据格式
        checkExtendAttributeConfigInfoValidity(extendAttributeConfigInfo);

        // 2、更新扩展属性配置信息记录
        ExtendNumberAttributeConfigExample example = new ExtendNumberAttributeConfigExample();
        ExtendNumberAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        ExtendNumberAttributeConfig record = ExtendAttributeObjectTypeConvertUtils.
                convertNumberExtendAttributeBoToDao(extendAttributeConfigInfo);
        record.setUpdateTime(new Date());
        record.setUpdateNumber(updateUserId);

        extendNumberAttributeConfigMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int removeExtendAttributeConfigInfoById(String attributeId,
                                                   String deleteUserId) {
        if (StringUtils.isEmpty(attributeId) || StringUtils.isEmpty(deleteUserId)) {
            return 0;
        }

        ExtendNumberAttributeConfigExample example = new ExtendNumberAttributeConfigExample();
        ExtendNumberAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        ExtendNumberAttributeConfig record = new ExtendNumberAttributeConfig();
        record.setIsDelete(EnumDelete.DELETE.getCode());
        record.setUpdateNumber(deleteUserId);
        record.setUpdateTime(new Date());

        return extendNumberAttributeConfigMapper.updateByExampleSelective(record, example);
    }

    @Override
    public NumberExtendAttributeConfigBo findExtendAttributeConfigInfoById(String attributeId) {
        if (StringUtils.isEmpty(attributeId)) {
            return null;
        }

        ExtendNumberAttributeConfigExample example = new ExtendNumberAttributeConfigExample();
        ExtendNumberAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        example.setOrderByClause("create_time desc");

        List<ExtendNumberAttributeConfig> list = extendNumberAttributeConfigMapper.selectByExample(example);

        if (CollectionUtils.isEmpty(list)) {
            return null;
        }

        return ExtendAttributeObjectTypeConvertUtils.convertNumberExtendAttributeDaoToBo(list.get(0));
    }

    @Override
    public List<NumberExtendAttributeConfigBo> findExtendAttributeConfigInfoByIdList(List<String> attributeIdList) {
        List<NumberExtendAttributeConfigBo> list = new ArrayList<>();
        if (CollectionUtils.isEmpty(attributeIdList)) {
            return list;
        }

        ExtendNumberAttributeConfigExample example = new ExtendNumberAttributeConfigExample();
        ExtendNumberAttributeConfigExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdIn(attributeIdList);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        List<ExtendNumberAttributeConfig> numberAttributeConfigList = extendNumberAttributeConfigMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(numberAttributeConfigList)) {
            return list;
        }

        for (ExtendNumberAttributeConfig record : numberAttributeConfigList) {
            list.add(ExtendAttributeObjectTypeConvertUtils.convertNumberExtendAttributeDaoToBo(record));
        }

        return list;
    }

    /**
     * 校验数字扩展属性配置信息的正确性，包括最小值、最大值格式和正确性
     *
     * @param numberExtendAttributeConfigInfo 数字类扩展属性的配置信息
     */
    private void checkExtendAttributeConfigInfoValidity(NumberExtendAttributeConfigBo numberExtendAttributeConfigInfo) {
        if (numberExtendAttributeConfigInfo == null) {
            return;
        }

        BigDecimal minValue = null;
        BigDecimal maxValue = null;
        BigDecimal defaultValue = null;

        // 1、判断数字格式是否正确
        try {
            if (StringUtils.isNotEmpty(numberExtendAttributeConfigInfo.getMinValue())) {
                minValue = new BigDecimal(numberExtendAttributeConfigInfo.getMinValue());
            }

            if (StringUtils.isNotEmpty(numberExtendAttributeConfigInfo.getMaxValue())) {
                maxValue = new BigDecimal(numberExtendAttributeConfigInfo.getMaxValue());
            }

            if (StringUtils.isNotEmpty(numberExtendAttributeConfigInfo.getDefaultValue())) {
                defaultValue = new BigDecimal(numberExtendAttributeConfigInfo.getDefaultValue());
            }
        } catch (Exception e) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_FORMAT_ERROR.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_FORMAT_ERROR.getMessage());
        }

        // 2、判断最小值是否大于最大值
        if (minValue != null
                && maxValue != null
                && minValue.compareTo(maxValue) > 0) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_CONFIG_ERROR.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_CONFIG_ERROR.getMessage());
        }

        // 3、判断默认值是否小于最小值
        if (minValue != null
                && defaultValue != null
                && defaultValue.compareTo(minValue) < 0) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_CONFIG_ERROR.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_CONFIG_ERROR.getMessage());
        }

        // 4、判断默认值是否大于最大值
        if (maxValue != null
                && defaultValue != null
                && defaultValue.compareTo(maxValue) > 0) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_CONFIG_ERROR.getCode(),
                    EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_FIELD_CONFIG_ERROR.getMessage());
        }
    }
}
