import java.util.HashMap;
import java.util.Map;

import com.justep.system.process.*;
import com.justep.system.data.KSQL;
import com.justep.system.data.Table;

public class DynamicFlow {
	private static String URL_Relation = "sESField01";
	
	
	private static void updateFlowUrl(String flowID, String url) {
		String ksql = "update SA_Task t set t.sCURL = :url, t.sEURL = :url where t.sFlowID = :flowID";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("flowID", flowID);
		params.put("url", url);
		KSQL.executeUpdate(ksql, params, "/system/data", null);
	}
	
	private static String getUrlByFlowID(String flowID) {
		String ksql = "select t." + URL_Relation + " from SA_Task t where t = :flowID";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("flowID", flowID);
		Table t = KSQL.select(ksql, params, "/system/data", null);
		return t.iterator().next().getString(URL_Relation);
	}
	

	public static void dynamicFlowListener() {
		// 获取流程ID
		String flowID = ProcessUtils.getPI().getId();
		// 获取页面
		String url = getUrlByFlowID(flowID);
		// 更新任务的URL
		updateFlowUrl(flowID, url); 
	}
}