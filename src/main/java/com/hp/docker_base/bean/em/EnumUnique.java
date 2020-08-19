package com.hp.docker_base.bean.em;

/**
 * @description: 是否唯一
 * @author: bee
 * @create: 2020-04-03 11:25
 **/
public enum EnumUnique {
    /**
     * 唯一
     */
    YES(1),

    /**
     * 不唯一
     */
    NO(0);

    int code;

    EnumUnique(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
