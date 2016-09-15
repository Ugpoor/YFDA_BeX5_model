package com.justep.desinger.chart.data.composite.datatree;

import org.eclipse.swt.graphics.Image;


public class DataTreeLabelProvider extends DataLabelProvider {
	
  public Image getColumnImage(Object obj, int col) {
    if (obj instanceof DataEntry){
      return super.getColumnImage(obj, col);
    }
    Image image = null;
	if(col == 0){
		//image = SWTResourceManager.getImage(DataLabelProvider.class, "/images/chart.gif");
	}
    return image;
  }

  public String getColumnText(Object obj, int col) {
    if (obj instanceof DataEntry){
      return super.getColumnText(obj, col);
    }
    if(col == 0){
    	return "Item";
    }else{
    	return "";
    }
  }
  
}