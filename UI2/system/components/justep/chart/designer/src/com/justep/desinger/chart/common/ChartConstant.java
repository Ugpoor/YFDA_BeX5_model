package com.justep.desinger.chart.common;

import java.awt.GraphicsEnvironment;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.eclipse.swt.graphics.Image;

import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.desinger.chart.type.select.ChartMajorType;

public class ChartConstant {
	
	public static String basePath;
	

	public static  Image pieImage;
	public static  Image barImage;
	public static  Image lineImage;
	public static  Image xyLineImage;
	public static  Image areaImage;
	public static  Image timeImage;
	public static  Image meterImage;
	public static  Image ganttImage;
	public static  Image radarImage;

	public static HashMap<String,String[][]> chartImageMap = new HashMap<String,String[][]>();
	public final static String PIE_CHART = "pie";
	public final static String BAR_CHART = "bar";
	public final static String LINE_CHART = "line";
	public final static String XYLINE_CHART = "xy-line";
	public final static String AREA_CHART = "area";
	public final static String TIME_CHART = "time";
	public final static String METER_CHART = "meter";
	public final static String GANTT_CHART = "gantt";
	public final static String RADAR_CHART = "radar";
	
	private final static String PIE_IMAGE_PATH[][] = {
		{"/img/pie/pie.gif","pie"},
		{"/img/pie/pie3d.gif","pie-3d"}
	};
	private final static String BAR_IMAGE_PATH[][] = {
		{"/img/bar/vertical_bar.gif","vertical-bar"},
		{"/img/bar/vertical_bar_3d.gif","vertical-bar-3d"},
		{"/img/bar/stacked_vertical_bar.gif","stacked-vertical-bar"},
		{"/img/bar/stacked_vertical_bar_3d.gif","stacked-vertical-bar-3d"},
		{"/img/bar/cylinder_vertical_bar.gif","cylinder-vertical-bar"},
		{"/img/bar/cylinder_vertical_bar_3d.gif","cylinder-vertical-bar-3d"},
		{"/img/bar/horizontal_bar.gif","horizontal-bar"},
		{"/img/bar/horizontal_bar_3d.gif","horizontal-bar-3d"},
		{"/img/bar/stacked_horizontal_bar.gif","stacked-horizontal-bar"},
		{"/img/bar/stacked_horizontal_bar_3d.gif","stacked-horizontal-bar-3d"},
		{"/img/bar/cylinder_horizontal_bar.gif","cylinder-horizontal-bar"},
		{"/img/bar/cylinder_horizontal_bar_3d.gif","cylinder-horizontal-bar-3d"}
	};
	private final static String LINE_IMAGE_PATH[][] = {
		{"/img/line/vertical_line.gif","vertical-line"},
		{"/img/line/vertical_line_3d.gif","vertical-line-3d"},
		{"/img/line/horizontal_line.gif","horizontal-line"},
		{"/img/line/horizontal_line_3d.gif","horizontal-line-3d"}
	};
	private final static String XYLINE_IMAGE_PATH[][] = {
		{"/img/xyline/vertical_xyline.gif","vertical-xy-line"},
		{"/img/xyline/horizontal_xyline.gif","horizontal-xy-line"}
	};
	private final static String AREA_IMAGE_PATH[][] = {
		{"/img/area/vertical_area.gif","vertical-area"},
		{"/img/area/horizontal_area.gif","horizontal-area"}		
	};
	private final static String TIME_IMAGE_PATH[][] = {
		{"/img/time/time_series.gif","time-series"}
	};
	private final static String METER_IMAGE_PATH[][] = {
		{"/img/meter/simple_meter.gif","simple-meter"},
		{"/img/meter/dial_meter.gif","dial-meter"},
		{"/img/meter/arc_dial_meter.gif","arc-dial-meter"},
		{"/img/meter/thermometer_meter.gif","thermometer-meter"}
	};
	private final static String GANTT_IMAGE_PATH[][] = {
		{"/img/gantt/vertical_gantt.gif","horizontal-gantt"},
		{"/img/gantt/horizontal_gantt.gif","vertical-gantt"}
	};
	private final static String RADAR_IMAGE_PATH[][] = {
		{"/img/radar/radar.gif","radar"}
	};
	
	public static void initImages(){
		chartImageMap.put(PIE_CHART, PIE_IMAGE_PATH);
		chartImageMap.put(BAR_CHART, BAR_IMAGE_PATH);
		chartImageMap.put(LINE_CHART, LINE_IMAGE_PATH);
		chartImageMap.put(XYLINE_CHART, XYLINE_IMAGE_PATH);
		chartImageMap.put(AREA_CHART, AREA_IMAGE_PATH);
		chartImageMap.put(TIME_CHART, TIME_IMAGE_PATH);
		chartImageMap.put(METER_CHART, METER_IMAGE_PATH);
		chartImageMap.put(GANTT_CHART, GANTT_IMAGE_PATH);
		chartImageMap.put(RADAR_CHART, RADAR_IMAGE_PATH);
		
		pieImage = new Image(null,basePath + "/img/nav/pie.gif");
		barImage = new Image(null, basePath + "/img/nav/bar.gif");
		lineImage = new Image(null, basePath + "/img/nav/line.gif");
		xyLineImage = new Image(null, basePath + "/img/nav/xy-line.gif");
		areaImage = new Image(null, basePath + "/img/nav/area.gif");
		timeImage = new Image(null, basePath + "/img/nav/time.gif");
		meterImage = new Image(null, basePath + "/img/nav/meter.gif");
		ganttImage = new Image(null, basePath + "/img/nav/gantt.gif");
		radarImage = new Image(null, basePath + "/img/nav/radar.gif");
	}
	
	public static List<ChartTreeNode> createDefaultTree(String currentChartType, IChartCompositeContainer chartCompositeContainer) {

		ArrayList<ChartTreeNode> nodeList = new ArrayList<ChartTreeNode>();

		ChartTreeNode generalNode = new ChartTreeNode("10", "公共");

		ChartTreeNode titleNode = new ChartTreeNode("101", "标题");
		ChartTreeNode subTitleNode = new ChartTreeNode("103", "子标题");
		ChartTreeNode legendNode = new ChartTreeNode("105", "图例");
		ChartTreeNode commentNode = new ChartTreeNode("107", "注释");
		ChartTreeNode otherNode = new ChartTreeNode("109", "其他");

		ArrayList<ChartTreeNode> childNodeList = new ArrayList<ChartTreeNode>();
		childNodeList.add(titleNode);
		childNodeList.add(subTitleNode);
		childNodeList.add(legendNode);
		childNodeList.add(commentNode);
		childNodeList.add(otherNode);

		generalNode.setChildren(childNodeList);
		nodeList.add(generalNode);

		if (currentChartType.indexOf("pie") != -1) {
			ChartTreeNode pieNode = new ChartTreeNode("20", "饼图");
			nodeList.add(pieNode);
		} else if (currentChartType.indexOf("bar") != -1) {
			ChartTreeNode barNode = new ChartTreeNode("30", "柱形图");
			chartCompositeContainer.addParticularComposite(barNode);
			nodeList.add(barNode);
		} else if (currentChartType.indexOf("xy-line") != -1) {
			ChartTreeNode xyLineNode = new ChartTreeNode("40", "XY线图");
			chartCompositeContainer.addParticularComposite(xyLineNode);
			nodeList.add(xyLineNode);
		} else if (currentChartType.indexOf("line") != -1) {
			ChartTreeNode lineNode = new ChartTreeNode("50", "折线图");
			chartCompositeContainer.addParticularComposite(lineNode);
			nodeList.add(lineNode);
		} else if (currentChartType.indexOf("area") != -1) {
			ChartTreeNode areaNode = new ChartTreeNode("60", "面积图");
			chartCompositeContainer.addParticularComposite(areaNode);
			nodeList.add(areaNode);
		} else if (currentChartType.indexOf("time") != -1) {
			ChartTreeNode timeNode = new ChartTreeNode("70", "时序图");
			chartCompositeContainer.addParticularComposite(timeNode);
			nodeList.add(timeNode);
		} else if (currentChartType.indexOf("meter") != -1) {
			ChartTreeNode meterNode = new ChartTreeNode("80", "仪表盘");
			chartCompositeContainer.addParticularComposite(meterNode);
			nodeList.add(meterNode);
		} else if (currentChartType.indexOf("gantt") != -1) {
			ChartTreeNode ganttNode = new ChartTreeNode("90", "甘特图");
			chartCompositeContainer.addParticularComposite(ganttNode);
			nodeList.add(ganttNode);
		} else if (currentChartType.indexOf("radar") != -1) {
			ChartTreeNode radarNode = new ChartTreeNode("100", "雷达图");
			nodeList.add(radarNode);
		}

		return nodeList;
	}

	public static List<ChartMajorType> createChartMajorTypeList(String baseChartType) {
		ArrayList<ChartMajorType> nodeList = new ArrayList<ChartMajorType>();
		if (baseChartType.indexOf("bar") != -1 || baseChartType.indexOf("area") != -1 || baseChartType.indexOf("line") != -1) {
			nodeList.add(new ChartMajorType("bar", "柱形图"));
			nodeList.add(new ChartMajorType("line", "折线图"));
			nodeList.add(new ChartMajorType("area", "面积图"));
		} else if (baseChartType.indexOf("xy-line") != -1 || baseChartType.indexOf("time") != -1) {
			nodeList.add(new ChartMajorType("xy-line", "XY线图"));
			nodeList.add(new ChartMajorType("time", "时序图"));
		} else if (baseChartType.indexOf("dial-meter") != -1) {
			nodeList.add(new ChartMajorType("meter", "仪表盘"));
		} else {
			nodeList.add(new ChartMajorType("pie", "饼图"));
			nodeList.add(new ChartMajorType("bar", "柱形图"));
			nodeList.add(new ChartMajorType("line", "折线图"));
			nodeList.add(new ChartMajorType("xy-line", "XY线图"));
			nodeList.add(new ChartMajorType("area", "面积图"));
			nodeList.add(new ChartMajorType("time", "时序图"));
			nodeList.add(new ChartMajorType("meter", "仪表盘"));
			nodeList.add(new ChartMajorType("gantt", "甘特图"));
			nodeList.add(new ChartMajorType("radar", "雷达图"));
		}
		return nodeList;
	}

	public static String getChartType(String chartTypeDesc) {
		String chartType = "";
		if (chartTypeDesc.equalsIgnoreCase("二维饼图")) {
			chartType = "pie";
		} else if (chartTypeDesc.equalsIgnoreCase("三维饼图")) {
			chartType = "pie-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直柱图")) {
			chartType = "vertical-bar";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直3D柱图")) {
			chartType = "vertical-bar-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直堆叠柱图")) {
			chartType = "stacked-vertical-bar";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直堆叠3D柱图")) {
			chartType = "stacked-vertical-bar-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直圆柱图")) {
			chartType = "cylinder-vertical-bar";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直3D圆柱图")) {
			chartType = "cylinder-vertical-bar-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("水平柱图")) {
			chartType = "horizontal-bar";
		} else if (chartTypeDesc.equalsIgnoreCase("水平3D柱图")) {
			chartType = "horizontal-bar-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("水平堆叠柱图")) {
			chartType = "stacked-horizontal-bar";
		} else if (chartTypeDesc.equalsIgnoreCase("水平堆叠3D柱图")) {
			chartType = "stacked-horizontal-bar-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("水平圆柱图")) {
			chartType = "cylinder-horizontal-bar";
		} else if (chartTypeDesc.equalsIgnoreCase("水平3D圆柱图")) {
			chartType = "cylinder-horizontal-bar-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直线图")) {
			chartType = "vertical-line";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直3D线图")) {
			chartType = "vertical-line-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("水平线图")) {
			chartType = "horizontal-line";
		} else if (chartTypeDesc.equalsIgnoreCase("水平3D线图")) {
			chartType = "horizontal-line-3d";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直XY线图")) {
			chartType = "vertical-xy-line";
		} else if (chartTypeDesc.equalsIgnoreCase("水平XY线图")) {
			chartType = "horizontal-xy-line";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直面积图")) {
			chartType = "vertical-area";
		} else if (chartTypeDesc.equalsIgnoreCase("水平面积图")) {
			chartType = "horizontal-area";
		} else if (chartTypeDesc.equalsIgnoreCase("时序图")) {
			chartType = "time-series";
		} else if (chartTypeDesc.equalsIgnoreCase("简单仪表盘")) {
			chartType = "simple-meter";
		} else if (chartTypeDesc.equalsIgnoreCase("刻度盘")) {
			chartType = "dial-meter";
		} else if (chartTypeDesc.equalsIgnoreCase("弧度刻度盘")) {
			chartType = "arc-dial-meter";
		} else if (chartTypeDesc.equalsIgnoreCase("温度计")) {
			chartType = "thermometer-meter";
		} else if (chartTypeDesc.equalsIgnoreCase("水平甘特图")) {
			chartType = "horizontal-gantt";
		} else if (chartTypeDesc.equalsIgnoreCase("垂直甘特图")) {
			chartType = "vertical-gantt";
		} else if (chartTypeDesc.equalsIgnoreCase("雷达图")) {
			chartType = "radar";
		} else {
			chartType = "";
		}
		return chartType;
	}

	public static String [] getSYSFontList(){
		String[] fontlist= GraphicsEnvironment.getLocalGraphicsEnvironment().getAvailableFontFamilyNames();   
		String [] temp = new String[fontlist.length+1];
		for(int i=0; i<fontlist.length; i++){
			temp[i] = fontlist[i];
		}
		temp[fontlist.length] = "黑体";
		return temp;
	}
}
