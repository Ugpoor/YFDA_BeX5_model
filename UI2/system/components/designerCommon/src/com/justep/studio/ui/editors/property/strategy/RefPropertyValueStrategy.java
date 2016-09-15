package com.justep.studio.ui.editors.property.strategy;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.swt.widgets.Tree;

import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.ui.editors.xui.IPropertyValueStrategy;

public class RefPropertyValueStrategy implements IPropertyValueStrategy {
	private String _type;

	public RefPropertyValueStrategy(){
		this._type = "ref";
	}

	public RefPropertyValueStrategy(String type){
		this._type = type;
	}
	
	public String transformPropertyValue(DataSet dataset) {
		// TODO Auto-generated method stub
		List<DataRecord> rcList = dataset.getSelectedRecord();
		if(rcList.size()>0){
			//String nodeType = rcList.get(0).getString("nodeType");
			if(!("false".equals(rcList.get(0).getString("asPath")))){
				if(!"relation".equals(_type))
					return getRelationPath(rcList.get(0));
				else
					return rcList.get(0).getString("text");
			}
		}
		return "";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String getRelationPath(DataRecord record){
		String funPath = getFunPath(record);
		if(funPath.startsWith("$")){
			return funPath;
		}
		List<DataRecord> valueList = new ArrayList();
		buildPath(record,valueList);
		StringBuilder path = new StringBuilder();
		for(int i=valueList.size()-1;i>=0;i--){
			DataRecord tmpRecord = valueList.get(i);
			String id = tmpRecord.getString("xid");
			if(id == null || "".equals(id)){
				id = record.getString("text");
			}
			String type = tmpRecord.getString("nodeType");			
			if("data".equals(type)){
				path.append(id+"."+_type);
			}else if("dataAlias".equals(type)){
				path.append(id+"."+_type);
			}else{
				path.append("('"+record.getString("text")+"')");
			}			
		}		
		return path.toString();
	}
	private String getFunPath(DataRecord record){
 
 
		String path = "";
		String nodeType = record.getString("nodeType");
		if("method".equals(record.getString("nodeType"))){
			DataRecord pRecord = record.getParent();
			if(pRecord != null && "relation".equals(pRecord.getString("nodeType"))){
				path = getPath(record.getParent().getParent())+"."+record.getString("text")+"(\""+pRecord.getString("text")+"\")";
			}else{
				path = getPath(record);
			}
		}else if("relation".equals(nodeType)){
			path = getPath(record.getParent())+".val(\""+record.getString("text")+"\")";
		}else{
			path = getPath(record);
		}
		return path;
	}
	
	private String getPath(DataRecord record){
		List<String> list = new ArrayList<String>();
		while(record != null){
			if(record.getBoolean("asPath")){
				list.add(record.getString("text"));
			}
			record = record.getParent();
		}
		StringBuffer sbf = new StringBuffer();
		for(int i = list.size()-1;i>=0;i-=1){
			sbf.append("."+list.get(i));
		}
		
		
		if(sbf.length()>0){
			return sbf.toString().substring(1);
		}
		return "";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void  buildPath(DataRecord record,List valueList){		
		valueList.add(record);
		DataRecord pNode = record.getParent();
		if(pNode != null && !("false".equals(pNode.getString("asPath")))){
			buildPath(pNode,valueList);
		}
	}	
}
