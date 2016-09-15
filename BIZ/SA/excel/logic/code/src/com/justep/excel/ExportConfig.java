package com.justep.excel;

import java.util.HashMap;
import java.util.List;

import org.dom4j.Element;


class ExportConfig {
	private String excelCellNo;
	private HashMap<Integer,ExportRelationConfig> metaNumberMap = new HashMap<Integer ,ExportRelationConfig>();
	private HashMap<String ,ExportRelationConfig> nameMap = new HashMap<String ,ExportRelationConfig>();
	
	public ExportConfig(Element e){
		String value = e.attributeValue(Const.CELLNO);
		this.excelCellNo = null == value? "":value;
		List<?> relationEs = e.elements("relation");
		for(Object relationE : relationEs){
			ExportRelationConfig r = new ExportRelationConfig((Element)relationE);
			metaNumberMap.put(Integer.valueOf(r.getMetaCellIndex()), r);
			nameMap.put(r.getMetaName(), r);
		}
	}
	
	public ExportRelationConfig getRelationConfig(int p){
		return this.metaNumberMap.get(p);
	}
	
	public ExportRelationConfig getRelationConfig(String name){
		return this.nameMap.get(name);
	}

	public String getExcelCellNo() {
		return excelCellNo;
	}
}

