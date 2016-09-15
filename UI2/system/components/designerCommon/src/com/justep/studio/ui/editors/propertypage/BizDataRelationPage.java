package com.justep.studio.ui.editors.propertypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.swt.widgets.Composite;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.justep.design.model.ModelConstant;
import com.justep.studio.data.DSUtil;
import com.justep.studio.data.DataRecord;
import com.justep.studio.ui.editors.xui.XuiDataModel;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.exjface.DataSetViewerEditor;
//import com.justep.studio.ui.views.ConsoleView;

public class BizDataRelationPage extends RelationPage {
	protected Map<String,String> relationLabels = new HashMap<String,String>(); 
	protected Map<String,Element> relationNodes = new HashMap<String,Element>(); 

	public BizDataRelationPage(Composite parent, int style) {
		super(parent, style);
		setSize(680, 500);
	}

	protected void loadLabels(){
		relationLabels.clear();
		relationNodes.clear();
		NodeList nodes = propertyItem.getOwerElement().getOriginElement().getElementsByTagName("column");
		//ConsoleView.println("column:"+nodes.getLength());
		for(int i=0;i<nodes.getLength();i++){
			Element node = (Element)nodes.item(i);
			//ConsoleView.println("column:"+node.getAttribute("name")+":"+node.getAttribute("label"));
			relationLabels.put(node.getAttribute("name"), node.getAttribute("label"));
			relationNodes.put(node.getAttribute("name"), node);
		}
	}
	
	protected void createContents(){
		loadLabels();
		
		DSUtil.createColumn(dataset, "dispName", "自定义名称", "string", false, false, 160).setDataSource("dispName").setEditor(DataSetViewerEditor.TEXT_CELL_EDITOR);
		
		List<DataRecord> rcList = dataset.getData();
		for(DataRecord rc:rcList){
			
			if(relationLabels.containsKey(rc.getString(ModelConstant.ALIAS))){
				String label = relationLabels.get(rc.getString(ModelConstant.ALIAS));
				rc.setValue("dispName", label);
			}
		} 	
		
		super.createContents();
	}

	protected void setColumnLabel(String name, String label){
		if(relationNodes.containsKey(name)){
			relationNodes.get(name).setAttribute("label", label);
		}else{
			String elementName = "column";
			XuiDataModel model = propertyItem.getOwerElement().getXuiDataModel();
			XuiElement newE = model.addElement(elementName, (XuiElement)propertyItem.getOwerElement(), null);
			newE.setPropertyValue("name", name);
			newE.setPropertyValue("label", label);
		}
	}
	
	protected void removeColumnLabel(String name){
		if(relationNodes.containsKey(name))
			propertyItem.getOwerElement().getOriginElement().removeChild(relationNodes.get(name));
	}
	
	protected List<DataRecord> getSelectedRecord() {
		List<DataRecord> list = super.getSelectedRecord();
		
		for (DataRecord dr : list) {
			String name = dr.getString(ModelConstant.ALIAS);
			String dispName = dr.getString("dispName");
			String label = dr.getString(ModelConstant.LABEL);
			if(null!=dispName && !"".equals(dispName) && !dispName.equals(label)){
				setColumnLabel(name, dispName);
				relationLabels.remove(name);
			}
		}
		
		for(String name : relationLabels.keySet()){
			removeColumnLabel(name);
		}
		
		return list;
	}	
	
	public Object getReturnValue() {
		return super.getReturnValue();
	}
	
}
