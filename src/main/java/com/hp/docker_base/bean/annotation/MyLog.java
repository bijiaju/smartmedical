package com.hp.docker_base.bean.annotation;

import java.lang.annotation.*;

/**
 * @description: 日志操作
 * @author: biyangqiang
 * @time: 2020/8/14 22:19
 */

@Target(ElementType.METHOD) //注解放置的目标位置,METHOD是可注解在方法级别上
@Retention(RetentionPolicy.RUNTIME) //注解在哪个阶段执行
@Documented //生成文档
public @interface MyLog {

    String value() default "";
}
