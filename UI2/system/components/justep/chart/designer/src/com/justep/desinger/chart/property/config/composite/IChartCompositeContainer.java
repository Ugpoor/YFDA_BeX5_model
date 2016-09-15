package com.justep.desinger.chart.property.config.composite;

import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;

public interface IChartCompositeContainer {
	
	/**
	 * 在barNode中注入子页签
	 * @param barNode
	 */
	public void addParticularComposite(ChartTreeNode barNode);
	
	/**
	 * 根据cIndex返回子页签
	 * @param cIndex
	 * @return
	 */
	public Composite findParticularComposite(String cIndex);
	
	/**
	 * 保存设置
	 */
	public void saveConfig();

}
