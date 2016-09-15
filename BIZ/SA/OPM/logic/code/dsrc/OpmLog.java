import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import org.dom4j.Document;
import org.dom4j.Element;

import com.justep.model.Action;
import com.justep.model.Activity;
import com.justep.model.Config;
import com.justep.model.ModelUtils;
import com.justep.system.context.ActionContext;
import com.justep.system.context.ContextHelper;
import com.justep.system.log.LogUtils;
import com.justep.system.transform.ResponseTransform;

public class OpmLog {

	public static final String OPERATION_RELATION = "sESField01";
	public static final String CHANGE_CONCEPT_RELATION = "sESField02";
	public static final String CHANGE_ID_RELATION = "sESField03";
	public static final String CHANGE_STATE_RELATION = "sESField04";
	public static final String CHANGE_VALUES_RELATION = "sETField31";
	public static final String CHANGE_VALUES_TRANS_RELATION = "sETField32";

	private static boolean getLogEnabled() {
		Config config = (Config) ModelUtils.getModelObjectByFullName("/SA/OPM/log/opm.api.log.enabled", Config.TYPE);
		if (config != null) {
			return ("true".equalsIgnoreCase(config.getValue()));
		} 
		return false;
	}
	
	public static void log(String operation, String description, Document changeValues) {
		if (!getLogEnabled()) {
			return;
		}
		
		ActionContext actionContext = null;
		Stack<ActionContext> actionStack = ContextHelper.getRequestContext().getActionContextStack();
		if (actionStack.size() > 1) {
			actionContext = actionStack.get(actionStack.size() - 2);
		} else {
			actionContext = ContextHelper.getActionContext();
		}
		com.justep.model.Process process = actionContext.getProcess();
		Activity activity = actionContext.getActivity();
		Action action = actionContext.getAction();
		String parameters = parametersToString(actionContext.getParameters());	
		String result = objectToString(actionContext.getActionResult(), "返回值序列化时出错");	
		String status = "成功";
		String ip = ContextHelper.getLoginIP();
		
		
		Map<String, Object> exts = new HashMap<String, Object>();
		exts.put(OPERATION_RELATION, operation);
		if (changeValues != null) {
			String conceptName = getConceptName(changeValues);
			String rowID = getRowID(changeValues);
			String rowState = getRowState(changeValues);
			exts.put(CHANGE_CONCEPT_RELATION, conceptName);
			exts.put(CHANGE_ID_RELATION, rowID);
			exts.put(CHANGE_STATE_RELATION, rowState);
			exts.put(CHANGE_VALUES_RELATION, changeValues.getRootElement().asXML());
			exts.put(CHANGE_VALUES_TRANS_RELATION, transChangeValues(changeValues));
		}
		LogUtils.log(process, activity, action, parameters, result, "组织权限变更日志", operation + ": " + description, status, ip, exts);
	}
	
	private static String parametersToString(Map<String, Object> params){
		StringBuffer result = new StringBuffer();
		for (String key : params.keySet()){
			result.append("参数名称: ").append(key).append("\n");
			String item = objectToString(params.get(key), "参数" + key + "序列化时出错");
			result.append("参数值: ").append(item).append("\n");
		}
		
		return result.toString();
	}
	
	private static String objectToString(Object o, String errorTip){
		if (o == null){
			return "";
		}else{
			try {
				//一定返回的是xml
				Document result = (Document)ResponseTransform.transform(o, null);
				Element data = result.getRootElement();
				for (Object item : data.elements()){
					//有且只有一个子节点
					return ((Element)item).asXML();
				}
				
				return "";
			} catch (Exception e) {
				return errorTip + ": " + ((e!=null) ? e.getMessage() : "");
			}
		}
	}
	
	private static String transChangeValues(Document changeValues) {
		Element tableE = changeValues.getRootElement();
		Element rowE = tableE.element("row");
		@SuppressWarnings("unchecked")
		List<Element> fields = rowE.elements();
		
		StringBuffer result = new StringBuffer();
		result.append("数据本体: " + tableE.attributeValue("label") + "[" + tableE.attributeValue("name") + "]\n");
		result.append("数据标识: " + rowE.attributeValue("id") + "[" + transState(rowE.attributeValue("state")) + "]\n");
		for (Element fieldE : fields) {
			result.append("    字段: " + fieldE.attributeValue("label") + "[" + fieldE.attributeValue("name") + "]\n");
			if (!"new".equalsIgnoreCase(rowE.attributeValue("state"))) {
				result.append("        旧值: " + fieldE.attributeValue("oldValue") + "\n");
			}
			result.append("        新值: " + fieldE.attributeValue("newValue") + "\n");
		}
		return result.toString();
	}
	
	private static String transState(String state) {   
		if ("new".equalsIgnoreCase(state)) {
			return "新增";
		} else if ("edit".equalsIgnoreCase(state)) {
			return "编辑";
		} else if ("delete".equalsIgnoreCase(state)) {
			return "删除";
		}
		return "";
	}
	
	private static String getConceptName(Document changeValues) {
		Element tableE = changeValues.getRootElement();
		return tableE.attributeValue("name");
	}
	
	private static String getRowID(Document changeValues) {
		Element tableE = changeValues.getRootElement();
		Element rowE = tableE.element("row");
		return rowE.attributeValue("id");
	}
	
	private static String getRowState(Document changeValues) {
		Element tableE = changeValues.getRootElement();
		Element rowE = tableE.element("row");
		return rowE.attributeValue("state");
	}
	
}