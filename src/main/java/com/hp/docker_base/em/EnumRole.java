package com.hp.docker_base.em;

/**
 * @program: idaas
 * @description: 通用是否
 * @author: bee
 * @create: 2020-04-07 15:41
 **/
public enum EnumRole {
    DOCTOR("1","医生"),
    ADMIN("2","管理员");

    String code;
    String value;

    EnumRole(String code, String value) {
        this.code = code;
        this.value = value;
    }

    public String getCode() {
        return code;
    }

    public String getValue() {
        return value;
    }
}
