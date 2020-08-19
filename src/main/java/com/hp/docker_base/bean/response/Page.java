package com.hp.docker_base.bean.response;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:45
 */
import java.io.Serializable;
import java.util.List;

public class Page<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    private static int DEFAULT_COUNT = 20;
    private int startIndex = 0;
    private int pageNo = 1;
    private int pageTotal = 1;
    private int pageSize;
    private int total;
    private List<T> records;

    public int getPageNo() {
        return this.pageNo;
    }

    public int getPageTotal() {
        return this.pageTotal;
    }

    public static <T> Page<T> makePageByPageNumber(int pageNumber, int pageSize) throws IllegalArgumentException {
        Page<T> page = new Page();
        if (pageSize >= 1) {
            page.setPageSize(pageSize);
            if (pageNumber < 1) {
                page.startIndex = 0;
            } else {
                page.startIndex = (pageNumber - 1) * page.pageSize;
            }

            return page;
        } else {
            throw new IllegalArgumentException("请设置有效的分页大小！");
        }
    }

    public static <T> Page<T> makePageByOffsetRecord(int offset, int pageSize) {
        Page<T> page = new Page();
        if (pageSize >= 1) {
            page.setPageSize(pageSize);
        }

        if (offset >= 0) {
            page.startIndex = offset;
        }

        return page;
    }

    private Page() {
        this.pageSize = DEFAULT_COUNT;
        this.total = 0;
    }

    public void setPageSize(int pageSize) {
        if (pageSize > 0) {
            this.pageSize = pageSize;
        }

    }

    public void setTotal(int total) {
        this.total = total;
        if (this.total <= 0) {
            this.pageNo = 1;
            this.pageTotal = 1;
        } else {
            this.pageTotal = (int)Math.ceil((double)((float)total * 1.0F / (float)this.getPageSize()));
            this.pageNo = Math.min(this.getStartIndex() / this.getPageSize() + 1, this.pageTotal);
        }

    }

    public int getTotal() {
        return this.total;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public int getStartIndex() {
        return this.startIndex;
    }

    public void setRecords(List<T> obj) {
        this.records = obj;
    }

    public List<T> getRecords() {
        return this.records;
    }

    public int getNextPage() {
        return Math.min(this.pageNo + 1, this.pageTotal);
    }

    public int getPrePage() {
        return Math.max(this.pageNo - 1, 1);
    }

    public String toString() {
        return "Page [startIndex=" + this.startIndex + ", pageSize=" + this.pageSize + ", total=" + this.total + ", records=" + this.records + "]";
    }
}