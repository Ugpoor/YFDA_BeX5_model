package com.justep.desinger.chart.property.config.treeviewer;

import org.eclipse.jface.viewers.ILabelProvider;
import org.eclipse.jface.viewers.LabelProvider;
import org.eclipse.swt.graphics.Image;

public class ChartTreeLabelProvider extends LabelProvider implements ILabelProvider {   
	
    public String getText(Object element) {   
    	IChartTree node = (IChartTree)element;   
        return node.getName();   
    }   
    
    public Image getImage(Object element) {   
        return null;   
    }
    
}  
