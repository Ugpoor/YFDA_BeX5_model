package com.justep.excel;

import org.apache.poi.ss.usermodel.Workbook;
import org.dom4j.Element;

public class ImportConfig {
	private Element mappingE = null;
	private Element configE = null;
	private ImportConceptConfig conceptConfig;

	public ImportConfig(Element mappingElement, Element configElement) {
		mappingE = mappingElement;
		configE = configElement;

		conceptConfig = new ImportConceptConfig(mappingElement, configElement);
	}

	public String getToKind() {
		return configE.attributeValue("to");
	}

	public ImportRange getRowRange(int sheet, Workbook workBook) {
		ImportRange result = new ImportRange();
		int start = 1;
		int end = workBook.getSheetAt(sheet).getPhysicalNumberOfRows();
		Element E = useDefault() ? mappingE.element("default-config") : configE;
		if (null != E) {
			Element rowE = E.element("row");
			if ("false".equalsIgnoreCase(rowE.attributeValue("all"))) {
				try {
					int i = Integer.parseInt(rowE.attributeValue("start"));
					start = i > start ? i : start;
					i = Integer.parseInt(rowE.attributeValue("end"));
					end = i < end ? i : end;
				} catch (Exception e) {
				}
			}
		}
		result.setStart(start);
		result.setEnd(end);
		return result;
	}

	public ImportRange getSheetRange(int sheetNum) {
		ImportRange result = new ImportRange();
		int start = 1;
		int end = sheetNum;
		Element E = useDefault() ? mappingE.element("default-config") : configE;
		if (null != E) {
			Element sheetE = E.element("sheet");
			if ("false".equalsIgnoreCase(sheetE.attributeValue("all"))) {
				try {
					int i = Integer.parseInt(sheetE.attributeValue("start"));
					start = i > start ? i : start;
					i = Integer.parseInt(sheetE.attributeValue("end"));
					end = i < end ? i : end;
				} catch (Exception e) {
				}
			}
		}
		result.setStart(start);
		result.setEnd(end);
		return result;
	}

	private boolean useDefault() {
		return "true".equalsIgnoreCase(configE.attributeValue("use-default"));
	}

	public ImportConceptConfig getConceptConfig() {
		return conceptConfig;
	}

}





