import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.justep.biz.client.Action;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.ui.JustepConfig;
import com.justep.ui.util.NetUtils;


public class ImageManager extends com.justep.ui.impl.JProcessorImpl  {
	private static String SAVE_PATH = "concat('justep_public/',currentPersonID(),'/image')";
	private boolean useFileSystem = false;
	private int fileCount = 20;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imgStr ="";
		List<String> files = getFiles(request);
		for(String file : files){
			imgStr+= "'?file"+(!useFileSystem?"id":"")+"="+file+"',";
		}
		if(imgStr!=""){
	        imgStr = imgStr.substring(0,imgStr.lastIndexOf(",")).trim();
	    }
		response.getWriter().print("["+imgStr+"]");		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private List<String> getFiles(HttpServletRequest request){
		String pageIndex = request.getParameter("index");
		int iPageIndex = Integer.parseInt(pageIndex);
		if(useFileSystem) return getFilesByFileSys(iPageIndex);
		else return getFilesByDocServer(request, iPageIndex);
	}
	
	private List<String> getFilesByDocServer(HttpServletRequest request, int pageIndex){
		String bsessionID = NetUtils.getBSessionID(request);
		String language = NetUtils.getLanguage(request);
		Action ac = new Action();
		ac.setProcess("/SA/doc/system/systemProcess");
		ac.setActivity("mainActivity");
		ac.setName("queryDocFileIDs");
		//ac.setParameter("rootPath", value);
		ac.setParameter("subPath", SAVE_PATH);
		ac.setParameter("limit", fileCount);
		ac.setParameter("offset", pageIndex*fileCount);
		ActionResult ar = ActionEngine.invokeAction(ac, ActionUtils.JSON_CONTENT_TYPE, bsessionID, language, null);
		List<String> ret = new ArrayList<String>();
		if(ar.isSuccess()){
			List<Object> datas = ar.getDatas();
			if(datas.size()==1){
				JSONArray jret = (JSONArray)datas.get(0);
				for(int i=0; i<jret.size(); i++){
					try {
						ret.add(jret.getString(i));
					} catch (JSONException e) {
					}
				}
			}
		}
			
		return ret;
	}
	
	private List<String> getFilesByFileSys(int pageIndex){
		String realpath = JustepConfig.getUeditorDataDir()+SAVE_PATH;
		List<String> files = _getFiles(realpath,new ArrayList<String>(),SAVE_PATH+"/");
		List<String> ret = new ArrayList<String>();
		for(int i=pageIndex*fileCount; i<Math.min(files.size(), (pageIndex+1)*fileCount); i++){
			ret.add(files.get(i));
		}
		return ret;
	}
	
	private List<String> _getFiles(String realpath, List<String> files, String path) {
		File realFile = new File(realpath);
		if (realFile.isDirectory()) {
			File[] subfiles = realFile.listFiles();
			for(File file :subfiles ){
				if(file.isDirectory()){
					_getFiles(file.getAbsolutePath(),files,path+file.getName()+"/");
				}else{
					if(!getFileType(file.getName()).equals("")) {
						files.add(path+file.getName());
					}
				}
			}
		}
		return files;
	}

	private String getFileType(String fileName){
		String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
		Iterator<String> type = Arrays.asList(fileType).iterator();
		while(type.hasNext()){
			String t = type.next();
			if(fileName.endsWith(t)){
				return t;
			}
		}
		return "";
	}	
}
