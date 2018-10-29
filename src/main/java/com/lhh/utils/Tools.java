package com.lhh.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;

public class Tools {

	
	public static boolean notEmpty(String s) {
		return s != null && !"".equals(s) && !"null".equals(s);
	}

	/**
	 * 检测字符串是否为空(null,"","null")
	 * 
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(String s) {
		return s == null || "".equals(s) || "null".equals(s);
	}
	
	/**
	 * 判断字符串是否为空，集合是否为空，数组是否为空
	 * 
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isNotNullOrEmpty(Object obj) {
		return !isNullOrEmpty(obj);
	}

	/**
	 * 判断字符串是否为空，集合是否为空，数组是否为空
	 * 
	 * @return 为空则返回true，不否则返回false
	 */
	@SuppressWarnings("rawtypes")
	public static boolean isNullOrEmpty(Object obj) {
		if (obj == null)
			return true;

		if (obj instanceof CharSequence)
			return ((CharSequence) obj).length() == 0;

		if (obj instanceof Collection)
			return ((Collection) obj).isEmpty();

		if (obj instanceof Map)
			return ((Map) obj).isEmpty();

		if (obj instanceof Object[]) {
			Object[] object = (Object[]) obj;
			if (object.length == 0) {
				return true;
			}
			boolean empty = true;
			for (int i = 0; i < object.length; i++) {
				if (!isNullOrEmpty(object[i])) {
					empty = false;
					break;
				}
			}
			return empty;
		}
		return false;
	}

	
	@SuppressWarnings("deprecation")
	public static String excelTime(Cell cell) {
		String guarantee_time = null;
		if (DateUtil.isCellDateFormatted(cell)) {
			// 用于转化为日期格式
			Date d = cell.getDateCellValue();
			// System.err.println(d.toString());
			// DateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
			guarantee_time = formater.format(d);
		}
		return guarantee_time;
	}
	
}
