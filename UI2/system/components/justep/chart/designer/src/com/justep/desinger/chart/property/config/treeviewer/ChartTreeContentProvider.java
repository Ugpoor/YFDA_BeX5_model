package com.justep.desinger.chart.property.config.treeviewer;

import java.util.List;

import org.eclipse.jface.viewers.IStructuredContentProvider;
import org.eclipse.jface.viewers.ITreeContentProvider;
import org.eclipse.jface.viewers.Viewer;

public class ChartTreeContentProvider implements IStructuredContentProvider,ITreeContentProvider {

	public Object[] getElements(Object inputElement) {
		if (inputElement instanceof List) {
			@SuppressWarnings("unchecked")
			List<ChartTreeNode> input = (List<ChartTreeNode>) inputElement;
			return input.toArray();
		}
		return new Object[0];
	}

	public Object[] getChildren(Object parentElement) {
		IChartTree node = (IChartTree) parentElement;
		List<ChartTreeNode> list = node.getChildren();
		if (list == null) {
			return new Object[0];
		}
		return list.toArray();
	}

	public boolean hasChildren(Object element) {
		IChartTree node = (IChartTree) element;
		List<ChartTreeNode> list = node.getChildren();
		return !(list == null || list.isEmpty());
	}

	public Object getParent(Object element) {
		return null;
	}

	public void inputChanged(Viewer viewer, Object oldInput, Object newInput) {
	}

	public void dispose() {
	}
}
