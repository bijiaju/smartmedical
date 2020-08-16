package com.hp.docker_base.util.convert;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Desc 通用的类型转换
 * @Author 24763
 * @Date 2020/5/29 10:43
 */
public class CommonObjectTypeConvertUtils {

    /**
     * Str->List<Str>
     */
    public static List<String> convertStrToStrList(String str) {
        if (StringUtils.isEmpty(str)) {
            return new ArrayList<>();
        }

        return Arrays.asList(str.split(","));
    }

    /**
     * 合并应用资源集合
     */
    public static List<String> mergeResourceIdList(List<String> accountGroupResourceIdList,
                                                   List<String> accountGroupRoleResourceIdList) {
        List<String> retList = new ArrayList<>();

        if (CollectionUtils.isNotEmpty(accountGroupResourceIdList)) {
            retList.addAll(accountGroupResourceIdList);
        }

        if (CollectionUtils.isNotEmpty(accountGroupRoleResourceIdList)) {
            retList.addAll(accountGroupRoleResourceIdList);
        }

        // 返回过滤好数据
        return retList.stream().distinct().collect(Collectors.toList());
    }

    /**
     * 获取要添加的id
     *
     * @param front    前端传来数据集合
     * @param database 数据库查询出来的数据
     */
    public static List<String> getAddId(List<String> front, List<String> database) {
        List<String> front1 = new ArrayList<>(front);
        List<String> database2 = new ArrayList<>(database);

        front1.removeAll(database2);
        return front1;
    }

    /**
     * 获取要删除的id
     *
     * @param front    前端传来数据集合
     * @param database 数据库查询出来的数据
     */
    public static List<String> getDeleteId(List<String> front, List<String> database) {
        List<String> front1 = new ArrayList<>(front);
        List<String> database2 = new ArrayList<>(database);

        database2.removeAll(front1);
        return database2;
    }

    /* *//**
     *  过滤List中重复数据
     *//*
    public static List<T> convertDistinctList(List<T> list) {
        if (list.isEmpty()) {
            return new ArrayList<>();
        }

       return list.stream().distinct().collect(Collectors.toList());
    }*/
}
