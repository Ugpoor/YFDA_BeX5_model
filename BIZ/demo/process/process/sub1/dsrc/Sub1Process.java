import java.util.Iterator;

import org.dom4j.Document;

import com.justep.process.master.MasterProcessUtils;
import com.justep.system.context.ActionContext;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.process.ProcessUtils;
import com.justep.system.process.Task;


public class Sub1Process {
	public static void sub1ProcessAfterStart() {
		ActionContext ac = ContextHelper.getActionContext();
		Document result = (Document)ac.getActionResult();
		//第一个环节的待办任务
		String task = result.selectSingleNode("/items/item/task").getText();
		String piTask = getProcessTask(task);
		
		MasterProcessUtils.startMaster("/demo/process/process/master/masterProcess", piTask, ContextHelper.getPersonMember().getFID());
	}
	
	//获取流程实例任务
	private static String getProcessTask(String task){
		String query = "select t.sFlowID from SA_Task t where t='" + task + "'";
		Table table = KSQL.select(query, null, "/system/data", null);
		Iterator<Row> it = table.iterator();
		while (it.hasNext()){
			Row r = it.next();
			 return r.getString("sFlowID");
		}
		
		throw new RuntimeException("获取流程实例任务为空！");
	}

	public static void sub1ProcessBeforeFinish() {
		Task task = ProcessUtils.getTaskInProcessContext();
		MasterProcessUtils.resumeMaster(task.getFlow());
	}
}