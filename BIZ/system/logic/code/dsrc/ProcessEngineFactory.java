import java.util.HashMap;
import java.util.Iterator;

import com.justep.message.SystemMessages;
import com.justep.model.Config;
import com.justep.model.Model;
import com.justep.model.ModelUtils;
import com.justep.system.context.ActionContext;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.process.ProcessConstants;
import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessEngine;
import com.justep.system.process.TaskDB;
import com.justep.system.util.BizSystemException;
import com.justep.util.Utils;


public class ProcessEngineFactory {
	private static final String TASK_FLOW = "TaskFlow"; 
	public static ProcessEngine createProcessEngine(String task, ProcessControl control){
		if (isTaskFlow(task)){
			return new TaskFlowEngine(task, control);
		}else{
			return new ProcessEngine(task, control);
		}
	}
	
	private static boolean isTaskFlow(String task){
		String process = null;
		String query = "select pi.sProcess from SA_Task pi where pi in (select t.sFlowID from SA_Task t where t='" + task + "')";
		Table table = com.justep.system.process.TaskDB.select(query, new HashMap<String, Object>(), "/system/data", null);
		Iterator<Row> it = table.iterator();
		if (it.hasNext()){
			Row r = it.next();
			process = r.getString("sProcess");
			
		}else{
			//如果是流程启动或流程启动查询
			ActionContext ac = ContextHelper.getActionContext();
			if (ProcessConstants.START_PROCESS_ACTION.equals(ac.getAction().getName())
					|| ProcessConstants.START_PROCESS_QUERY_ACTION.equals(ac.getAction().getName())){
				process = (String)ac.getParameter(ProcessConstants.PROCESS_PARAMETER);
			}else{
				throw BizSystemException.create(SystemMessages.NO_TASK1, task);
			}
		}
		
		if (Utils.isEmptyString(process)){
			throw BizSystemException.create(SystemMessages.PROCESS_AND_ACTIVITY_OF_TASK_NULL1, task);
		}
		Model m = ModelUtils.getProcess(process).getModel();
		Config config = (Config)m.getUseableConfig("com.justep.system.process.type");
		if ((config != null) && TASK_FLOW.equals(config.getValue())){
			return true;
		}else{
			return false;
		}
	}
}
