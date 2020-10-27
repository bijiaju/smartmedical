package com.hp.docker_base.bean.em;

/**
 * @description: 是否唯一
 * @author: bee
 * @create: 2020-04-03 11:25
 **/
public enum EnumTreatResultType {
    /**
     * 唯一
     */
    AUTO(1),

    /**
     * 不唯一
     */
    DOCTOR(0);

    int code;

    EnumTreatResultType(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
