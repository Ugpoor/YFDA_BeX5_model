package com.justep.desinger.chart.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.desinger.chart.common.ChartConstant;

public class ChartConfigHelper {
		
	private Document defaultConfigDocument;
		
	public static ChartConfigHelper chartConfigHelper = null;
	
	public static ChartConfigHelper getChartConfigHelper(){
		if(chartConfigHelper == null){
			chartConfigHelper = new ChartConfigHelper();
			chartConfigHelper.defaultConfigDocument = chartConfigHelper.initDefaultConfigDocument();
		}
		return chartConfigHelper;
	}
	
	public Document initDefaultConfigDocument(){
		Document doc = null;
		SAXReader reader = new SAXReader();
		String templatePath = ChartConstant.basePath +"/res/default-chart-config-template.xml";
		try {
			FileInputStream  fis = new FileInputStream(new File(templatePath));
			doc = reader.read(fis);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return doc;
	}
	
	/**
	 * 
	 * @param chartType
	 * @param tagName
	 * @param tagValue
	 * @param attrMap
	 * @return
	 */
	public boolean compare(String chartType ,String tagName , String tagValue, HashMap<String,String> attrMap){
		boolean b_flag = false;
		
		String xpath="";
		if(chartType.equalsIgnoreCase("common")){
			xpath = "./charts/public/config/"+tagName;
		}else{
			xpath = "./charts/private//chart[contains(@type,concat('|','"+chartType+"','|'))]/series-set/series/config/"+tagName;			
		}
		
		Element defaultE = (Element) defaultConfigDocument.selectSingleNode(xpath);
		if(defaultE == null){
			b_flag = true;
		}else{
			b_flag = compareElement(defaultE,tagValue,attrMap);
		}
		
		return b_flag;
	}
	
	/**
	 * 
	 * @param defaultE
	 * @param tagValue
	 * @param attrMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean compareElement(Element defaultE ,String tagValue, HashMap<String,String> attrMap){
		boolean b_flag = false;
		
		String defaultValue = defaultE.getText();
		if(!defaultValue.equals(tagValue)){
			b_flag = true;
		}else{
			Iterator<?> it = attrMap.entrySet().iterator();
			while(it.hasNext()){
				Map.Entry<String,String> entry = (Map.Entry<String,String>)it.next();
				String key = entry.getKey();
				String value = entry.getValue();
				String dv = defaultE.attributeValue(key);
				if(dv!= null && !dv.equals(value)){
					b_flag = true;
					break;
				}
			}
		}
		
		return b_flag;
	}

	
	public Document getDefaultConfigDocument() {
		return defaultConfigDocument;
	}

	public void setDefaultConfigDocument(Document defaultConfigDocument) {
		this.defaultConfigDocument = defaultConfigDocument;
	}

	
}
