import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;

import com.justep.common.SystemUtils;
import com.justep.filesystem.FileSystem;
import com.justep.filesystem.FileSystemWrapper;
import com.justep.message.UIMessages;
import com.justep.ui.JProcessor;
import com.justep.ui.WindowCompiler;
import com.justep.ui.exception.UIException;
import com.justep.ui.system.SystemComponentException;
import com.justep.ui.system.UISystemMessages;
import com.justep.ui.util.UIUtils;


public class GetWindowContent implements JProcessor  {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String window = request.getParameter("window");
		if (SystemUtils.isEmptyString(window)){
			throw SystemComponentException.create(UISystemMessages.GET_WINDOW_CONTENT_PARAM_NULL1, "window");
		}
		String xid = request.getParameter("xid");
		if (SystemUtils.isEmptyString(xid)){
			throw SystemComponentException.create(UISystemMessages.GET_WINDOW_CONTENT_PARAM_NULL1, "xid");
		}
		
		FileSystem fs = FileSystemWrapper.instance();
		String path = fs.getRealPath(window);
		if (!WindowCompiler.hasFile(path)){
			throw UIException.create(UIMessages.WINDOW_COMPILE_ERROR1, window);
		}
		
		File file = new File(path);
		if (file.exists() && file.isFile()){
			Document doc = WindowCompiler.loadWindow(path);
			Element node = (Element)doc.selectSingleNode("//*[@xid='" + xid + "']");
			if (node != null){
				UIUtils.outputXML(response, node.asXML().getBytes("UTF-8"));
			}else{
				throw SystemComponentException.create(UISystemMessages.GET_WINDOW_CONTENT_XID_NOT_EXIST2, file.getAbsolutePath(), xid);
			}
		}else{
			throw UIException.create(UIMessages.WINDOW_COMPILE_ERROR1, window);
		}
	}
	
}
