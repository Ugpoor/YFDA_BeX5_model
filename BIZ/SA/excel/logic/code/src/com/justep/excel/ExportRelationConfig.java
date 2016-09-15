package com.justep.excel;

import org.dom4j.Element;

public class ExportRelationConfig {
	private String metaName;
	private String metaLabel;
	private String metaCellIndex;
	private String type;
	private String excelCellIndex;
	
	public ExportRelationConfig(Element e){
		String value = null ;
		value = e.attribute(Const.META_NAME).getText();
		if(null == value){
			//"发现未命名的 relation  ==> " + e.asXML()
			throw ExcelException.create(com.justep.message.SAMessages.RELATION_NOT_EXISTS, e.asXML());
		}
		metaName = value;
		
		value = e.attributeValue(Const.META_LABEL);
	    metaLabel = null == value? "":value;
	    
	    value = e.attributeValue(Const.META_CELLNO);
	    metaCellIndex = null == value? "":value;
	    
	    value = e.attributeValue(Const.TYPE);
	    type = null == value? "http://www.w3.org/2001/XMLSchema#string":value;
	    
	    value = e.attributeValue(Const.CELLNO);
	    excelCellIndex = null == value? "":value;
		
	}

	public String getMetaName() {
		return metaName;
	}

	public void setMetaName(String metaName) {
		this.metaName = metaName;
	}

	public String getMetaLabel() {
		return metaLabel;
	}

	public void setMetaLabel(String metaLabel) {
		this.metaLabel = metaLabel;
	}

	public String getMetaCellIndex() {
		return metaCellIndex;
	}

	public void setMetaCellIndex(String metaCellNo) {
		this.metaCellIndex = metaCellNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getExcelCellIndex() {
		return excelCellIndex;
	}

	public void setExcelCellIndex(String excelCellIndex) {
		this.excelCellIndex = excelCellIndex;
	}
}
