package com.hp.docker_base.service;

import com.hp.docker_base.bean.annotation.SysLog;

import java.util.List;

/**
 * @description: 系统日志
 * @author: biyangqiang
 * @time: 2020/8/14 22:53
 */

public interface ISysLogService {
    /**
     * 插入系统日志
     */
    int save(SysLog sysLog);

    /**
     * 查询日志信息
     */
    List<SysLog> querySysLogList(String startDate,
                                 String endDate,
                                 String keywords);
}
