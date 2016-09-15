import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.Action;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.common.SystemUtils;
import com.justep.ui.JustepConfig;
import com.justep.ui.impl.JProcessorImpl;
import com.justep.ui.system.service.permission.MenuUtils;
import com.justep.ui.util.NetUtils;


public class GetFunctionData extends JProcessorImpl  {
	
	private Element filterFlowMenus(HttpServletRequest request, Document menus){
		Action action = new Action();
		action.setProcess("/SA/OPM/system/systemProcess");
		action.setActivity("mainActivity");
		action.setName("queryProcessAction");
		action.setParameter("type", "flow");
		action.setParameter("range", menus);
		
		String bsessionID = NetUtils.getBSessionID(request);
		String language = NetUtils.getLanguage(request);
		ActionResult ar = ActionEngine.invokeAction(action, ActionUtils.XML_CONTENT_TYPE, bsessionID, language, null);
		if (ar.isSuccess()){
			Document arDocument = (Document)ar.getContent();
			Element elmTreeRoot = (Element) arDocument.selectSingleNode("/*[local-name()='root']/*[local-name()='data']/*[local-name()='xml']/*[local-name()='root']");
			return elmTreeRoot;
		}else{
			Document arDocument = (Document)ar.getContent();
			throw new RuntimeException(arDocument.asXML());
		}
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.execute(request, response);
		
		// 菜单数据模式（树形或列表）
		// mode : list | tree  
		Boolean isTree = !"list".equals(request.getParameter("mode"));
		// 菜单数据是否合并（process、activity、path相同）
		// identity : true | false
		Boolean identity = "true".equals(request.getParameter("identity"));

		//支持返回流程相关的功能菜单
		Boolean isFlow = "flow".equals(request.getParameter("type"));

		// 菜单文件根目录
		// roots : UI mobileUI UI2
		String rootsParam = request.getParameter("roots");
		// 菜单文件后缀 
		// file : .function.xml .function.m.xml
		String devicesParam = request.getParameter("devices");
		
		JSONArray rows = new JSONArray();

		Collection<String> roots = (rootsParam != null) ? Arrays.asList(rootsParam.split(",")) : JustepConfig.getUIRoots();
		
		if (SystemUtils.isEmptyString(devicesParam)){
			devicesParam = MenuUtils.DEVICE_PC + "," + MenuUtils.DEVICE_MOBILE; 
		}
		for (String root : roots) {
			Document menus = MenuUtils.getMenus(request, "/" + root, devicesParam);
			Element menuRoot = null;
			if (isFlow){
				menuRoot = filterFlowMenus(request, menus);
			}else{
				menuRoot = (Element) menus.selectSingleNode("/root");
			}
			menu2row(menuRoot, rows, null, "", isTree, identity);
		}

		JSONObject table = createTable(rows);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(table.toJSONString());
		out.flush();
	}
	
	private JSONObject createTable(JSONArray rows) {
		JSONObject table = new JSONObject();
		table.put("@type", "table");
		table.put("rows", rows);
		return table;
	}
	
	private void addRowValue(JSONObject row, String field, Object value) {
		JSONObject jo = new JSONObject();
		jo.put("value", value);
		row.put(field, jo);
	};
	
	private Object getRowValue(JSONObject row, String field) {
		return row.getJSONObject(field).get("value");
	}
	
	private JSONObject findRow(JSONArray rows, String process, String activity, String path) {
		Iterator<Object> it = rows.iterator();
		while (it.hasNext()) {
			Object o = it.next();
			if (o instanceof JSONObject) {
				JSONObject row = (JSONObject) o; 
				if (process.equals(getRowValue(row, "process")) && activity.equals(getRowValue(row, "activity")) && path.equals(getRowValue(row, "path"))) {
					return row;
				}
			}
		}
		return null;
	};
	
	private void menu2row(Element parent, JSONArray rows, String parentID, String parentPath, Boolean isTree, Boolean identity) {
		@SuppressWarnings("unchecked")
		List<Element> children = parent.elements();
		for (Element child : children) {
			String id = child.attributeValue("access_id") == null ? UUID.randomUUID().toString() : child.attributeValue("access_id");
			String label = child.attributeValue("label") == null ? "" : child.attributeValue("label");
			String url = child.attributeValue("url") == null ? "" : child.attributeValue("url"); 
			String process = child.attributeValue("process") == null ? "" : child.attributeValue("process"); 
			String activity = child.attributeValue("activity") == null ? "" : child.attributeValue("activity"); 
			String path = parentPath + "/" + label;
			boolean isFolder = (process == "");
			
			if (!isTree && isFolder) {
				menu2row(child, rows, null, path, isTree, identity);
			} else {
				JSONObject row = null;
				if (identity) {
					row = findRow(rows, process, activity, path);
				}
				if (row == null) {
					row = new JSONObject();
					addRowValue(row, "id", id);
					addRowValue(row, "parent", parentID);
					addRowValue(row, "label", label);
					addRowValue(row, "path", path);
					addRowValue(row, "isFolder", isFolder);
					addRowValue(row, "process", process);
					addRowValue(row, "activity", activity);
					addRowValue(row, "url", url);
					rows.add(row);
				}
				id = (String) getRowValue(row, "id");
				if (isTree) {
					if (!row.containsKey("rows")) {
						row.put("rows", new JSONArray());
					}
					menu2row(child, row.getJSONArray("rows"), id, path, isTree, identity);
				} else {
					menu2row(child, rows, null, path, isTree, identity);
				}
			}
		}
	}
	
}
