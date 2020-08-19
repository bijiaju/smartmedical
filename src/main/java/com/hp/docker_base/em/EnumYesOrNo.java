package com.hp.docker_base.em;

/**
 * @program: idaas
 * @description: 通用是否
 * @author: bee
 * @create: 2020-04-07 15:41
 **/
public enum EnumYesOrNo {
    YES(1),
    NO(0);

    int code;

    EnumYesOrNo(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
