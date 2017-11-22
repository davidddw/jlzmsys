package org.cloud.ssm.util;

import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.Calendar;
import java.util.Locale;

public class DateTimeUtil {

	/**
	 * 解析2017-10-20 星期三格式的字符串
	 * @param date	年-月-日 星期格式的字符串
	 * @return		年-月-日
	 */
	public static String parseDateAndWeek(String date) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd EE").withLocale(Locale.CHINESE);
		DateTimeFormatter targetFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		return LocalDate.parse(date, formatter).format(targetFormatter);
	}
	
	public static String getFirstDay(String date) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM");
		LocalDate localDate = LocalDate.parse(date, formatter);
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, localDate.getYear());
		calendar.set(Calendar.MONTH, localDate.getMonthValue());
		System.out.println(calendar.getActualMaximum(Calendar.DATE));
		return null;
	}
	
	public static void main(String[] args) {
		getFirstDay("2020/01");
	}

}
