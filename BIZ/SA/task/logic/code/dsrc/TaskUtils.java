import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.message.SystemMessages;
import com.justep.system.context.ContextHelper;
import com.justep.system.opm.PersonMember;
import com.justep.system.util.BizSystemException;
import com.justep.util.Utils;


public class TaskUtils {
	
	public static String getCreatorCondition(String alias, Collection<PersonMember> pms, boolean useAgentProcess, Map<String, Object> vars){
		String result = "";
		List<String> items = new ArrayList<String>();
		
		boolean isOperator = true;
		for (PersonMember pm : pms){
			if (!pm.getPerson().getID().equals(ContextHelper.getOperator().getID())){
				isOperator = false;
				break;
			}
		}
		
		if (isOperator){
			items.add(alias + ".sCreatorPersonID=:_cpid");
			vars.put("_cpid", ContextHelper.getOperator().getID());
		}else{
			int i = 0;
			for (PersonMember pm : pms){
				String var = "_cfid" + i++;
				String item = alias + ".sCreatorFID = :" + var;
				vars.put(var, pm.getFID());
				if (useAgentProcess){
					String agentProcess = pm.getAgentProcess();
					if (Utils.isNotEmptyString(agentProcess)){
						String agentProcessCondition = getAgentProcessCondition(alias, agentProcess, vars);
						item += " and " + agentProcessCondition;
					}
				}
				
				items.add(item);
			}
		}
		
		if (items.isEmpty()){
			result = "1<>1";
		}else{
			for (String item : items){
				if (result.equals("")){
					result = item;
				}else{
					result = result + " or " + item;
				}
			}
			
			result = "(" + result + ")";
		}
		
		return result;
	}
	
	public static String getExecutorCondition(String alias, Collection<PersonMember> pms, boolean useAgentProcess, Map<String, Object> vars){
		String result = "";
		List<String> items = new ArrayList<String>();
		int i = 0;
		for (PersonMember pm : pms){
			String var = "_efid" + i++;
			vars.put(var, pm.getFID());
			String item = ":" + var + " like concat(" + alias + ".sExecutorFID, '%')";
			if (useAgentProcess){
				String agentProcess = pm.getAgentProcess();
				if (Utils.isNotEmptyString(agentProcess)){
					String agentProcessCondition = getAgentProcessCondition(alias, agentProcess, vars);
					item += " and " + agentProcessCondition;
				}
			}
			
			items.add(item);
		}
		
		if (items.isEmpty()){
			result = "1<>1";
		}else{
			for (String item : items){
				if (result.equals("")){
					result = item;
				}else{
					result = result + " or " + item;
				}
			}
			
			result = "(" + result + ") and " +  alias + ".sExecutorFID like '/%' ";
		}
		
		return result;
	}
	
	private static String getAgentProcessCondition(String alias, String agentProcess, Map<String, Object> vars){
		try {
			String result = "";
			List<String> items = new ArrayList<String>();
			SAXReader reader = new SAXReader();
			Document doc = reader.read(new ByteArrayInputStream(agentProcess.getBytes("UTF-8")));
			if (doc.getRootElement() != null){
				int i = 0;
				for (Object item : doc.getRootElement().elements()){
					i++;
					
					String type = ((Element)item).getName();
					String value = ((Element)item).getTextTrim();
					if (type.equals("m")){
						String var = "_process" + i;
						vars.put(var, value + "%");
						items.add(alias + ".sProcess like :" + var);
						
					}else if (type.equals("r")){
						int j = 0;
						for (String processActivity : ContextHelper.getOperator().getPermissionByRoleID(value)){
							String process = processActivity.substring(0, processActivity.indexOf(",")).trim();
							String activity = processActivity.substring(processActivity.indexOf(",") + 1).trim();

							j++;
							String var = "_r" + j + "process" + i;
							String var2 = "r" + j + "activity" + i;
							
							vars.put(var, process);
							vars.put(var2, activity);
							items.add(alias + ".sProcess = :" + var + " and " + alias + ".sActivity = :" + var2);
						}
						
					}else if (type.equals("p")){
						String var = "_process" + i;
						vars.put(var, value);
						items.add(alias + ".sProcess = :" + var);

					}else if (type.equals("a")){
						String activity = value.substring(value.lastIndexOf("/") + 1).trim();
						String process = getProcess(value.substring(0, value.lastIndexOf("/")));
						if ("*".equals(activity)){
							String var = "_process" + i;
							vars.put(var, process);
							items.add(alias + ".sProcess = :" + var);
							
						}else{
							String var = "_process" + i;
							vars.put(var, process);
							
							String var2 = "_activity" + i;
							vars.put(var2, activity);
							items.add(alias + ".sProcess = :" + var + " and " + alias + ".sActivity = :" + var2);
						}

					}else{
						throw BizSystemException.create(SystemMessages.TYPE_OF_AGENT1, type);
					}
				}
			}
			
			if (items.isEmpty()){
				result = "1=1";
			}else{
				for (String item : items){
					if (result.equals("")){
						result = item;
					}else{
						result = result + " or " + item;
					}
				}
				result = "(" + result + ")";
			}
			
			return result;
		} catch (UnsupportedEncodingException e) {
			throw BizSystemException.create(e, SystemMessages.SET_AGENT_ERROR1, agentProcess);
		} catch (DocumentException e) {
			throw BizSystemException.create(e, SystemMessages.SET_AGENT_ERROR1, agentProcess);
		}
	}
	
	private static String getProcess(String path){
		String name = path.substring(path.lastIndexOf("/") + 1);
		name = Character.toLowerCase(name.charAt(0)) + name.substring(1) + "Process";
		return path + "/" + name;
	}
	
	/*
	public static String appendCondition(String base, String operator, String condition){
		if (Utils.isEmptyString(base)){
			return condition;
		}else{
			if (Utils.isEmptyString(condition)){
				return base;
			}else{
				return "((" + base + ") " + operator + " (" + condition + "))";	
			}
		}
	}
	*/
}
