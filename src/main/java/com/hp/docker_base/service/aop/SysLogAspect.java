package com.hp.docker_base.service.aop;

import com.alibaba.fastjson.JSON;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.annotation.MyLog;
import com.hp.docker_base.bean.annotation.SysLog;
import com.hp.docker_base.service.ISysLogService;
import com.hp.docker_base.util.IPUtils;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.ArrayUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/14 22:21
 */
@Aspect
@Component
public class SysLogAspect {

    @Autowired
    public ISysLogService sysLogService;

    @Pointcut("@annotation( com.hp.docker_base.bean.annotation.MyLog)")
    public void logPoinCut() {
    }

    //切面 配置通知
    @AfterReturning("logPoinCut()")
    public void saveSysLog(JoinPoint joinPoint) {
        //保存日志
        SysLog sysLog = new SysLog();

        //从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获取切入点所在的方法
        Method method = signature.getMethod();

        //获取操作
        MyLog myLog = method.getAnnotation(MyLog.class);
        if (myLog != null) {
            String value = myLog.value();
            sysLog.setOperation(value);//保存获取的操作
        }

        //获取请求的类名
        String className = joinPoint.getTarget().getClass().getName();
        //获取请求的方法名
        String methodName = method.getName();
        sysLog.setMethod(methodName);


        //请求的参数
        Object[] args = joinPoint.getArgs();
        //将参数所在的数组转换成json
        List<Object> logArgs = SysLogAspect.streamOf(args)
                .filter(arg -> (!(arg instanceof HttpServletRequest) && !(arg instanceof HttpServletResponse)))
                .collect(Collectors.toList());
        String params = JSON.toJSONString(logArgs);

        if(params.length() < 200){
            sysLog.setParams(params);
        }


        sysLog.setCreateDate(new Date());

        //获取用户名
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();

        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            sysLog.setUsername(user.getUserName());
        }else{
            sysLog.setUsername("bee");
        }

        //获取用户ip地址
        sysLog.setIp(IPUtils.getIpAddress(request));

        //调用service保存SysLog实体类到数据库
        sysLogService.save(sysLog);
    }

    public static <T> Stream<T> streamOf(T[] array) {
        return ArrayUtils.isEmpty(array) ? Stream.empty() : Arrays.asList(array).stream();
    }
}
