package com.justep.desinger.chart.property.config.composite.meter;

import java.util.ArrayList;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartMeterCompositeContainer implements IChartCompositeContainer {

	private String type;
	private Composite chartMeterGeneralComposite;
	private Composite chartSimpleMeterComposite;
	private Composite chartDialMeter1Composite;
	private Composite chartDialMeter2Composite;
	private Composite chartArcDialMeterComposite;
	private Composite chartThermometerMeterComposite;
	
	public ChartMeterCompositeContainer(Composite rightComp, int none,
			XuiElement publicConfigE, String currentChartType) {
		
		this.type = currentChartType;
		chartMeterGeneralComposite = new ChartMeterGeneralComposite(rightComp,none,publicConfigE,currentChartType);
		
		if(type.equalsIgnoreCase("simple-meter")){
			chartSimpleMeterComposite = new ChartSimpleMeterComposite(rightComp,none,publicConfigE,"simple-meter");
		}else if(type.equalsIgnoreCase("dial-meter")){
			chartDialMeter1Composite = new ChartDialMeter1Composite(rightComp,none,publicConfigE,"dial-meter");
			chartDialMeter2Composite = new ChartDialMeter2Composite(rightComp,none,publicConfigE,"dial-meter");
		}else if(type.equalsIgnoreCase("arc-dial-meter")){
			chartArcDialMeterComposite = new ChartArcDialMeterComposite(rightComp,none,publicConfigE,"arc-dial-meter");
		}else if(type.equalsIgnoreCase("thermometer-meter")){
			chartThermometerMeterComposite = new ChartThermometerMeterComposite(rightComp,none,publicConfigE,"thermometer-meter");
		}
	}

	public void addParticularComposite(ChartTreeNode barNode) {
		ChartTreeNode generalNode= new ChartTreeNode("801","其他");
		ArrayList<ChartTreeNode> childNodeList = new ArrayList<ChartTreeNode>();
		
		if(type.equalsIgnoreCase("simple-meter")){
			ChartTreeNode simpleNode= new ChartTreeNode("802","简单仪表盘");
			childNodeList.add(simpleNode);
		}
		else if(type.equalsIgnoreCase("dial-meter")){
			ChartTreeNode dial1Node= new ChartTreeNode("802","刻度盘设置");
			ChartTreeNode dial2Node= new ChartTreeNode("803","刻度区间与指针");
			childNodeList.add(dial1Node);
			childNodeList.add(dial2Node);
		}else if(type.equalsIgnoreCase("arc-dial-meter")){
			ChartTreeNode arcDialNode= new ChartTreeNode("802","弧度刻度盘");
			childNodeList.add(arcDialNode);
		}
		else if(type.equalsIgnoreCase("thermometer-meter")){
			ChartTreeNode arcDialNode= new ChartTreeNode("802","温度计");
			childNodeList.add(arcDialNode);
		}
		
		childNodeList.add(generalNode);
		barNode.setChildren(childNodeList);
	}

	public Composite findParticularComposite(String index) {
		Composite result = null;
		if(index.equalsIgnoreCase("80") || index.equalsIgnoreCase("802")){
			if(type.equalsIgnoreCase("simple-meter")){
				result = chartSimpleMeterComposite;
			}else if(type.equalsIgnoreCase("dial-meter")){
				result = chartDialMeter1Composite;
			}else if(type.equalsIgnoreCase("arc-dial-meter")){
				result = chartArcDialMeterComposite;
			}else if(type.equalsIgnoreCase("thermometer-meter")){
				result = chartThermometerMeterComposite;
			}	
		}else if(index.equalsIgnoreCase("801")){
			result = chartMeterGeneralComposite;
		}else if(index.equalsIgnoreCase("803")){
			result = chartDialMeter2Composite;
		}
		
		return result;
	}

	public void saveConfig() {
		((IChartComposite)chartMeterGeneralComposite).saveSelfConfig();
		if(type.equalsIgnoreCase("simple-meter")){
			((IChartComposite)chartSimpleMeterComposite).saveSelfConfig();
		}
		else if(type.equalsIgnoreCase("dial-meter")){
			((IChartComposite)chartDialMeter1Composite).saveSelfConfig();
			((IChartComposite)chartDialMeter2Composite).saveSelfConfig();
		}else if(type.equalsIgnoreCase("arc-dial-meter")){
			((IChartComposite)chartArcDialMeterComposite).saveSelfConfig();
		}
		else if(type.equalsIgnoreCase("thermometer-meter")){
			((IChartComposite)chartThermometerMeterComposite).saveSelfConfig();
		}
	}

}
