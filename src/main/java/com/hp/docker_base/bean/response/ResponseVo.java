package com.hp.docker_base.bean.response;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:20
 */
import com.alibaba.fastjson.JSONArray;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@ApiModel("返回值")
public class ResponseVo<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    @ApiModelProperty("标识[0,成功][>0,失败]")
    private int code;
    @ApiModelProperty("描述")
    private String message;
    @ApiModelProperty("返回值")
    private List<T> data;

    public ResponseVo() {
    }

    public static ResponseVo error() {
        return error(1, "操作失败!");
    }

    public static ResponseVo error(String msg) {
        return error(1, msg);
    }

    public static ResponseVo error(int code, String msg) {
        ResponseVo<JSONArray> r = new ResponseVo();
        r.setCode(code);
        r.setMessage(msg);
        r.setData(new ArrayList());
        return r;
    }

    public static ResponseVo ok() {
        return ok(0, "操作成功!", (List)null);
    }

    public static <T> ResponseVo<T> ok(T data) {
        List<T> datas = new ArrayList();
        if (data != null) {
            datas.add(data);
        }

        return ok(0, "操作成功!", datas);
    }

    public static <T> ResponseVo<T> ok(List<T> data) {
        return ok(0, "操作成功!", data);
    }

    public static ResponseVo ok(int code, String msg) {
        return ok(code, msg, (List)null);
    }

    public static <T> ResponseVo<T> ok(String msg, List<T> data) {
        return ok(0, msg, data);
    }

    private static <T> ResponseVo<T> ok(int code, String msg, List<T> data) {
        ResponseVo r = new ResponseVo();
        r.setCode(code);
        r.setMessage(msg);
        r.setData(data);
        return r;
    }

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

    public List<T> getData() {
        return this.data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public String toString() {
        return "ResponseVo{code=" + this.code + ", message='" + this.message + '\'' + ", data=" + this.data.toString() + '}';
    }
}
