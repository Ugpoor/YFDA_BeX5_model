package com.justep.desinger.chart.type.select;

import org.eclipse.jface.viewers.LabelProvider;
import org.eclipse.swt.graphics.Image;

public class ChartSelectLabelProvider extends LabelProvider {

	public String getText(Object element) {
		ChartMajorType cmt = (ChartMajorType)element;
        return cmt.getName();
    }
	
    public Image getImage(Object element) {
        return null;
    }
    
}
