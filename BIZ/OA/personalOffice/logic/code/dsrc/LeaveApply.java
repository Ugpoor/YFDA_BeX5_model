import java.math.BigDecimal;
import java.sql.Date;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

public class LeaveApply {

	private static Table holidayTable;
	private static final String defBeginTimeAM = "08:30";
	private static final String defEndTimeAM = "12:00";
	private static final String defBeginTimePM = "13:00";
	private static final String defEndTimePM = "17:30";
	
	public static Map<String, Object> calcLeaveDays(String startTime,String endTime){
		Date startDate = CommonUtils.toDate(startTime.substring(0,10));
		Date endDate = CommonUtils.toDate(endTime.substring(0,10));
		queryHoliday(startDate, endDate);
			
		String sStartTime = startTime.substring(11,16);
		String sEndTime = endTime.substring(11,16);

		int workDays = 0, leaveTime = 0;
		long minutes = 0;
		if(startDate.equals(endDate)){//同一天
			if(isWorkDay(startDate) == 1)
				minutes = calcOneDayMinutes(sStartTime, sEndTime);
		}else{
			Date currDate = (Date) CommonUtils.addDays(startDate,1);
			while(currDate.before(endDate)){
				workDays = workDays + isWorkDay(currDate);
				currDate = (Date) CommonUtils.addDays(currDate, 1);
			}
			if(sStartTime.compareTo(sEndTime) <= 0 && isWorkDay(startDate) == 1 && isWorkDay(endDate) == 1){//超过一天
				workDays ++;
				minutes = calcOneDayMinutes(sStartTime, sEndTime);
			}else{
				if(isWorkDay(startDate) == 1)
					minutes = calcOneDayMinutesFromStart(startDate, sStartTime);
				if(isWorkDay(endDate) == 1)
					minutes = minutes + calcOneDayMinutesFromEnd(endDate, sEndTime);
			}
		}
		BigDecimal dHours = new BigDecimal(minutes / 60.0).setScale(0, BigDecimal.ROUND_HALF_UP);
		leaveTime = workDays;
		if(!dHours.toString().equals("0") )
			leaveTime ++;
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("days", workDays);
		result.put("hours", dHours);
		result.put("time", leaveTime);
		return result;
	}
	/**
	 * 查询节假日定义表
	 */
	private static void queryHoliday(Date startDate, Date endDate) {
		String ksql = "select OA_WM_Holiday.* from OA_WM_Holiday OA_WM_Holiday where OA_WM_Holiday.fDate between stringToDateTime('"+ startDate + "') and stringToDateTime('" + endDate+"')";
		holidayTable = KSQL.select(ksql, null, "/OA/personalOffice/data", null);
		holidayTable.getMetaData().setKeyColumn("fDate");
	}

	/**
	 * 给定日期计算是否工作日
	 */
	private static int isWorkDay(Date calcDate) {
		//2014-05-07  在oa_wm_holiday表中查找,如果有获取fState，判断是否=2（上班），是则天数加1
		//2014-05-08  在oa_wm_holiday表中查找,如果没有判断是否六日，不是六日，天数加1
	    Collection<Row> rows = holidayTable.getRows(calcDate);
	    if(rows.iterator().hasNext()){
			if (rows.iterator().next().getString("fState").equals("2"))
				return 1;
			else
				return 0;
		} else {
			int week = CommonUtils.getDayOfWeek(calcDate);
			if (week > 1 && week < 7)
				return 1;
			else
				return 0;
		}
	}
	/**
	 * 计算一天中的分钟数
	 */
	private static int calcOneDayMinutesFromStart(Date calcDate, String sStartTime) {
		if(sStartTime.compareTo(defBeginTimeAM) < 0){//上午上班之前
			return calcMinutes(defBeginTimeAM, defEndTimeAM) + calcMinutes(defBeginTimePM, defEndTimePM);
			
		}else if(sStartTime.compareTo(defBeginTimeAM) >= 0 && sStartTime.compareTo(defEndTimeAM) < 0){//上午上班时间
			return calcMinutes(sStartTime, defEndTimeAM) + calcMinutes(defBeginTimePM, defEndTimePM);
			
		}else if(sStartTime.compareTo(defEndTimeAM) >= 0 && sStartTime.compareTo(defBeginTimePM) < 0){//中午休息时间
			return calcMinutes(defBeginTimePM, defEndTimePM);
		
		}else if(sStartTime.compareTo(defBeginTimePM) >= 0 && sStartTime.compareTo(defEndTimePM) < 0){//下午上班时间
			return calcMinutes(sStartTime, defEndTimePM);
		
		}else{//下午下班之后
			return 0;
		}
	}
	
	/**
	 * 计算一天中的分钟数
	 */
	private static int calcOneDayMinutesFromEnd(Date calcDate, String sEndTime) {
		if(sEndTime.compareTo(defBeginTimeAM) < 0){//上午上班之前
			return 0;
			
		}else if(sEndTime.compareTo(defBeginTimeAM) >= 0 && sEndTime.compareTo(defEndTimeAM) < 0){//上午上班时间
			return calcMinutes(defBeginTimeAM, sEndTime);
			
		}else if(sEndTime.compareTo(defEndTimeAM) >= 0 && sEndTime.compareTo(defBeginTimePM) < 0){//中午休息时间
			return calcMinutes(defBeginTimeAM, defEndTimeAM);
		
		}else if(sEndTime.compareTo(defBeginTimePM) >= 0 && sEndTime.compareTo(defEndTimePM) < 0){//下午上班时间
			return calcMinutes(defBeginTimeAM, defEndTimeAM) + calcMinutes(defBeginTimePM, sEndTime);
		
		}else{//下午下班之后
			return calcMinutes(defBeginTimeAM, defEndTimeAM) + calcMinutes(defBeginTimePM, defEndTimePM);
		}
	}
	
	/**
	 * 计算两个时间相差的分钟数
	 */
	private static int calcMinutes(String sStartTime, String sEndTime) {
		return Integer.parseInt(sEndTime.substring(0, 2)) * 60 + Integer.parseInt(sEndTime.substring(3, 5))
				- Integer.parseInt(sStartTime.substring(0, 2)) * 60 - Integer.parseInt(sStartTime.substring(3, 5));
		
	}
	
	/**
	 * 计算一天中的分钟数
	 */
	private static int calcOneDayMinutes(String sStartTime, String sEndTime) {
		if(sEndTime.compareTo(defBeginTimePM) <= 0){//全在上午
			if(sEndTime.compareTo(defBeginTimeAM) <= 0 || sStartTime.compareTo(defEndTimeAM) >= 0){//非上班时间
				return 0;
			}else{
				if(sStartTime.compareTo(defBeginTimeAM) < 0){
					sStartTime = defBeginTimeAM;
				}
				if(sEndTime.compareTo(defEndTimeAM) > 0){
					sEndTime = defEndTimeAM;
				}
				return calcMinutes(sStartTime, sEndTime);
			}
			
		}else if(sStartTime.compareTo(defEndTimeAM) >= 0){//全在下午
			if(sEndTime.compareTo(defBeginTimePM) <= 0 || sStartTime.compareTo(defEndTimePM) >= 0){//非上班时间
				return 0;
			}else{
				if(sStartTime.compareTo(defBeginTimePM) < 0){
					sStartTime = defBeginTimePM;
				}
				if(sEndTime.compareTo(defEndTimePM) > 0){
					sEndTime = defEndTimePM;
				}
				return calcMinutes(sStartTime, sEndTime);
			}
		}else{//从上午到下午
			if(sStartTime.compareTo(defBeginTimeAM) < 0){
				sStartTime = defBeginTimeAM;
			}
			if(sEndTime.compareTo(defEndTimePM) > 0){
				sEndTime = defEndTimePM;
			}
			return calcMinutes(sStartTime, sEndTime) - calcMinutes(defEndTimeAM, defBeginTimePM);
		}
	}
	
}