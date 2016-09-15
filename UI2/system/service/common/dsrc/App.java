import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.common.Logger;

import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionUtils;
import com.justep.common.SystemUtils;
import com.justep.ui.JProcessor;
import com.justep.ui.resources.ResourceManagerWrapper;
import com.justep.ui.util.NetUtils;
import com.justep.ui.util.PageUtils;

/**
  		要求返回的数据结构如下： 
  	{ 
  		"resourceInfo": { 
  			"indexURL": "/demo/updateApp/mainActivity.w?language=zh_CN&skin=", 
  			"version": "v-xxxx-zh_CN-", 
  			"downloadUrl": "/takeout/www.zip", 
  			"mode": 2, 
  			"appVersion": ">=5.5.0"
  		}, 
  		"appInfo": { 
  			"androidApp": { 
  				"version": "5.5.0", 
  				"changeLog": "1. 这是为了演示WeX5 app版本更新能力。\n 2. 别点我",
  				"downloadUrl": "http://xxxxx" 
  			},
  			"iosApp": { 
  				"version": "5.5.0", 
  				"changeLog": "1. 这是为了演示WeX5 app版本更新能力。\n 2. 别点我",
  				"downloadUrl": "http://xxxxx"
  			} 
  		} 
  	} 
  		原理： 根据url指定的首页地址，到首页同目录下查找appMetadata.json文件，appMetadata.json文件的格式如下所示，如果找到则返回文件的内容，
 	否则只返回url的版本号，结构如下：
 		{ "resourceInfo": { "version": "v-xxxx-zh_CN-" } }
 */
public class App implements JProcessor {
	private static final String URL = "url";
	private static final String RESOURCE_INFO = "resourceInfo";
	private static final String VERSION = "version";
	private static final String INDEX_URL = "indexURL";
	private static final Logger logger = Logger.getLogger(App.class);

	private JSONObject getAppConfig(String url) {
		JSONObject result = null;
		try {
			int index = url.lastIndexOf("/");
			if (index != -1) {
				String path = url.substring(0, index) + "/appMetadata.json";
				String filePath = ResourceManagerWrapper.instance().getRealPath(path);
				File file = new File(filePath);
				if (file.exists() && file.isFile()) {
					String content = PageUtils.readFileToString(file);
					result = JSONObject.parseObject(content);
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage() + "", e);

		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONObject result = new JSONObject();
		String url = req.getParameter(URL);
		if (SystemUtils.isNotEmptyString(url)) {
			url = "/UI2" + url;
			result = getAppConfig(url);
			String vls = NetUtils.generateVLS(req, url);
			if (result == null) {
				result = new JSONObject();
				JSONObject resourceInfo = new JSONObject();
				result.put(RESOURCE_INFO, resourceInfo);
				resourceInfo.put(VERSION, vls);
			} else {
				JSONObject resourceInfo = (JSONObject) result.get(RESOURCE_INFO);
				if (resourceInfo == null){
					resourceInfo = new JSONObject();
					result.put(RESOURCE_INFO, resourceInfo);
				}
				
				resourceInfo.put(VERSION, vls);
				
				String indexUrl = resourceInfo.getString(INDEX_URL);
				if (SystemUtils.isNotEmptyString(indexUrl)) {
					Enumeration<String> names = req.getParameterNames();
					while (names.hasMoreElements()) {
						String name = names.nextElement();
						if (!name.equals(URL) && !name.equals("_")) {
							if (indexUrl.contains("?")) {
								indexUrl += "&";
							} else {
								indexUrl += "?";
							}
							indexUrl += name + "=" + req.getParameter(name);
						}
					}

					resourceInfo.put(INDEX_URL, indexUrl);
				}
			}
		}

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		OutputStream output = resp.getOutputStream();
		output.write(result.toJSONString().getBytes("UTF-8"));
		output.flush();
		output.close();
	}

}
