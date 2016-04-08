package com.batis.utils;

/**
 * String工具类
 * 
 * @author eg366
 * 
 */
public class StringUtils extends org.apache.commons.lang.StringUtils {

	/**
	 * Object对象trim为String
	 */
	public static String trimToEmpty4Obj(Object obj) {
		if (obj == null)
			return "";
		return trimToEmpty(obj.toString());
	}
}
