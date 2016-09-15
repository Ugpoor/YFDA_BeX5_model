import java.io.IOException;
import java.io.Writer;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.system.transform.SimpleTransform;
import com.justep.ui.JProcessor;


public class GetSystemDatetime implements JProcessor  {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cur = SimpleTransform.transToString(new java.sql.Timestamp(new Date().getTime()));
		Writer writer = null;
		try{
			writer = resp.getWriter();
			writer.append(cur);
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
