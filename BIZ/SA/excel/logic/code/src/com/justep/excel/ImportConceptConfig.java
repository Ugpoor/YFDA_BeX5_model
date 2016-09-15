package com.justep.excel;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Element;

public class ImportConceptConfig {
	private List<ImportRelationConfig> relationConfigs = new ArrayList<ImportRelationConfig>();
	private String name;
	private int cellSize = 0;
	private boolean useKey = true;
	private List<Integer> cellNumbers = new ArrayList<Integer>();
	private List<String> types = new ArrayList<String>();
	private List<String> datePatterns = new ArrayList<String>();
	private List<Boolean> checks = new ArrayList<Boolean>();

	public ImportConceptConfig(Element mappingElement, Element configElement) {
		Element mappConceptE = mappingElement.element("concept");
		if (null == mappConceptE)
			throw ExcelException.create(com.justep.message.SAMessages.IMPORT_CONCEPT_CONFIG_CONCEPT_NOT_EXISTS);
		String s1 = mappConceptE.attributeValue("name");
		Element configConceptE = (Element) configElement.selectSingleNode("//concept");
		if (null == configConceptE)
			throw ExcelException.create(com.justep.message.SAMessages.IMPORT_CONCEPT_CONFIG_DATA_CONCEPT_NOT_EXISTS);
		String s2 = configConceptE.attributeValue("name");
		if (null == s1 || null == s2 || !s1.equals(s2))
			throw ExcelException.create(com.justep.message.SAMessages.IMPORT_CONCEPT_CONFIG_CONCEPT_ERROR);
		name = s1;
		try {
			List<?> keyEs = mappConceptE.element("primary-key").elements("key-value");
			for (Object keyE : keyEs) {
				Element e = ((Element) keyE);
				cellNumbers.add(new Integer(Integer.parseInt(e.attributeValue("cell-number")) - 1));
				String type = e.attributeValue("value-type");
				checks.add("true".equalsIgnoreCase(e.attributeValue("check")));
				if (null == type || "".equals(type))
					type = "String";
				types.add(type);
				datePatterns.add(e.attributeValue("date-pattern"));
			}
		} catch (Exception e) {
			useKey = false;
		}
		List<?> relationEs = mappConceptE.elements("relation");
		for (Object relationE : relationEs) {
			ImportRelationConfig o = new ImportRelationConfig((Element) relationE, configConceptE);
			if (cellSize < o.getMetaCellIndex())
				cellSize = o.getMetaCellIndex();
			relationConfigs.add(o);
		}
	}

	public List<ImportRelationConfig> getRelationConfigs() {
		return relationConfigs;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCellSize() {
		return cellSize;
	}

	public void setCellSize(int cellSize) {
		this.cellSize = cellSize;
	}

	public boolean isUseKey() {
		return useKey;
	}

	public void setUseKey(boolean useKey) {
		this.useKey = useKey;
	}

	public List<Integer> getCellNumbers() {
		return cellNumbers;
	}

	public void setCellNumbers(List<Integer> cellNumbers) {
		this.cellNumbers = cellNumbers;
	}

	public List<String> getTypes() {
		return types;
	}

	public List<String> getDatePatterns() {
		return datePatterns;
	}

	public List<Boolean> getChecks() {
		return checks;
	}

}