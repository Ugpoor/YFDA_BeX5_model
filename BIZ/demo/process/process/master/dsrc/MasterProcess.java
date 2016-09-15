import org.dom4j.Document;

import com.justep.process.master.MasterProcessUtils;
import com.justep.system.context.ContextHelper;

public class MasterProcess {

	public static void sub1ActivityAfterAdvance() {
		Document doc = (Document)ContextHelper.getActionContext().getActionResult();
		String task = doc.selectSingleNode("/items/item/task").getText();
		String sub2Process = "/demo/process/process/sub2/sub2Process";
		MasterProcessUtils.startSubProcessInActivity(task, sub2Process);
		
	}
}