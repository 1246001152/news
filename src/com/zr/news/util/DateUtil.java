package com.zr.news.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public class DateUtil {
    public static String formatDate(Date date, String format){
        String result="";
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        if(date!=null){
            result=sdf.format(date);
        }
        return result;
    }


    public static Date formatString(String str,String format) {
        if(StringUtil.isEmpty(str)){
            return null;
        }
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        try {
            return sdf.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return new Date();
    }

    public static String getCurrentDateStr()throws Exception{
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
        return sdf.format(date);
    }
}
