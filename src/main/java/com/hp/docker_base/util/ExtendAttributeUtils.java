package com.hp.docker_base.util;

import com.hp.docker_base.bean.bo.*;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.dto.extend.SelectionContentDto;
import com.hp.docker_base.bean.dto.extend.SelectionExtendAttributeConfigDto;
import com.hp.docker_base.bean.em.EnumExceptionCode;
import com.hp.docker_base.bean.em.EnumExtendAttributeType;
import com.hp.docker_base.bean.em.EnumFill;
import com.hp.docker_base.bean.exception.DataException;
import com.hp.docker_base.bean.extend.ExtendAttribute;

import org.apache.commons.lang3.StringUtils;
import org.springframework.util.CollectionUtils;


import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @program: IDAAS
 * @description: 扩展属性相关工具方法
 * @author: 姬同凯
 * @create: 2020-05-09 11:31
 **/
public class ExtendAttributeUtils {

    /**
     * 根据选项内容找到选项编号，如果是多选，则以","隔开
     *
     * @param selectionContent    选项内容，多个选项间使用","隔开
     * @param extendAttributeInfo 扩展属性信息
     */
    public static String getSelectionIdByContent(String selectionContent, ExtendAttributeDto extendAttributeInfo) {
        if (StringUtils.isEmpty(selectionContent)
                || extendAttributeInfo == null
                || !(extendAttributeInfo.getAttributeConfigInfo() instanceof SelectionExtendAttributeConfigDto)) {
            return null;
        }

        SelectionExtendAttributeConfigDto selectionExtendAttributeConfig = (SelectionExtendAttributeConfigDto) extendAttributeInfo.getAttributeConfigInfo();
        String[] contentArray = selectionContent.split("[,]");
        StringBuilder selectionIdStr = new StringBuilder();

        Map<String, String> selectionMap = Optional.ofNullable(selectionExtendAttributeConfig.getSelectionList())
                .map(list -> list.stream().collect(Collectors.toMap(SelectionContentDto::getContent, SelectionContentDto::getUuid)))
                .orElse(new HashMap<>());

        for (String content : contentArray) {
            if (selectionMap.containsKey(content)) {
                if (StringUtils.isNotEmpty(selectionIdStr.toString())) {
                    selectionIdStr.append(",");
                }

                selectionIdStr.append(selectionMap.get(content));
            }
        }

        return selectionIdStr.toString();
    }

    /**
     * 根据选项编号找到选项内容，如果是多选，则以","隔开
     *
     * @param selectionId         选项编号，多个选项间使用","隔开
     * @param extendAttributeInfo 扩展属性信息
     */
    public static String getSelectionContentById(String selectionId, ExtendAttributeDto extendAttributeInfo) {
        if (StringUtils.isEmpty(selectionId)
                || extendAttributeInfo == null
                || !(extendAttributeInfo.getAttributeConfigInfo() instanceof SelectionExtendAttributeConfigDto)) {
            return null;
        }

        SelectionExtendAttributeConfigDto selectionExtendAttributeConfig = (SelectionExtendAttributeConfigDto) extendAttributeInfo.getAttributeConfigInfo();
        String[] idArray = selectionId.split("[,]");
        StringBuilder selectionContentStr = new StringBuilder();

        Map<String, String> selectionMap = Optional.ofNullable(selectionExtendAttributeConfig.getSelectionList())
                .map(list -> list.stream().collect(Collectors.toMap(SelectionContentDto::getUuid, SelectionContentDto::getContent)))
                .orElse(new HashMap<>());

        for (String id : idArray) {
            if (selectionMap.containsKey(id)) {
                if (StringUtils.isNotEmpty(selectionContentStr.toString())) {
                    selectionContentStr.append(",");
                }

                selectionContentStr.append(selectionMap.get(id));
            }
        }

        return selectionContentStr.toString();
    }

    /**
     * 去除无关的扩展属性
     *
     * @param extendAttributeList      分类（组织机构、账户组、账户）下自定义的扩展属性列表
     * @param extendAttributeValueList 要保存的扩展属性值列表
     */
    public static void removeIrrelevantExtendAttributeValue(List<ExtendAttributeBo> extendAttributeList,
                                                            List<ExtendAttributeValueBo> extendAttributeValueList) {

        if (CollectionUtils.isEmpty(extendAttributeList)
                || CollectionUtils.isEmpty(extendAttributeValueList)) {
            return;
        }

        // 获取分类下自定义的扩展属性编号列表
        Set<String> extendAttributeIdSet = extendAttributeList
                .stream()
                .map(ExtendAttribute::getUuid)
                .collect(Collectors.toSet());

        // 判断要保存的扩展属性中是否存在有无关的扩展属性，如果有的话，就去除
        extendAttributeValueList.removeIf(
                extendAttributeValue -> !extendAttributeIdSet.contains(extendAttributeValue.getAttributeId())
        );
    }

    /**
     * 检查扩展属性值的完整性
     */
    public static void checkExtendAttributeInfoIntegrity(ExtendAttributeBo extendAttributeValueInfo) {
        if (extendAttributeValueInfo.getIsFill() == EnumFill.YES.getCode()
                && StringUtils.isEmpty(extendAttributeValueInfo.getAttributeFieldValue())) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_LACK.getCode(),
                    String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_LACK.getMessage(), extendAttributeValueInfo.getAttrName()));
        }
    }

    /**
     * 检查扩展属性值的正确性，包括文本类、数字类、选项类和日期时间类扩展属性
     *
     * @param extendAttributeValueInfo 扩展属性值信息
     */
    public static void checkExtendAttributeInfoValidity(ExtendAttributeBo extendAttributeValueInfo) {
        if (extendAttributeValueInfo == null) {
            return;
        }

        EnumExtendAttributeType type = EnumExtendAttributeType.getExtendAttributeType(extendAttributeValueInfo.getFieldType());

        if (EnumExtendAttributeType.isTextAttributeType(type)) {
            // 检查文本类扩展属性值
            checkTextExtendAttributeValueValidity(extendAttributeValueInfo);
        } else if (EnumExtendAttributeType.isNumberAttributeType(type)) {
            // 检查数字类扩展属性值
            checkNumberExtendAttributeValueValidity(extendAttributeValueInfo);
        } else if (EnumExtendAttributeType.isSelectionAttributeType(type)) {
            // 检查选项类扩展属性值
            checkSelectionExtendAttributeValueValidity(extendAttributeValueInfo);
        } else if (EnumExtendAttributeType.isDateAttributeType(type)) {
            // 检查日期时间类扩展属性值
            checkDateExtendAttributeValueValidity(extendAttributeValueInfo);
        }
    }

    /**
     * 检查文本类扩展属性的正确性
     *
     * @param textExtendAttributeValueInfo 文本类扩展属性值
     */
    public static void checkTextExtendAttributeValueValidity(ExtendAttributeBo textExtendAttributeValueInfo) {
        if (textExtendAttributeValueInfo == null
                || textExtendAttributeValueInfo.getAttributeConfigInfo() == null
                || StringUtils.isEmpty(textExtendAttributeValueInfo.getAttributeFieldValue())) {
            return;
        }

        // 1、获取文本类扩展属性的配置信息
        TextExtendAttributeConfigBo textExtendAttributeConfig = (TextExtendAttributeConfigBo) textExtendAttributeValueInfo.getAttributeConfigInfo();

        // 2、校验文本字符个数是否超出了最大字符数
        if (textExtendAttributeConfig.getMaxCharacterCount() != null
                && textExtendAttributeValueInfo.getAttributeFieldValue().length() > textExtendAttributeConfig.getMaxCharacterCount()) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_OVER_LENGTH.getCode(),
                    String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_OVER_LENGTH.getMessage(), textExtendAttributeValueInfo.getAttrName()));
        }
    }

    /**
     * 检查数字类扩展属性的正确性
     *
     * @param numberExtendAttributeValueInfo 数字类扩展属性值
     */
    public static void checkNumberExtendAttributeValueValidity(ExtendAttributeBo numberExtendAttributeValueInfo) {
        if (numberExtendAttributeValueInfo == null
                || numberExtendAttributeValueInfo.getAttributeConfigInfo() == null
                || StringUtils.isEmpty(numberExtendAttributeValueInfo.getAttributeFieldValue())) {
            return;
        }

        // 1、获取数字类扩展属性的配置信息
        NumberExtendAttributeConfigBo numberExtendAttributeConfig = (NumberExtendAttributeConfigBo) numberExtendAttributeValueInfo.getAttributeConfigInfo();

        // 2、检查数字类扩展属性值的正确性
        BigDecimal minValue = null;
        BigDecimal maxValue = null;
        BigDecimal fieldValue = null;

        try {
            if (StringUtils.isNotEmpty(numberExtendAttributeConfig.getMinValue())) {
                minValue = new BigDecimal(numberExtendAttributeConfig.getMinValue());
            }

            if (StringUtils.isNotEmpty(numberExtendAttributeConfig.getMaxValue())) {
                maxValue = new BigDecimal(numberExtendAttributeConfig.getMaxValue());
            }

            if (StringUtils.isNotEmpty(numberExtendAttributeValueInfo.getAttributeFieldValue())) {
                fieldValue = new BigDecimal(numberExtendAttributeValueInfo.getAttributeFieldValue());
            }
        } catch (Exception e) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_FORMAT_ERROR.getCode(),
                    String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_FORMAT_ERROR.getMessage(), numberExtendAttributeValueInfo.getAttrName())) ;
        }

        // 3、检查扩展属性值是否小于最小值限制
        if (fieldValue != null
                && minValue != null
                && fieldValue.compareTo(minValue) < 0) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT.getCode(),
                    String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT.getMessage(), numberExtendAttributeValueInfo.getAttrName()));
        }

        // 4、检查扩展属性值是否大于最大值限制
        if (fieldValue != null
                && maxValue != null
                && fieldValue.compareTo(maxValue) > 0) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT.getCode(),
                    String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT.getMessage(), numberExtendAttributeValueInfo.getAttrName()));
        }
    }

    /**
     * 检查选项类扩展属性的正确性
     *
     * @param selectionExtendAttributeValueInfo 选项类扩展属性值
     */
    public static void checkSelectionExtendAttributeValueValidity(ExtendAttributeBo selectionExtendAttributeValueInfo) {
        if (selectionExtendAttributeValueInfo == null
                || selectionExtendAttributeValueInfo.getAttributeConfigInfo() == null
                || StringUtils.isEmpty(selectionExtendAttributeValueInfo.getAttributeFieldValue())) {
            return;
        }

        // 1、获取选项类扩展属性的配置信息
        SelectionExtendAttributeConfigBo selectionExtendAttributeConfig = (SelectionExtendAttributeConfigBo) selectionExtendAttributeValueInfo.getAttributeConfigInfo();

        // 2、获取所有选项的编号列表
        Set<String> selectionContentIdSet = selectionExtendAttributeConfig.getSelectionList()
                .stream()
                .map(SelectionContentBo::getUuid)
                .collect(Collectors.toSet());

        // 3、校验选项编号是否正确
        String[] selectionValueArray = selectionExtendAttributeValueInfo.getAttributeFieldValue().split("[,]");
        for (String selectionValue : selectionValueArray) {
            if (!selectionContentIdSet.contains(selectionValue)) {
                throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT.getCode(),
                        String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT.getMessage(), selectionExtendAttributeValueInfo.getAttrName()));
            }
        }

        // 4、校验单选扩展属性存在多个选择值
        EnumExtendAttributeType type = EnumExtendAttributeType.getExtendAttributeType(selectionExtendAttributeValueInfo.getFieldType());
        if (EnumExtendAttributeType.isSingleSelectionAttributeType(type)
                && StringUtils.isNotEmpty(selectionExtendAttributeValueInfo.getAttributeFieldValue())
                && selectionExtendAttributeValueInfo.getAttributeFieldValue().contains("[,]")) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT.getCode(),
                    String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_INCORRECT.getMessage(), selectionExtendAttributeValueInfo.getAttrName()));
        }
    }

    /**
     * 检查日期实现类扩展属性的正确性
     *
     * @param dateExtendAttributeValueInfo 日期时间类扩展属性值
     */
    public static void checkDateExtendAttributeValueValidity(ExtendAttributeBo dateExtendAttributeValueInfo) {
        if (dateExtendAttributeValueInfo == null || StringUtils.isEmpty(dateExtendAttributeValueInfo.getAttributeFieldValue())) {
            return;
        }

        EnumExtendAttributeType attributeType = EnumExtendAttributeType.getExtendAttributeType(dateExtendAttributeValueInfo.getFieldType());

        // 检查日期类扩展属性内容格式的正确性
        try {
            if (attributeType == EnumExtendAttributeType.DATE) {
                DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
                dateFormatter.parse(dateExtendAttributeValueInfo.getAttributeFieldValue());
            } else if (attributeType == EnumExtendAttributeType.DATE_TIME) {
                DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                dateFormatter.parse(dateExtendAttributeValueInfo.getAttributeFieldValue());
            } else if (attributeType == EnumExtendAttributeType.TIME) {
                DateFormat dateFormatter = new SimpleDateFormat("hh:mm:ss");
                dateFormatter.parse(dateExtendAttributeValueInfo.getAttributeFieldValue());
            }
        } catch (Exception e) {
            throw new DataException(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_FORMAT_ERROR.getCode(),
                    String.format(EnumExceptionCode.ERROR_EXTEND_ATTRIBUTE_VALUE_FORMAT_ERROR.getMessage(), dateExtendAttributeValueInfo.getAttrName()));
        }
    }
}
