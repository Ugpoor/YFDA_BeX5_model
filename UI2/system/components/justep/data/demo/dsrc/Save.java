import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.filesystem.FileSystemWrapper;
import com.justep.ui.JavaServer;

public class Save extends com.justep.ui.impl.JProcessorImpl  {
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fileName = FileSystemWrapper.instance().getRealPath(
				"/UI2/system/components/justep/data/demo/save.json");
		File outFile = new File(fileName);
		OutputStream ro = new FileOutputStream(outFile);
		String postData = JavaServer.getPostData(request);
		byte[] b = postData.getBytes("UTF-8");
		ro.write(b);
		ro.flush();
		ro.close();
	}
}
