package com.hp.docker_base.util;

import cn.hutool.cache.Cache;
import cn.hutool.cache.CacheUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.Month;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.IdcardUtil;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;

/**
 * @description: hutool工具类
 * @author: biyangqiang
 * @time: 2020/8/14 23:08
 */

public class HuToolUtils {


    public static void main(String args[]) {

        // 1-类型转换
        String param = "10";
        int paramInt = Convert.toInt(param);
        int paramIntDefault = Convert.toInt(param, 0);

        // 日期转换
        String dateStr = "2020年09月29日";
        Date date = Convert.toDate(dateStr);

        String unicodeStr = "沉默王二";
        String unicode = Convert.strToUnicode(unicodeStr);

        String digitToChinese = Convert.digitToChinese(12.13);

        //2-日期时间
        // 获取生肖
        String chineseZodiac = DateUtil.getChineseZodiac(1991);
        System.out.println(chineseZodiac);

       // 射手座
        String zodiac = DateUtil.getZodiac(Month.OCTOBER.getValue(), 9);
        System.out.println(zodiac);

        // 3、文件流
        //FileUtil.getInputStream("origin.txt")

        // 4、文件压缩


        //5、身份证工具
        String ID_18 = "321083197812162119";
        String ID_15 = "150102880730303";

        boolean valid = IdcardUtil.isValidCard(ID_18);
        boolean valid15 = IdcardUtil.isValidCard(ID_15);


        //6、拓展的hashmap
        Dict dict = Dict.create()
                .set("age", 18)
                .set("name", "沉默王二")
                .set("birthday", DateTime.now());

        int age = dict.getInt("age");
        String name = dict.getStr("name");

        //7、字段验证器

        //8、图片处理

        // 9、缓存工具

        Cache<String, String> fifoCache = CacheUtil.newFIFOCache(3);
        fifoCache.put("key1", "沉默王一");
        fifoCache.put("key2", "沉默王二");
        fifoCache.put("key3", "沉默王三");
        fifoCache.put("key4", "沉默王四");

// 大小为 3，所以 key3 放入后 key1 被清除
        String value1 = fifoCache.get("key1");
        System.out.println(fifoCache);

        // 加密解密
    }
}
