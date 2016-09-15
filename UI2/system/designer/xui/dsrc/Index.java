import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Index extends com.justep.ui.impl.JProcessorImpl  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String uiPath = request.getParameter("uiPath");
		String designerDir = request.getParameter("designerDir");
		if(designerDir == null || designerDir.equals("")){
			designerDir = "xui";
		}
		 
		String UIDirName = uiPath.substring(uiPath.lastIndexOf("/")+1);
 
		String uiServerPort = request.getParameter("UIServerPort");
		String contextPathName = request.getParameter("contextPathName");
		String templateFilePath = uiPath+"/system/designer/"+designerDir+"/index_template.html";
	 
		String baseUrl = "http://localhost:"+uiServerPort+"/"+contextPathName+"/"+UIDirName;
		
		String content = readTemplateContent(templateFilePath);
		content = content.replace("{baseUrl}", baseUrl);
		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(content);
	}
	
	public String readTemplateContent(String fileName)  {
		if (fileName == null || fileName.equals("")) {
			return "";//throw new Exception("文件名不能为空！");
		}
		StringBuffer sbf = new StringBuffer();
		try{
			File file = new File(fileName);
			if (!file.exists()) {
				return "";
			}
	
			InputStream in = new FileInputStream(file);
	
			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
			
			String str;
			while ((str = reader.readLine()) != null) {
				sbf.append(str + "\n");
			}
			reader.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return sbf.toString().trim();
	}
}
