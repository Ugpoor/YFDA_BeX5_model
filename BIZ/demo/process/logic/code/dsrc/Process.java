import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessControlItem;
import com.justep.system.process.ProcessUtils;

public class Process {
	/**
	 * 当前主要使用control中后续环节和通知的执行人信息 
	 */
	public static void batchAdvanceProcess(List<String> tasks, ProcessControl control){
		for (String task : tasks){
			ProcessControl cur = ProcessUtils.advanceProcessQuery(task);
			modifyFlowToExecutor(cur, control);
			modifyNoticeExecutor(cur, control);
			
			ProcessUtils.advanceProcess(task, cur);
		}
	}
	
	private static void modifyNoticeExecutor(ProcessControl cur, ProcessControl control){
		Iterator<ProcessControlItem> it = cur.getNotices().iterator();
		while (it.hasNext()){
			ProcessControlItem item = it.next();
			ProcessControlItem template = control.getNotice(item.getUnit());
			if (template == null){
				it.remove();
			}else{
				item.clearExecutors();
				item.addExecutors(template.getExecutors());
			}
		}
	}
	
	
	private static void modifyFlowToExecutor(ProcessControl cur, ProcessControl control){
		Iterator<ProcessControlItem> it = cur.getFlowTos().iterator();
		while (it.hasNext()){
			ProcessControlItem item = it.next();
			ProcessControlItem template = control.getFlowTo(item.getUnit());
			if (template == null){
				it.remove();
			}else{
				item.clearExecutors();
				item.addExecutors(template.getExecutors());
			}
		}
	}

	public static List<String> batchStartProcess(String process, List<String> datas){
		List<String> result = new ArrayList<String>();
		for (String data : datas){
			List<Map<String, String>> items = ProcessUtils.startProcess(process, null, data, null);
			
			if (items.size() != 1){
				throw new RuntimeException("流程启动后必须有且只能有一个待办！");
			}
			
			String task = items.get(0).get("task");
			result.add(task);
		}
		
		return result;
	}
}