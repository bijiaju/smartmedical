package com.hp.docker_base.bean.response;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 17:09
 */
import java.util.List;

public class PageUtils {
    public PageUtils() {
    }

    public static <T> Page<T> makePage(Page<T> page, List<T> records, int total) {
        if (page == null) {
            page = Page.makePageByOffsetRecord(0, 0);
        }

        page.setRecords(records);
        page.setTotal(total);
        return page;
    }

    public static <T> Page<T> makePage(int offset, int limit) {
        if (limit == 0) {
            throw new IllegalArgumentException("分页大小不能为0");
        } else {
            Page<T> page = Page.makePageByOffsetRecord(offset, limit);
            page.setPageSize(limit);
            return page;
        }
    }
}
