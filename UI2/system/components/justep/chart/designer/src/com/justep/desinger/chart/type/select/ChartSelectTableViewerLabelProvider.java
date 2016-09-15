package com.justep.desinger.chart.type.select;

import org.eclipse.jface.viewers.ILabelProviderListener;
import org.eclipse.jface.viewers.ITableLabelProvider;
import org.eclipse.swt.graphics.Image;

import com.justep.desinger.chart.common.ChartConstant;

public class ChartSelectTableViewerLabelProvider implements ITableLabelProvider {  

	
	 
	public String getText(Object element) {
		ChartMajorType cmt = (ChartMajorType)element;
        return cmt.getName();
    }
	
    public Image getImage(Object element) {
        return null;
    }

	public Image getColumnImage(Object element, int col) {
		ChartMajorType cmt = (ChartMajorType)element;
		String id = cmt.getId();
		if(id.equalsIgnoreCase("pie")){
			return ChartConstant.pieImage;
		}else if(id.equalsIgnoreCase("bar")){
			return ChartConstant.barImage;
		}else if(id.equalsIgnoreCase("line")){
			return ChartConstant.lineImage;
		}else if(id.equalsIgnoreCase("xy-line")){
			return ChartConstant.xyLineImage;
		}else if(id.equalsIgnoreCase("area")){
			return ChartConstant.areaImage;
		}else if(id.equalsIgnoreCase("time")){
			return ChartConstant.timeImage;
		}else if(id.equalsIgnoreCase("meter")){
			return ChartConstant.meterImage;
		}else if(id.equalsIgnoreCase("gantt")){
			return ChartConstant.ganttImage;
		}else if(id.equalsIgnoreCase("radar")){
			return ChartConstant.radarImage;
		}
		return null;
	}

	public String getColumnText(Object element, int col) {
		ChartMajorType cmt = (ChartMajorType)element;
		return cmt.getName();
	}

	public void addListener(ILabelProviderListener arg0) {

	}

	public void dispose() {
		/*for (Image image : chartImages) {   
            image.dispose();   
        }   */
	}

	public boolean isLabelProperty(Object arg0, String arg1) {
		return false;
	}

	public void removeListener(ILabelProviderListener arg0) {
		
	}
    
}
