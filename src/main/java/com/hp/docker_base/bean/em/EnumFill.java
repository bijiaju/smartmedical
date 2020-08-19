package com.hp.docker_base.bean.em;

/**
 * @description: 是否必填
 * @create: 2020-04-03 11:25
 **/
public enum EnumFill {
    /**
     * 必填
     */
    YES(1),
    /**
     * 非必填
     */
    NO(0);

    int code;

    EnumFill(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
