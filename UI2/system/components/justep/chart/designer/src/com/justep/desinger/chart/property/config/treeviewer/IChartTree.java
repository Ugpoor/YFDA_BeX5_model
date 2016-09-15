package com.justep.desinger.chart.property.config.treeviewer;

import java.util.List;

public interface IChartTree {

	public String getName();
	public void setName(String name);
	public void setChildren(List<ChartTreeNode> children);
	public List<ChartTreeNode> getChildren();
	
}
