import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.baas.compiler.CompileContext;
import com.justep.baas.model.Action;
import com.justep.baas.model.ActionParam;
import com.justep.baas.model.DBConfig;
import com.justep.baas.model.ModelContext;
import com.justep.baas.model.Service;
import com.justep.system.transform.Utils;
import com.justep.ui.JustepConfig;
import com.justep.ui.resources.ResourceManagerWrapper;


public class GetBaasModel extends com.justep.ui.impl.JProcessorImpl  {
	
	private static String getBaasType(){
		String ret = "Baas";
		String filePath = ResourceManagerWrapper.instance().getRealPath("/UI2/system/config/studio.xml");
		File file = new File(filePath);
		if (file.exists() && file.isFile()) {
			try {
				SAXReader reader = new SAXReader();
				Document doc = reader.read(file);
				Element element = doc.getRootElement().element("baas");
				if(null!=element){
					element = element.element("project");
					if(null!=element){
						String str = element.getTextTrim();
						if(null!=str && !"".equals(str)) ret = str;
					}
				}
			}catch(Exception e) {
				//默认加载Baas的模型
			}
		}
		return ret;
	}
	
	private static void loadModelDir(ModelContext context, String sourceDir, Map<String, Service> services) throws IOException{
		File fSourceDir = new File(context.getModelDir()+sourceDir);
		if (!fSourceDir.exists())
			return;
		if (sourceDir.endsWith(".svn") || sourceDir.endsWith("out") || sourceDir.endsWith("bin") || sourceDir.endsWith("classes") || sourceDir.endsWith(".settings"))
			return;//.svn out bin classes不进行复制
		// 获取源文件夹当前下的文件或目录
		File[] file = fSourceDir.listFiles();
		for (int i = 0; i < file.length; i++) {
			if (file[i].isFile()) {
				// 源文件
				File sourceFile = file[i];
				String name = sourceFile.getName();
				if(!name.endsWith(".classpath") && !name.endsWith(".project")){
					if(name.endsWith(CompileContext.SERVICE_FILE_EXT)){
						String modelFile = sourceDir + (!"".equals(sourceDir)?"/":"") + name;
						services.put(modelFile, Service.loadService(context, modelFile));
					}
				}
			}
			if (file[i].isDirectory()) {
				// 准备复制的源文件夹
				String dir1 = sourceDir + (!"".equals(sourceDir)?"/":"") + file[i].getName();
				loadModelDir(context, dir1, services);
			}
		}
	}
	
	private static Map<String, Service> getServiceModels(ModelContext context) throws IOException{
		Map<String, Service> ret = new HashMap<String, Service>();
		
		loadModelDir(context,"",ret);
		
		return ret;
	}
	
	private static JSONObject param2Json(ActionParam param){
		if(null!=param){
			JSONObject ret = new JSONObject();
			ret.put("name", param.name);
			ret.put("value", param.value);
			ret.put("type", param.type);
			return ret;
		}
		return null;
	}
	
	private static JSONObject params2Json(Map<String,ActionParam> params){
		if(null!=params){
			JSONObject ret = new JSONObject();
			for(String key : params.keySet()){
				ret.put(key, param2Json(params.get(key)));
			}
			return ret;
		}
		return null;
	}
	
	private static JSONObject action2Json(Action action){
		if(null!=action){
			JSONObject ret = new JSONObject();
			ret.put("name", action.getName());
			ret.put("private", action.isPrivate());
			ret.put("privateParams", params2Json(action.getPrivateParams()));
			ret.put("publicParams", params2Json(action.getPublicParams()));
			return ret;
		}
		return null;
	}

	private static JSONObject service2Json(Service service){
		if(null!=service){
			JSONObject ret = new JSONObject();
			JSONArray actions = new JSONArray(); 
			for(Action action : service.getActions()){
				actions.add(action2Json(action));
			}
			ret.put("actions", actions);
			return ret;
		}
		return null;
	}
	
	private static String rewriteFilePath(String oldFilePath) {
		return oldFilePath.replace("\\", "/").replace("\\\\", "/");
	}
	
	private static String getServicePath(String path){
		if(Utils.isEmptyString(path)) return path;
		path = rewriteFilePath(path);
		if(path.endsWith(ModelContext.SERVICE_FILE_EXT)){
			path = path.substring(0,path.length()-ModelContext.SERVICE_FILE_EXT.length());
		}
		if(!path.startsWith("/")) path = "/" + path;
		return path;
	}
	
	private static JSONObject getServices(String baas) throws IOException{
		if(null==baas || "".equals(baas)) baas = getBaasType();
		String home = JustepConfig.getHome();
		String BAASModelRootPath = home+File.separator+"model"+File.separator+baas+File.separator;
		ModelContext context = new ModelContext(BAASModelRootPath);
		Map<String, Service> services = getServiceModels(context);
		JSONObject ret = new JSONObject();
		JSONObject jsonServices = new JSONObject();
		ret.put("services", jsonServices);
		for(String key : services.keySet()){
			jsonServices.put(getServicePath(key), service2Json(services.get(key)));
		}
		JSONObject jsonDBs = new JSONObject();
		ret.put("DBs", jsonDBs);
		DBConfig dbCfg = context.getDbConfig();
		for(String key : dbCfg.keySet()){
			jsonDBs.put(key, dbCfg.get(key));
		}
		return ret;
	}

	public void execute(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		String baas = request.getParameter("baas");
		//获取baas模型
		JSONObject ret = getServices(baas);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(ret.toString());
		out.flush();
	}
}
