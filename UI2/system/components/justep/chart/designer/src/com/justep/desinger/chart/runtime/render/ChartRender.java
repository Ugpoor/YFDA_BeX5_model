package com.justep.desinger.chart.runtime.render;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.JFreeChart;

import com.justep.chart.BuildChart;
import com.justep.chart.config.transform.ChartConfigTransform;
import com.justep.desinger.chart.runtime.data.ChartTempDataHelper;


public class ChartRender {

	private String returnChartFileAbsPath;
	private Element chartComponentE;

	private Document configDoc;
	private Document dataDoc;
	
	private int chartWidth = 500;
	private int chartHeight = 375;
	
	/**
	 * 图表
	 * @param configDoc
	 * @param dataDoc
	 */
	public ChartRender(Element chartComponentE ,int chartWidth ,int chartHeight){
		this.chartWidth = chartWidth;
		this.chartHeight = chartHeight;
		Element seriesSetE = (Element) chartComponentE.selectSingleNode("//series-set");
		Document dataDoc = ChartTempDataHelper.generateTempDataDoc(seriesSetE);
		this.chartComponentE = chartComponentE;
		this.dataDoc = dataDoc;
	}
	
	/**
	 * 图表
	 * @param configDoc
	 * @param dataDoc
	 */
	public ChartRender(Element chartComponentE ,Document dataDoc){
		this.chartComponentE = chartComponentE;
		this.dataDoc = dataDoc;
	}
	
	/**
	 * 执行图表
	 * @return
	 */
	public String executeChart(){
		StringBuffer sb = new StringBuffer();
		
		//用户自定义配置
		Document chartConfigDoc = DocumentHelper.createDocument();
		Element rootE = chartConfigDoc.addElement("chart");		
		Element sChartE = (Element) this.chartComponentE.selectSingleNode(".//child::*[name()='chart']");
		rootE.add((Element)sChartE.element("config").clone());
		rootE.add((Element)sChartE.element("series-set").clone());
		
		System.out.println(chartConfigDoc.asXML());
		//模板转换
		ChartConfigTransform chartConfigTransform = new ChartConfigTransform();
		this.configDoc = chartConfigTransform.transform(chartConfigDoc);

		//构造图表图片
		BuildChart buildChart = new BuildChart(configDoc,dataDoc);
		JFreeChart chart = null;
		try {
			chart = buildChart.createChart();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ChartRenderingInfo info = new ChartRenderingInfo();
		
		String tempAbsPath = System.getProperty("java.io.tmpdir");
		tempAbsPath = tempAbsPath.replaceAll("\\\\", "/");
		if(!tempAbsPath.endsWith("/")){
			tempAbsPath +="/";
		}
		
		String chartFileName = "";
		try {
			chartFileName = ChartFileUtil.saveChartAsPNG(chart, chartWidth, chartHeight, info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		this.returnChartFileAbsPath = tempAbsPath + chartFileName;

		//sb.append("<img src='"+this.returnChartFileAbsPath+"' width='"+w+"' height='"+h+"' border='0'/>");
		
		//System.out.println(this.returnChartFileAbsPath);
		
		sb.append(this.returnChartFileAbsPath);
		
		return sb.toString();
	}

	
	public Document getConfigDoc() {
		return configDoc;
	}

	public void setConfigDoc(Document configDoc) {
		this.configDoc = configDoc;
	}

	public Document getDataDoc() {
		return dataDoc;
	}

	public void setDataDoc(Document dataDoc) {
		this.dataDoc = dataDoc;
	}

	public String getReturnChartFileAbsPath() {
		return returnChartFileAbsPath;
	}

	public void setReturnChartFileAbsPath(String returnChartFileAbsPath) {
		this.returnChartFileAbsPath = returnChartFileAbsPath;
	}

	
}
