package com.hp.docker_base.util;

import antlr.StringUtils;
import cn.hutool.core.date.DateUtil;
import com.hp.docker_base.bean.User;
import org.springframework.beans.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/14 23:08
 */

public class IPUtils {

    public static String getIpAddr(HttpServletRequest request){
        String ipAddress = request.getHeader("x-forwarded-for");
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
                //根据网卡取本机配置的IP
                InetAddress inet=null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                ipAddress= inet.getHostAddress();
            }
        }
        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15
            if(ipAddress.indexOf(",")>0){
                ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return "0:0:0:0:0:0:0:1".equals(ip) ? "127.0.0.1" : ip;
    }


    public static void main(String args[]) {

        String property = System.getProperty("line.separator");

        if (System.getProperty("line.separator").equals("/r/n")) {
            System.out.println("//r//n is for windows");
        } else if (System.getProperty("line.separator").equals("/r")) {
            System.out.println("//r is for Mac");
        } else if (System.getProperty("line.separator").equals("/n")) {
            System.out.println("//n is for Unix/Linux");
        }

        List<User> userList = new ArrayList<User>();
        User user1 = new User();
        user1.setId(1);
        User user2 = new User();
        user2.setId(2);
        userList.add(user1);
        userList.add(user2);

        List<User> extCopyFields = new ArrayList<>();
        //BeanUtils.copyProperties(userList,extCopyFields);
        //BeanConvertUtils.convertListTo(userList,extCopyFields);
        List<User> users = BeanCopyUtil.copyListProperties(userList, User::new);

        String str = "|31|21||";
        if(str != null
                && str.startsWith("|")
                && str.endsWith("|")){

            String[] userArr = str.split("\\|");
            if(userArr != null || userArr.length != 0){
                for(String userId : userArr){
                    if(!"".equals(userId)){
                        System.out.println("good");
                    }
                }
            }
        }

        int isExist = 1==2 ? 1 :0;
        System.out.println(isExist);

        User p=new User();
        System.out.println( p instanceof User);


        String chineseZodiac = DateUtil.getChineseZodiac(1991);
        System.out.println(chineseZodiac);

        BigDecimal bd   =   new   BigDecimal("6783.14159265");
        bd   =   bd.setScale(2,BigDecimal.ROUND_HALF_UP);

        System.out.println(new BigDecimal("6783.14159265").setScale(2,BigDecimal.ROUND_HALF_UP).toString());
    }
}
