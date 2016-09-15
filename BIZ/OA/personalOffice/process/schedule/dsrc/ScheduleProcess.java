import java.sql.Date;
import java.util.Iterator;
import com.justep.system.util.*;
import com.justep.system.context.*;
import com.justep.system.data.*;

public class ScheduleProcess {

	public static void scheduleProcessBeforeSaveOA_ScheduleAction()  {
		Table table = (Table)ContextHelper.getActionContext().getParameter("table");
	    Row row;    		
	    Iterator<Row> rows = table.iterator(com.justep.system.data.ModifyState.NEW );
	    while (rows.hasNext()){
	    	row = rows.next();
	    	if(row.getValue("fRepeatCount") != null){
				calcUpToDate(row);
	    	}
	    }
	    rows = table.iterator(com.justep.system.data.ModifyState.EDIT );
	    while (rows.hasNext()){
	    	row = rows.next();
	    	if(row.getValue("fRepeatCount") != null){
				calcUpToDate(row);
	    	}
	    }
	}
/**
 * 根据重复频率计算截止日期
 * 如果选择了周重复，要判断开始日期是否在选择的星期，不在不能保存
 * 如果设置了重复次数，要生成截止日期
 * @param row
 * @throws Exception 
 */
	
	private static void calcUpToDate(Row row)  {
	    Integer repeatCount = row.getInteger("fRepeatCount"); //重复次数
	    Date upToDate = null;//截止日期
	    
	    if(repeatCount != null){
		    String repeat = row.getString("fRepeat");
		    Integer frequency = row.getInteger("fRepeatFrequency");//重复频率
		    String startTime = row.getDateTime("fStartTime").toString(); //开始时间
		    Date startDate = CommonUtils.toDate(startTime.substring(0,10)); 
		    String endTime = row.getDateTime("fEndTime").toString(); //结束时间
		    Date endDate = CommonUtils.toDate(endTime.substring(0,10)); 
	    	//年月日：结束日期 + (重复次数-1)*重复频率 (年月日)
	    	//周：结束日期 + 重复次数*重复频率 (周) – 1天
	    	if("day".equals(repeat)){
	    		upToDate = (Date) CommonUtils.addDays(endDate,(int) (repeatCount-1)*frequency);
	    	}else if("month".equals(repeat)){
	    		upToDate = (Date) CommonUtils.addMonths(endDate,(int) (repeatCount-1)*frequency);
	    	}else if("year".equals(repeat)){
	    		upToDate = (Date) CommonUtils.addMonths(endDate,(int) (repeatCount-1)*frequency*12);
	    	}else if("week".equals(repeat)){
	    		//获得是星期几,星期五是 6,星期日是 1
	    		int iStartDateWeekday = CommonUtils.getDayOfWeek(startDate);
	    		String sStartDateWeekday = iStartDateWeekday + "";
	    		String sWeekRepeat = row.getString("fWeekRepeat");
	    		int iStartweekdayIndex = sWeekRepeat.indexOf(sStartDateWeekday);
	    		if(iStartweekdayIndex < 0){
	    			throw new RuntimeException("周重复的开始日期必须在设置的范围内");
	    		}else if(iStartweekdayIndex == 0){
	    			int iLastWeekday = Integer.parseInt(sWeekRepeat.substring(sWeekRepeat.length()-1,sWeekRepeat.length()));
	    			int iDelta = iLastWeekday - iStartDateWeekday;
	    			iDelta = iDelta < 0 ? iDelta + 7 : iDelta;
	    			upToDate = (Date) CommonUtils.addDays(endDate, iDelta + (repeatCount - 1) * 7 * frequency);
		    	}else{
	    			int iPrevWeekday = Integer.parseInt(sWeekRepeat.substring(iStartweekdayIndex - 2, iStartweekdayIndex - 1));
	    			int iDelta = iStartDateWeekday - iPrevWeekday;
	    			iDelta = iDelta < 0 ? iDelta + 7 : iDelta;
	    			upToDate = (Date) CommonUtils.addDays(endDate, 7 - iDelta + (repeatCount - 1) * 7 * frequency);
		    	}
	    	}
			row.setDate("fUpToDate", upToDate);
	    }        
	}
}