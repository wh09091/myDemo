package com.wangjin.convert;

import com.wangjin.Util.StringUtil;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/3/27.
 */
public class DateConvert implements Converter<String, Date> {
    public Date convert(String s) {
        if(!StringUtil.isEmpty(s)){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                return simpleDateFormat.parse(s);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
