import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.justep.common.SystemUtils;
import com.justep.message.dispatcher.Message;
import com.justep.message.dispatcher.MessageDispatcherFactory;
import com.justep.util.JustepConfig;



public class MessageProcedure {
	public static void sendMessage(String targets, String title, String url, String type){
		if (SystemUtils.isEmptyString(targets)) return;
		Set<String> orgs = new HashSet<String>();
		for (String target : targets.split(",")){
			target = target.trim();
			if (SystemUtils.isNotEmptyString(target)){
				orgs.add(target);
			}
		}
		if (orgs.isEmpty()) return;
		Map<String, Object> exts = new HashMap<String, Object>(); 
		if (SystemUtils.isNotEmptyString(url)){
			url = url.trim();
			if (url.startsWith("/")){
				url = JustepConfig.getUIServer() + url;
			}else if (url.startsWith("$UI")){
				url = url.replace("$UI", "/UI2");
				url = JustepConfig.getUIServer() + url;
			}
		}
		Message msg = new Message(title, url, type, exts);
		MessageDispatcherFactory.createMessageDispatcher().sendMessage(msg, orgs);
	}
}
