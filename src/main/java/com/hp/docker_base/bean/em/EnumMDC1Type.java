package com.hp.docker_base.bean.em;

/**
 * @description: 是否唯一
 * @author: bee
 * @create: 2020-04-03 11:25
 **/
public enum EnumMDC1Type {
    /**
     * 唯一
     */
    IN("input"),

    /**
     * 不唯一
     */
    OUT("output");

    String code;

    EnumMDC1Type(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
