package com.hp.docker_base.bean.exception;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:42
 */
public class DataException extends RuntimeException {
    private static final long serialVersionUID = 1L;
    private String message;
    private String code;

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public DataException() {
        this("数据异常！");
    }

    public DataException(String message) {
        this.message = message;
    }

    public DataException(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public DataException(String message, Throwable cause) {
        super(message, cause);
        this.message = message;
    }

    public String getMessage() {
        return this.message;
    }
}
