package com.hp.docker_base.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

/**
 * 2018-11-23 16:47:23
 * author:bee
 */
public class CalendarUtils {

    private static String formatDayStr = "yyyy-MM-dd";
    private static SimpleDateFormat formatDay = new SimpleDateFormat(formatDayStr);//NOSONAR
    private static SimpleDateFormat formatMonth = new SimpleDateFormat("yyyy-MM");//NOSONAR
    private static SimpleDateFormat formatTimeS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");//NOSONAR
    private static SimpleDateFormat formatTimes = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//NOSONAR


    public static long ONE_DAY = 86400000L;//天的毫秒数

    public static long ONE_WEEK = 604800000L;//周的毫秒数

    public static long ONE_MONTH = 2678400000L;//月的毫秒数

    public static long ONE_COMMON_YEAR = 31536000000L;//普通年的毫秒数

    public static long ONE_LEAP_YEAR = 31622400000L;//闰年的毫秒数


    public static void main(String[] args) throws  Exception{

        Date endOfDay = getEndOfDay(new Date());
        System.out.println(endOfDay);
       /* Date beginTime1 = formatTimes.parse("2020-02-28 09:59:12");
        int i1 = compare_date(beginTime1, new Date());
        System.out.println(i1);
        Date date = addDay(new Date(), 1);
        System.out.println(date);
        Date beginTime = formatTimes.parse("2020-02-28 09:59:12");
        long dayByMinusDate = getDayByMinusDate(beginTime, new Date());
        System.out.println("相差："+dayByMinusDate);
        for(int i=0;i<dayByMinusDate;i++){
            Date start = addDay(beginTime,i);
            Date end = addDay(beginTime,i+1);
            System.out.println("begin："+start);
            System.out.println("end："+end);
        }
        String dateDiff = getDateDiff(beginTime,new Date());
        System.out.println(dateDiff);
        long hourByMinusDate = getHourByMinusDate(beginTime, new Date());
        System.out.println(hourByMinusDate);
        Date addHour = addHour(new Date(), -1);
        System.out.println(addHour+"   addHour");*/
       /* Date fromDate1 = formatDay.parse("2016-08-30");
        int age = calcAge(fromDate1, new Date());
        System.out.println(age);*/
        /*String str = "1100001010";
        System.out.println(str.substring(str.length()-8));*/
        /*System.out.println( getDayOfDate(new Date()) );//23
        System.out.println( getWeekOfDate(new Date()) );//5
        System.out.println(getCurrTimesec());//2018-11-23 16:47:23
        System.out.println(addMonth(new Date(),2));//Wed Jan 23 17:04:27 CST 2019
        System.out.println(getDayByMinusDate(new Date(),addMonth(new Date(),2)));//61
        System.out.println(getMonthByMinusDate(new Date(),addMonth(new Date(),2)));//2
        System.out.println(getYearByMinusDate(new Date(),addMonth(new Date(),2)));//1
        System.out.println(getBirthDayFromIDCard("410822199108111511"));//1991-08-11*/
        //amOrpm();
        //main1();.
      /*  int i= compare_date("1999-12-11 09:59:12", "1999-12-11 09:59:12");
        System.out.println("i=="+i);

        //Date from =
        int yearByMinusDate = getYearByMinusDate(formatTimes.parse("2016-12-11 09:59:12"), new Date());
        System.out.println("相差=="+yearByMinusDate);

        long yearByMinusD= getDayByMinusDate(formatTimes.parse("2020-2-1 09:59:12"), new Date());
        System.out.println("相差=="+yearByMinusD);

        Date fromDate = formatTimes.parse("2016-08-30 09:59:12");
        fromDate.getTime();
        long res = new Date().getTime()-fromDate.getTime();
        System.out.println(System.currentTimeMillis());
        System.out.println(new Date().getTime());

        if(res>=94608000000L){
            System.out.println("相差三年"+fromDate.getTime());
        }else {
            System.out.println("不足三年"+fromDate.getTime());
        }
        System.out.println(isExceedYear(fromDate,3));*/
    }
    /*后续添加*/




    // 获得某天最大时间 2020-02-19 23:59:59
    public static Date getEndOfDay(Date date) {
        LocalDateTime localDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(date.getTime()), ZoneId.systemDefault());
        LocalDateTime endOfDay = localDateTime.with(LocalTime.MAX);
        return Date.from(endOfDay.atZone(ZoneId.systemDefault()).toInstant());
    }

    // 获得某天最小时间 2020-02-17 00:00:00
    public static Date getStartOfDay(Date date) {
        LocalDateTime localDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(date.getTime()), ZoneId.systemDefault());
        LocalDateTime startOfDay = localDateTime.with(LocalTime.MIN);
        return Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
    }
    /**
     *  计算开始时间和结束时间毫秒数
     * @param fromDate
     * @param endDate
     * @return
     */
    public static long calcMilliSecondByPeriod(Date fromDate,Date endDate){
        return endDate.getTime()-fromDate.getTime();
    }
    /**
     *  计算给定时间是否超过若干年
     * @param fromDate
     * @param year
     * @return
     */
    public static boolean isExceedYear(Date fromDate,int year){
        long res = System.currentTimeMillis() - fromDate.getTime();
        return (res>=(year*getYearMilliSeconds(fromDate)))?true:false;
    }

    /**
     * 比较两个日期的大小
     * @param DATE1
     * @param DATE2
     * @return
     */
    public static int compare_date(String DATE1, String DATE2) {

        try {
            Date dt1 = formatTimes.parse(DATE1);
            Date dt2 = formatTimes.parse(DATE2);
            if (dt1.before(dt2)) {
               // System.out.println("dt1 在dt2前");
                return 1;
            } else if (dt1.after(dt2)) {
                //System.out.println("dt1在dt2后");
                return -1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 比较两个日期的大小
     * @return
     */
    public static int compare_date(Date dt1, Date dt2) {

        try {
            if (dt1.before(dt2)) {
                // System.out.println("dt1 在dt2前");
                return 1;
            } else if (dt1.after(dt2)) {
                //System.out.println("dt1在dt2后");
                return -1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }



    public static void main1() {
        Date d1 = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd:HH-mm-ss");
        System.out.println(sdf.format(d1));

        Calendar c1 = Calendar.getInstance();
        int year = c1.get(Calendar.YEAR);
        int month = c1.get(Calendar.MONTH) + 1;
        int day = c1.get(Calendar.DAY_OF_MONTH);
        int hour = c1.get(Calendar.HOUR);
        int minute = c1.get(Calendar.MINUTE);
        int second = c1.get(Calendar.SECOND);
        System.out.println(year + "年" + month + "月" + day + "日" + hour + "时" + minute + "分" + second + "秒");

        int hourOfDay = c1.get(Calendar.HOUR_OF_DAY);
        System.out.println("一天的第" + hourOfDay + "小时");

        int dayOfWeek = c1.get(Calendar.DAY_OF_WEEK);
        System.out.println("一周的第" + dayOfWeek + "天");

        int dayOfMonth = c1.get(Calendar.DAY_OF_MONTH);
        System.out.println("一月的第" + dayOfMonth + "天");

        int dayOfYear = c1.get(Calendar.DAY_OF_YEAR);
        System.out.println("一年的第" + dayOfYear + "天");

        int weekOfYear = c1.get(Calendar.WEEK_OF_YEAR);
        System.out.println("一年的第" + weekOfYear + "周");

        int weeksInWeekYear = c1.getWeeksInWeekYear();
        System.out.println("一年有" + weeksInWeekYear + "周");

        Date time = c1.getTime();
        System.out.println("Date:" + time);

        TimeZone timeZone = c1.getTimeZone();
        System.out.println("时区：" + timeZone);

        long timeInMillis = c1.getTimeInMillis();
        System.out.println(timeInMillis);


        int weekYear = c1.getWeekYear();
        System.out.println("今年是：" + weekYear);

    }

    /**
     *  0 是上午 ，1 是下午
     */
    public static void amOrpm() {
        Calendar cd = Calendar.getInstance();
       // cd.setTime(new Date());
        int i = cd.get(Calendar.AM_PM);
        String result = (i==0)?"上午":"下午";
        System.out.println(result);
    }


    /**
     *  获取一年的毫秒数
     * @param date
     * @return
     */
    public static long getYearMilliSeconds(Date date){
        boolean leapYEAR = isLeapYEAR(date);
        if(leapYEAR){
            return ONE_LEAP_YEAR;
        }else{
            return ONE_COMMON_YEAR;
        }
    }

    /*--------------------------日期加减------------------------------------------------------*/
    public static Date addHour(Date date, int ihour) {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        cd.add(Calendar.HOUR_OF_DAY, ihour);
        return cd.getTime();
    }
    /**
     * 在输入日期上增加（+）或减去（-）天数
     *
     * @param date
     *      输入日期
     * @param iday
     *      要增加或减少的天数
     */
    public static Date addDay(Date date, int iday) {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        cd.add(Calendar.DAY_OF_MONTH, iday);
        return cd.getTime();
    }

    /**
     * 在输入日期上增加（+）或减去（-）月份
     *
     * @param date
     *      输入日期
     * @param imonth
     *      要增加或减少的月分数
     */
    public static Date addMonth(Date date, int imonth) {
        Calendar cd = Calendar.getInstance();

        cd.setTime(date);

        cd.add(Calendar.MONTH, imonth);

        return cd.getTime();
    }

    /**
     * 在输入日期上增加（+）或减去（-）年份
     *
     * @param date
     *      输入日期
     * @param iyear
     *      要增加或减少的年数
     */
    public static Date addYear(Date date, int iyear) {
        Calendar cd = Calendar.getInstance();

        cd.setTime(date);

        cd.add(Calendar.YEAR, iyear);

        return cd.getTime();
    }

    /**
     * 获取当前月第一天
     * @return
     */
    public static String getCurrMonthFirstDay() {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
        String firstDay = formatDay.format(c.getTime());
        return firstDay;
    }
    /**
     * 获取当前月最后一天
     * @return
     */
    public static String getCurrMonthLastDay() {
        Calendar ca = Calendar.getInstance();
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        String lastDay = formatDay.format(ca.getTime());
        return lastDay;
    }

    /**
     * 获取当前日期
     * @return
     */
    public static String getCurrNowDay() {
        Date dateTime = new Date();
        String nowDay = formatDay.format(dateTime);
        return nowDay;
    }


    /**
     * 获取当前时间到毫秒
     * @return
     */
    public static String getCurrTimeMsec(){
        Date dateTime = new Date();
        String nowTime = formatTimeS.format(dateTime);
        return nowTime;
    }

    /**
     * 获取当前时间到秒
     * @return 2018-11-23 16:47:23
     */
    public static String getCurrTimesec(){
        Date dateTime = new Date();
        String nowTime = formatTimes.format(dateTime);
        return nowTime;
    }

    /**
     * 获取日期的DAY值
     * @param date
     *      输入日期
     * @return
     *
     */
    public static int getDayOfDate(Date date) {
        int d = 0;
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        d = cd.get(Calendar.DAY_OF_MONTH);
        return d;
    }

    /**
     * 获取日期的MONTH值
     * @param date
     *      输入日期
     * @return
     *
     */
    public static int getMonthOfDate(Date date) {
        int m = 0;
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        m = cd.get(Calendar.MONTH) + 1;
        return m;
    }

    /**
     * 获取日期的YEAR值
     * @param date
     *      输入日期
     * @return
     *
     */
    public static int getYearOfDate(Date date) {
        int y = 0;
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        y = cd.get(Calendar.YEAR);
        return y;
    }

    /**
     * 获取星期几
     * @param date
     *      输入日期
     * @return
     *
     */
    public static int getWeekOfDate(Date date) {
        int wd = 0;
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        wd = cd.get(Calendar.DAY_OF_WEEK) - 1;
        return wd;
    }



    /**
     * 判断是否是闰年
     *
     *
     * @param date
     *      输入日期
     * @return 是true 否false
     *
     */
    public static boolean isLeapYEAR(Date date) {

        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        int year = cd.get(Calendar.YEAR);

        if (year % 4 == 0 && year % 100 != 0 | year % 400 == 0) {
            return true;
        } else {
            return false;
        }
    }


    /*-------------------------------相差多少天、月、日---------------------------------------------------------*/

    /**
     *  计算两个日期相差多少天小时分钟等
     * @param endDate
     * @param nowDate
     * @return
     */
    public static String getDateDiff(Date nowDate,Date endDate) {

        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - nowDate.getTime();
        // 计算差多少天
        long day = diff / nd;
        // 计算差多少小时
        long hour = diff % nd / nh;
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        // 计算差多少秒//输出结果
        // long sec = diff % nd % nh % nm / ns;
        return day + "天" + hour + "小时" + min + "分钟";
    }

    /**
     *  计算两个日期相差小时
     * @param endDate
     * @param nowDate
     * @return
     */
    public static long getHourByMinusDate(Date nowDate,Date endDate) {
        long fd=nowDate.getTime();
        long td=endDate.getTime();
        return (td-fd)/(60L * 60L * 1000L);
    }


    /**
     * 计算 fromDate 到 toDate 相差多少年
     *
     * @param fromDate
     * @param toDate
     * @return 年数
     *
     */
    public static int getYearByMinusDate(Date fromDate, Date toDate) {
        Calendar df=Calendar.getInstance();
        df.setTime(fromDate);

        Calendar dt=Calendar.getInstance();
        dt.setTime(toDate);

        return dt.get(Calendar.YEAR)-df.get(Calendar.YEAR);
    }

    /**
     * 计算 fromDate 到 toDate 相差多少天
     * @param fromDate
     * @param toDate
     * @return 天数
     *
     */
    public static long getDayByMinusDate(Object fromDate, Object toDate) {

        Date f=CalendarUtils.chgObject(fromDate);

        Date t=CalendarUtils.chgObject(toDate);

        long fd=f.getTime();
        long td=t.getTime();

        return (td-fd)/(24L * 60L * 60L * 1000L);
    }


    /**
     * 计算 fromDate 到 toDate 相差多少周
     * @param fromDate
     * @param toDate
     * @return 周数
     *
     */
    public static long getWeekByMinusDate(Object fromDate, Object toDate) {
        Date f=CalendarUtils.chgObject(fromDate);
        Date t=CalendarUtils.chgObject(toDate);
        long fd=f.getTime();
        long td=t.getTime();
        return (td-fd)/(7L*24L * 60L * 60L * 1000L);
    }


    /**
     * 计算 fromDate 到 toDate 相差多少个月
     *
     * @param fromDate
     * @param toDate
     * @return 月数
     *
     */
    public static int getMonthByMinusDate(Date fromDate, Date toDate) {
        Calendar df=Calendar.getInstance();
        df.setTime(fromDate);

        Calendar dt=Calendar.getInstance();
        dt.setTime(toDate);

        return dt.get(Calendar.YEAR)*12+dt.get(Calendar.MONTH)-
                (df.get(Calendar.YEAR)*12+df.get(Calendar.MONTH));
    }

    /**
     * 获取当前时间的前后几天
     *
     */
    public static String getNowTimeAndPlus(int day){
        Date date=new Date();//取时间
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE,day);//把日期往前减少一天，若想把日期向后推一天则将负数改为正数
        date=calendar.getTime();
        String dateString = formatDay.format(date);

        return dateString;
    }



    /**
     * 计算年龄
     *
     * @param birthday
     *      生日日期
     * @param calcDate
     *      要计算的日期点
     * @return
     *
     */
    public static int calcAge(Date birthday, Date calcDate) {

        int cYear=CalendarUtils.getYearOfDate(calcDate);
        int cMonth=CalendarUtils.getMonthOfDate(calcDate);
        int cDay=CalendarUtils.getDayOfDate(calcDate);
        int bYear=CalendarUtils.getYearOfDate(birthday);
        int bMonth=CalendarUtils.getMonthOfDate(birthday);
        int bDay=CalendarUtils.getDayOfDate(birthday);

        if(cMonth>bMonth||(cMonth==bMonth&&cDay>bDay)){
            return cYear-bYear;
        }else{
            return cYear-1-bYear;
        }
    }

    /**
     * 从身份证中获取出生日期
     *
     * @param idno
     *      身份证号码
     * @return
     *
     */
    public static String getBirthDayFromIDCard(String idno) {
        Calendar cd = Calendar.getInstance();
        if (idno.length() == 15) {
            cd.set(Calendar.YEAR, Integer.valueOf("19" + idno.substring(6, 8))
                    .intValue());
            cd.set(Calendar.MONTH, Integer.valueOf(idno.substring(8, 10))
                    .intValue() - 1);
            cd.set(Calendar.DAY_OF_MONTH,
                    Integer.valueOf(idno.substring(10, 12)).intValue());
        } else if (idno.length() == 18) {
            cd.set(Calendar.YEAR, Integer.valueOf(idno.substring(6, 10))
                    .intValue());
            cd.set(Calendar.MONTH, Integer.valueOf(idno.substring(10, 12))
                    .intValue() - 1);
            cd.set(Calendar.DAY_OF_MONTH,
                    Integer.valueOf(idno.substring(12, 14)).intValue());
        }
        return CalendarUtils.dateToString(cd.getTime());
    }

    /**
     * 从身份证中获取出生日期
     *
     * @param idno
     *      身份证号码
     * @return
     *
     */
    public static Date getBirthDayDateFromIDCard(String idno) {
        Calendar cd = Calendar.getInstance();
        if (idno.length() == 15) {
            cd.set(Calendar.YEAR, Integer.valueOf("19" + idno.substring(6, 8))
                    .intValue());
            cd.set(Calendar.MONTH, Integer.valueOf(idno.substring(8, 10))
                    .intValue() - 1);
            cd.set(Calendar.DAY_OF_MONTH,
                    Integer.valueOf(idno.substring(10, 12)).intValue());
        } else if (idno.length() == 18) {
            cd.set(Calendar.YEAR, Integer.valueOf(idno.substring(6, 10))
                    .intValue());
            cd.set(Calendar.MONTH, Integer.valueOf(idno.substring(10, 12))
                    .intValue() - 1);
            cd.set(Calendar.DAY_OF_MONTH,
                    Integer.valueOf(idno.substring(12, 14)).intValue());
        }
        return cd.getTime();
    }


    /**
     * 将日期格式日期转换为字符串格式
     *
     *
     * @param date
     * @return
     *
     */
    public static String dateToString(Date date) {
        String datestr = null;
        SimpleDateFormat df = new SimpleDateFormat(CalendarUtils.formatDayStr);
        datestr = df.format(date);
        return datestr;
    }

    /**
     * 将日期格式日期转换为字符串格式 自定義格式
     *
     * @param date
     * @param dateformat
     * @return
     */
    public static String dateToString(Date date, String dateformat) {
        String datestr = null;
        SimpleDateFormat df = new SimpleDateFormat(dateformat);
        datestr = df.format(date);
        return datestr;
    }

    /**
     * 將OBJECT類型轉換為Date
     * @param date
     * @return
     */
    public static Date chgObject(Object date){

        if(date!=null&&date instanceof Date){
            return (Date)date;
        }

        if(date!=null&&date instanceof String){
            return CalendarUtils.stringToDate((String)date);
        }

        return null;

    }

    /**
     * 将字符串日期转换为日期格式
     *
     *
     * @param datestr
     * @return
     *
     */
    public static Date stringToDate(String datestr) {

        if(datestr ==null ||datestr.equals("")){
            return null;
        }
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat(CalendarUtils.formatDayStr);
        try {
            date = df.parse(datestr);
        } catch (ParseException e) {
            date=CalendarUtils.stringToDate(datestr,"yyyyMMdd");
        }
        return date;
    }

    /**
     * 将字符串日期转换为日期格式
     * 自定義格式
     *
     * @param datestr
     * @return
     *
     */
    public static Date stringToDate(String datestr, String dateformat) {
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat(dateformat);
        try {
            date = df.parse(datestr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}

