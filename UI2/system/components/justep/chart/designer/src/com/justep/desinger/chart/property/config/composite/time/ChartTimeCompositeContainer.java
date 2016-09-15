package com.justep.desinger.chart.property.config.composite.time;

import java.util.ArrayList;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartTimeCompositeContainer implements IChartCompositeContainer {
	
	private Composite chartTimeGeneralComposite;
	private Composite chartTimeClassComposite;
	private Composite chartTimeDataComposite;
	private Composite chartTimeMarkerComposite;
	private Composite chartTimeMapComposite;
	
	public ChartTimeCompositeContainer() {
		super();
		
	}
	
	public ChartTimeCompositeContainer(Composite parent, int style,
			XuiElement configE,String currentChartType) {
		chartTimeGeneralComposite = new ChartTimeGeneralComposite(parent, style, configE,currentChartType);
		chartTimeClassComposite = new ChartTimeClassComposite(parent, style, configE,currentChartType);
		chartTimeDataComposite = new ChartTimeDataComposite(parent, style, configE,currentChartType);
		chartTimeMarkerComposite = new ChartTimeMarkerComposite(parent, style, configE,currentChartType);
		chartTimeMapComposite = new ChartTimeMapComposite(parent, style, configE,currentChartType);
	}

	public void addParticularComposite(ChartTreeNode barNode) {
		ChartTreeNode generalNode= new ChartTreeNode("701","其他"); 
		ChartTreeNode classNode= new ChartTreeNode("702","分类轴"); 
		ChartTreeNode dataNode= new ChartTreeNode("703","数据轴");
		ChartTreeNode markerNode= new ChartTreeNode("704","警戒线");
		ChartTreeNode mapNode= new ChartTreeNode("705","热点");
		ArrayList<ChartTreeNode> childNodeList = new ArrayList<ChartTreeNode>();
		childNodeList.add(classNode);
		childNodeList.add(dataNode);
		childNodeList.add(markerNode);
		childNodeList.add(mapNode);
		childNodeList.add(generalNode);
		barNode.setChildren(childNodeList);
	}

	public Composite findParticularComposite(String index) {
		Composite result = null;
		if(index.equalsIgnoreCase("70") || index.equalsIgnoreCase("702")){
			result = chartTimeClassComposite;
		}
		else if(index.equalsIgnoreCase("701")){
			result = chartTimeGeneralComposite;
		}
		else if(index.equalsIgnoreCase("703")){
			result = chartTimeDataComposite;
		}
		else if(index.equalsIgnoreCase("704")){
			result = chartTimeMarkerComposite;
		}
		else if(index.equalsIgnoreCase("705")){
			result = chartTimeMapComposite;
		}
		return result;
	}
	
	public void saveConfig() {
		((IChartComposite)chartTimeGeneralComposite).saveSelfConfig();
		((IChartComposite)chartTimeClassComposite).saveSelfConfig();
		((IChartComposite)chartTimeDataComposite).saveSelfConfig();
		((IChartComposite)chartTimeMarkerComposite).saveSelfConfig();
		((IChartComposite)chartTimeMapComposite).saveSelfConfig();
	}
}
