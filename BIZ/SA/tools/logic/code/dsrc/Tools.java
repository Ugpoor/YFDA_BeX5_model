import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.dom4j.*;
import org.dom4j.io.SAXReader;

import sun.misc.BASE64Decoder;

import com.justep.filesystem.FileSystemWrapper;
import com.justep.license.EncryptModel;


public class Tools {
	
	private static byte[] loadCert(Document cert) {
		if(null==cert) throw new RuntimeException("数字证书不能为空");
		Element root = cert.getRootElement();
		if(null==root) throw new RuntimeException("数字证书格式不正确");
		String content = root.elementTextTrim("content");
		if(null==content) throw new RuntimeException("数字证书格式不正确");
		return content.getBytes();
	}

	public static void encryptApp(Object cert,String password,String sourceModelPath,String targetModelPath,String app,String isCompile){
		if(null==password || "".equals(password)) throw new RuntimeException("数字证书密码不能为空");
		if(null==sourceModelPath || "".equals(sourceModelPath)) throw new RuntimeException("请指定原模型路径");
		if(null==targetModelPath || "".equals(targetModelPath)) throw new RuntimeException("请指定加密后模型存放路径");
		if(null==app || "".equals(app)) throw new RuntimeException("请指定需要加密的应用模块");
		if(sourceModelPath.equalsIgnoreCase(targetModelPath)) throw new RuntimeException("请把“加密后模型存放路径”设置在“原模型路径”不同的目录");
		try {
			password = java.net.URLDecoder.decode(password, "UTF8");
		} catch (UnsupportedEncodingException e1) {
			throw new RuntimeException("数字证书密码获取失败", e1);
		}
		SAXReader reader = new SAXReader();
		Document doc = null;
		try {
			doc = reader.read((InputStream)cert);
		} catch (DocumentException e) {
			throw new RuntimeException("数字证书格式不正确", e);
		}
		byte[] bCert = loadCert(doc);
		EncryptModel eapp = new EncryptModel(bCert, sourceModelPath, targetModelPath);
		try {
			String[] appList = app.split(";");
			for(int i=0; i<appList.length; i++)
				eapp.encrypt(appList[i], password, !"false".equalsIgnoreCase(isCompile));
		} catch (IOException e) {
			throw new RuntimeException("加密模型出错", e);
		}
	}

	public static Map<String,String> regAppLicense(String appLicense){
		if(null==appLicense || "".equals(appLicense)) throw new RuntimeException("请输入有效的应用License");
		BASE64Decoder decoder =new BASE64Decoder();
		try {
			Map<String,String> ret = new HashMap<String,String>();
			SAXReader reader = new SAXReader();
			reader.setEncoding("UTF-8");
			Document doc = reader.read(new ByteArrayInputStream(decoder.decodeBuffer(appLicense)));
			Element root = doc.getRootElement();
			String app = root.elementTextTrim("models");
			ret.put("app",app);
			String content = root.elementTextTrim("content");
			String appPath = FileSystemWrapper.instance().getRealPath(app);
			File fApp = new File(appPath);
			if(!fApp.exists()) throw new RuntimeException("应用模块\""+app+"\"不存在");
			File fAppLicenseDir = new File(appPath+"/license");
			fAppLicenseDir.mkdirs();
			FileOutputStream fo = null;
			try{
				fo = new FileOutputStream(appPath+"/license/license");
				fo.write(content.getBytes());
				fo.flush();
			}finally{
				if(null!=fo) fo.close();
			}	
			String developer = root.elementTextTrim("developer");
			ret.put("developer",developer);
			String validDate = root.elementTextTrim("valid-date");
			ret.put("valid-date",!"0".equals(validDate)?validDate:"不限");
			String userCount = root.elementTextTrim("user-count");
			ret.put("user-count",!"0".equals(userCount)?userCount:"不限");
			
			return ret;
		} catch (IOException e) {
			throw new RuntimeException("请输入有效的应用License", e);
		} catch (DocumentException e) {
			throw new RuntimeException("请输入有效的应用License", e);
		}
	}

}