package com.justep.chart.validate;

import java.io.InputStream;
import java.util.HashMap;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.io.SAXReader;

public class ValidateRuleManager {

	public static HashMap<String ,Document> ruleMap = new HashMap<String ,Document>();
	
	public static Document generateRuleDoc(String chartType){
		Document ruleDoc = null;
		String path = "";
		String type = "|" + chartType + "|";		
		if (ValidateConstant.PIE_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_PIE_RULE_PATH;
		} else if (ValidateConstant.BAR_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_BAR_RULE_PATH;
		} else if (ValidateConstant.LINE_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_LINE_RULE_PATH;
		} else if (ValidateConstant.XY_LINE_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_XYLINE_RULE_PATH;
		} else if (ValidateConstant.AREA_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_AREA_RULE_PATH;
		} else if (ValidateConstant.TIME_SERIES_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_TIME_RULE_PATH;
		} else if (ValidateConstant.METER_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_METER_RULE_PATH;
		} else if (ValidateConstant.GANTT_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_GANTT_RULE_PATH;
		} else if (ValidateConstant.RADAR_TYPE.indexOf(type) != -1) {
			path = ValidateConstant.CHART_VALIDATE_RADAR_RULE_PATH;
		}else if(type.equalsIgnoreCase("|base|")){
			path = ValidateConstant.CHART_VALIDATE_BASE_RULE_PATH;
		}else if(type.equalsIgnoreCase("|base-frame|")){
			path = ValidateConstant.CHART_VALIDATE_BASE_FRAME_RULE_PATH;
		}
		
		if(ruleMap.containsKey(path)){
			return ruleMap.get(path);
		}
		
		if(!path.equals("")){
			SAXReader reader = new SAXReader();
			InputStream is = ValidateRuleManager.class.getResourceAsStream(path);
			try {
				ruleDoc = reader.read(is);
			} catch (DocumentException e) {
				e.printStackTrace();
			}			
			ruleMap.put(path, ruleDoc);
		}else{
			ruleDoc = DocumentHelper.createDocument();
		}
		
		return ruleDoc;
	}
	
	
	
}
