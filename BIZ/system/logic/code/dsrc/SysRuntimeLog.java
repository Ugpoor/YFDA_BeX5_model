import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

import com.justep.system.action.Interceptor;


public class SysRuntimeLog  implements Interceptor{
	public static Logger logger = Logger.getLogger(SysRuntimeLog.class);
	
	public void execute() {
		String ss = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(com.justep.util.Utils.getSystemRunTime());
		logger.info("system runtime:"+ss);
	}

}
