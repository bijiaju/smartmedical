package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.annotation.SysLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/14 23:12
 */

@Mapper
public interface SysLogMapper {
    /**
     * 插入日志
     */
    int save(SysLog sysLog);
}
