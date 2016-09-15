package com.justep.desinger.chart.property.config.composite.line;

import java.util.ArrayList;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartLineCompositeContainer implements IChartCompositeContainer {
	
	private Composite chartLineGeneralComposite;
	private Composite chartLineClassComposite;
	private Composite chartLineDataComposite;
	private Composite chartLineMarkerComposite;
	private Composite chartLineMapComposite;
	
	public ChartLineCompositeContainer() {
		super();
		
	}
	
	public ChartLineCompositeContainer(Composite parent, int style,
			XuiElement configE ,String currentChartType) {
		chartLineGeneralComposite = new ChartLineGeneralComposite(parent, style, configE,currentChartType);
		chartLineClassComposite = new ChartLineClassComposite(parent, style, configE,currentChartType);
		chartLineDataComposite = new ChartLineDataComposite(parent, style, configE,currentChartType);
		chartLineMarkerComposite = new ChartLineMarkerComposite(parent, style, configE,currentChartType );
		chartLineMapComposite = new ChartLineMapComposite(parent, style, configE,currentChartType );
	}

	public void addParticularComposite(ChartTreeNode barNode) {
		ChartTreeNode generalNode= new ChartTreeNode("501","其他"); 
		ChartTreeNode classNode= new ChartTreeNode("502","分类轴"); 
		ChartTreeNode dataNode= new ChartTreeNode("503","数据轴");
		ChartTreeNode markerNode= new ChartTreeNode("504","警戒线");
		ChartTreeNode mapNode= new ChartTreeNode("505","热点");
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
		if(index.equalsIgnoreCase("50") || index.equalsIgnoreCase("502")){
			result = chartLineClassComposite;
		}else if(index.equalsIgnoreCase("501")){
			result = chartLineGeneralComposite;
		}else if(index.equalsIgnoreCase("503")){
			result = chartLineDataComposite;
		}else if(index.equalsIgnoreCase("504")){
			result = chartLineMarkerComposite;
		}else if(index.equalsIgnoreCase("505")){
			result = chartLineMapComposite;
		}
		return result;
	}

	public void saveConfig() {
		((IChartComposite)chartLineGeneralComposite).saveSelfConfig();
		((IChartComposite)chartLineClassComposite).saveSelfConfig();
		((IChartComposite)chartLineDataComposite).saveSelfConfig();
		((IChartComposite)chartLineMarkerComposite).saveSelfConfig();
		((IChartComposite)chartLineMapComposite).saveSelfConfig();
	}
	
}
