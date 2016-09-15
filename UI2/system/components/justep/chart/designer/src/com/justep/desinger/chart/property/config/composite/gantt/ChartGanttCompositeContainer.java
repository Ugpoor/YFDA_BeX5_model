package com.justep.desinger.chart.property.config.composite.gantt;

import java.util.ArrayList;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartGanttCompositeContainer implements IChartCompositeContainer {
	
	//private Composite chartGanttComposite;
	
	private Composite chartGanttGeneralComposite;
	private Composite chartGanttClassComposite;
	private Composite chartGanttDataComposite;
	private Composite chartGanttMapComposite;
	
	
	public ChartGanttCompositeContainer(Composite parent, int style,
			XuiElement configE,String currentChartType) {
		//chartGanttComposite = new ChartGanttComposite(rightComp,none,publicConfigE,currentChartType);
		
		chartGanttGeneralComposite = new ChartGanttGeneralComposite(parent, style, configE ,currentChartType);
		chartGanttClassComposite = new ChartGanttClassComposite(parent, style, configE ,currentChartType);
		chartGanttDataComposite = new ChartGanttDataComposite(parent, style, configE ,currentChartType);
		chartGanttMapComposite = new ChartGanttMapComposite(parent, style, configE ,currentChartType );
		
	}
	
	public void addParticularComposite(ChartTreeNode ganttNode) {
		ChartTreeNode generalNode= new ChartTreeNode("901","其他"); 
		ChartTreeNode classNode= new ChartTreeNode("902","分类轴"); 
		ChartTreeNode dataNode= new ChartTreeNode("903","数据轴");
		ChartTreeNode mapNode= new ChartTreeNode("904","热点");
		ArrayList<ChartTreeNode> childNodeList = new ArrayList<ChartTreeNode>();
		childNodeList.add(classNode);
		childNodeList.add(dataNode);
		childNodeList.add(mapNode);
		childNodeList.add(generalNode);
		ganttNode.setChildren(childNodeList);
	}

	public Composite findParticularComposite(String index) {
		Composite result = null;
		if(index.equalsIgnoreCase("90") || index.equalsIgnoreCase("902")){
			result = chartGanttClassComposite;
		}
		else if(index.equalsIgnoreCase("901")){
			result = chartGanttGeneralComposite;
		}
		else if(index.equalsIgnoreCase("903")){
			result = chartGanttDataComposite;
		}
		else if(index.equalsIgnoreCase("904")){
			result = chartGanttMapComposite;
		}		
		return result;
	}

	public void saveConfig() {
		((IChartComposite)chartGanttGeneralComposite).saveSelfConfig();
		((IChartComposite)chartGanttClassComposite).saveSelfConfig();
		((IChartComposite)chartGanttDataComposite).saveSelfConfig();
		((IChartComposite)chartGanttMapComposite).saveSelfConfig();
	}
	
	
}
