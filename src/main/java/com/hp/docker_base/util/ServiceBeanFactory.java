package com.hp.docker_base.util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author: biyangqiang
 * @Description:
 * @Date: Created in 10:18 2021/4/23
 * @Modify By:
 */
public class ServiceBeanFactory {

    private static final Map<Class, Object> CLASS_BEAN_MAP = new ConcurrentHashMap<>();
    private static final Map<String, Object> NAME_BEAN_MAP = new ConcurrentHashMap<>();

    private ServiceBeanFactory() {
        //  do nothing
    }

    @SuppressWarnings("unchecked")
    public static <T> T getBean(Class<T> clazz) {
        if (clazz == null) {
            throw new IllegalArgumentException("class is null!");
        }
        if (CLASS_BEAN_MAP.containsKey(clazz)) {
            return (T) CLASS_BEAN_MAP.get(clazz);
        } else {
            T obj = ApplicationContextHolder.getBean(clazz);
            CLASS_BEAN_MAP.put(clazz, obj);
            return obj;
        }
    }

    @SuppressWarnings("unchecked")
    public static <T> T getBean(String name, Class<T> clazz) {
        if (name == null) {
            throw new IllegalArgumentException("name is null!");
        }
        if (clazz == null) {
            throw new IllegalArgumentException("class is null!");
        }
        if (NAME_BEAN_MAP.containsKey(name)) {
            return (T) NAME_BEAN_MAP.get(name);
        } else {
            T obj = ApplicationContextHolder.getBean(name, clazz);
            NAME_BEAN_MAP.put(name, obj);
            return obj;
        }
    }
}
