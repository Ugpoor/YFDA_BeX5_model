import java.util.Map;

import com.justep.system.util.*;
import com.justep.system.process.*;
import com.justep.system.context.*;
import com.justep.system.opm.*;
import com.justep.system.data.*;
import com.justep.system.action.*;
import com.justep.model.*;

public class EventProcess {

	/**
		advanceProcessQueryAction的before事件。
		在before事件中，可以获取action参数的值，同时也可以修改参数的值，实现其它的业务逻辑。
	*/
	public static void bizActivity1BeforeAdvanceQuery() {
		String info = "[开始]========advanceProcessQueryAction的before事件======\n";
		ActionContext context = ContextHelper.getActionContext();

		//获取action的输入参数
		String task = (String)context.getParameter("task"); 			//task是advanceProcessQueryAction的参数名称
		info += "输入参数task: " + task + "\n";

		//修改参数的值，对于简单类型的参数，需要使用context.setParameter(参数名称, 参数值)来修改参数的值；
		//对象类型的参数则可以直接修改参数值本身；
		//context.setParameter("task", "参数值");
		
		info += "这里可以插入其它的业务逻辑...\n"; 

		info += "[结束]========advanceProcessQueryAction的before事件======\n";
		System.out.println(info);
	}

	/**
		advanceProcessQueryAction的after事件。
		在after事件中，可以获取action参数的值和action的返回值，实现其它的业务逻辑。
	*/
	public static void bizActivity1AfterAdvanceQuery() {
		String info = "[开始]========advanceProcessQueryAction的after事件======\n";
		ActionContext context = ContextHelper.getActionContext();

		//获取action的输入参数
		String task = (String)context.getParameter("task"); 			//task是advanceProcessQueryAction的参数名称
		info += "输入参数task: " + task + "\n";

		//修改参数的值，对于简单类型的参数，需要使用context.setParameter(参数名称, 参数值)来修改参数的值；
		//对象类型的参数则可以直接修改参数值本身；
		//context.setParameter("task", "参数值");
		
		//获取action的返回值，查看advanceProcessQueryAction的实现可以知道，它的返回值类型是ProcessControl;
		ProcessControl control = (ProcessControl)context.getActionResult();
		info += "返回值: " + control.writer().asXML() + "\n";


		info += "这里可以插入其它的业务逻辑...\n"; 

		info += "[结束]========advanceProcessQueryAction的after事件======\n";
		System.out.println(info);
	}
}