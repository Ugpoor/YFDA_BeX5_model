import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

import com.justep.message.CommonMessages;
import com.justep.message.SystemMessages;
import com.justep.model.Activity;
import com.justep.model.AdvanceRule;
import com.justep.model.BusinessActivity;
import com.justep.model.ConditionActivity;
import com.justep.model.CustomizedType;
import com.justep.model.IfElseActivity;
import com.justep.model.ModelUtils;
import com.justep.model.Place;
import com.justep.model.Process;
import com.justep.model.Template;
import com.justep.model.Unit;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.opm.PersonMember;
import com.justep.system.opm.ResourceUtils;
import com.justep.system.process.ActivityInstance;
import com.justep.system.process.ProcessChartEngine;
import com.justep.system.process.ProcessEngine;
import com.justep.system.process.ProcessRuleEngine;
import com.justep.system.process.ProcessTemplate;
import com.justep.system.process.ProcessTemplateFactory;
import com.justep.system.process.ProcessTemplateItem;
import com.justep.system.process.ProcessUtils;
import com.justep.system.process.TemplateHelper;
import com.justep.system.util.BizSystemException;
import com.justep.system.util.CommonUtils;
import com.justep.ui.editors.process.ProcessJSONObjectHelper;
import com.justep.util.Utils;

public class ProcessTemplateProcedure {
	//private static final Logger logger = Logger.getLogger(ProcessTemplateProcedure.class);

	public static List<String> queryProcessDefine2(String process){
		List<String> result = new ArrayList<String>();
		String chart = ProcessJSONObjectHelper.getProcessDiagram(process, null);
		String p = getProcessModel2(process).asXML();
		result.add(p);
		result.add(chart);
		return result;
	}

	private static Document getProcessModel2(String process){
		try {
			String file = ProcessJSONObjectHelper.getProcessModelFile(process, null);
			SAXReader reader = new SAXReader();
			Document doc = reader.read(new File(file));
			/*
			List<?> items = doc.selectNodes("//*[local-name()='has-action' " +
					"or local-name()='advance-rule' or local-name()='execute-rule' " +
					"or local-name()='start-rule' or local-name()='auto-action' " +
					"or local-name()='listener' or local-name()='token' " +
					"or local-name()='back-rule' or local-name()='transfer-rule' " +
					"or local-name()='notice-rule']");
			*/		
			List<?> items = doc.selectNodes("//*[local-name()='has-action' " +
					"or local-name()='start-rule' or local-name()='auto-action' " +
					"or local-name()='listener']");
			for (Object item : items){
				Element e = (Element)item;
				e.getParent().remove(e);
			}
			
			items = doc.selectNodes("//*[local-name() ='business-activity']");
			for (Object item : items){
				Element e = (Element)item;
				e.addAttribute("ref", e.attributeValue("name"));
			}
			
			Element root = doc.getRootElement().element("process");
			
			doc.getRootElement().remove(root);
			
			Element template = doc.getRootElement().addElement("template");
			template.addAttribute("name", CommonUtils.createGUID());
			template.addAttribute("process", root.attributeValue("name"));
			template.addAttribute("start", root.attributeValue("start"));
			template.addAttribute("end", root.attributeValue("end"));
			
			for (Object node : root.elements()){
				root.remove((Element)node);
				template.add((Element)node);
			}
			
		
			return doc;
		} catch (DocumentException e1) {
			throw new RuntimeException(e1.getMessage(), e1);
		}
		
		
		
	}
	
	public static List<String> queryProcessDefine(String process){
		List<String> result = new ArrayList<String>();
		String chart = ProcessJSONObjectHelper.getProcessDiagram(process, null);
		String p = getProcessModel(process).asXML();
		//System.out.println(p);
		result.add(p);
		result.add(chart);
		return result;
	}
	
	private static Document getProcessModel(String process){
		try {
			String file = ProcessJSONObjectHelper.getProcessModelFile(process, null);
			SAXReader reader = new SAXReader();
			Document doc = reader.read(new File(file));
			List<?> items = doc.selectNodes("//*[local-name()='has-action' " +
					"or local-name()='advance-rule' or local-name()='execute-rule' " +
					"or local-name()='start-rule' or local-name()='auto-action' " +
					"or local-name()='listener' or local-name()='token' " +
					"or local-name()='back-rule' or local-name()='transfer-rule' " +
					"or local-name()='notice-rule']");
			for (Object item : items){
				Element e = (Element)item;
				e.getParent().remove(e);
			}
			
			items = doc.selectNodes("//*[local-name() ='business-activity' " +
					"or local-name()='condition-activity' " +
					"or local-name()='if-else-activity' " +
					"or local-name()='auto-activity' " +
					"or local-name()='place']");
			for (Object item : items){
				Element e = (Element)item;
				e.addAttribute("src", e.attributeValue("name"));
			}
			
		
			return doc;
		} catch (DocumentException e1) {
			throw new RuntimeException(e1.getMessage(), e1);
		}
		
		
		
	}
	
	public static Document queryCustomizedRange2(String process, String activity){
		Utils.check(Utils.isNotEmptyString(process), CommonMessages.class, CommonMessages.PARAM_NULL1, "process");
		Utils.check(Utils.isNotEmptyString(activity), CommonMessages.class, CommonMessages.PARAM_NULL1, "activity");
		Process p = ModelUtils.getProcess(process);
		Activity a = p.getActivity(activity);
		List<AdvanceRule> rules = a.getAdvanceRules();
		
		//当有多个AdvanceRule时，随机取一个
		return getCustomizedRangeFromRule(rules.get(0));
	}
	
	
	
	public static Document queryCustomizedRange3(String process){
		Utils.check(Utils.isNotEmptyString(process), CommonMessages.class, CommonMessages.PARAM_NULL1, "process");
		Process p = ModelUtils.getProcess(process);
		Template t = p.getTemplate("");
		
		
		Document result = DocumentHelper.createDocument();
		Element items = result.addElement("items");
		

		Document processModel = getProcessModel2(process);
		
		for (Activity unit : t.getActivities()) {
			if (((unit instanceof BusinessActivity)
					|| (unit instanceof IfElseActivity)
					|| (unit instanceof ConditionActivity))
					&& unit.isNative()){
				Element item = items.addElement("item");
				item.addAttribute("activity", unit.getName());
				item.addAttribute("label", unit.getLabel(ContextHelper.getOperator().getLanguage()));
				String tag = null;
				if (unit instanceof BusinessActivity){
					item.addAttribute("tag", "activity");
					tag = BusinessActivity.TAG;
					
				}else if (unit instanceof IfElseActivity){
					item.addAttribute("tag", IfElseActivity.TAG);
					tag = IfElseActivity.TAG;
					
				}else if (unit instanceof ConditionActivity){
					item.addAttribute("tag", ConditionActivity.TAG);
					tag = ConditionActivity.TAG;
				}
				
				Element unitElement = (Element)processModel.selectSingleNode("//*[local-name(.)='"+ tag +"' and @name='" + unit.getName() + "']");
				if (unitElement != null){
					Element copy = (Element)unitElement.clone();
					for (Object node : copy.selectNodes("./*[(local-name(.)='input') or (local-name(.)='output')" +
							" or (local-name(.)='true-output') or (local-name(.)='false-output')]")){
						copy.remove((Node)node);
					}
					item.add(copy);
				}
			}
		}
		return result;
	}
	
	private static ActivityInstance getCustomizedStart(ActivityInstance ai, String templateID){
		if (Utils.isEmptyString(templateID))
			return ai;
		
		for (ActivityInstance item : ai.getPI().getAIs()){
			if (templateID.equals(item.getProcessTemplateID()) && "start".equals(item.getProcessTemplateItemID())){
				return item;
			}
		}
		throw BizSystemException.create(SystemMessages.NO_START_OF_TEMPLATE);
	}
	
	private static Document getCustomizedRangeFromRule(AdvanceRule rule){
		List<Unit> ranges = rule.getCustomizedRange();

		Document result = DocumentHelper.createDocument();
		Element items = result.addElement("items");
		for (Unit unit : ranges) {
			Element item = items.addElement("item");
			item.addAttribute("activity", unit.getName());
			item.addAttribute("label", unit.getLabel(ContextHelper.getOperator().getLanguage()));
			if (unit instanceof BusinessActivity){
				item.addAttribute("tag", "activity");
			}else if (unit instanceof IfElseActivity){
				item.addAttribute("tag", IfElseActivity.TAG);
				
			}else if (unit instanceof ConditionActivity){
				item.addAttribute("tag", ConditionActivity.TAG);
				
			}else if (unit instanceof Place){
				item.addAttribute("isEnd", "true");
			}
		}
		return result;
	}
	
	public static Document queryCustomizedRange(String task){
		Utils.check(Utils.isNotEmptyString(task), CommonMessages.class, CommonMessages.PARAM_NULL1, "task");
		ProcessEngine engine = new ProcessEngine(task, null);
		ProcessUtils.addProcessContext(engine);
		
		ActivityInstance ai = engine.getAI();
		String templateID = ai.getProcessTemplateID();
		ActivityInstance start = getCustomizedStart(ai, templateID);
		AdvanceRule rule = ProcessRuleEngine.getAdvanceRule(start);
		return getCustomizedRangeFromRule(rule);
	}
	
	/*
	public static String queryProcessTemplateItemSequenceByTask(String task) {
		Utils.checkNotEmptyString("输入参数task", task);
		String ai = queryAIByTask(task);
		String query = "select t.sProcessTemplateSequence, t.sParent "
				+ " from SA_Task t where t='" + ai + "'";
		Table table = KSQL.select(query, null, ProcessUtils.CORE_MODEL, null);
		for (Iterator<Row> it = table.iterator(); it.hasNext();) {
			Row r = it.next();
			return r.getString("sProcessTemplateSequence");
		}

		return "";
	}
	*/

	public static void startCustomizedProcess(String task, String template) {
		Utils.check(Utils.isNotEmptyString(task), CommonMessages.class, CommonMessages.PARAM_NULL1, "task");
		Utils.check(Utils.isNotEmptyString(template), CommonMessages.class, CommonMessages.PARAM_NULL1, "template");
		String ai = queryAIByTask(task);
			
		String ksql = "update SA_Task t set t.sProcessTemplateID='" + template + "', t.sProcessTemplateItemSequence='start' where t='" + ai + "'";
		int size = KSQL.executeUpdate(ksql.toString(), null, ProcessUtils.CORE_MODEL, null);
		if (size < 1){
			throw BizSystemException.create(SystemMessages.START_CUSTOM_ERROR);
		}
	}
	
	public static void cancelCustomizedProcess(String task){
		Utils.check(Utils.isNotEmptyString(task), CommonMessages.class, CommonMessages.PARAM_NULL1, "task");
		String ai = queryAIByTask(task);
			
		String ksql = "update SA_Task t " + " set t.sProcessTemplateID='', t.sProcessTemplateItemSequence='' where t='" + ai + "'";
		int size = KSQL.executeUpdate(ksql.toString(), null, ProcessUtils.CORE_MODEL, null);
		if (size < 1){
			throw BizSystemException.create(SystemMessages.CANCEL_CUSTOM_ERROR);
		}
	}

	private static String queryAIByTask(String task) {
		String query = "select t.sAIID, t.sParent "
						+ " from SA_Task t where t=:task";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("task", task);
		Table table = KSQL.select(query, params, ProcessUtils.CORE_MODEL, null);
		for (Iterator<Row> it = table.iterator(); it.hasNext();) {
			Row r = it.next();
			String ai = r.getString("sAIID");
			if (task.equals(ai)) {
				return task;

			} else {
				String parent = r.getString("sParent");
				if (Utils.isNotEmptyString(parent)) {
					return queryAIByTask(parent);
				}
			}
		}
		
		throw BizSystemException.create(SystemMessages.NO_AI_FROM_TASK1, task);
	}
	
	public static Map<String, String> startCustomizedProcessQuery(String task){
		Utils.check(Utils.isNotEmptyString(task), CommonMessages.class, CommonMessages.PARAM_NULL1, "task");
		ProcessEngine engine = new ProcessEngine(task, null);
		ProcessUtils.addProcessContext(engine);
		
		ActivityInstance ai = engine.getAI();
		String process = ai.getTemplate().getProcess().getFullName2();
		String processName = ai.getTemplate().getProcess().getName();
		String activity = ai.getActivity().getName();
		String activityName = ai.getActivityLabel();
		
		String template = null;
		String activeActivities = "";
		String finishedActivities = "";
		String templateType = CustomizedType.GRID;
		boolean customizedEnabled = false;
		if (Utils.isEmptyString(ai.getPI().getProcessTemplateID2())){
			ProcessTemplateItem item = ai.getProcessTemplateItem();
			if (item != null){
				customizedEnabled = item.isCustomizedEnabled();
				templateType = ai.getProcessTemplate().getType();
			}else{
				AdvanceRule rule = ProcessRuleEngine.getAdvanceRule(ai);
				customizedEnabled = rule.isCustomizedEnabled();
				templateType = rule.getCustomizedType();
			}
		}else{
			AdvanceRule rule = ProcessRuleEngine.getAdvanceRule(ai);
			customizedEnabled = rule.isCustomizedEnabled();
			templateType = CustomizedType.GRAPH2;//rule.getCustomizedType(); 通过流程模板启动的流程实例，只支持新版本的流程定制
		}

		if (CustomizedType.GRAPH2.equals(templateType)){
			template = (ai.getProcessTemplateID2()!=null)?ai.getProcessTemplateID2():"";
			
			for (ActivityInstance item : ai.getPI().getActiveAIs()){
				if (Utils.isNotEmptyString(activeActivities)){
					activeActivities += ",";
				}
				activeActivities += "\"" + item.getActivityID() + "\"";
			}
			
			if (Utils.isNotEmptyString(activeActivities)){
				activeActivities = "[" + activeActivities + "]";
			}
			
			finishedActivities = ProcessChartEngine.getFlowTrack(ai.getPI());
			
			
			
		}else{
			template = (ai.getProcessTemplateID()!=null)?ai.getProcessTemplateID():"";
			activeActivities = "[]";
			finishedActivities = "[]";
		}
		
		
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("enabled", customizedEnabled + "");
		result.put("template", template);
		result.put("templateType", templateType);
		result.put("templateItemSequence", (ai.getProcessTemplateItemID()!=null)?ai.getProcessTemplateItemID():"");
		result.put("process", process + "");
		result.put("processName", processName + "");
		result.put("activity", activity + "");
		result.put("activityName", activityName + "");
		result.put("activeActivities", activeActivities);
		result.put("finishedActivities", finishedActivities);
		return result;
	}	
	/*
	public static Document startCustomizedProcessQuery(String task){
		Utils.check(Utils.isNotEmptyString(task), CommonMessages.class, CommonMessages.PARAM_NULL1, "task");
		ProcessEngine engine = new ProcessEngine(task, null);
		ProcessUtils.addProcessContext(engine);
		
		ActivityInstance ai = engine.getAI();
		String process = ai.getTemplate().getProcess().getFullName2();
		String processName = ai.getTemplate().getProcess().getName();
		String activity = ai.getActivity().getName();
		String activityName = ai.getActivityLabel();
		
		String template = null;
		String activeActivities = "";
		String finishedActivities = "";
		String templateType = CustomizedType.GRID;
		boolean customizedEnabled = false;
		if (Utils.isEmptyString(ai.getPI().getProcessTemplateID2())){
			ProcessTemplateItem item = ai.getProcessTemplateItem();
			if (item != null){
				customizedEnabled = item.isCustomizedEnabled();
				templateType = ai.getProcessTemplate().getType();
			}else{
				AdvanceRule rule = ProcessRuleEngine.getAdvanceRule(ai);
				customizedEnabled = rule.isCustomizedEnabled();
				templateType = rule.getCustomizedType();
			}
		}else{
			AdvanceRule rule = ProcessRuleEngine.getAdvanceRule(ai);
			customizedEnabled = rule.isCustomizedEnabled();
			templateType = CustomizedType.GRAPH2;//rule.getCustomizedType(); 通过流程模板启动的流程实例，只支持新版本的流程定制
		}

		if (CustomizedType.GRAPH2.equals(templateType)){
			template = (ai.getProcessTemplateID2()!=null)?ai.getProcessTemplateID2():"";
			
			for (ActivityInstance item : ai.getPI().getActiveAIs()){
				if (Utils.isNotEmptyString(activeActivities)){
					activeActivities += ",";
				}
				activeActivities += "\"" + item.getActivityID() + "\"";
			}
			
			if (Utils.isNotEmptyString(activeActivities)){
				activeActivities = "[" + activeActivities + "]";
			}
			
			finishedActivities = ProcessChartEngine.getFlowTrack(ai.getPI());
			
			
			
		}else{
			template = (ai.getProcessTemplateID()!=null)?ai.getProcessTemplateID():"";
			activeActivities = "[]";
			finishedActivities = "[]";
		}
		
		
		
		Document result = DocumentHelper.createDocument();
		Element root = result.addElement(new QName("customized"));
		root.addElement(new QName("enabled")).addText(customizedEnabled + "");
		root.addElement(new QName("template")).addText(template);
		root.addElement(new QName("templateType")).addText(templateType);
		root.addElement(new QName("templateItemSequence")).addText((ai.getProcessTemplateItemID()!=null)?ai.getProcessTemplateItemID():"");
		root.addElement(new QName("process")).addText(process + "");
		root.addElement(new QName("processName")).addText(processName + "");
		root.addElement(new QName("activity")).addText(activity + "");
		root.addElement(new QName("activityName")).addText(activityName + "");
		
		root.addElement(new QName("activeActivities")).addText(activeActivities);
		root.addElement(new QName("finishedActivities")).addText(finishedActivities);
		
		return result;
	}
	*/
	
	public static Table queryProcessTemplate(String concept, String idColumn, String select, String from, String condition, List<DataPermission> range,
			String filter, Boolean distinct, int offset, int limit, String columns, String orderBy, String aggregate, String aggregateColumns,
			Map<String, Object> variables, String dataModel, String fnModel, String queryRange) {
		if ("OWNER".equals(queryRange)){
			String alias = "SA_ProcessTemplate";
			Set<String> resources = ResourceUtils.getResources(alias);
			String customFilter = "1<>1";
			for (String resource : resources){
				customFilter += " or " + alias + "='" + resource + "'";
			}
			
			customFilter = "((" + customFilter + ") and " + alias + ".sScopeID='public') " +
					"or (" + alias + ".sScopeID='private' and " + alias + ".sCreatorID='" + ContextHelper.getPerson().getID() + "')";
			
			if (Utils.isEmptyString(filter)){
				filter = customFilter;
			}else{
				filter = "(" + filter + ") and (" + customFilter + ")";
			}
		}
		return BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
	}
	
	public static int saveProcessTemplate(Table table, String concept, List<DataPermission> insertRange, List<DataPermission> deleteRange,
			List<DataPermission> updateRange, String readOnly, String notNull, String dataModel, String fnModel) {
		Iterator<Row> it = table.iterator();
		while(it.hasNext()){
			Row r = it.next();
			String content = r.getString("sContent");
			
			if (Utils.isNotEmptyString(content)){
				String type = "";
				if (table.getColumnNames().contains("sTypeID")){
					type = r.getString("sTypeID");
				}
				ProcessTemplate t = ProcessTemplateFactory.createProcessTemplate(type);
				t.setProcess(r.getString("sProcess"));
				
				
				//验证合法性
				t.setContent(content);
			}
		}
		return BizData.save(table, concept, insertRange, deleteRange, updateRange, readOnly, notNull, dataModel, fnModel);
	}

	public static int saveProcessTemplate3(Table table, String concept, List<DataPermission> insertRange, List<DataPermission> deleteRange,
			List<DataPermission> updateRange, String readOnly, String notNull, String dataModel, String fnModel) {
		Set<String> processes = new HashSet<String>();
		Iterator<Row> it = table.iterator();
		while(it.hasNext()){
			Row r = it.next();
			String content = r.getString("sContent");
			String id = r.getString("SA_ProcessTemplate");
			String newContent = TemplateHelper.checkTemplate(r.getString("sProcess"), id, content);
			if (!content.equals(newContent)){
				r.setString("sContent", newContent);
			}
			if (r.getState().isEdit()){
				processes.add(r.getString("sProcess"));
			}
		}
		
		int result = BizData.save(table, concept, insertRange, deleteRange, updateRange, readOnly, notNull, dataModel, fnModel);
		
		unload(processes);
		
		return result;
	}

	public static Map<String, String> queryProcessChartByCustomized(String task){
		return ProcessChartEngine.getProcessChartByCustomized(task);
	}
	
	
	public static void assignTemplatePermission(String template, String process, String processName, List<String> orgIDs, List<String> orgNames, List<String> orgFIDs, List<String> orgFNames){
		Utils.check(Utils.isNotEmptyString(template), CommonMessages.class, CommonMessages.PARAM_NULL1, "template");
		Utils.check(Utils.isNotEmptyString(process), CommonMessages.class, CommonMessages.PARAM_NULL1, "process");
		
		if ((orgFIDs==null) || orgFIDs.isEmpty()){
			return;
		}
		
		Set<String> usedFIDs = new HashSet<String>();
		String query = "select c.sOrgFID from SA_ResourceControl c where c.sResourceID='" + template + "' " +
				"and c.sProcess='" + process + "' " +
				"and c.sTypeID='PROCESS_TEMPLATE2'";
		Table table = KSQL.select(query, new HashMap<String, Object>(), "/system/data", null);
		Iterator<Row> it = table.iterator();
		while (it.hasNext()){
			Row r = it.next();
			usedFIDs.add(r.getString("sOrgFID"));
		}
		
		
		PersonMember psm = ContextHelper.getPersonMember();
		String creatorID = psm.getPerson().getID();
		String creatorName = ContextHelper.getPersonMemberNameWithAgent();
		String creatorFID = psm.getFID();
		String creatorFName = ContextHelper.getPersonMemberFNameWithAgent();
		
		
		for (int i=0; i<orgFIDs.size(); i++){
			String orgFID = orgFIDs.get(i);
			if (Utils.isEmptyString(orgFID) || usedFIDs.contains(orgFID)){
				continue;
			}
			
			String insert = "insert into SA_ResourceControl c (c, c.sOrgID, c.sOrgName, c.sOrgFID, c.sOrgFName, c.sProcess, c.sProcessName, " +
					"c.sResourceID, c.sTypeID, c.sTypeName, c.sCreatorID, c.sCreatorName, c.sCreatorFID, c.sCreatorFName, c.sCreateTime, c.version) " +
					"values(:id, :orgID, :orgName, :orgFID, :orgFName, :process, :processName," +
					":resourceID, :type, :typeName, :creatorID, :creatorName, :creatorFID, :creatorFName, :createTime, 0) ";
					
			Map<String, Object> vars = new HashMap<String, Object>();
			vars.put("id", CommonUtils.createGUID());
			vars.put("orgID", orgIDs.get(i));
			vars.put("orgName", orgNames.get(i));
			vars.put("orgFID", orgFID);
			vars.put("orgFName", orgFNames.get(i));
			vars.put("process", process);
			vars.put("processName", processName);
			vars.put("resourceID", template);
			vars.put("type", "PROCESS_TEMPLATE2");
			vars.put("typeName", "流程模板");
			vars.put("creatorID", creatorID);
			vars.put("creatorName", creatorName);
			vars.put("creatorFID", creatorFID);
			vars.put("creatorFName", creatorFName);
			vars.put("createTime", CommonUtils.getCurrentDateTime());
			
			KSQL.executeUpdate(insert, vars, "/system/data", null);
		}
	}
	
	public static void deleteTemplate(Map<String, Object> ids, Map<String, Object> processes){
		if (!ids.isEmpty()){
			String condition1 = null;
			String condition2 = null;
			for (String id : ids.keySet()){
				int version = (Integer)ids.get(id);
				if (condition1 == null){
					condition1 = " (t='" + id + "' and t.version=" + version + ") ";
				}else{
					condition1 += " or (t='" + id + "' and t.version=" + version + ") ";
				}
				
				if (condition2 == null){
					condition2 = " rc.sResourceID='" + id + "' ";
				}else{
					condition2 += " or rc.sResourceID='" + id + "' ";
				}
			}
			
			String ksql1 = "delete from SA_ProcessTemplate t where " + condition1;
			String ksql2 = "delete from SA_ResourceControl rc where " + condition2;
			
			KSQL.executeUpdate(ksql1, new HashMap<String, Object>(), "/system/data", null);
			KSQL.executeUpdate(ksql2, new HashMap<String, Object>(), "/system/data", null);
		}
	}
	
	public static void deleteTemplatePermission(Map<String, Object> ids){
		if (!ids.isEmpty()){
			String condition = null;
			for (String id : ids.keySet()){
				int version = (Integer)ids.get(id);
				if (condition == null){
					condition = " (rc='" + id + "' and rc.version=" + version + ")";
				}else{
					condition += " or (rc='" + id + "' and rc.version=" + version + ")";
				}
			}
			
			String ksql = "delete from SA_ResourceControl rc where " + condition;
			
			KSQL.executeUpdate(ksql, new HashMap<String, Object>(), "/system/data", null);
		}
	}
	
	public static void enabledTemplate(Map<String, Object> ids, Map<String, Object> processes){
		if (!ids.isEmpty()){
			String condition = null;
			for (String id : ids.keySet()){
				int version = (Integer)ids.get(id);
				if (condition == null){
					condition = " (t='" + id + "' and t.version=" + version + ") ";
				}else{
					condition += " or (t='" + id + "' and t.version=" + version + ") ";
				}
			}
			
			String ksql = "update SA_ProcessTemplate t set t.sValidState=1 where " + condition;
			
			KSQL.executeUpdate(ksql, new HashMap<String, Object>(), "/system/data", null);
			
			unload(processes.keySet());
		}
	}
	
	public static void disabledTemplate(Map<String, Object> ids, Map<String, Object> processes){
		if (!ids.isEmpty()){
			String condition = null;
			for (String id : ids.keySet()){
				int version = (Integer)ids.get(id);
				if (condition == null){
					condition = " (t='" + id + "' and t.version=" + version + ") ";
				}else{
					condition += " or (t='" + id + "' and t.version=" + version + ") ";
				}
			}
			
			String ksql = "update SA_ProcessTemplate t set t.sValidState=0 where " + condition;
			
			KSQL.executeUpdate(ksql, new HashMap<String, Object>(), "/system/data", null);
			
			unload(processes.keySet());
		}
	}
	
	private static void unload(Set<String> processes){
		for (String process : processes){
			ModelUtils.unloadModel(process.substring(0, process.lastIndexOf("/")));
		}
	}
	
	public static void saveProcessTemplate4(String id, String sName, String sProcess, String sContent, String sContent2, String sTemplateID, String sKindID){
		if (Utils.isEmptyString(id)){
			id = CommonUtils.createGUID();
		}
		
		if (Utils.isEmptyString(sKindID)){
			sKindID = "template";
		}
		
		sContent = TemplateHelper.checkTemplate(sProcess, id, sContent);
		
		String ksql = "insert into SA_ProcessTemplate t (t, t.sName, t.sProcess, t.sProcessName, t.sContent, t.sContent2, t.sTemplateID, " +
				"t.version, t.sTypeID, t.sKindID, t.sValidState,t.sCreateTime," +
				"t.sCreatorFID, t.sCreatorFName, t.sCreatorID, t.sCreatorName" +
				") values(:id, :sName, :sProcess, :sProcessName, :sContent, :sContent2, :sTemplateID," +
				"0, 'PROCESS_TEMPLATE', :sKindID, 1, :sCreateTime, " +
				":sCreatorFID, :sCreatorFName, :sCreatorID, :sCreatorName)";
		String sProcessName = ModelUtils.getProcess(sProcess).getLabel(ContextHelper.getOperator().getLanguage());
		PersonMember psm = ContextHelper.getPersonMember();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("sName", sName);
		params.put("sProcess", sProcess);
		params.put("sProcessName", sProcessName);
		params.put("sContent", sContent);
		params.put("sContent2", sContent2);
		params.put("sTemplateID", sTemplateID);
		params.put("sKindID", sKindID);
		params.put("sCreateTime", CommonUtils.getCurrentDateTime());
		params.put("sCreatorFID", psm.getFID());
		params.put("sCreatorFName", psm.getFName());
		params.put("sCreatorID", psm.getPerson().getID());
		params.put("sCreatorName", psm.getPerson().getName());
		KSQL.executeUpdate(ksql, params, "/system/data", null);
	}
	
	public static void replaceTemplate(String task, String template){
		String query = "select t.sFlowID from SA_Task t where t=:task";
		Map<String, Object> params1 = new HashMap<String, Object>();
		params1.put("task", task);
		Table t = KSQL.select(query, params1, "/system/data", null);
		Iterator<Row> it = t.iterator();
		while (it.hasNext()){
			Row r = it.next();
			String sFlowID = r.getString("sFlowID");
			if (Utils.isNotEmptyString(sFlowID)){
				String ksql = "update SA_Task t set t.sProcessTemplateID2=:template where t.sFlowID = :sFlowID";
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("sFlowID", sFlowID);
				params.put("template", template);
				KSQL.executeUpdate(ksql, params, "/system/data", null);
			}
			
			break;
		}
		
	}
	
	
}
