package com.batis.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Title: DateUtils.java
 * @Package com.gopay.card.common.util
 * @Description: TODO()
 * @author HJY
 * @date 2012-12-7 下午02:04:08
 * @version V1.0
 */

public class DateUtils {
	/** 时间格式：yyyyMMddHHmmss'. */
	public static String yyyyMMddHHmmss = "yyyyMMddHHmmss";

	/** 时间格式：yyyyMMdd'. */
	public static String yyyyMMdd = "yyyyMMdd";

	/** 时间格式：yyyy-MM-dd'. */
	public static String yyyy_MM_dd = "yyyy-MM-dd";

	/** 时间格式：yyyy-MM-dd'. */
	public static String yyyy__MM__dd = "yyyy/MM/dd";

	/** 时间格式：yyyy-MM'. */
	public static String yyyy_MM = "yyyy-MM";

	/** 时间格式：yyyy-MM-dd' 'HH:mm:ss'. */
	public static String yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd' 'HH:mm:ss";
	/** 时间格式：HH:mm */
	public static String HH_mm = "HH:mm";

	public static String formatDate(Date date, String patten) {
		if (date == null)
			return null;
		return new SimpleDateFormat(patten).format(date);
	}

	public static Date add(Date date, int field, int amount) {
		if (date == null)
			return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(field, amount);
		return c.getTime();
	}

	/**
	 * 时间字符串转对象
	 * 
	 * @param aMask
	 *            模式
	 * @param strDate
	 *            时间
	 * @return
	 */
	public static final Date convertDate(String patten, String strDate) {
		SimpleDateFormat df = null;
		Date date = null;
		df = new SimpleDateFormat(patten);
		try {
			date = df.parse(strDate);
		} catch (ParseException pe) {
			throw new RuntimeException(pe);
		}
		return date;
	}

	/**
	 * 获取上个月的今天
	 * 
	 * @return
	 */
	public static String getLastMonthDt() {
		Date dt = add(new Date(), Calendar.MONTH, -1);
		return formatDate(dt, yyyy_MM_dd);
	}

	/**
	 * 获取下个月的今天
	 * 
	 * @return
	 */
	// public static String getNextMonthDt(){
	// Date dt = add(new Date(), Calendar.MONTH, 1);
	// return formatDate(dt, yyyy_MM_dd);
	// }
	public static String getCurMonthDt() {
		return formatDate(new Date(), yyyy_MM_dd);
	}

	public static String getCurTime() {
		return formatDate(new Date(), yyyyMMddHHmmss);
	}

	/**
	 * 将Date类型参数转为
	 * 
	 * @param date
	 * @return
	 */
	public static String formatFull14StyleByDate(Date date) {
		return formatDate(date, yyyy_MM_dd_HH_mm_ss);
	}

	/**
	 * 将YYYY/MM/DD字符串格式化为Date对象
	 * 
	 * @param strDate
	 * @return
	 */
	public static Date formatFull8DateByStr(String strDate) {
		return convertDate(yyyy__MM__dd, strDate);
	}

	public static void main(String[] args) {
		System.out.println(formatFull8DateByStr("2015/06/03"));
	}

	/**
	 * 获得和现在时间的间隔日期.
	 * 
	 * @param intervalDay
	 *            正数 取当前时间的后几天 负数 取当前时间的前几天
	 */
	public static String getIntervalDay(int intervalDay, String dateFormat) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, intervalDay);
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		return sdf.format(cal.getTime());
	}

	/**
	 * 获取指定日期的前N天或后N天
	 *
	 * @param currentDate
	 *            指定日期
	 * @param intervalDay
	 *            正数 取指定日期的后N天 负数 取指定时间的前N天
	 * @return
	 */
	public static Date getDateByAddDay(Date currentDate, int intervalDay) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(currentDate);
		calendar.add(Calendar.DAY_OF_MONTH, intervalDay);
		return calendar.getTime();

	}

	/**
	 * 获取指定两日期间的间隔天数
	 * 
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static Long getDaysBetween(Date startDate, Date endDate) {
		Calendar fromCalendar = Calendar.getInstance();
		fromCalendar.setTime(startDate);
		fromCalendar.set(Calendar.HOUR_OF_DAY, 0);
		fromCalendar.set(Calendar.MINUTE, 0);
		fromCalendar.set(Calendar.SECOND, 0);
		fromCalendar.set(Calendar.MILLISECOND, 0);

		Calendar toCalendar = Calendar.getInstance();
		toCalendar.setTime(endDate);
		toCalendar.set(Calendar.HOUR_OF_DAY, 0);
		toCalendar.set(Calendar.MINUTE, 0);
		toCalendar.set(Calendar.SECOND, 0);
		toCalendar.set(Calendar.MILLISECOND, 0);

		return (toCalendar.getTime().getTime() - fromCalendar.getTime().getTime()) / (1000 * 60 * 60 * 24);
	}
}
