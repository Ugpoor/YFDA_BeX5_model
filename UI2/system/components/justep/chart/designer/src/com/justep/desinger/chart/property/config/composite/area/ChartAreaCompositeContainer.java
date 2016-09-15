package com.justep.desinger.chart.property.config.composite.area;

import java.util.ArrayList;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartAreaCompositeContainer implements IChartCompositeContainer {
	
	private Composite chartAreaGeneralComposite;
	private Composite chartAreaClassComposite;
	private Composite chartAreaDataComposite;
	private Composite chartAreaMarkerComposite;
	private Composite chartAreaMapComposite;
	
	
	public ChartAreaCompositeContainer() {
		super();
		
	}
	
	public ChartAreaCompositeContainer(Composite parent, int style,
			XuiElement configE , String currentChartType) {
		chartAreaGeneralComposite = new ChartAreaGeneralComposite(parent, style, configE , currentChartType);
		chartAreaClassComposite = new ChartAreaClassComposite(parent, style, configE , currentChartType);
		chartAreaDataComposite = new ChartAreaDataComposite(parent, style, configE , currentChartType);
		chartAreaMarkerComposite = new ChartAreaMarkerComposite(parent, style, configE , currentChartType);
		chartAreaMapComposite = new ChartAreaMapComposite(parent, style, configE , currentChartType);

	}

	public void addParticularComposite(ChartTreeNode barNode) {
		ChartTreeNode generalNode= new ChartTreeNode("601","其他"); 
		ChartTreeNode classNode= new ChartTreeNode("602","分类轴"); 
		ChartTreeNode dataNode= new ChartTreeNode("603","数据轴");
		ChartTreeNode markerNode= new ChartTreeNode("604","警戒线");
		ChartTreeNode mapNode= new ChartTreeNode("605","热点");
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
		if(index.equalsIgnoreCase("60") || index.equalsIgnoreCase("602")){
			result = chartAreaClassComposite;
		}
		else if(index.equalsIgnoreCase("601")){
			result = chartAreaGeneralComposite;
		}
		else if(index.equalsIgnoreCase("603")){
			result = chartAreaDataComposite;
		}
		else if(index.equalsIgnoreCase("604")){
			result = chartAreaMarkerComposite;
		}
		else if(index.equalsIgnoreCase("605")){
			result = chartAreaMapComposite;
		}
		return result;
	}

	public void saveConfig() {
		((IChartComposite)chartAreaGeneralComposite).saveSelfConfig();
		((IChartComposite)chartAreaClassComposite).saveSelfConfig();
		((IChartComposite)chartAreaDataComposite).saveSelfConfig();
		((IChartComposite)chartAreaMarkerComposite).saveSelfConfig();
		((IChartComposite)chartAreaMapComposite).saveSelfConfig();
	}
	
}
