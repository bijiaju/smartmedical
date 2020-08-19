package com.hp.docker_base.bean.em;

/**
 * @description: 【枚举】是否有效（启用/禁用）
 * @author: bee
 * @create: 2020-03-17 11:32
 **/
public enum EnumValid {
    ALL(-1, "全部"),
    INVALID(0, "无效"),
    VALID(1, "有效");

    private Integer value;
    private String description;

    public Integer getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }

    private EnumValid(Integer value, String desc) {
        this.value = value;
        this.description = desc;
    }

    public static EnumValid getValidState(int code) {
        EnumValid[] states = values();
        for (EnumValid state : states) {
            if (state.getValue() == code) {
                return state;
            }
        }

        return null;
    }
}
