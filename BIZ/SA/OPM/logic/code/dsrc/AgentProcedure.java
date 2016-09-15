import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.opm.api.AgentHelper;

public class AgentProcedure {
	public static Table queryOPAgent(List<DataPermission> range,
			String concept, String select, String from, String aggregate,
			String dataModel, String fnModel, String condition,
			Boolean distinct, String idColumn, String filter, Integer limit,
			Integer offset, String columns, String orderBy,
			String aggregateColumns, Map<String, Object> variables) {
		Table table = BizData.query(concept, idColumn, select, from, condition,
				range, filter, distinct, offset, limit, columns, orderBy,
				aggregate, aggregateColumns, variables, dataModel, fnModel);
		table.setRecordState(false);
		//table.addColumns("processLabel", "String");
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row row = rows.next();
			String process = row.getString("sProcess");
			row.setString("processLabel", AgentHelper.getProcessLabel(process));
		}
		return table;
	}

	public static int saveOPAgent(List<DataPermission> insertRange,
			List<DataPermission> deleteRange, List<DataPermission> updateRange,
			String concept, String dataModel, String fnModel, String readOnly,
			String notNull, Table table) {
		int i = 0;
		Iterator<Row> newIterator = table.iterator(ModifyState.NEW);
		while (newIterator.hasNext()) {
			Row row = newIterator.next();
			String id = row.getString("SA_OPAgent");
			String orgFID = row.getString("sOrgFID");
			String agentPersonID = row.getString("sAgentID");
			Timestamp startTime = row.getDateTime("sStartTime");
			Timestamp finishTime = row.getDateTime("sFinishTime");
			String process = row.getString("sProcess");
			Integer canTranAgent = row.getInteger("sCanTranAgent");

			AgentHelper.appendAgent(id, orgFID, process, agentPersonID,
					startTime, finishTime, (new Integer(1)).equals(canTranAgent));
			i++;
		}
		
		Iterator<Row> editIterator = table.iterator(ModifyState.EDIT);
		while (editIterator.hasNext()) {
			Row row = editIterator.next();
			String id = row.getString("SA_OPAgent");
			String orgFID = row.getString("sOrgFID");
			String agentPersonID = row.getString("sAgentID");
			Timestamp startTime = row.getDateTime("sStartTime");
			Timestamp finishTime = row.getDateTime("sFinishTime");
			Integer version = row.getInteger("version");
			String process = row.getString("sProcess");
			Integer canTranAgent = row.getInteger("sCanTranAgent");

			AgentHelper.updateAgent(id, version, orgFID, process,
					agentPersonID, startTime, finishTime,
					(new Integer(1)).equals(canTranAgent));
			i++;
		}
		
		Iterator<Row> deleteIterator = table.iterator(ModifyState.DELETE);
		while (deleteIterator.hasNext()) {
			Row row = deleteIterator.next();
			String id = row.getString("SA_OPAgent");
			Integer version = row.getInteger("version");

			AgentHelper.deleteAgent(id, version);
			i++;
		}

		return i;
	}

	public static void appendAgents(List<String> orgFIDList,
			List<String> processList, String agentPersonID,
			Timestamp startTime, Timestamp finishTime, Boolean canTranAgent) {
		canTranAgent = canTranAgent == null ? false : canTranAgent;
		AgentHelper.appendAgents(orgFIDList, processList, agentPersonID,
				startTime, finishTime, canTranAgent);
	}

	public static void cancelAgents(Map<String, Integer> agents) {
		AgentHelper.cancelAgents(agents);
	}

	public static void deleteAgents(Map<String, Integer> agents) {
		AgentHelper.deleteAgents(agents);
	}

	public static Table agentProcessStringToTable(String process){
		return AgentHelper.processStringToTable(process);
	}

	public static Map<String, String> agentProcessTableToString(Table table){
		Map<String, String> result = new HashMap<String, String>();
		String process = AgentHelper.processTableToString(table);
		String processLabel = AgentHelper.getProcessLabel(process);
		result.put("process", process);
		result.put("processLabel", processLabel);
		return result;
	}

	public static Table getModelTree(){
		return AgentHelper.getModelTree();
	}
}
