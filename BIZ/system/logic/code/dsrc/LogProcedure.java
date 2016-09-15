import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.QName;

import com.justep.message.CommonMessages;
import com.justep.model.Action;
import com.justep.model.Activity;
import com.justep.model.Process;
import com.justep.model.exception.ModelException;
import com.justep.system.context.ActionContext;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.ColumnTypes;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;
import com.justep.system.log.LogUtils;
import com.justep.util.Utils;


public class LogProcedure {
	private static final Logger logger = Logger.getLogger(LogProcedure.class);
	public static void enableLogSetting(){
		LogUtils.refresh();
	}
	
	public static void log(String actionName, String parameters, String result, String typeName, String description){
		ActionContext context = ContextHelper.getActionContext(); 
		Process process = context.getProcess();
		Activity activity = context.getActivity();
		Action action = activity.getAction(actionName);
		/*
		if (Utils.isEmptyString(typeName)){
			typeName = activity.getLabel(ContextHelper.getOperator().getLanguage());
			if (Utils.isEmptyString(typeName)){
				typeName = activity.getName();
			}
			typeName = "操作日志";
		}
		*/
		
		long cur = System.currentTimeMillis();
		LogUtils.log(process, activity, action, parameters, result, typeName, description, "成功", ContextHelper.getLoginIP(), new HashMap<String, Object>());
		if (logger.isDebugEnabled()){
			System.out.println("[log sql]: " + (System.currentTimeMillis() - cur));
		}
	}
	
	@SuppressWarnings("unchecked")
	public static Table getActions(Document processes) {
		Utils.check(Utils.isNotNull(processes), CommonMessages.class, CommonMessages.PARAM_NULL1, "processes");
		Table table = TableUtils.createTable(null);
		table.addColumn("action", ColumnTypes.STRING);
		table.addColumn("name", ColumnTypes.STRING);
		
		Set<String> usedActions = new HashSet<String>();
		
		List<Element> items = processes.selectNodes("//item");
		for (Element item : items){
			String process = item.attributeValue(new QName("process"));
			String activity = item.attributeValue(new QName("activity"));
			if (Utils.isNotEmptyString(process) && Utils.isNotEmptyString(activity)){
				try{
					Map<String, Action> actions = com.justep.model.ModelUtils.getProcess(process).getActivity(activity).getActions();
					for (Action action : actions.values()) {
						if (action.logEnabled()){
							String id = action.getName();
							if (!usedActions.contains(id)){
								usedActions.add(id);
								
								Row row = table.appendRow();
								String name = action.getLabel(ContextHelper.getOperator()
										.getLanguage());
								row.setString("action", id);
								row.setString("name", Utils.isEmptyString(name) ? id	: name);
							}
						}
					}
				}catch(ModelException e){
					
				}
				
			}
			
		}
		
		return table;
	}

}
