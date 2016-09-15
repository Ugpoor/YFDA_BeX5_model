import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;

import com.justep.common.SystemUtils;
import com.justep.message.dispatcher.Message;
import com.justep.message.dispatcher.MessageDispatcherFactory;
import com.justep.model.Action;
import com.justep.system.action.Interceptor;
import com.justep.system.context.ActionContext;
import com.justep.system.context.ContextHelper;
import com.justep.system.process.ActivityInstance;
import com.justep.system.process.ProcessUtils;
import com.justep.system.process.Task;
import com.justep.system.process.TaskStatus;
import com.justep.util.JustepConfig;


public class ProcessPushEngine  implements Interceptor{
	public static Logger logger = Logger.getLogger(ProcessPushEngine.class);
	public static final List<String> NAMES = new ArrayList<String>();
	static{
		NAMES.add("advanceProcessAction");
		NAMES.add("backProcessAction");
		NAMES.add("transferTaskAction");
		NAMES.add("withdrawTaskAction");
	};
	
	public void execute() {
		ActionContext ac = ContextHelper.getActionContext();
		Action action = ac.getAction();
		if (NAMES.contains(action.getName())){
			try{
				ActivityInstance ai = ProcessUtils.getAI();
				Set<ActivityInstance> nexts = ai.getAllNextAIs();
				nexts.add(ai);
				for (ActivityInstance next : nexts){
					if (next.activation()){
						for (Task t : next.getTask().getExecutorTasks()){
							String status = t.getStatus();
							if (TaskStatus.READY.equals(status) || TaskStatus.EXECUTING.equals(status)){
								String name = t.getName();
								String url = t.getEURL();
								if (SystemUtils.isNotEmptyString(url)){
									url += (url.contains("?") ? "&" : "?");
									url = url + "task=" + t.getId() + "&process=" + t.getProcess() + "&activity=" + t.getActivity();
									
									if (url.startsWith("/")){
										url = JustepConfig.getUIServer() + url;
									}
									logger.info("message: " + name + ", url: " + url + ", person: " + t.getExecutorFID() + ", " + t.getExecutorFName());
									Message msg = new Message(name, url, null);
									Set<String> personIDs = new HashSet<String>();
									personIDs.add(t.getExecutorFID());
									MessageDispatcherFactory.createMessageDispatcher().sendMessage(msg, personIDs);
								}
							}
						}
					}
				}
			}catch (Exception e){
				e.printStackTrace();
				logger.error(e.getMessage()+"", e);
			}
		}
		
		
	}

}
