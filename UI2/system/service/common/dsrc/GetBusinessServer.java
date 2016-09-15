import java.io.IOException;
import java.io.Writer;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.common.ServerConfig;
import com.justep.common.SystemUtils;
import com.justep.ui.JProcessor;


public class GetBusinessServer implements JProcessor  {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String result = "";//ServerConfig.getExternalServer(ServerConfig.BUSINESS_SERVER);
		if (SystemUtils.isEmptyString(result)){
			URL cur = new URL(req.getParameter("cur"));
			String protocol = cur.getProtocol();
			String host = cur.getHost();
			int port = cur.getPort();
			URL ui = new URL(ServerConfig.getUIServer());
			URL biz = new URL(ServerConfig.getBusinessServer());
			
			if (!ui.getProtocol().equals(biz.getProtocol()) 
					|| !ui.getHost().equals(biz.getHost())
					|| ui.getPort() != biz.getPort()){
				protocol = biz.getProtocol();
				host = biz.getHost();
				port = biz.getPort();
			}
			
			result = protocol + "://" + host + ((port!=-1) ? (":"+port) : "") + biz.getPath();
		}
		
		if (result == null) result = "";
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