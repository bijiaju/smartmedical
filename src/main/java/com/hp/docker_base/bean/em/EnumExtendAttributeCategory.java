package com.hp.docker_base.bean.em;

/**
 * @description: 【枚举】自定义扩展属性所属分类，组织机构/账户组/组
 * @author: bee
 * @create: 2020-03-17 11:32
 **/
public enum EnumExtendAttributeCategory {

    BASIC_INFO(0, "基础信息及病史"),
    DIAGNOSIS(1, "临床诊断"),
    IMAGE(2, "医学图像特征");

    int code;
    String description;

    EnumExtendAttributeCategory(int code, String description) {
        this.code = code;
        this.description = description;
    }

    public int getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public static EnumExtendAttributeCategory getExtendAttributeCategory(int code) {
        EnumExtendAttributeCategory[] categories = values();
        for (EnumExtendAttributeCategory category : categories) {
            if (category.getCode() == code) {
                return category;
            }
        }

        return null;
    }
}
