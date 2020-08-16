package com.hp.docker_base.controller;


import com.github.pagehelper.PageInfo;
import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.annotation.SysLog;
import com.hp.docker_base.controller.base.BaseController;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.ISysLogService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.PageUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @Auther: bee
 * @Date: 2019/1/11 16:47
 * @Description: 用户Controller
 */
@RestController
@RequestMapping("/sys/log")
@Api(tags = "【前端开放】系统日志API", description = "系统日志API")
public class SysLogController extends BaseController{

    @Autowired
    private ISysLogService sysLogService;

    @ApiOperation(value = "查询操作日志", notes = "根据日期区间，账户、ip、操作查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "startDate", paramType = "query", required = false,
                    value = "开始日期 2020-08-15 02:39:53"),
            @ApiImplicitParam(name = "endDate", paramType = "query", required = false,
                    value = "结束日期 2020-08-15 02:39:53"),
            @ApiImplicitParam(name = "keywords", paramType = "query", required = false,
                    value = "关键字，根据日期区间，账户、ip、操作查询"),
            @ApiImplicitParam(name = "pageNum", paramType = "query", required = true,
                    value = "1 就是查第一页，每页10条记录"),
    })
    @GetMapping("/list")
    @MyLog("查询操作日志")
    public  Map<String,Object>  doQuerySysLogList(
            @RequestParam(value = "startDate",required = false) String startDate,
            @RequestParam(value = "endDate",required = false) String endDate,
            @RequestParam(value = "keywords",required = false) String keywords,
            @RequestParam(value = "pageNum") int pageNum) {

        // 查询所有日志
        PageUtil.startPage(pageNum);

        List<SysLog>  sysLogList = sysLogService.querySysLogList(startDate,
                endDate,
                keywords);

        return CommonUtil.setReturnMap(EnumOKOrNG.OK.getCode(),
                EnumOKOrNG.OK.getValue(),
                new PageInfo(sysLogList));
    }


}