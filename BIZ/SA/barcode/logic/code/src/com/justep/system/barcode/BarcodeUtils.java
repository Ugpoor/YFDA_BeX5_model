package com.justep.system.barcode;
import java.io.InputStream;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.helper.BarcodeHelper;

/**
 * @author wangyi
 * 参数单位：默认为mm,其它支持单位有厘米cm,像素pt,英尺in
 * config参数格式：{height:15mm,qz:enable,mw:0.9mm,wf:2.5mm,dpi:300,hrp:bottom,hrsize:12pt,hrfont:Helvetica}
 * height:高度(不等于最后图像大小)，图像像素=输入参数(mm)/25.4*dpi，(in=mm/25.4)
 * qz:条形码左右两边空白,(qz:disable,没有空白;qz:2,2mm宽空白)
 * mw:最窄的条码宽度,(mw:0.9mm)
 * wf:the factor by which wide bars are broader than narrow bars.
 * hrp:可读代码位置(top,bottom,none)
 * hrfont:可读代码字体
 * hrsize：可读代码字号
 * 注意：code93不支持数字带单位的格式如15mm，默认单位为像素
 */
public class BarcodeUtils {
	private static final Logger logger = Logger.getLogger(BarcodeUtils.class);
	public static InputStream execute(String type, String code, String config)
			throws Exception {
		HashMap<String, String> cfgmap = new HashMap<String, String>();
		if(!"{}".equals(config) && !"".equals(config)){
			try{
				String[] cfgAry = config.substring(1,config.length()-1).split(",");
				for(String s:cfgAry){
					String[] tmp = s.split(":");
					cfgmap.put(tmp[0], tmp[1]);
				}			
			}catch(Exception e){
				//logger.error("config参数解析出错");
				throw new RuntimeException("config参数解析出错！" + e.getMessage(), e);
			}			
		}
		return BarcodeHelper.encode(type, code, cfgmap);
	}
	
}
