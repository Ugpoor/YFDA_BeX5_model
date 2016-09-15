package com.justep.desinger.chart.data.composite.datatree;

import org.eclipse.jface.viewers.ILabelProviderListener;
import org.eclipse.jface.viewers.ITableLabelProvider;
import org.eclipse.swt.graphics.Image;

import com.swtdesigner.SWTResourceManager;

public class DataLabelProvider implements ITableLabelProvider {
	
  //public static  Image ball = SWTResourceManager.getImage(DataLabelProvider.class, "/images/chart.gif"); 

  public DataLabelProvider() {
      //ball = SWTResourceManager.getImage(DataLabelProvider.class, "/images/chart.gif"); 
  }


  public Image getColumnImage(Object entry, int col) {
	@SuppressWarnings("unused")
	DataEntry dataEntry = (DataEntry) entry;
	Image image = null;
	if(col == 0){
		image = SWTResourceManager.getImage(DataLabelProvider.class, "/images/chart.gif");
	}
	//image = ball;
    return image;
  }

  
  public String getColumnText(Object entry, int col) {
	  DataEntry dataEntry = (DataEntry) entry;
    String text = "";
    switch (col) {
	    case 0:
	      text = dataEntry.getParam1();
	      break;
	    case 1:
	      text = dataEntry.getParam2();
	      break;
	    case 2:
	      text = dataEntry.getParam3();
	      break;
	    case 3:
	      text = dataEntry.getParam4();
	      break;
	    case 4:
	      text = dataEntry.getParam5();
	      break;
    }
    return text;
  }


  public void addListener(ILabelProviderListener arg0) {
  }

  
  public void dispose() {
    /*if (ball != null)
      ball.dispose();*/
  }


  public boolean isLabelProperty(Object entry, String arg1) {
    return false;
  }


  public void removeListener(ILabelProviderListener arg0) {

  }
}
