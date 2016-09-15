

import java.math.BigDecimal;
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
import com.justep.system.opm.Person;


public class RemindProcedure {
	private static final String DATA_MODEL = "/SA/task/data";
	
	public static void live(){
		//不需要做任务操作，只是让session不失效
	}
	
	public static Document queryRemindCount(){
		Document result = DocumentHelper.createDocument();
		long waitTaskCount = 0;
		Element taskdetect = result.addElement("remindCount");
		{
			//本人	
			waitTaskCount = queryWaitCount(ContextHelper.getPerson());
		}
			
		if (ContextHelper.getOperator().getID().equals(ContextHelper.getPerson().getID())){
			//代理
			for (Person person : ContextHelper.getOperator().getAgents()){
		
				waitTaskCount = waitTaskCount + queryWaitCount(person);
			}
		}
		taskdetect.addAttribute("remindCount", String.valueOf(waitTaskCount));
		return result;
	}

	private static long queryWaitCount(Person person){
		long result = 0;
		Map<String, Object> vars = new HashMap<String, Object>();
		String condition = TaskUtils.getExecutorCondition("t", person.getPersonMembers(), true, vars);
		String query = "select CountAll() AS remindcount" +
			" from SA_WorkRemind t " +
			" where  (t.sStatusID='tesReady' or t.sStatusID='tesExecuting') " +
			//" and (t.sTypeID = 'WORKREMIND')" + //t.sTypeID IS NULL or 
			" and " + condition;
		Table table = KSQL.select(query, vars, DATA_MODEL, null);
		for(Iterator<Row> it = table.iterator(); it.hasNext();){
			Row r = it.next();
			Object v = r.getValue("remindcount");
			result = parserLong(v);
		}
		return result;
		
	}
	
	private static long parserLong(Object v){
		long result = 0;
		if (v instanceof BigDecimal){
			result = ((BigDecimal) v).longValue();
		}else if (v instanceof Integer){
			result = ((Integer) v).longValue();
		}else if (v instanceof Long){
			result = ((Long) v).longValue();
		}else{
			result = Long.parseLong(v.toString());
		}
		
		return result;
	}		
}
