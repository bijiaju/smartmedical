package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.annotation.SysLog;
import com.hp.docker_base.bean.condition.SysLogCondition;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 查询日志
     */
    List<SysLog> findSysLogList(@Param("condition") SysLogCondition condition);
}
