package com.justep.desinger.report.mapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Table;

import com.justep.studio.data.DSUtil;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.data.DataSetChangedEvent;
import com.justep.studio.data.DataSetChangedListener;
import com.justep.studio.ui.exjface.DataSetTableViewer;

public class GeneralDataMappingConfigComposite extends Composite{

	private DataSet dataSet;
	private DataSetTableViewer tableViewer;
	
	private String dataId;
	private HashMap<String,List<FieldInfo>> sysFieldMap;
	private HashMap<String,List<FieldInfo>> useFieldMap;
	private boolean isRefresh;
	
	public GeneralDataMappingConfigComposite(Composite parent, int style,
		HashMap<String,List<FieldInfo>> sysFieldMap, HashMap<String,List<FieldInfo>> useFieldMap) {
		super(parent, style);
		this.sysFieldMap = sysFieldMap;
		this.useFieldMap = useFieldMap;
		this.dataSet = this.createBizDataSet();
		this.initLayout();
	}

	private void initLayout(){
		setLayout(new FillLayout());
		tableViewer = new DataSetTableViewer(this, SWT.BORDER | SWT.FULL_SELECTION);
		tableViewer.setDataSet(this.dataSet);
		Table table = tableViewer.getTable();
		final GridData gd_table = new GridData(SWT.FILL, SWT.FILL, false, false, 2, 1);
		gd_table.heightHint = 314;
		gd_table.widthHint = 456;
		table.setLinesVisible(true);
		table.setHeaderVisible(true);
		tableViewer.getTable().setFocus();
		tableViewer.getTable().select(0);
		tableViewer.updateSelectionData();
		
		initEvent();
	}
	
	private DataSet createBizDataSet() {
		DataSet ds = new DataSet();
		DSUtil.createSelectedColumn(ds);
		DSUtil.createColumn(ds, "name", "关系名称", "string", false, true, 180);
		DSUtil.createColumn(ds, "label", "别名", "string", false, true, 320);
		DSUtil.createColumn(ds, "path","关系映射", "string", false, true, 0).setEditable(false);//.setEditor("TextCellEditor");
		return ds;
	}

	public void refreshViewer(String dataId){
		this.dataId = dataId;
		this.isRefresh = true;
		this.dataSet.getDataRecords().clear();
		List<FieldInfo> sfList = sysFieldMap.get(this.dataId);
		for(FieldInfo f : sfList){
			String fName = f.getName();
			String fPath = f.getPath();
			String label = f.getLabel();
			DataRecord dr = this.dataSet.addRecord();
			dr.setValue("label", label);
			dr.setValue("name", fName);
			FieldInfo temp = find(this.useFieldMap,fName);
			if(temp != null){
				dr.setValue(DSUtil.SELECTED, true);
				dr.setValue("path",temp.getPath());
			}else{
				dr.setValue("path", fPath);
			}
		}

		tableViewer.setDataSet(this.dataSet);
		tableViewer.refresh();
		
		isRefresh = false;
	}
	
	private void initEvent(){
		
		this.dataSet.addDataSetChangedListener(new DataSetChangedListener (){			
			public void dataSetChanged(DataSetChangedEvent dce) {
				if(isRefresh){
					return;
				}
				
				boolean b = dce.getDatarecord().getBoolean(DSUtil.SELECTED);
				String name = dce.getDatarecord().getString("name");
				String path = dce.getDatarecord().getString("path");			

				List<FieldInfo> ufList = useFieldMap.get(dataId);
				if(ufList==null){
					ufList = new ArrayList<FieldInfo>();
					useFieldMap.put(dataId, ufList);
				}
				FieldInfo temp = null;
				for(FieldInfo f : ufList){
					String fName = f.getName();
					if(name.equals(fName)){
						temp = f;
						break;
					}
				}
				
				if(b){//选中状态
					if(temp!= null){
						temp.setName(name);
						temp.setPath(path);
					}else{
						temp = new FieldInfo();
						temp.setName(name);
						temp.setPath(path);
						ufList.add(temp);
					}
				}else{//取消状态
					if(temp!= null){
						ufList.remove(temp);
					}else{
						//TODO:
					}
				}

			}
		});
		
	}
	
	
	private FieldInfo find(HashMap<String,List<FieldInfo>> map , String fN){
		FieldInfo temp = null;
		List<FieldInfo> ufList = map.get(dataId);
		if(ufList != null){
			for(FieldInfo f : ufList){
				String fName = f.getName();
				if(fN.equals(fName)){
					temp = f;
					break;
				}
			}
		}
		return temp;
	}
	
	
}
