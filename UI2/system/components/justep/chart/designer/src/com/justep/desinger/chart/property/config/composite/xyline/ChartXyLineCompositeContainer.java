package com.justep.desinger.chart.property.config.composite.xyline;

import java.util.ArrayList;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartXyLineCompositeContainer implements IChartCompositeContainer {
	
	private Composite chartXyLineGeneralComposite;
	private Composite chartXyLineClassComposite;
	private Composite chartXyLineDataComposite;
	private Composite chartXyLineMarkerComposite;
	private Composite chartXyLineMapComposite;
	
	public ChartXyLineCompositeContainer() {
		super();
	}
	
	public ChartXyLineCompositeContainer(Composite parent, int style,
			XuiElement configE , String currentChartType ) {
		chartXyLineGeneralComposite = new ChartXyLineGeneralComposite(parent, style, configE , currentChartType);
		chartXyLineClassComposite = new ChartXyLineClassComposite(parent, style, configE, currentChartType);
		chartXyLineDataComposite = new ChartXyLineDataComposite(parent, style, configE, currentChartType);
		chartXyLineMarkerComposite = new ChartXyLineMarkerComposite(parent, style, configE, currentChartType);
		chartXyLineMapComposite = new ChartXyLineMapComposite(parent, style, configE, currentChartType);
	}

	public void addParticularComposite(ChartTreeNode barNode) {
		ChartTreeNode generalNode= new ChartTreeNode("401","其他"); 
		ChartTreeNode classNode= new ChartTreeNode("402","分类轴"); 
		ChartTreeNode dataNode= new ChartTreeNode("403","数据轴");
		ChartTreeNode markerNode= new ChartTreeNode("404","警戒线");
		ChartTreeNode mapNode= new ChartTreeNode("405","热点");
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
		if(index.equalsIgnoreCase("40") || index.equalsIgnoreCase("402")){
			result = chartXyLineClassComposite;
		}
		else if(index.equalsIgnoreCase("401")){
			result = chartXyLineGeneralComposite;
		}
		else if(index.equalsIgnoreCase("403")){
			result = chartXyLineDataComposite;
		}
		else if(index.equalsIgnoreCase("404")){
			result = chartXyLineMarkerComposite;
		}
		else if(index.equalsIgnoreCase("405")){
			result = chartXyLineMapComposite;
		}
		return result;
	}

	public void saveConfig() {
		((IChartComposite)chartXyLineGeneralComposite).saveSelfConfig();
		((IChartComposite)chartXyLineClassComposite).saveSelfConfig();
		((IChartComposite)chartXyLineDataComposite).saveSelfConfig();
		((IChartComposite)chartXyLineMarkerComposite).saveSelfConfig();
		((IChartComposite)chartXyLineMapComposite).saveSelfConfig();
	}
	
}
