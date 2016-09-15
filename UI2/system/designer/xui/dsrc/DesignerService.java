import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionUtils;
import com.justep.common.SystemUtils;
import com.justep.ui.min.MinEngineUtils;
import com.justep.ui.util.NetUtils;

/**
 * UI设计器服务类.
 * @author zmh
 *
 */

public class DesignerService extends com.justep.ui.impl.JProcessorImpl  {
	
	/**
	 * 获取依赖的js和css文件.
	 */
	public String getDepends(HttpServletRequest request){
		String componentUrls = request.getParameter("componentUrls");

		String[] compUrls = componentUrls.split(",");
		Set<String> set = new HashSet<String>();
		for(String compUrl:compUrls){
			compUrl = SystemUtils.addModelVar(NetUtils.processUIVar(request, compUrl));
			set.add(compUrl);
		}
		//获取依赖的js和css文件
		List<String> jsDependList = MinEngineUtils.getMinJsByComponents(set);
		List<String> cssDependList = MinEngineUtils.getMinCssByComponents(set);
		
		List<String> newJsDependList = new ArrayList<String>();
		for(int i = 0;i<jsDependList.size();i+=1){
			String item = jsDependList.get(i);
			//默认加载
			if(item.contains("/system/core.min")){
			  continue;
			}
			int idx2 = item.lastIndexOf(".");
			if(  idx2>0){
				item = item.substring(0,idx2);
			}
			newJsDependList.add(item);
		}
		
		for(int i = 0;i<cssDependList.size();i+=1){
			String item = cssDependList.get(i);
			int idx2 = item.lastIndexOf(".");
			if(  idx2>0){
				item = item.substring(0,idx2);
			}
			cssDependList.set(i, "css!"+item);
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("jsDependList", newJsDependList);
		jsonObj.put("cssDependList", cssDependList);
		return jsonObj.toJSONString();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		String result = getDepends(request);

		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		response.getWriter().write(result);
		response.flushBuffer();
	}
	
	public static void main(String[] args){
		List<String> list = new ArrayList<String>();
		list.add("dlfaj");
		
		JSONArray array = (JSONArray)JSONArray.toJSON(list);
		
		System.out.println(array.toJSONString());
	}

}
