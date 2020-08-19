package com.hp.docker_base.util.convert;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:28
 */
import com.hp.docker_base.bean.bo.*;
import com.hp.docker_base.bean.dto.extend.*;
import com.hp.docker_base.bean.extend.ExtendAttribute;
import com.hp.docker_base.bean.extend.ExtendNumberAttributeConfig;
import com.hp.docker_base.bean.extend.ExtendSelectionAttributeConfig;
import com.hp.docker_base.bean.extend.ExtendTextAttributeConfig;
import lombok.NonNull;
import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: smart
 * @description: 扩展属性配置信息实体类型转换工具类
 * @author: bee
 * @create: 2020-04-18 10:32
 **/
public class ExtendAttributeObjectTypeConvertUtils {
    /**
     * 类型转换，DTO -> DAO
     *
     * @param dto 【DTO】扩展属性信息
     */
    public static ExtendAttribute convertExtendAttributeDtoToDao(@NonNull ExtendAttributeDto dto) {
        if (dto == null) {
            return null;
        }

        ExtendAttribute extendAttributeDao = new ExtendAttribute();
        extendAttributeDao.setUuid(dto.getUuid());
        extendAttributeDao.setCategory(dto.getAttributeCategory());
        extendAttributeDao.setAttrName(dto.getAttributeName());
        extendAttributeDao.setFieldName(dto.getAttributeFieldName());
        extendAttributeDao.setFieldType(dto.getAttributeFieldType());
        extendAttributeDao.setIsFill(dto.getNeedFill());
        extendAttributeDao.setIsModify(dto.getCanModify());
        extendAttributeDao.setIsUnique(dto.getUnique());
        extendAttributeDao.setIsValid(dto.getValid());
        extendAttributeDao.setRemark(dto.getRemark());
        extendAttributeDao.setSort(dto.getSort());

        return extendAttributeDao;
    }

    /**
     * 类型转换，DAO -> DTO
     *
     * @param dao 【DAO】扩展属性信息
     */
    public static ExtendAttributeDto convertExtendAttributeDaoToDto(@NonNull ExtendAttribute dao) {

        ExtendAttributeDto extendAttributeDto = new ExtendAttributeDto();
        extendAttributeDto.setUuid(dao.getUuid());
        extendAttributeDto.setAttributeCategory(dao.getCategory());
        extendAttributeDto.setAttributeName(dao.getAttrName());
        extendAttributeDto.setAttributeFieldName(dao.getFieldName());
        extendAttributeDto.setAttributeFieldType(dao.getFieldType());
        extendAttributeDto.setNeedFill(dao.getIsFill());
        extendAttributeDto.setCanModify(dao.getIsModify());
        extendAttributeDto.setUnique(dao.getIsUnique());
        extendAttributeDto.setValid(dao.getIsValid());
        extendAttributeDto.setRemark(dao.getRemark());
        extendAttributeDto.setSort(dao.getSort());

        return extendAttributeDto;
    }

    /**
     * 类型转换，DAO -> BO
     *
     * @param dao 【DAO】扩展属性信息
     */
    public static ExtendAttributeBo convertExtendAttributeDaoToBo(@NonNull ExtendAttribute dao) {

        ExtendAttributeBo bo = new ExtendAttributeBo();
        BeanUtils.copyProperties(dao, bo);

        return bo;
    }

    /**
     * 类型转换，BO -> DTO
     *
     * @param bo 【BO】扩展属性信息
     */
    public static ExtendAttributeDto convertExtendAttributeBoToDto(@NonNull ExtendAttributeBo bo) {

        ExtendAttributeDto dto = convertExtendAttributeDaoToDto(bo);
        dto.setAttributeFieldValue(bo.getAttributeFieldValue());
        if (bo.getAttributeConfigInfo() != null) {
            dto.setAttributeConfigInfo(convertExtendAttributeConfigBoToDto(bo.getAttributeConfigInfo()));
        }
        return dto;
    }

    /**
     * 类型转换，DTO -> BO
     *
     * @param dto 【DTO】扩展属性信息
     */
    public static ExtendAttributeBo convertExtendAttributeDtoToBo(@NonNull String parentId, @NonNull ExtendAttributeDto dto) {
        if (dto == null) {
            return null;
        }

        ExtendAttributeBo bo = new ExtendAttributeBo();
        bo.setUuid(dto.getUuid());
        bo.setCategory(dto.getAttributeCategory());
        bo.setAttrName(dto.getAttributeName());
        bo.setFieldName(dto.getAttributeFieldName());
        bo.setFieldType(dto.getAttributeFieldType());
        bo.setIsFill(dto.getNeedFill());
        bo.setIsModify(dto.getCanModify());
        bo.setIsUnique(dto.getUnique());
        bo.setIsValid(dto.getValid());
        bo.setRemark(dto.getRemark());
        bo.setSort(dto.getSort());

        bo.setParentId(parentId);
        bo.setAttributeFieldValue(dto.getAttributeFieldValue());
        bo.setAttributeConfigInfo(convertExtendAttributeConfigDtoToBo(dto.getAttributeConfigInfo()));

        return bo;
    }

    /**
     * 类型转换，DTO -> BO
     *
     * @param dto 【DTO】扩展属性信息
     */
    public static ExtendAttributeValueBo convertExtendAttributeValueDtoToBo(@NonNull String parentId,
                                                                            @NonNull String tenantId,
                                                                            @NonNull ExtendAttributeDto dto) {
        return ExtendAttributeValueBo.builder()
                .parentId(parentId)
                .tenantId(tenantId)
                .attributeId(dto.getUuid())
                .attributeFieldName(dto.getAttributeFieldName())
                .attributeFieldValue(dto.getAttributeFieldValue())
                .build();
    }

    /**
     * 类型转换 DTO -> BO
     *
     * @param dto 扩展属性类型编号
     */
    public static AbstractExtendAttributeConfigBo convertExtendAttributeConfigDtoToBo(AbstractExtendAttributeConfigDto dto) {
        if (dto == null) {
            return null;
        }

        AbstractExtendAttributeConfigBo bo = null;
        if (dto instanceof TextExtendAttributeConfigDto) {
            bo = convertTextExtentAttributeConfigDtoToBo((TextExtendAttributeConfigDto) dto);
        } else if (dto instanceof NumberExtendAttributeConfigDto) {
            bo = convertNumberExtendAttributeConfigDtoToBo((NumberExtendAttributeConfigDto) dto);
        } else if (dto instanceof SelectionExtendAttributeConfigDto) {
            bo = convertSelectionExtendAttributeConfigDtoToBo((SelectionExtendAttributeConfigDto) dto);
        }

        return bo;
    }

    /**
     * 类型转换 BO -> DTO
     *
     * @param bo 扩展属性类型信息
     */
    public static AbstractExtendAttributeConfigDto convertExtendAttributeConfigBoToDto(@NonNull AbstractExtendAttributeConfigBo bo) {
        AbstractExtendAttributeConfigDto dto = null;
        if (bo instanceof TextExtendAttributeConfigBo) {
            dto = convertTextExtentAttributeConfigBoToDto((TextExtendAttributeConfigBo) bo);
        } else if (bo instanceof NumberExtendAttributeConfigBo) {
            dto = convertNumberExtendAttributeConfigBoToDto((NumberExtendAttributeConfigBo) bo);
        } else if (bo instanceof SelectionExtendAttributeConfigBo) {
            dto = convertSelectionExtendAttributeConfigBoToDto((SelectionExtendAttributeConfigBo) bo);
        }

        return dto;
    }

    /**
     * 类型转换，DTO -> BO
     *
     * @param dto 文本类扩展属性的配置信息
     */
    public static TextExtendAttributeConfigBo convertTextExtentAttributeConfigDtoToBo(@NonNull TextExtendAttributeConfigDto dto) {
        TextExtendAttributeConfigBo bo = new TextExtendAttributeConfigBo();
        bo.setAttributeId(dto.getAttributeId());
        bo.setMaxCharacterCount(dto.getMaxCharacterCount());
        bo.setDefaultValue(dto.getDefaultValue());

        return bo;
    }

    /**
     * 类型转换，BO -> DTO
     *
     * @param bo 文本类扩展属性的配置信息
     */
    public static TextExtendAttributeConfigDto convertTextExtentAttributeConfigBoToDto(@NonNull TextExtendAttributeConfigBo bo) {
        TextExtendAttributeConfigDto dto = new TextExtendAttributeConfigDto();
        dto.setAttributeId(bo.getAttributeId());
        dto.setMaxCharacterCount(bo.getMaxCharacterCount());
        dto.setDefaultValue(bo.getDefaultValue());

        return dto;
    }

    /**
     * 类型转换，DTO -> BO
     *
     * @param dto 数字类扩展属性的配置信息
     */
    public static NumberExtendAttributeConfigBo convertNumberExtendAttributeConfigDtoToBo(@NonNull NumberExtendAttributeConfigDto dto) {
        NumberExtendAttributeConfigBo bo = new NumberExtendAttributeConfigBo();
        bo.setAttributeId(dto.getAttributeId());
        bo.setUnit(dto.getUnit());
        bo.setMinValue(dto.getMinValue());
        bo.setMaxValue(dto.getMaxValue());
        bo.setDefaultValue(dto.getDefaultValue());

        return bo;
    }

    /**
     * 类型转换，BO -> DTO
     *
     * @param bo 数字类扩展属性的配置信息
     */
    public static NumberExtendAttributeConfigDto convertNumberExtendAttributeConfigBoToDto(@NonNull NumberExtendAttributeConfigBo bo) {
        NumberExtendAttributeConfigDto dto = new NumberExtendAttributeConfigDto();
        dto.setAttributeId(bo.getAttributeId());
        dto.setUnit(bo.getUnit());
        dto.setMinValue(bo.getMinValue());
        dto.setMaxValue(bo.getMaxValue());
        dto.setDefaultValue(bo.getDefaultValue());

        return dto;
    }

    /**
     * 类型转换，DTO -> BO
     *
     * @param dto 选项类扩展属性的配置信息
     */
    public static SelectionExtendAttributeConfigBo convertSelectionExtendAttributeConfigDtoToBo(@NonNull SelectionExtendAttributeConfigDto dto) {
        SelectionExtendAttributeConfigBo bo = new SelectionExtendAttributeConfigBo();
        bo.setAttributeId(dto.getAttributeId());
        bo.setSelectionList(convertSelectionContentDtoToBo(dto.getSelectionList()));

        return bo;
    }

    /**
     * 类型转换，BO -> DTO
     *
     * @param bo 选项类扩展属性的配置信息
     */
    public static SelectionExtendAttributeConfigDto convertSelectionExtendAttributeConfigBoToDto(@NonNull SelectionExtendAttributeConfigBo bo) {
        SelectionExtendAttributeConfigDto dto = new SelectionExtendAttributeConfigDto();
        dto.setAttributeId(bo.getAttributeId());
        dto.setSelectionList(convertSelectionContentBoToDto(bo.getSelectionList()));

        return dto;
    }

    /**
     * 类型转换DTO -> BO
     *
     * @param dto 选项内容信息
     */
    public static SelectionContentBo convertSelectionContentDtoToBo(@NonNull SelectionContentDto dto) {
        SelectionContentBo bo = new SelectionContentBo();
        bo.setUuid(dto.getUuid());
        bo.setContent(dto.getContent());
        bo.setDefaultSelection(dto.getDefaultSelection());
        bo.setSort(dto.getSort());

        return bo;
    }

    /**
     * 类型转换 BO -> DTO
     *
     * @param bo 选项内容信息
     */
    public static SelectionContentDto convertSelectionContentBoToDto(@NonNull SelectionContentBo bo) {
        SelectionContentDto dto = new SelectionContentDto();
        dto.setUuid(bo.getUuid());
        dto.setContent(bo.getContent());
        dto.setDefaultSelection(bo.getDefaultSelection());
        dto.setSort(bo.getSort());

        return dto;
    }

    /**
     * 类型转换 DTO -> BO
     *
     * @param dtoList 选项内容信息列表
     */
    public static List<SelectionContentBo> convertSelectionContentDtoToBo(List<SelectionContentDto> dtoList) {
        List<SelectionContentBo> boList = new ArrayList<>();
        if (CollectionUtils.isEmpty(dtoList)) {
            return boList;
        }

        dtoList.forEach(dto -> boList.add(convertSelectionContentDtoToBo(dto)));
        return boList;
    }

    /**
     * 类型转换 BO -> DTO
     *
     * @param boList 选项内容信息列表
     */
    public static List<SelectionContentDto> convertSelectionContentBoToDto(@NonNull List<SelectionContentBo> boList) {
        List<SelectionContentDto> dtoList = new ArrayList<>();
        boList.forEach(bo -> dtoList.add(convertSelectionContentBoToDto(bo)));

        return dtoList;
    }

    /**
     * 类型转换，BO -> DAO
     *
     * @param bo 文本类扩展属性的配置信息
     */
    public static ExtendTextAttributeConfig convertTextExtendAttributeBoToDao(@NonNull TextExtendAttributeConfigBo bo) {

        ExtendTextAttributeConfig dao = new ExtendTextAttributeConfig();
        dao.setAttrId(bo.getAttributeId());
        dao.setMaxCharacterCount(bo.getMaxCharacterCount());
        dao.setDefaultValue(bo.getDefaultValue());

        return dao;
    }

    /**
     * 类型转换，DAO ->BO
     *
     * @param dao 文本类扩展属性的配置信息
     */
    public static TextExtendAttributeConfigBo convertTextExtendAttributeDaoToBo(@NonNull ExtendTextAttributeConfig dao) {
        TextExtendAttributeConfigBo bo = new TextExtendAttributeConfigBo();
        bo.setAttributeId(dao.getAttrId());
        bo.setMaxCharacterCount(dao.getMaxCharacterCount());
        bo.setDefaultValue(dao.getDefaultValue());

        return bo;
    }

    /**
     * 类型转换，BO -> DAO
     *
     * @param bo 数字类扩展属性的配置信息
     */
    public static ExtendNumberAttributeConfig convertNumberExtendAttributeBoToDao(@NonNull NumberExtendAttributeConfigBo bo) {
        ExtendNumberAttributeConfig dao = new ExtendNumberAttributeConfig();
        dao.setAttrId(bo.getAttributeId());
        dao.setUnit(bo.getUnit());
        dao.setMinValue(bo.getMinValue());
        dao.setMaxValue(bo.getMaxValue());
        dao.setDefaultValue(bo.getDefaultValue());

        return dao;
    }

    /**
     * 类型转换，DAO -> BO
     *
     * @param dao 数字类扩展属性的配置信息
     */
    public static NumberExtendAttributeConfigBo convertNumberExtendAttributeDaoToBo(ExtendNumberAttributeConfig dao) {
        if (dao == null) {
            return null;
        }

        NumberExtendAttributeConfigBo bo = new NumberExtendAttributeConfigBo();
        bo.setAttributeId(dao.getAttrId());
        bo.setUnit(dao.getUnit());
        bo.setMinValue(dao.getMinValue());
        bo.setMaxValue(dao.getMaxValue());
        bo.setDefaultValue(dao.getDefaultValue());

        return bo;
    }

    /**
     * 类型转换，BO -> DAO
     *
     * @param bo 选项类扩展属性的配置选型信息
     */
    public static ExtendSelectionAttributeConfig convertSelectionExtendAttributeBoToDao(@NonNull String attributeId,
                                                                                        @NonNull SelectionContentBo bo) {
        ExtendSelectionAttributeConfig dao = new ExtendSelectionAttributeConfig();
        dao.setAttrId(attributeId);
        dao.setUuid(bo.getUuid());
        dao.setContent(bo.getContent());
        dao.setIsDefault(bo.getDefaultSelection());
        dao.setSort(bo.getSort());

        return dao;
    }

    /**
     * 类型转换，DAO -> DTO
     *
     * @param dao 选项类扩展属性的配置选项信息
     */
    public static SelectionContentDto convertSelectionExtendAttributeDaoToDto(@NonNull ExtendSelectionAttributeConfig dao) {
        SelectionContentDto dto = new SelectionContentDto();
        dto.setUuid(dao.getUuid());
        dto.setContent(dao.getContent());
        dto.setDefaultSelection(dao.getIsDefault());
        dto.setSort(dao.getSort());

        return dto;
    }

    /**
     * 类型转换，DAO -> BO
     *
     * @param dao 选项类扩展属性的配置选项信息
     */
    public static SelectionContentBo convertSelectionExtendAttributeDaoToBo(@NonNull ExtendSelectionAttributeConfig dao) {
        SelectionContentBo bo = new SelectionContentBo();
        bo.setUuid(dao.getUuid());
        bo.setContent(dao.getContent());
        bo.setDefaultSelection(dao.getIsDefault());
        bo.setSort(dao.getSort());

        return bo;
    }

    /**
     * 类型转换，DAO -> DTO
     *
     * @param selectionContentList 选项类扩展属性的配置选项信息
     */
    public static SelectionExtendAttributeConfigDto convertSelectionExtendAttributeDaoToDto(List<ExtendSelectionAttributeConfig> selectionContentList) {
        SelectionExtendAttributeConfigDto dto = new SelectionExtendAttributeConfigDto();
        List<SelectionContentDto> contentDtoList = new ArrayList<>();

        if (CollectionUtils.isEmpty(selectionContentList)) {
            return dto;
        }

        for (ExtendSelectionAttributeConfig dao : selectionContentList) {
            contentDtoList.add(convertSelectionExtendAttributeDaoToDto(dao));
        }

        dto.setAttributeId(selectionContentList.get(0).getAttrId());
        dto.setSelectionList(contentDtoList);

        return dto;
    }

    /**
     * 类型转换，DAO -> BO
     *
     * @param selectionContentList 选项类扩展属性的配置选项信息
     */
    public static SelectionExtendAttributeConfigBo convertSelectionExtendAttributeDaoToBo(List<ExtendSelectionAttributeConfig> selectionContentList) {
        SelectionExtendAttributeConfigBo bo = new SelectionExtendAttributeConfigBo();
        List<SelectionContentBo> contentBoList = new ArrayList<>();

        if (CollectionUtils.isEmpty(selectionContentList)) {
            return bo;
        }

        for (ExtendSelectionAttributeConfig dao : selectionContentList) {
            contentBoList.add(convertSelectionExtendAttributeDaoToBo(dao));
        }

        bo.setAttributeId(selectionContentList.get(0).getAttrId());
        bo.setSelectionList(contentBoList);

        return bo;
    }

}
