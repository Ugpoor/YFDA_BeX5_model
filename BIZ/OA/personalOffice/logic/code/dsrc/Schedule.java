import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;
import com.justep.system.util.CommonUtils;

public class Schedule {

	static Table scheTable, originalTable;
	static Row originalRow;
	
	public static Table queryOA_ScheduleMonth(String concept,String select,String from,String aggregate,String dataModel,String fnModel,String condition,List<DataPermission> range,Boolean distinct,String idColumn,String filter,Integer limit,Integer offset,String columns,String orderBy,String aggregateColumns,Map<String, Object> variables,String scheMonth,String schePerson){
		//schePerson未空，就使用当前人
		String sPersonID = ContextHelper.getPerson().getID();
		String sPubSche = "";
		if (schePerson != null && !schePerson.equals("")) {
			if(!sPersonID.equals(schePerson))
				sPubSche = " and (OA_Schedule.fOwn is null or OA_Schedule.fOwn <> 1)";
			sPersonID = schePerson;
		}
		if (scheMonth == null || scheMonth.equals("")) {
			scheMonth = CommonUtils.dateFormat(CommonUtils.getCurrentDate(),"yyyy-MM");
		}
		String scheMonthFirstDay = scheMonth + "-01";
		//不是当前人，表示正在查询同事日程，增加只显示公开日程的条件
	    HashMap<String, Object> params = new HashMap<String, Object>();
	    params.put("sPersonID", sPersonID);
	    params.put("scheMonthFirstDay", scheMonthFirstDay);
	    //查询日程表，查询月1日 >= 开始日期所在月1日    并且  （截止日期is null 或者 查询月1日<=截止日期）
	    String ksql = "select OA_Schedule.fRepeat,OA_Schedule.fStartTime,OA_Schedule.fEndTime,OA_Schedule.fRepeatFrequency,OA_Schedule.fWeekRepeat,OA_Schedule.fUpToDate,OA_Schedule.fCreatorID,OA_Schedule.fName,OA_Schedule "
	    	+ " from OA_Schedule OA_Schedule where OA_Schedule.fCreatorID = :sPersonID"
	    	+ " and stringToDate(:scheMonthFirstDay) >= stringToDate(concat(getYear(OA_Schedule.fStartTime), '-', getMonth(OA_Schedule.fStartTime), '-01'))"
	    	+ " and (OA_Schedule.fUpToDate is null or stringToDate(:scheMonthFirstDay) <= fUpToDate)" + sPubSche;
	    
	    ksql = ksql + " union select OA_Schedule.fRepeat,OA_Schedule.fStartTime,OA_Schedule.fEndTime,OA_Schedule.fRepeatFrequency,OA_Schedule.fWeekRepeat,OA_Schedule.fUpToDate,SA_Social.sPersonID,OA_Schedule.fName,OA_Schedule "
	    	+ " from OA_Schedule OA_Schedule join SA_Social SA_Social"
	    	+ " on OA_Schedule = SA_Social.sData1 and SA_Social.sValidState = '1' and SA_Social.sTypeID = 'RelativeOrg'"
	    	+ " and (SA_Social.sESField01 ='o') and SA_Social.sPersonID = :sPersonID"
	    	+ " where stringToDate(:scheMonthFirstDay) >= stringToDate(concat(getYear(OA_Schedule.fStartTime), '-', getMonth(OA_Schedule.fStartTime), '-01'))"
	    	+ " and (OA_Schedule.fUpToDate is null or stringToDate(:scheMonthFirstDay) <= fUpToDate)" + sPubSche;
	    
		originalTable = KSQL.select(ksql, params, "/OA/personalOffice/data", null);

		// 在内存中构造日程的数据集
		List<String> names = new ArrayList<String>();
		names.add("fScheDay"); names.add("fTimePeriod");	names.add("fCreatorID"); names.add("fName"); names.add("fRepeat"); names.add("fScheID"); names.add("fIsTitle");
		List<String> types = new ArrayList<String>();
		types.add("String"); types.add("String"); types.add("String"); types.add("String"); types.add("String"); types.add("String");	types.add("String");
		// 创建table，names代表列，types代表列的类型
		scheTable = TableUtils.createTable(null, names, types);
		
		String sRepeat, sStartTime, sEndTime, sWeekRepeat;
		Integer iRepeatFrequency;
		Iterator<Row> it = originalTable.iterator();
		while (it.hasNext()){
		    originalRow = it.next();
		    sRepeat = originalRow.getString("fRepeat");
		    sStartTime = originalRow.getDateTime("fStartTime").toString();
		    sEndTime = originalRow.getDateTime("fEndTime").toString();
		    iRepeatFrequency = originalRow.getInteger("fRepeatFrequency");
		    sWeekRepeat = originalRow.getString("fWeekRepeat");
		    
		    if(sRepeat.equals("day")){
		    	addDaySche(scheMonth,sStartTime,sEndTime,sRepeat,iRepeatFrequency);
		    }else if(sRepeat.equals("week")){
		    	addWeekSche(scheMonth,sStartTime,sEndTime,sRepeat,iRepeatFrequency,sWeekRepeat);
		    }else if(sRepeat.equals("year") || sRepeat.equals("month")){
		    	addYearMonthSche(scheMonth,sStartTime,sEndTime,sRepeat,iRepeatFrequency);
		    }else{
			    addNoRepearSche(scheMonth,sStartTime,sEndTime);
		    }
		}	
		return sortTable(scheMonth);
	}

/**
 * 产生重复为年、月的日程
 */
	private static void  addYearMonthSche(String sScheMonth,String sStartTime,String sEndTime,String sRepeat,int iRepeatFrequency){
		Date startDate = CommonUtils.toDate(sStartTime.substring(0,10));
        Date startDateMonthFirstDay = CommonUtils.getFirstDateOfMonth(startDate) ;
		Date scheMonthFirstDay = CommonUtils.toDate(sScheMonth + "-01");
        
        long delta = CommonUtils.dateDiff("m", startDateMonthFirstDay, scheMonthFirstDay);
        
        int iCoefficient = 1;
        if(sRepeat.equals("year")){
        	iCoefficient = 12;
        }
        if(delta % (iRepeatFrequency * iCoefficient) == 0){//本月有日程
            String sScheDay = sScheMonth + "-" + CommonUtils.format("%02d",CommonUtils.getDay(startDate));
            
	        //判断日期是否存在，不存在则取月末最后一天
            if(!CommonUtils.dateFormat(CommonUtils.toDate(sScheDay),"yyyy-MM-dd").equals(sScheDay)){
				sScheDay = CommonUtils.dateFormat(CommonUtils.getLastDateOfMonth(scheMonthFirstDay),"yyyy-MM-dd");
            }
        	addSche(sScheMonth,sScheDay,sStartTime,sEndTime);
        }else{//本月不日程
        	return;
        }
	}
/**
 * 产生重复为天的日程
 */
	private static void  addDaySche(String sScheMonth,String sStartTime,String sEndTime,String sRepeat,int iRepeatFrequency){
		Date startDate = CommonUtils.toDate(sStartTime.substring(0,10));
		Date scheMonthFirstDay = CommonUtils.toDate(sScheMonth + "-01");
		Date scheMonthLastDay = CommonUtils.getLastDateOfMonth(scheMonthFirstDay);
		 
        int delta = (int)CommonUtils.dateDiff("d", startDate, scheMonthFirstDay);
        
        int iCoefficient = 1;
        if(sRepeat.equals("week")){
        	iCoefficient = 7;
        }
        String sScheDay;
        java.util.Date scheDay;
        if(delta < 0){//日程开始时间大于查询月第一天
        	scheDay = startDate;
        }else if(delta % (iRepeatFrequency * iCoefficient) > 0){//查询月第一天没有日程，计算查询月第一个有日程的天
        	scheDay = CommonUtils.addDays(scheMonthFirstDay, iRepeatFrequency * iCoefficient - delta);
        }else{//查询月第一天有日程
        	scheDay = scheMonthFirstDay;
        }
        //为查询月中所有有日程的天产生日程
        while(!scheDay.after(scheMonthLastDay)){
        	sScheDay = CommonUtils.dateFormat(scheDay, "yyyy-MM-dd");
        	addSche(sScheMonth,sScheDay,sStartTime,sEndTime);

        	scheDay = CommonUtils.addDays(scheDay, iRepeatFrequency * iCoefficient);
        }
	}
/**
 * 产生重复为周的日程
 */
	private static void  addWeekSche(String sScheMonth,String sStartTime,String sEndTime,String sRepeat,int iRepeatFrequency,String sWeekRepeat){
		//计算查询月内第一个日程日，要大于开始日期，大于查询月首日，还要满足重复频率，否则加7天，知道找到第一个日程日
		//获得查询月首日
		Date scheMonthFirstDay = CommonUtils.toDate(sScheMonth + "-01");
    	Date scheMonthLastDay = CommonUtils.getLastDateOfMonth(scheMonthFirstDay);
		Date scheStartDate = CommonUtils.toDate(sStartTime.substring(0,10));
		//获得是星期几,星期五是 6,星期日是 1
		int iScheMonthFirstDayWeekday = CommonUtils.getDayOfWeek(scheMonthFirstDay);
        int iWeekday;
        String arrWeekday[]= sWeekRepeat.split(" ");
        String sScheDay;
        java.util.Date scheDay;
        //// 在每个空格字符处进行分解  
        for(String sWeekday : arrWeekday){  
        	iWeekday = Integer.parseInt(sWeekday);
        	//找到查询月中第一个周重复里面的星期几
        	if(iScheMonthFirstDayWeekday > iWeekday){
        		scheDay = CommonUtils.addDays(scheMonthFirstDay, 7 - iScheMonthFirstDayWeekday + iWeekday);
        	}else{
        		scheDay = CommonUtils.addDays(scheMonthFirstDay, iWeekday - iScheMonthFirstDayWeekday);
        	}
        	//找到查询月中第一个满足重复频率的星期几
            int delta = (int)Math.abs(CommonUtils.dateDiff("ww", CommonUtils.getFirstDateOfWeek(scheStartDate), CommonUtils.getFirstDateOfWeek(scheDay)));
        	if(delta % iRepeatFrequency != 0){
        		scheDay = CommonUtils.addDays(scheDay, (delta % iRepeatFrequency) * 7);
        	}
        	//在小于查询月末时，重复生成日程
            while(!scheDay.after(scheMonthLastDay)){
            	if(!scheDay.before(scheStartDate)){
                	sScheDay = CommonUtils.dateFormat(scheDay, "yyyy-MM-dd");
                	addSche(sScheMonth,sScheDay,sStartTime,sEndTime);
            	}
            	scheDay = CommonUtils.addDays(scheDay, iRepeatFrequency * 7);
            }
        }  
	}
/**
 * 产生不重复的日程
 */
	private static void  addNoRepearSche(String sScheMonth,String sStartTime,String sEndTime){
    	String sScheDay = sStartTime.substring(0,10);
		addSche(sScheMonth,sScheDay,sStartTime,sEndTime);
	}
/**
 * 产生日程
 * 计算日程时间段
 * 如果是多天的日程，产生多个日程
 */
	private static void  addSche(String sScheMonth,String sScheDay,String sStartTime,String sEndTime){
		String sTimePeriod;
		Date startDate = CommonUtils.toDate(sStartTime.substring(0,10));
		Date endDate = CommonUtils.toDate(sEndTime.substring(0,10));
		if(startDate.equals(endDate)){
			//日程时间段计算规则：如果开始时间和结束时间是同一天，则取出时间部分拼接
			sTimePeriod = sStartTime.substring(11,16) + "-" + sEndTime.substring(11,16);
			addOneDaySche(sTimePeriod, sScheDay);
		}else{
			//否则，先计算出结束时间-开始时间的天数差
			//日程日+开始时间的时间部分 + 日程日+天数差 +结束时间的时间部分
	        int delta = (int)CommonUtils.dateDiff("d", startDate, endDate);
			java.util.Date scheDay = CommonUtils.toDate(sScheDay);
	        java.util.Date newEndDate = CommonUtils.addDays(scheDay, delta);
	        String sNewEndDate = CommonUtils.dateFormat(newEndDate, "yyyy-MM-dd");
			
	        sTimePeriod = sScheDay + " " + sStartTime.substring(11,16) + "-" + sNewEndDate + " " + sEndTime.substring(11,16);

			for(int i = 0;i<delta;i++){
				addOneDaySche(sTimePeriod,sScheDay);
				scheDay = CommonUtils.addDays(scheDay, 1);
				sScheDay = CommonUtils.dateFormat(scheDay, "yyyy-MM-dd");
			}
		}
	}
/**
 * 产生某天的日程时，判断是否大于等于开始日期，且小于等于截止日期，否则不产生日程
 */
	private static void addOneDaySche(String sTimePeriod,String sScheDay){
		Date scheDay = CommonUtils.toDate(sScheDay);
		if(!scheDay.before(CommonUtils.toDate(originalRow.getDateTime("fStartTime")))
			&& (originalRow.getDate("fUpToDate") == null
			|| !scheDay.after(originalRow.getDate("fUpToDate")))){
			Row row = scheTable.appendRow();
			row.setString("fTimePeriod", sTimePeriod);
			row.setString("fScheDay", sScheDay);
			row.setString("fIsTitle", "0");
			row.setString("fCreatorID", originalRow.getString("fCreatorID"));
			row.setString("fName", originalRow.getString("fName"));
			row.setString("fRepeat", originalRow.getString("fRepeat"));
			row.setString("fScheID", originalRow.getString("OA_Schedule"));
		}
	}
/**
 * 重新生成一个排好序的table，遍历查询月的每一天，如果有记录，先生成标题记录，然后复制记录
 */
	private static Table sortTable(String sScheMonth){
		// 在内存中构造日程的数据集
		List<String> names = new ArrayList<String>();
		names.add("fScheDay"); names.add("fTimePeriod");	names.add("fCreatorID"); names.add("fName"); names.add("fRepeat"); names.add("fScheID"); names.add("fIsTitle");
		List<String> types = new ArrayList<String>();
		types.add("String"); types.add("String"); types.add("String"); types.add("String"); types.add("String"); types.add("String");	types.add("String");
		// 创建table，names代表列，types代表列的类型
		Table sortTable = TableUtils.createTable(null, names, types);
		//设置查找列
		scheTable.getMetaData().setKeyColumn("fScheDay");

		Date scheMonth = CommonUtils.toDate(sScheMonth+"-01");
		Date scheMonthFirstDay = CommonUtils.getFirstDateOfMonth(scheMonth);
		Date scheMonthLastDay = CommonUtils.getLastDateOfMonth(scheMonth);
		java.util.Date currDate = scheMonthFirstDay;
		String sCurrDate;
		//遍历查询月的每一天
		while(!currDate.after(scheMonthLastDay)){
			sCurrDate = CommonUtils.dateFormat(currDate,"yyyy-MM-dd");
		    Collection<Row> rows = scheTable.getRows(sCurrDate);
		    if(rows.iterator().hasNext()){
		    	//存在某天的日程，则先增加标题行
				Row toRow = sortTable.appendRow();
				toRow.setString("fScheDay", CommonUtils.dateFormat(currDate, "yyyy-MM-dd"));
				toRow.setString("fIsTitle", "1");
		    }
		    for (Row fromRow : rows){
		    	//复制某天的记录
				Row toRow = sortTable.appendRow();
				toRow.setString("fTimePeriod", fromRow.getString("fTimePeriod"));
				toRow.setString("fScheDay", fromRow.getString("fScheDay"));
				toRow.setString("fIsTitle", "0");
				toRow.setString("fCreatorID", fromRow.getString("fCreatorID"));
				toRow.setString("fName", fromRow.getString("fName"));
				toRow.setString("fRepeat", fromRow.getString("fRepeat"));
				toRow.setString("fScheID", fromRow.getString("fScheID"));
		    }
			currDate = CommonUtils.addDays(currDate, 1);
		}
		return sortTable;
	}
	/**
	 * 拒绝参加日程
	 * @param scheID 日程表ID
	 */
	public static void refuseSche(String scheID){
	    HashMap<String, Object> params = new HashMap<String, Object>();
	    params.put("scheID", scheID);
		String sPersonID = ContextHelper.getPerson().getID();
	    params.put("personID", sPersonID);
		String ksql = "update SA_Social s set s.sESField01='C' where s.sData1=:scheID and s.sGroupID='E' and s.sPersonID=:personID ";
		KSQL.executeUpdate(ksql, params, "/OA/personalOffice/data", null);
	}
	/**
	 * 确认参加日程
	 * @param scheID 日程表ID
	 */
	public static void confirmSche(String scheID){
	    HashMap<String, Object> params = new HashMap<String, Object>();
	    params.put("scheID", scheID);
		String sPersonID = ContextHelper.getPerson().getID();
	    params.put("personID", sPersonID);
		String ksql = "update SA_Social s set s.sESField01='O' where s.sData1=:scheID and s.sGroupID='E' and s.sPersonID=:personID ";
		KSQL.executeUpdate(ksql, params, "/OA/personalOffice/data", null);
	
	}}