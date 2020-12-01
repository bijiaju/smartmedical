package com.hp.docker_base.bean.em;

/**
 * @description: 【枚举】是否有效（启用/禁用）
 * @author: bee
 * @create: 2020-03-17 11:32
 **/
public enum EnumTreatState {
    ALL(-1, "全部"),
    COMMON(1, "普通"),
    MODIFY(2, "修改"),
    REJECT_MODIFY(3, "修改被驳回"),
    CONFIRM_MODIFY(4, "修改被确认");

    private Integer value;
    private String description;

    public Integer getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }

    private EnumTreatState(Integer value, String desc) {
        this.value = value;
        this.description = desc;
    }

    public static EnumTreatState getValidState(int code) {
        EnumTreatState[] states = values();
        for (EnumTreatState state : states) {
            if (state.getValue() == code) {
                return state;
            }
        }

        return null;
    }
}
