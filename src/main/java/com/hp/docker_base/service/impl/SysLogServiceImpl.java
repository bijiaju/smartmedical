package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.annotation.SysLog;
import com.hp.docker_base.bean.condition.SysLogCondition;
import com.hp.docker_base.mapper.SysLogMapper;
import com.hp.docker_base.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description: 系统日志实现
 * @author: biyangqiang
 * @time: 2020/8/14 22:55
 */
@Service
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;

    @Override
    public int save(SysLog sysLog) {
        return sysLogMapper.save(sysLog);
    }

    @Override
    public List<SysLog> querySysLogList(String startDate,
                                        String endDate,
                                        String keywords) {



        SysLogCondition condition = new SysLogCondition();
        condition.setStartDate(startDate);
        condition.setEndDate(endDate);
        condition.setKeywords(keywords);
        return sysLogMapper.findSysLogList(condition);
    }
}
