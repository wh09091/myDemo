package com.wangjin.Util;

/**
 * Created by Administrator on 2018/3/27.
 */
public class StringUtil {
    //判断字符串中是否为NULL、空
    public static boolean isEmpty(String inputString) {
        if (inputString == null || inputString.trim().length() == 0) {
            return true;
        } else {
            return false;
        }
    }

    //根据每页条数、总条数计算总页数
    public static int getPageNumber(int pagesize, int count) {
        int pagenumber = 0;
        if (count > 0) {
            if (count % pagesize == 0) {
                pagenumber = count / pagesize;
            } else {
                pagenumber = count / pagesize + 1;
            }
        }
        return pagenumber;
    }

}
