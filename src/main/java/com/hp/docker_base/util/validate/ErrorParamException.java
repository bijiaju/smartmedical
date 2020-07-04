package com.hp.docker_base.util.validate;

/**
 * @author ligang
 * @Description 服务异常
 * @date 2019/10/24 19:23
 */
public class ErrorParamException extends RuntimeException {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String message;
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public ErrorParamException() {
        this("服务调用异常！");
    }

    public ErrorParamException(String message) {
        this.message = message;
    }

    public ErrorParamException(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public ErrorParamException(String message, Throwable cause) {
        super(message, cause);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
