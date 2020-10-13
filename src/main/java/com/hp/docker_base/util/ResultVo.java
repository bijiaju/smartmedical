package com.hp.docker_base.util;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/18 9:56
 */
public class ResultVo<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    @ApiModelProperty("标识[0,成功][>0,失败]")
    private int code;
    @ApiModelProperty("描述")
    private String message;
    @ApiModelProperty("返回值")
    private String data;

    public int getCode() {
        return this.code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
