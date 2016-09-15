import java.util.HashMap;
import java.util.Iterator;

import com.justep.system.action.ActionUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.InitUtils;

public class InitOA {


	public static void initOADB() throws Exception{

    	//初始化OA的演示数据
    	//根据概念生成表
		InitUtils.createAppDb("/OA/CRM");
		InitUtils.createAppDb("/OA/personalOffice");
		
		//mysql 5.6使用默认事务机制时, 需要放在这里初始化demo, 具体原因未知, 和清除org数据有关
		//调用demo的初始化演示数据
    	ActionUtils.invokeAction("/demo/common/process/initDemoDB/initDemoDBProcess", "mainActivity", "initDemoDB", ContextHelper.getPerson().getID(), new HashMap<String, Object>());

		//执行data.ksql文件中的ksql
		InitUtils.initAppDb(null, "/OA/CRM");
		InitUtils.initAppDb(null, "/OA/personalOffice");
		
	}

}
