package com.justep.desinger.chart.property.config.composite.radar;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartRadarCompositeContainer implements IChartCompositeContainer {
	
	private Composite chartRadarComposite;
	
	public ChartRadarCompositeContainer(Composite rightComp, int none,
			XuiElement publicConfigE, String currentChartType) {
		chartRadarComposite = new ChartRadarComposite(rightComp,none,publicConfigE ,currentChartType);
	}

	public void addParticularComposite(ChartTreeNode barNode) {
		
	}

	public Composite findParticularComposite(String index) {
		if(index.equalsIgnoreCase("100")){
			return chartRadarComposite;
		}
		return null;
	}

	public void saveConfig() {
		((IChartComposite)chartRadarComposite).saveSelfConfig();
	}
	
}
