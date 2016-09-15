import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.common.SystemUtils;
import com.justep.ui.JProcessor;
import com.justep.ui.util.NetUtils;


public class Vls implements JProcessor {

	public void execute(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		String url = request.getParameter("path");
		String result = "no";
		if (SystemUtils.isNotEmptyString(url)){
			result = NetUtils.generateVLS(request, url);
		}
		
		Writer writer = null;
		try{
			writer = response.getWriter();
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
