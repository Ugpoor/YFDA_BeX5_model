package com.justep.desinger.chart.property.config.treeviewer;

import java.util.ArrayList;
import java.util.List;

public class ChartTreeNode implements IChartTree {
	
	private String id;
	private String name;
	private List<ChartTreeNode> children = new ArrayList<ChartTreeNode>();
	
	public ChartTreeNode(){
		
	}
	
	public ChartTreeNode(String id ,String name){
		this.id = id;
		this.name = name;
	}
	
	public ChartTreeNode(String name){
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setChildren(List<ChartTreeNode> children) {
		this.children = children;
	}

	public List<ChartTreeNode> getChildren() {
		return this.children;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	

}
