package com.justep.desinger.chart.property.config.composite.pie;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartPieCompositeContainer implements IChartCompositeContainer {

	private Composite chartPieComposite;

	public ChartPieCompositeContainer() {
		super();
	}

	public ChartPieCompositeContainer(Composite rightComp, int none, XuiElement publicConfigE, String currentChartType) {
		chartPieComposite = new ChartPieComposite(rightComp, none, publicConfigE, currentChartType);
	}

	public void addParticularComposite(ChartTreeNode barNode) {

	}

	public Composite findParticularComposite(String index) {
		if (index.equalsIgnoreCase("20")) {
			return chartPieComposite;
		}
		return null;
	}

	public void saveConfig() {
		((IChartComposite) chartPieComposite).saveSelfConfig();
	}

}
