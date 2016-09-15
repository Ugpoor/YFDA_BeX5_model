import java.util.Map;

import org.apache.log4j.Logger;

import com.justep.business.server.MyCatMultiTenant;
import com.justep.common.ServerConfig;
import com.justep.system.action.Interceptor;
import com.justep.system.context.ActionContext;
import com.justep.system.context.ContextHelper;


public class TenantEngine  implements Interceptor{
	public static Logger logger = Logger.getLogger(TenantEngine.class);
	
	@SuppressWarnings("rawtypes")
	public void execute() {
		if (ServerConfig.isDistributed()){
			String tenant = null;
			ActionContext ac = ContextHelper.getActionContext();
			String name = ac.getAction().getName();
			if (name.equals("loginAction") || name.equals("ntLoginAction")){
				Map options = (Map)ac.getParameter("options");
				if (options != null){
					tenant = (String)options.get(MyCatMultiTenant.TENANT);
				}
			}
			MyCatMultiTenant.setMyCatMultiTenantInfo(ContextHelper.getRequestContext().getRequest(), tenant);
		}
	}

}
