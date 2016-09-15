import java.util.HashMap;
import java.util.Iterator;

import com.justep.system.action.ActionUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

import com.justep.oa.OACommon;

public class TasksAssignedProcess {

	public static void tasksAssignedProcessAfterSaveOA_TasksAssignedAction() {
		Table table = (Table)ContextHelper.getActionContext().getParameter("table");
		com.justep.oa.OACommon.updateSocial(table);
	}
}