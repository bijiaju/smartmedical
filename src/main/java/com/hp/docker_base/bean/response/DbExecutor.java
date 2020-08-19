package com.hp.docker_base.bean.response;

import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 17:10
 */
public interface DbExecutor<T> {
    List<T> doQuery(PageBoundsRecord<T> var1);
}
