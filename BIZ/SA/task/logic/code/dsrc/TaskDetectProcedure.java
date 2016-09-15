

import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.opm.PersonMember;
import com.justep.system.transform.SimpleTransform;
import com.justep.system.util.CommonUtils;


public class TaskDetectProcedure {
	private static final String DATA_MODEL = "/system/data";

	
	public static Document queryTaskDetect(Timestamp taskStart){
		Document result = DocumentHelper.createDocument();
		Element taskdetect = result.addElement("taskdetect");

		String count = "";
		String last = "";
		
		Map<String, Object> vars = new HashMap<String, Object>();
		Collection<PersonMember> pms = ContextHelper.getOperator().getAllPersonMembers();
		String condition = TaskUtils.getExecutorCondition("t", pms, true, vars);
		String query = "select countAll() as taskCount, max(t.sCreateTime) as last " +
			" from SA_Task t " +
			" where (t.sKindID='tkTask' or t.sKindID='tkExecutor' or t.sKindID='tkNotice' or t.sKindID IS NULL) " +
			" and (t.sStatusID='tesReady' or t.sStatusID='tesExecuting') " +
			" and (t.sTypeID IS NULL or t.sTypeID <> 'WORKREMIND')" +
			" and (t.sCreateTime > :var)" +
			" and " + condition;
		vars.put("var", taskStart);
		Table table = KSQL.select(query, vars, DATA_MODEL, null);
		for(Iterator<Row> it = table.iterator(); it.hasNext();){
			Row r = it.next();
			Object obj = r.getValue("taskCount");
			count = CommonUtils.toLong(obj) + "";
			last = SimpleTransform.transToString(r.getDateTime("last"));
		}
		
		taskdetect.addAttribute("taskdetect", count);
		taskdetect.addAttribute("last", last);
		return result;
	}
}
