package com.justep.desinger.chart.property.config.composite.bar;

import java.util.ArrayList;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartBarCompositeContainer implements IChartCompositeContainer {
	
	private Composite chartBarGeneralComposite;
	private Composite chartBarClassComposite;
	private Composite chartBarDataComposite;
	private Composite chartBarMarkerComposite;
	private Composite chartBarMapComposite;
	
	public ChartBarCompositeContainer() {
		super();
		
	}
	
	public ChartBarCompositeContainer(Composite parent, int style, XuiElement configE  , String currentChartType ) {
		chartBarGeneralComposite = new ChartBarGeneralComposite(parent, style, configE ,currentChartType);
		chartBarClassComposite = new ChartBarClassComposite(parent, style, configE ,currentChartType);
		chartBarDataComposite = new ChartBarDataComposite(parent, style, configE ,currentChartType);
		chartBarMarkerComposite = new ChartBarMarkerComposite(parent, style, configE ,currentChartType);
		chartBarMapComposite = new ChartBarMapComposite(parent, style, configE ,currentChartType );
	}

	public void addParticularComposite(ChartTreeNode barNode) {
		
		ChartTreeNode classNode= new ChartTreeNode("302","分类轴"); 
		ChartTreeNode dataNode= new ChartTreeNode("303","数据轴");
		ChartTreeNode markerNode= new ChartTreeNode("304","警戒线");
		ChartTreeNode mapNode= new ChartTreeNode("305","热点");
		ChartTreeNode generalNode= new ChartTreeNode("301","其他"); 
		
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
		if(index.equalsIgnoreCase("30") || index.equalsIgnoreCase("302")){
			result = chartBarClassComposite;			
		}
		else if(index.equalsIgnoreCase("301")){
			result = chartBarGeneralComposite;
		}
		else if(index.equalsIgnoreCase("303")){
			result = chartBarDataComposite;
		}
		else if(index.equalsIgnoreCase("304")){
			result = chartBarMarkerComposite;
		}
		else if(index.equalsIgnoreCase("305")){
			result = chartBarMapComposite;
		}
		return result;
	}

	public void saveConfig() {
		((IChartComposite)chartBarGeneralComposite).saveSelfConfig();
		((IChartComposite)chartBarClassComposite).saveSelfConfig();
		((IChartComposite)chartBarDataComposite).saveSelfConfig();
		((IChartComposite)chartBarMarkerComposite).saveSelfConfig();
		((IChartComposite)chartBarMapComposite).saveSelfConfig();
	}
	
}
