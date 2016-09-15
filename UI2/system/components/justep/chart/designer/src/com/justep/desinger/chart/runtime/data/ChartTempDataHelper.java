package com.justep.desinger.chart.runtime.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Namespace;
import org.dom4j.QName;

import com.justep.chart.ChartConstant;

public class ChartTempDataHelper {

	
	public static final Namespace RDL_NS = new Namespace("rdl", "http://www.justep.com/RDL");
	public static final int TEMP_DATA_NUMBER = 3;
	
	
	/**
	 * 产生图表临时数据
	 * @param seriesSetE
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Document generateTempDataDoc(Element seriesSetE){
		Document doc = DocumentHelper.createDocument();
		Element rootE = doc.addElement(new QName("datasets",RDL_NS));
		if(seriesSetE == null){
			return doc;
		}
		
		HashMap<String ,ArrayList<DataFeild>> dataMap = generateDataMap(seriesSetE);
		
		Iterator<?> it = dataMap.entrySet().iterator();
		while(it.hasNext()){
			Map.Entry<String, ArrayList<DataFeild>> entry = (Map.Entry<String, ArrayList<DataFeild>>)it.next();
			String key = entry.getKey();
			ArrayList<DataFeild> dataFeildList = entry.getValue();
			
			
			Element datasetE = rootE.addElement(new QName("dataset",RDL_NS));
			datasetE.addAttribute("id", key);
			Element datasE = datasetE.addElement("datas");
			
			for(int k=0; k<TEMP_DATA_NUMBER; k++){
				Element recordE = DocumentHelper.createElement("record");			
				for(int i=0; i<dataFeildList.size(); i++){
					DataFeild dataFeild = dataFeildList.get(i);
					String dn = dataFeild.getFeildName();
					String dt = dataFeild.getFeildType();
					
					Element dnE = recordE.addElement(dn);					
					if(dt.equalsIgnoreCase("categoryAxis")){
						dnE.setText("Category"+k);
					}else if(dt.equalsIgnoreCase("numberAxis")){
						dnE.setText(""+(10*(k+1)));
					}else if(dt.equalsIgnoreCase("title")){
						dnE.setText("Group"+k);
					}else if(dt.equalsIgnoreCase("value")){
						dnE.setText(""+(10*(k+1)));
					}else if(dt.equalsIgnoreCase("startDate")){
						dnE.setText("2010-"+(k+1)+"-01");
					}else if(dt.equalsIgnoreCase("endDate")){
						dnE.setText("2010-"+(k+1)+"-30");
					}					
				}
				datasE.add(recordE);				
			}
		}
		
		//System.out.println(doc.asXML());
		return doc;
	}
	
	
	/**
	 * 
	 * @param seriesSetE
	 * @return
	 */
	private static HashMap<String ,ArrayList<DataFeild>> generateDataMap(Element seriesSetE){
		HashMap<String ,ArrayList<DataFeild>> dataMap = new HashMap<String ,ArrayList<DataFeild>>();
		if(seriesSetE == null){
			return dataMap;
		}
		
		List<?> seriesList = seriesSetE.elements("series");
		for( int i=0; i<seriesList.size(); i++){
			Element seriesE = (Element) seriesList.get(i);			
			String chartType = seriesE.attributeValue("chart-type");
			String type = "|" + chartType + "|";
			if (ChartConstant.PIE_TYPE.indexOf(type) != -1) {				
				generatePieDataMap(dataMap ,seriesE);
			} else if (ChartConstant.BAR_TYPE.indexOf(type) != -1 || ChartConstant.LINE_TYPE.indexOf(type) != -1 
					|| ChartConstant.XY_LINE_TYPE.indexOf(type) != -1 || ChartConstant.AREA_TYPE.indexOf(type) != -1 
					||ChartConstant.TIME_SERIES_TYPE.indexOf(type) != -1 || ChartConstant.RADAR_TYPE.indexOf(type) != -1 ) {
				generateBarDataMap(dataMap ,seriesE);				
			}else if (ChartConstant.METER_TYPE.indexOf(type) != -1) {
				generateMeterDataMap(dataMap ,seriesE);
			} else if (ChartConstant.GANTT_TYPE.indexOf(type) != -1) {
				generateGanttDataMap(dataMap ,seriesE);
			} 	
		}
		
		return dataMap;
	}
	
	
	
	/**
	 * 
	 * @param dataMap
	 * @param seriesE
	 */
	private static void generatePieDataMap(HashMap<String ,ArrayList<DataFeild>> dataMap ,Element seriesE){
		String baseRef = seriesE.attributeValue("ref");		
		Element dataE = seriesE.element("data");
		if(dataE == null){
			return;
		}
		String ref = dataE.attributeValue("ref");
		if(ref == null || ref.equals("")){
			ref = baseRef;
		}
		String categoryAxis = dataE.attributeValue("categoryAxis");
		String numberAxis = dataE.attributeValue("numberAxis");
		
		ArrayList<DataFeild> feildList = dataMap.get(ref);
		if(feildList == null){
			feildList = new ArrayList<DataFeild>();
			dataMap.put(ref, feildList);
		}
		
		if(!contains(feildList,categoryAxis)){			
			feildList.add(new DataFeild(categoryAxis,"categoryAxis"));		
		}
		
		if(!contains(feildList,numberAxis)){					
			feildList.add(new DataFeild(numberAxis,"numberAxis"));
		}
		
	} 
	
	
	/**
	 * 获取柱图等数据字段信息
	 * @param dataMap
	 * @param seriesE
	 */
	private static void generateBarDataMap(HashMap<String ,ArrayList<DataFeild>> dataMap ,Element seriesE){
		String baseRef = seriesE.attributeValue("ref");		
		String chartType = seriesE.attributeValue("chart-type");
		
		List<?> dataList = seriesE.elements("data");
		for(int i=0; i<dataList.size(); i++){
			Element dataE = (Element) dataList.get(i);
			String ref = dataE.attributeValue("ref");
			if(ref == null || ref.equals("")){
				ref = baseRef;
			}
			
			ArrayList<DataFeild> feildList = dataMap.get(ref);
			if(feildList == null){
				feildList = new ArrayList<DataFeild>();
				dataMap.put(ref, feildList);
			}
			
			String autoData = dataE.attributeValue("autoData");
			String title = dataE.attributeValue("title");
			String categoryAxis = dataE.attributeValue("categoryAxis");
			String numberAxis = dataE.attributeValue("numberAxis");
			
			if(autoData != null && autoData.equalsIgnoreCase("true")){		
				if(!contains(feildList,title)){			
					feildList.add(new DataFeild(title,"title"));		
				}
			}
			
			if(!contains(feildList,categoryAxis)){	
				if(ChartConstant.XY_LINE_TYPE.indexOf(chartType) != -1){
					feildList.add(new DataFeild(categoryAxis,"numberAxis"));
				}else if(ChartConstant.TIME_SERIES_TYPE.indexOf(chartType) != -1){
					feildList.add(new DataFeild(categoryAxis,"startDate"));				
				}else{
					feildList.add(new DataFeild(categoryAxis,"categoryAxis"));
				}
			}
			
			if(!contains(feildList,numberAxis)){					
				feildList.add(new DataFeild(numberAxis,"numberAxis"));
			}
			
			if(autoData != null && autoData.equalsIgnoreCase("true")){					
				break;
			}
			
		}
	}
	
	/**
	 * 获取仪表盘数据字段信息
	 * @param dataMap
	 * @param seriesE
	 */
	private static void generateMeterDataMap(HashMap<String ,ArrayList<DataFeild>> dataMap ,Element seriesE){
		String baseRef = seriesE.attributeValue("ref");		
		Element dataE = seriesE.element("data");
		if(dataE == null){
			return;
		}
		String ref = dataE.attributeValue("ref");
		if(ref == null || ref.equals("")){
			ref = baseRef;
		}
		
		ArrayList<DataFeild> feildList = dataMap.get(ref);
		if(feildList == null){
			feildList = new ArrayList<DataFeild>();
			dataMap.put(ref, feildList);
		}
		
		String value = dataE.attributeValue("value");
		if(!contains(feildList,value)){			
			feildList.add(new DataFeild(value,"value"));		
		}		
		
	}
	
	
	/**
	 * 获取甘特图数据字段信息
	 * @param dataMap
	 * @param seriesE
	 */
	private static void generateGanttDataMap(HashMap<String ,ArrayList<DataFeild>> dataMap ,Element seriesE){
		String baseRef = seriesE.attributeValue("ref");		
		
		List<?> dataList = seriesE.elements("data");
		for(int i=0; i<dataList.size(); i++){
			Element dataE = (Element) dataList.get(i);
			String ref = dataE.attributeValue("ref");
			if(ref == null || ref.equals("")){
				ref = baseRef;
			}

			ArrayList<DataFeild> feildList = dataMap.get(ref);
			if(feildList == null){
				feildList = new ArrayList<DataFeild>();
				dataMap.put(ref, feildList);
			}
			
			String categoryAxis = dataE.attributeValue("categoryAxis");
			String startDate = dataE.attributeValue("startDate");
			String endDate = dataE.attributeValue("endDate");
			
			if(!contains(feildList,categoryAxis)){			
				feildList.add(new DataFeild(categoryAxis,"categoryAxis"));		
			}
			
			if(!contains(feildList,startDate)){					
				feildList.add(new DataFeild(startDate,"startDate"));
			}
			
			if(!contains(feildList,endDate)){					
				feildList.add(new DataFeild(endDate,"endDate"));
			}
			
		}
	}
	
	private static boolean contains(ArrayList<DataFeild> dataFeildList,String feildName){
		boolean b = false;
		for(int i=0; i<dataFeildList.size(); i++){
			DataFeild dataFeild = dataFeildList.get(i);
			String dfn = dataFeild.getFeildName();
			if(dfn.equalsIgnoreCase(feildName)){
				b = true;
				break;
			}
		}
		return b;
	}
	
	//dataRef = String.format(".//child::*[name() ='rdl:dataset' and @id = '%s']/child::*/child::*[name()='record']/", dataRef);
	/*
	<rdl:datasets>
		<rdl:dataset id="s1">
			<datas>
				<record>
					
				</record>
			</datas>
		</rdl:dataset>
	</rdl:datasets>
	 */
}
