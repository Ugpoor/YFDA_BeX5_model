import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.cache.SystemCache;


public class ClearSystemCache extends com.justep.ui.impl.JProcessorImpl  {
	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		SystemCache.cache.clear();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write("system cache clear success!");
		out.flush();
	}
}
