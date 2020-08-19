package com.hp.docker_base.bean.em;

/**
 * @program: idaas
 * @description: 【枚举】自定义扩展属性类型，文本/数字/选项/日期等
 * @author: 姬同凯
 * @create: 2020-03-17 11:32
 **/
public enum EnumExtendAttributeType {

    SINGLE_LINE_TEXT("single-line-text", "单行文本"),
    MULTIPLE_LINE_TEXT("multiple-line-text", "多行文本"),
    INTEGER_NUMBER("integer-number", "整数"),
    REAL_NUMBER("real-number", "实数"),
    SINGLE_SELECTION("single-selection", "单选"),
    MULTIPLE_SELECTION("multiple-selection", "多选"),
    DROPDOWN_SINGLE_SELECTION("dropdown-single-selection", "下拉单选"),
    DROPDOWN_MULTIPLE_SELECTION("dropdown-multiple-selection", "下拉多选"),
    DATE("date", "日期"),
    TIME("time", "时间"),
    DATE_TIME("datetime", "日期时间");

    String code;
    String description;

    EnumExtendAttributeType(String code, String description) {
        this.code = code;
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public static EnumExtendAttributeType getExtendAttributeType(String code) {
        EnumExtendAttributeType[] types = values();
        for (EnumExtendAttributeType type : types) {
            if (type.getCode().equals(code)) {
                return type;
            }
        }

        return null;
    }

    /**
     * 判断是否是文本类扩展属性
     *
     * @param type 扩展属性类型
     */
    public static boolean isTextAttributeType(EnumExtendAttributeType type) {
        return type == SINGLE_LINE_TEXT || type == MULTIPLE_LINE_TEXT;
    }

    /**
     * 判断是否是数字类扩展属性
     *
     * @param type 扩展属性类型
     */
    public static boolean isNumberAttributeType(EnumExtendAttributeType type) {
        return type == INTEGER_NUMBER || type == REAL_NUMBER;
    }

    /**
     * 判断是否是选项类扩展属性
     *
     * @param type 扩展属性类型
     */
    public static boolean isSelectionAttributeType(EnumExtendAttributeType type) {
        return type == SINGLE_SELECTION
                || type == MULTIPLE_SELECTION
                || type == DROPDOWN_SINGLE_SELECTION
                || type == DROPDOWN_MULTIPLE_SELECTION;
    }

    /**
     * 判断是否是单选类扩展属性
     *
     * @param type 扩展属性类型
     */
    public static boolean isSingleSelectionAttributeType(EnumExtendAttributeType type) {
        return type == SINGLE_SELECTION
                || type == DROPDOWN_SINGLE_SELECTION;
    }

    /**
     * 判断是否是多选类扩展属性
     *
     * @param type 扩展属性类型
     */
    public static boolean isMultipleSelectionAttributeType(EnumExtendAttributeType type) {
        return type == MULTIPLE_SELECTION
                || type == DROPDOWN_MULTIPLE_SELECTION;
    }

    /**
     * 判断是否是日期时间类扩展属性
     *
     * @param type 扩展属性类型
     */
    public static boolean isDateAttributeType(EnumExtendAttributeType type) {
        return type == DATE || type == DATE_TIME || type == TIME;
    }
}
