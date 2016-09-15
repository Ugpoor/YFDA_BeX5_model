package com.justep.desinger.chart.data.composite.datatree;

import org.eclipse.jface.viewers.ITreeContentProvider;
import org.eclipse.jface.viewers.Viewer;


public class DataTreeContentProvider implements ITreeContentProvider {
	
  private static final Object[] EMPTY = new Object[] {};


  public Object[] getChildren(Object obj) {
    if (obj instanceof Team)
      return ((Team) obj).getDataEntrys().toArray();
    return EMPTY;
  }


  public Object getParent(Object obj) {
    return ((DataEntry) obj).getTeam();
  }


  public boolean hasChildren(Object obj) {
    return getChildren(obj).length > 0;
  }

 
  public Object[] getElements(Object obj) {
    return ((DataTableModel) obj).teamList.toArray();
  }


  public void dispose() {
  }

  
  public void inputChanged(Viewer obj, Object arg1, Object arg2) {

  }
}