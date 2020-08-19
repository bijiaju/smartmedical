package com.hp.docker_base.bean.response;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:21
 */
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.util.List;

@ApiModel("表返回值")
public class ResponseTableVo<T> implements Serializable {
    @ApiModelProperty("总数")
    private int total;
    @ApiModelProperty("行数据")
    private List<T> rows;

    public ResponseTableVo() {
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getRows() {
        return this.rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public static <T> ResponseTableVo<T> constructorTableResult(List<T> list, Integer size) {
        ResponseTableVo<T> result = new ResponseTableVo();
        result.setRows(list);
        result.setTotal(size);
        return result;
    }

    public String toString() {
        return "ResponseTableVo{total=" + this.total + ", rows=" + this.rows.toString() + '}';
    }
}
