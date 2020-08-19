package com.hp.docker_base.util;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 19:27
 */
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.hp.docker_base.bean.exception.DataException;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.util.ReflectionUtils;

public class ObjectConvertUtils {
    public static final String MAP_KEY_SEPARATOR = "_";

    public ObjectConvertUtils() {
    }

    public static <T> List<T> autoConvertToList(Collection<?> sourceCollection, Class<T> targetClass) {
        try {
            List<T> targets = new ArrayList();
            if (CollectionUtils.isNotEmpty(sourceCollection)) {
                Iterator var3 = sourceCollection.iterator();

                while(var3.hasNext()) {
                    Object source = var3.next();
                    T target = targetClass.newInstance();
                    BeanUtils.copyProperties(source, target);
                    targets.add(target);
                }
            }

            return targets;
        } catch (Exception var6) {
            throw new DataException("数据转换异常!");
        }
    }

    public static Object getFieldValueByFieldName(Object object, String fieldName) {
        try {
            Field field = ReflectionUtils.findField(object.getClass(), fieldName);
            field.setAccessible(true);
            return field.get(object);
        } catch (Exception var3) {
            throw new DataException("属性值获取异常!");
        }
    }

    public static <T> List<T> autoConvertPropertyToList(Collection<?> sourceCollection, String targetPropertyName, Class<T> targetPropertyClass) {
        try {
            List<T> targets = new ArrayList();
            if (CollectionUtils.isNotEmpty(sourceCollection)) {
                Iterator var4 = sourceCollection.iterator();

                while(var4.hasNext()) {
                    Object source = var4.next();
                    T target = targetPropertyClass.newInstance();
                    target = (T) getFieldValueByFieldName(source, targetPropertyName);
                    targets.add(target);
                }
            }

            return targets;
        } catch (Exception var7) {
            throw new DataException("数据转换异常!");
        }
    }

    public static <T> Set<String> autoConvertToSetByPropertys(Collection<T> sourceCollection, String... targetPropertyNames) {
        try {
            Set<String> sets = new HashSet();
            if (CollectionUtils.isNotEmpty(sourceCollection)) {
                Iterator var3 = sourceCollection.iterator();

                while(var3.hasNext()) {
                    T source = (T) var3.next();
                    String key = "";

                    for(int i = 0; i < targetPropertyNames.length; ++i) {
                        String targetPropertyValue = getFieldValueByFieldName(source, targetPropertyNames[i]).toString();
                        if (i == 0) {
                            key = targetPropertyValue;
                        } else {
                            key = key + "_" + targetPropertyValue;
                        }
                    }

                    sets.add(key);
                }
            }

            return sets;
        } catch (Exception var8) {
            throw new DataException("数据转换异常!");
        }
    }

    public static <T> Map<String, List<T>> autoConvertToMapByPropertys(Collection<T> sourceCollection, String... targetPropertyNames) {
        try {
            Map<String, List<T>> maps = new HashMap();
            if (CollectionUtils.isNotEmpty(sourceCollection)) {
                Iterator var3 = sourceCollection.iterator();

                while(var3.hasNext()) {
                    T source = (T) var3.next();
                    String key = "";

                    for(int i = 0; i < targetPropertyNames.length; ++i) {
                        String targetPropertyValue = getFieldValueByFieldName(source, targetPropertyNames[i]).toString();
                        if (i == 0) {
                            key = targetPropertyValue;
                        } else {
                            key = key + "_" + targetPropertyValue;
                        }
                    }

                    if (maps.containsKey(key)) {
                        ((List)maps.get(key)).add(source);
                    } else {
                        List<T> values = new ArrayList();
                        values.add(source);
                        maps.put(key, values);
                    }
                }
            }

            return maps;
        } catch (Exception var8) {
            throw new DataException("数据转换异常!");
        }
    }

    public static <T> T getFirstElementOfList(List<T> list) {
        return CollectionUtils.isNotEmpty(list) ? list.get(0) : null;
    }

    public static String[] getNullPropertyNames(Object source) {
        BeanWrapper src = new BeanWrapperImpl(source);
        PropertyDescriptor[] pds = src.getPropertyDescriptors();
        Set<String> emptyNames = new HashSet();
        PropertyDescriptor[] var4 = pds;
        int var5 = pds.length;

        for(int var6 = 0; var6 < var5; ++var6) {
            PropertyDescriptor pd = var4[var6];
            Object srcValue = src.getPropertyValue(pd.getName());
            if (srcValue == null) {
                emptyNames.add(pd.getName());
            }
        }

        String[] result = new String[emptyNames.size()];
        return (String[])emptyNames.toArray(result);
    }

    public static void copyPropertiesIgnoreNull(Object src, Object target) {
        BeanUtils.copyProperties(src, target, getNullPropertyNames(src));
    }
}

