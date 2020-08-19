package com.hp.docker_base.bean.response;

import org.apache.ibatis.session.RowBounds;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 17:12
 */
public class PageBounds extends RowBounds {
    private int total;

    public PageBounds() {
    }

    public PageBounds(int offset, int limit) {
        super(offset, limit);
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String toString() {
        return "PagingBounds [offset=" + this.getOffset() + ", limit=" + this.getLimit() + ", total=" + this.total + "]";
    }
}
