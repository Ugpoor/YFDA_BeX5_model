import java.io.IOException;
import java.io.Writer;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.common.SystemUtils;
import com.justep.ui.JProcessor;
import com.justep.ui.util.NetUtils;


public class IndexUrl implements JProcessor  {
	private static final String IS_NEW = "__isNew";
	private static final String URL = "url";
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String result = "";
		String url = req.getParameter(URL);
		//String isNew = req.getParameter(IS_NEW);
		//if ("true".equals(isNew) && SystemUtils.isDebug() ){
			//调试模式, 返回
		//}else{
			if (SystemUtils.isNotEmptyString(url)){
				String vls = NetUtils.generateVLS(req, url);
				result = vls + SystemUtils.removeUI(url);
				Enumeration<String> names = req.getParameterNames();
				while (names.hasMoreElements()){
					String name = names.nextElement();
					if (!name.equals(URL) && !name.equals(IS_NEW) && !name.equals("_")){
						if (result.contains("?")){
							result += "&";
						}else{
							result += "?";
						}
						result += name + "=" + req.getParameter(name);
					}
				}
			}
		//}
		
		Writer writer = null;
		try{
			writer = resp.getWriter();
			writer.append(result);
		}catch(Exception e){
			
		}finally{
			if (writer != null)
				try {
					writer.close();
				} catch (IOException e) {
					
				}	
		}
	}
	
}
