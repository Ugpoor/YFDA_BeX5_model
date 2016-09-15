package com.justep.excel;

import java.util.Iterator;

import org.dom4j.Element;

public class ImportRelationConfig {
	private String metaName;
	private String metaLabel;
	private int metaCellIndex;
	private String type;
	private int excelCellIndex;
	private String datePattern;
	private boolean isCheck;

	public ImportRelationConfig(Element mappingRelationElement, Element configConceptE) {
		metaName = mappingRelationElement.attributeValue("name");
		type = mappingRelationElement.attributeValue("value-type");
		if (null == type || "".equals(type)) {
			Element e = (Element) configConceptE.selectSingleNode("./relation[@name='" + metaName + "']");
			if (null != e)
				type = e.attributeValue("type");
		}
		if (null == type || "".equals(type))
			type = "String";
		else
			type = type.toUpperCase();
		metaLabel = metaName;
		metaCellIndex = getIndexByConfig(metaName, configConceptE);
		excelCellIndex = Integer.parseInt(mappingRelationElement.attributeValue("cell-number")) - 1;
		datePattern = mappingRelationElement.attributeValue("date-pattern");
		isCheck = "true".equalsIgnoreCase(mappingRelationElement.attributeValue("check"));
	}

	private int getIndexByConfig(String name, Element configConceptE) {
		int i = 0;

		Iterator<?> it = configConceptE.elementIterator("relation");
		while (it.hasNext()) {
			Element E = (Element) it.next();
			if (name.equals(E.attributeValue("name")))
				return i;
			i++;
		}
		return -1;
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

	public int getMetaCellIndex() {
		return metaCellIndex;
	}

	public void setMetaCellIndex(int metaCellIndex) {
		this.metaCellIndex = metaCellIndex;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getExcelCellIndex() {
		return excelCellIndex;
	}

	public void setExcelCellIndex(int excelCellIndex) {
		this.excelCellIndex = excelCellIndex;
	}

	public String getDatePattern() {
		return datePattern;
	}

	public void setDatePattern(String datePattern) {
		this.datePattern = datePattern;
	}

	public boolean isCheck() {
		return isCheck;
	}

	public void setCheck(boolean isCheck) {
		this.isCheck = isCheck;
	}
}