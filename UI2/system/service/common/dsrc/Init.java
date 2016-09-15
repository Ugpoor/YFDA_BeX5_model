import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.StreamCallback;
import com.justep.ui.util.NetUtils;

public class Init implements com.justep.ui.JProcessor{
	
	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		java.util.Date date = new java.util.Date();
		response.setDateHeader("Last-Modified",date.getTime());  
		response.setDateHeader("Expires",date.getTime()+((long)1000*60*60*24));//缓存一天  

		response.setHeader("Cache-Control", "public");  
		response.setHeader("Pragma", "Pragma");

		String bsessionID = NetUtils.getBSessionID(request);
		Map<String,String> mMap = new HashMap<String,String>();
		mMap.put("process", "/SA/OPM/system/systemProcess");
		mMap.put("activity", "mainActivity");
		mMap.put("action", "getSysCode");
		mMap.put("bsessionid", bsessionID);
		String params = "";
		for(Object k : mMap.keySet()){
			String name = (String)k;
			params += (!"".equals(params)?"&":"") + java.net.URLEncoder.encode(name, "utf-8") +"="+java.net.URLEncoder.encode(mMap.get(name), "utf-8");
		}
		String accept = NetUtils.getAccept(request);
		String contentType = NetUtils.getContentType(request);
		String language = NetUtils.getLanguage(request);
		ActionEngine.getSysCode(params, accept, contentType, bsessionID, language, new StreamCallback(response));
	}
}