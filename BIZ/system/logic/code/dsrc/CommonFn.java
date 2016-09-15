import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import com.justep.common.ShortUUID;
import com.justep.system.opm.OrgUtils;
import com.justep.system.util.CommonUtils;

public class CommonFn {
	public static String encryptPassword(String password){
		return OrgUtils.encryptPassword(password);
	}

	public static InputStream getInputStreamByFile(String path){
		return CommonUtils.getInputStreamByFile(path);
	}
	
	public static Object iff(Boolean condition, Object trueResult, Object falseResult){
		if (condition){
			return trueResult;
		}else{
			return falseResult;
		}
	}
	
	public static String guid() {
		return UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
	}
	
	public static String shortGuid(){
		return ShortUUID.generate();
	}

	public static List<?> list(Object... objs) {
		return CommonUtils.list(objs);
	}

	//类型转换
	public static String toString1(Object o) {
		return CommonUtils.toString(o);
	}

	public static Integer toInteger(Object o) {
		return (o == null) ? null : CommonUtils.toInteger(o);
	}
	
	public static Float toFloat(Object o) {
		return CommonUtils.toFloat(o);
	}

	public static BigDecimal toDecimal(Object o) {
		return CommonUtils.toDecimal(o);
	}

	public static java.sql.Date toDate(Object o) {
		return CommonUtils.toDate(o);
	}

	public static java.sql.Timestamp toDateTime(Object o) {
		return CommonUtils.toDateTime(o);
	}

	public static java.sql.Time toTime(Object o) {
		return CommonUtils.toTime(o);
	}

	public static long dateToMillisecond(java.util.Date d) {
		return CommonUtils.dateToMillisecond(d);
	}
	
	public static long dateDiff(String datePart, java.util.Date startDate, java.util.Date endDate) {
		return CommonUtils.dateDiff(datePart, startDate, endDate);
	}
	
	public static String toChineseNumber(Number num, boolean isCapital) {
		return CommonUtils.toChineseNumber(num, isCapital);
	}

	public static String toChineseMoney(Number num) {
		return CommonUtils.toChineseMoney(num);
	}

	//数值操作函数
	public static int ceil(Number num) {
		return CommonUtils.ceil(num);
	}

	public static int floor(Number num) {
		return CommonUtils.floor(num);
	}

	public static Number remainder(Number n1, Number n2) {
		return CommonUtils.remainder(n1, n2);
	}

	public static int round(Number num) {
		return CommonUtils.round(num);
	}

	public static Number abs(Number num) {
		return CommonUtils.abs(num);
	}

	public static Number sqrt(Number num) {
		return CommonUtils.sqrt(num);
	}

	public static Number power(Number num, Number n) {
		return CommonUtils.power(num, n);
	}

	//字符串操作函数
	public static String concat(String... strs) {
		return CommonUtils.concat(strs);
	}

	public static String upper(String str) {
		return CommonUtils.upper(str);
	}

	public static String lower(String str) {
		return CommonUtils.lower(str);
	}

	public static boolean startsWith(String str, String prefix) {
		return CommonUtils.startsWith(str, prefix);
	}

	public static boolean endsWith(String str, String suffix) {
		return CommonUtils.endsWith(str, suffix);
	}

	public static String trim(String str) {
		return CommonUtils.trim(str);
	}

	public static String ltrim(String str) {
		return CommonUtils.ltrim(str);
	}

	public static String rtrim(String str) {
		return CommonUtils.rtrim(str);
	}

	public static int stringLength(String str) {
		return CommonUtils.stringLength(str);
	}

	public static String replaceFirst(String srcString, String regex, String replacement) {
		return CommonUtils.replaceFirst(srcString, regex, replacement);
	}

	public static String replaceAll(String srcString, String regex, String replacement) {
		return CommonUtils.replaceAll(srcString, regex, replacement);
	}

	public static int stringPosition(String srcString, String dst) {
		return CommonUtils.stringPosition(srcString, dst);
	}

	public static String subString(String str, int begin, int end) {
		return CommonUtils.subString(str, begin, end);
	}

	public static String format(String format, Object... objs) {
		return CommonUtils.format(format, objs);
	}

	public static String decimalFormat(Number value, String format) {
		return CommonUtils.decimalFormat(value, format);
	}
	
	public static String dateFormat(java.util.Date value, String format) {
		return CommonUtils.dateFormat(value, format);
	}

	//日期操作函数
	public static Timestamp currentDateTime() {
		return CommonUtils.getCurrentDateTime();
	}

	public static java.sql.Date currentDate() {
		return CommonUtils.getCurrentDate();
	}

	public static Time currentTime() {
		return CommonUtils.getCurrentTime();
	}

	public static int yearOf(java.util.Date dt) {
		return CommonUtils.getYear(dt);

	}

	public static int monthOf(java.util.Date dt) {
		return CommonUtils.getMonth(dt);

	}

	public static int dayOf(java.util.Date dt) {
		return CommonUtils.getDay(dt);
	}

	public static int hourOf(java.util.Date dt) {
		return CommonUtils.getHour(dt);
	}

	public static int minuteOf(java.util.Date dt) {
		return CommonUtils.getMinute(dt);
	}

	public static int secondOf(java.util.Date dt) {
		return CommonUtils.getSecond(dt);
	}

	public static java.sql.Date firstDateOfYear(java.util.Date dt) {
		return CommonUtils.getFirstDateOfYear(dt);
	}

	public static java.sql.Date firstDateOfMonth(java.util.Date dt) {
		return CommonUtils.getFirstDateOfMonth(dt);
	}

	public static java.sql.Date firstDateOfWeek(java.util.Date dt) {
		return CommonUtils.getFirstDateOfWeek(dt);
	}

	public static java.sql.Date lastDateOfYear(java.util.Date dt) {
		return CommonUtils.getLastDateOfYear(dt);
	}

	public static java.sql.Date lastDateOfMonth(java.util.Date dt) {
		return CommonUtils.getLastDateOfMonth(dt);
	}

	public static java.sql.Date lastDateOfWeek(java.util.Date dt) {
		return CommonUtils.getLastDateOfWeek(dt);
	}

	public static int dayOfWeek(java.util.Date dt) {
		return CommonUtils.getDayOfWeek(dt);
	}


	public static java.util.Date addMonths(java.util.Date dt, int num) {
		return CommonUtils.addMonths(dt, num);
	}
	public static java.util.Date addDays(java.util.Date dt, int num) {
		return CommonUtils.addDays(dt, num);
	}
	
	public static java.util.Date addHours(java.util.Date dt, int num) {
		return CommonUtils.addHours(dt, num);
	}
	
	//路径操作
	public static String extOfFile(String path) {
		return CommonUtils.getExtOfFile(path);
	}

	public static String pathOfFile(String path) {
		return CommonUtils.getPathOfFile(path);
	}

	public static String nameOfFile(String path) {
		return CommonUtils.getNameOfFile(path);
	}

	public static String nameNoExtOfFile(String path) {
		return CommonUtils.getNameNoExtOfFile(path);
	}

}
