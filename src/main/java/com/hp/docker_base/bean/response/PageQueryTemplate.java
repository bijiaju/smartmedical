package com.hp.docker_base.bean.response;

import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 17:10
 */
public class PageQueryTemplate {
    public PageQueryTemplate() {
    }

    public static <T> Page<T> selectByPage(Page<T> page, DbExecutor<T> executor) {
        if (page == null) {
            page = Page.makePageByOffsetRecord(0, 2147483647);
        }

        PageBoundsRecord<T> pagingBounds = new PageBoundsRecord(page.getStartIndex(), page.getPageSize());
        List<T> list = executor.doQuery(pagingBounds);
        PageUtils.makePage(page, list, pagingBounds.getTotal());
        return page;
    }
}
