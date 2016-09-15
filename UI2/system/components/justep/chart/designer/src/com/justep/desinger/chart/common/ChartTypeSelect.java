package com.justep.desinger.chart.common;

import java.util.ArrayList;
import java.util.List;

import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiElement;


public class ChartTypeSelect {

	private void addChartTypeList(List<String[]> chartTypeList ,String key, String label){
		String [] temp = new String [2];
		temp[0]= key;
		temp[1]= label;
		chartTypeList.add(temp);
	}
	
	
	public List<String []> getChartTypeList(PropertyItem propertyItem){
		List<String[]> chartTypeList = new ArrayList<String []>();
		
		
		
		XuiElement cE = (XuiElement)propertyItem.getOwerElement();
		
		String baseChartType = cE.getProperyValue("chart-type");
		
		if (baseChartType.indexOf("pie") != -1) {	
			
			addChartTypeList(chartTypeList,"pie","饼图");
			addChartTypeList(chartTypeList,"pie-3d","3D饼图");
			
		}else if(baseChartType.indexOf("bar") != -1) {

			addChartTypeList(chartTypeList,"vertical-bar","垂直柱状图");
			addChartTypeList(chartTypeList,"vertical-bar-3d","垂直3D柱状图");
			addChartTypeList(chartTypeList,"stacked-vertical-bar","垂直堆叠柱状图");
			addChartTypeList(chartTypeList,"stacked-vertical-bar-3d","垂直堆叠3D柱状图");
			addChartTypeList(chartTypeList,"cylinder-vertical-bar","垂直圆柱图");
			addChartTypeList(chartTypeList,"cylinder-vertical-bar-3d","垂直3D圆柱图");
			
			addChartTypeList(chartTypeList,"horizontal-bar","水平柱状图");
			addChartTypeList(chartTypeList,"horizontal-bar-3d","水平3D柱状图");
			addChartTypeList(chartTypeList,"stacked-horizontal-bar","水平堆叠柱状态图");
			addChartTypeList(chartTypeList,"stacked-horizontal-bar-3d","水平堆叠3D柱状图");
			addChartTypeList(chartTypeList,"cylinder-horizontal-bar","水平圆柱图");
			addChartTypeList(chartTypeList,"cylinder-horizon-bar-3d","水平3D圆柱图");
			
			
			
		}else if(baseChartType.indexOf("xy-line") != -1) {
			
			addChartTypeList(chartTypeList,"vertical-xy-line","垂直XY线图");
			addChartTypeList(chartTypeList,"horizontal-xy-line","水平XY线图");
			
		}else if(baseChartType.indexOf("line") != -1) {
			
			addChartTypeList(chartTypeList,"vertical-line","垂直线图");
			addChartTypeList(chartTypeList,"vertical-line-3d","垂直3D线图");
			addChartTypeList(chartTypeList,"horizontal-line","水平线图");
			addChartTypeList(chartTypeList,"horizontal-line-3d","水平3D线图");
			
		}else if(baseChartType.indexOf("area") != -1) {
			
			addChartTypeList(chartTypeList,"vertical-area","垂直面积图");
			addChartTypeList(chartTypeList,"horizontal-area","水平面积图");
			
		}else if(baseChartType.indexOf("time") != -1) {
			addChartTypeList(chartTypeList,"time-series","时序图");
			
		}else if(baseChartType.indexOf("simple-meter") != -1) {
			addChartTypeList(chartTypeList,"simple-meter","简单仪表盘");

		}else if(baseChartType.indexOf("dial-meter") != -1) {
			addChartTypeList(chartTypeList,"dial-meter","刻度盘");

		}else if(baseChartType.indexOf("arc-dial-meter") != -1) {
			addChartTypeList(chartTypeList,"arc-dial-meter","弧度刻度盘");

		}else if(baseChartType.indexOf("thermometer-meter") != -1) {
			addChartTypeList(chartTypeList,"thermometer-meter","温度计");

		}else if(baseChartType.indexOf("gantt") != -1) {
			
			addChartTypeList(chartTypeList,"vertical-gantt","垂直甘特图");
			addChartTypeList(chartTypeList,"horizontal-gantt","水平甘特图");
			
		}else if(baseChartType.indexOf("radar") != -1) {
			addChartTypeList(chartTypeList,"radar","雷达图");
			
		}
		
		
		return chartTypeList;
		
		
	}

	
	
}
