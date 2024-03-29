package com.hp.docker_base.util;

import org.apache.tomcat.util.codec.binary.Base64;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 通用的工具类
 */
public class CommonUtil {

    /**
     *
     * @param d
     * @param IntegerDigits
     * @param FractionDigits
     * @return String
     * @time 2018年10月1日 上午11:09:35
     */
    public static String getPercentFormat(double d,int IntegerDigits,int FractionDigits) {
        NumberFormat nf = java.text.NumberFormat.getPercentInstance();
        nf.setMaximumIntegerDigits(IntegerDigits);//小数点前保留几位
        nf.setMinimumFractionDigits(FractionDigits);// 小数点后保留几位
        String str = nf.format(d);
        return str.substring(0,str.length()-1);

    }
        /**
         * 设置返回JSON数据
         * @param returncode
         * @param returnmessage
         * @return Map<String, Object>
         */
    public static Map<String, Object> setReturnMap(String returncode,
                                                   String returnmessage,
                                                   Object object) {
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("code", returncode);
        retMap.put("data",object);
        retMap.put("message", returnmessage);
        return retMap;
    }

    /**
     * 将图片转换成Base64编码
     * @param imgFile 待处理图片
     * @return
     */
    public static String imgToBase64(String imgFile){
        //将图片文件转化为字节数组字符串，并对其进行Base64编码处理


        InputStream in = null;
        byte[] data = null;
        //读取图片字节数组
        try
        {
            in = new FileInputStream(imgFile);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return new String(Base64.encodeBase64(data));
    }

    /**
     * 过滤中英文方括号的数字
     * @param src 过滤内容
     * @param reg 过滤规则
     * @return 过滤后的内容
     */
    public static String filterVerifyCode(String src,String reg[]){
        StringBuilder ret = new StringBuilder(src);
        //String [] reg = {"\\[\\d+\\]","\\【\\d+\\】"};//判断中英文方括号的正则
        for(int i=0;i<reg.length;i++){
            Pattern p = Pattern.compile(reg[i]);
            Matcher m = p.matcher(src);
            while(m.find())
            {
                ret.replace(m.start()+1, m.end()-1, addStar(m.start()+1, m.end()-1));
            }
        }
        return ret.toString();
    }

    /**
     * 根据起始位置添加 星号
     * @param start
     * @param end
     * @return
     */
    public static String addStar(int start,int end){
        String str ="";
        for(int i=start;i<end;i++){
            str+="*";
        }
        return str;
    }

    /**
     * 获取uuid
     */
    public static String generateUUID(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

    /**
     *  根据fullpath设置level层级
     * @param fullPath  fullPath：0001/002/003
     */
    public static Integer getLevel(String fullPath) {
        int count = 0;
        Pattern p = Pattern.compile("/");
        Matcher m = p.matcher(fullPath);
        while(m.find()) {
            count++;
        }
        return count+1;
    }

    public static String getVeriCode(){
        return String.valueOf((int)((Math.random() * 9 + 1) * Math.pow(10,5)));
    }

    public static void main(String[] args){
        String _name = "sdfads";
        //测试生成base64的编码
       /* String imgFile = "C:\\Users\\bee\\Desktop\\test1\\2.png";
        String base64 = imgToBase64(imgFile);
        System.out.println(base64);*/
    }
}
