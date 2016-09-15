package com.justep.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.message.SAMessages;
import com.justep.system.action.ActionUtils;
import com.justep.system.context.ActionContext;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.SimpleTransform;
import com.justep.util.Utils;

public class ImportGenerator {
	private Workbook workBook = null;
	private FormulaEvaluator evaluator = null;
	private Element configE = null;
	private ImportConfig importConfig = null;
	private String excelFileName = null;
	private String configFileName = null;

	public ImportGenerator() {
	}

	public static void generateBefore(Workbook excel, ImportConfig importConfig) {
		//调用事件接口，没有代码
	}

	public static void generateAfter(Table data, Workbook excel, ImportConfig importConfig) {
		//调用事件接口，没有代码
	}

	private void init(Document config) {
		configE = config.getRootElement();
		excelFileName = configE.attributeValue("excel-file");
		configFileName = configE.attributeValue("mapping-file");
		LoadExcel();
		loadMapping();
	}

	private void LoadExcel() {
		try {
			FileInputStream fis = new FileInputStream(excelFileName);
			workBook = org.apache.poi.ss.usermodel.WorkbookFactory.create(fis);
			evaluator = workBook.getCreationHelper().createFormulaEvaluator();
		} catch (FileNotFoundException e) {
			throw ExcelException.create(e, SAMessages.IMPORT_EXCEL_LOAD_EXCEL_ERROR);
		} catch (IOException e) {
			throw ExcelException.create(e, SAMessages.IMPORT_EXCEL_EXCEL_FILE_ERROR);
		} catch (InvalidFormatException e) {
			throw ExcelException.create(e, SAMessages.IMPORT_EXCEL_EXCEL_FILE_ERROR);
		}
	}

	private void loadMapping() {
		if (Utils.isNotEmptyString(configFileName)) {
			SAXReader reader = new SAXReader();
			Document doc = null;
			try {
				doc = reader.read(configFileName);
			} catch (DocumentException e) {
				throw ExcelException.create(e, SAMessages.IMPORT_EXCEL_LOAD_EXCEL_MAPPING_ERROR);
			}
			importConfig = new ImportConfig(doc.getRootElement(), configE);
		} else
			throw ExcelException.create(SAMessages.IMPORT_EXCEL_EXCEL_MAPPING_NOT_EXISTS);
	}

	private Table getCreateActionTable(Map<String, Object> createActionParam) {
		if (Utils.isNull(createActionParam))
			return null;
		@SuppressWarnings("unchecked")
		Map<String, Object> parameters = (Map<String, Object>) createActionParam.get("parameters");
		return (Table) parameters.get("table");
	}

	private void setSaveActionTable(Map<String, Object> saveActionParam, Table t) {
		if (Utils.isNotNull(saveActionParam)) {
			@SuppressWarnings("unchecked")
			Map<String, Object> parameters = (Map<String, Object>) saveActionParam.get("parameters");
			parameters.put("table", t);
		}
	}

	@SuppressWarnings("unchecked")
	public Object generate(Document config, Map<String, Object> createActionParam, Map<String, Object> saveActionParam) {
		try {
			init(config);
			ImportConfig importConfig = getImportConfig();

			//使用action机制给出控制接口
			ActionContext actionContext = ActionUtils.getRequestContext().getActionContext();
			String process = actionContext.getProcess().getFullName();
			String activity = actionContext.getActivity().getName();
			String executor = actionContext.getExecutor();
			String executeContext = actionContext.getExecuteContext();
			Map<String, Object> p = new HashMap<String, Object>();
			p.put("excel", workBook);
			p.put("config", importConfig);
			ActionUtils.invokeAction(process, activity, Const.IMPORT_BEFORE_ACTION, executor, executeContext, p);

			ImportRange sheetRange = importConfig.getSheetRange(workBook.getNumberOfSheets());

			Table t = getCreateActionTable(createActionParam);
			if (Utils.isNull(t))
				return null;

			for (int i = sheetRange.getStart() - 1; i <= sheetRange.getEnd() - 1; i++) {
				ImportRange rowRange = importConfig.getRowRange(i, workBook);
				generateSheet(i, rowRange.getStart() - 1, rowRange.getEnd() - 1, t);
			}

			if(t.size()>0)//有数据才进行新增
				t = (Table) com.justep.system.action.ActionUtils.invokeAction((String) createActionParam.get("process"),
					(String) createActionParam.get("activity"), (String) createActionParam.get("action"), (String) createActionParam.get("executor"),
					(Map<String, Object>) createActionParam.get("parameters"));

			p.put("data", t);
			ActionUtils.invokeAction(process, activity, Const.IMPORT_AFTER_ACTION, executor, executeContext, p);

			if (Const.KIND_UI.equalsIgnoreCase(importConfig.getToKind())) {
				return t;
			} else if (Const.KIND_DB.equalsIgnoreCase(importConfig.getToKind())) {
				setSaveActionTable(saveActionParam, t);
				return com.justep.system.action.ActionUtils.invokeAction((String) saveActionParam.get("process"),
						(String) saveActionParam.get("activity"), (String) saveActionParam.get("action"), (String) saveActionParam.get("executor"),
						(Map<String, Object>) saveActionParam.get("parameters"));
			}
			return null;
		} finally {
			File file = new File(excelFileName);
			if (file.exists())
				file.delete();
			file = new File(configFileName);
			if (file.exists())
				file.delete();
		}
	}

	private boolean cellIsBlank(Cell cell){
		if(null==cell) return true;
		int cellType = cell.getCellType();
		if (Cell.CELL_TYPE_FORMULA == cellType)
			cellType = evaluator.evaluateFormulaCell(cell);
		return cellType==Cell.CELL_TYPE_BLANK;
	}
	
	/*
	 * 判断导入的excel行数据是否有效
	 */
	private boolean isValidRowData(org.apache.poi.ss.usermodel.Row row, ImportConfig importConfig) {
		if (null != row) {
			ImportConceptConfig conceptConfig = importConfig.getConceptConfig();
			for (int i=0;i<conceptConfig.getChecks().size();i++){
				if(conceptConfig.getChecks().get(i)){
					Cell cell = row.getCell(conceptConfig.getCellNumbers().get(i));
					if(cellIsBlank(cell)) return false;
				}
			}
			List<ImportRelationConfig> relationConfigs = conceptConfig.getRelationConfigs();
			for (ImportRelationConfig rc : relationConfigs) {
				if(rc.isCheck()){
					Cell cell = row.getCell(rc.getExcelCellIndex());
					if(cellIsBlank(cell)) return false;
				}
			}
			return true;
		}else return false;
	}

	private void generateSheet(int sheetIndex, int rowStart, int rowEnd, Table t) {
		Sheet sheet = this.workBook.getSheetAt(sheetIndex);
		for (int i = rowStart; i <= rowEnd; i++) {
			org.apache.poi.ss.usermodel.Row row = sheet.getRow(i);
			if (!isValidRowData(row, getImportConfig()))
				continue;
			generateRecord(t.appendRow(), row, sheetIndex, i);
		}
	}

	private void generateRecord(Row tableRow, org.apache.poi.ss.usermodel.Row row, int sheetIndex, int rowIndex) {
		setCellsValue(tableRow, row, sheetIndex, rowIndex);
		setPrimarykey(tableRow, row, sheetIndex, rowIndex);
	}

	private void setPrimarykey(Row tableRow, org.apache.poi.ss.usermodel.Row row, int sheetIndex, int rowIndex) {
		ImportConceptConfig conceptConfig = getImportConfig().getConceptConfig();
		if (Utils.isNotNull(tableRow)) {
			Table t = tableRow.getTable();
			if (conceptConfig.isUseKey()) {
				// TODO lzg 只是支持单主键，多主键通过keyrelation方式完成
				if (1 == conceptConfig.getCellNumbers().size()) {
					String idColumn = (String) t.getProperties().get(Table.PROP_NAME_ROWID);
					Cell cell = row.getCell(conceptConfig.getCellNumbers().get(0).intValue());
					if (t.getMetaData().containsColumn(idColumn)) {
						String dataType = t.getMetaData().getColumnMetaData(idColumn).getType();
						Object keyValue = getValue(cell, dataType, conceptConfig.getDatePatterns().get(0), sheetIndex, rowIndex);
						if (Utils.isNotNull(keyValue))
							tableRow.setValue(idColumn, keyValue);
					}
				}
			}
		}
	}

	private void setCellsValue(Row tableRow, org.apache.poi.ss.usermodel.Row row, int sheetIndex, int rowIndex) {
		if (Utils.isNotNull(tableRow)) {
			Table t = tableRow.getTable();
			ImportConfig mappingConfig = getImportConfig();
			ImportConceptConfig conceptConfig = mappingConfig.getConceptConfig();
			List<ImportRelationConfig> relationConfigs = conceptConfig.getRelationConfigs();
			for (ImportRelationConfig rc : relationConfigs) {
				String rName = rc.getMetaName();
				Cell cell = row.getCell(rc.getExcelCellIndex());
				if (t.getMetaData().containsColumn(rName)) {
					String dataType = t.getMetaData().getColumnMetaData(rName).getType();
					Object value = getValue(cell, dataType, rc.getDatePattern(), sheetIndex, rowIndex);
					if (Utils.isNotNull(value))
						tableRow.setValue(rName, value);
				}
			}
		}
	}

	private ImportConfig getImportConfig() {
		return importConfig;
	}

	private Object formatDate(String dateType, String value, String pattern) {
		Locale locale = Locale.ENGLISH;
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, locale);
		Date date = null;
		try {
			date = formatter.parse(value);
		} catch (ParseException e) {
			throw ExcelException.create(e, SAMessages.IMPORT_EXCEL_PARSE_DATE_ERROR, value);
			//new RuntimeException("时间类型转换失败！value：" + value, e);
		}
		return date;
	}

	private Object getValue(Cell cell, String dataType, String datePattern, int sheetIndex, int rowIndex) {
		if (null == cell)
			return null;
		Object value = null;
		int cellType = cell.getCellType();
		if (Cell.CELL_TYPE_FORMULA == cellType)
			cellType = evaluator.evaluateFormulaCell(cell);
		switch (cellType) {
		case Cell.CELL_TYPE_BOOLEAN: {
			value = cell.getBooleanCellValue();
			break;
		}
		case Cell.CELL_TYPE_NUMERIC: {
			if ("date".equalsIgnoreCase(dataType)) {
				value = new java.sql.Date(cell.getDateCellValue().getTime());
			} else if ("time".equalsIgnoreCase(dataType)) {
				value = new java.sql.Time(cell.getDateCellValue().getTime());
			} else if ("dateTime".equalsIgnoreCase(dataType)) {
				value = new java.sql.Timestamp(cell.getDateCellValue().getTime());
			} else
				value = new DecimalFormat("0.##########").format(cell.getNumericCellValue());
			break;
		}
		case Cell.CELL_TYPE_ERROR: {
			value = null;
			break;
		}
		case Cell.CELL_TYPE_FORMULA: {
			break;
		}
		case Cell.CELL_TYPE_BLANK:
		case Cell.CELL_TYPE_STRING: {
			String s = cell.getStringCellValue();
			if ("date".equalsIgnoreCase(dataType) || "time".equalsIgnoreCase(dataType) || "dateTime".equalsIgnoreCase(dataType)) {
				if (null != datePattern && !"".equals(datePattern)){
					value = formatDate(dataType, s, datePattern);
					if(null!=value){
						long t = ((Date)value).getTime();
						if ("date".equalsIgnoreCase(dataType)) {
							value = new java.sql.Date(t);
						} else if ("time".equalsIgnoreCase(dataType)) {
							value = new java.sql.Time(t);
						} else if ("dateTime".equalsIgnoreCase(dataType)) {
							value = new java.sql.Timestamp(t);
						}
					}
				}else
					value = null;
			} else
				try {
					value = SimpleTransform.transToObj(dataType, s);
				} catch (Exception e) {
					throw ExcelException.create(e, SAMessages.IMPORT_EXCEL_PARSE_CELL_ERROR, sheetIndex,rowIndex,cell.getColumnIndex());
					//new RuntimeException("excel数据与mapping声明的类型不一致，对应excel的sheet index: " + sheetIndex + " ;row index: " + rowIndex
					//		+ " ;column index: " + cell.getColumnIndex(), e);
				}
			break;
		}
		}
		// 数据类型检查，处理
		if (Utils.isNotEmptyString(dataType) && Utils.isNotNull(value)) {
			try {
				if ("integer".equalsIgnoreCase(dataType)) {
					Double d = null;
					if (value instanceof String) {
						d = Double.parseDouble((String) value);
						value = d.intValue();
					} else if (value instanceof Double) {
						d = (Double) value;
						value = d.intValue();
					}
					if (!(value instanceof Integer))
						throw ExcelException.create(SAMessages.IMPORT_EXCEL_CHACK_ERROR,value,"Integer");
				} else if ("float".equalsIgnoreCase(dataType)) {
					if (value instanceof String)
						value = Double.parseDouble((String) value);
					else if (!(value instanceof Double))
						throw ExcelException.create(SAMessages.IMPORT_EXCEL_CHACK_ERROR,value,"Float");
						//new RuntimeException("获取Float类型数据失败！");
				} else if ("decimal".equalsIgnoreCase(dataType)) {
					if (value instanceof String)
						value = BigDecimal.valueOf(Double.parseDouble((String) value));
					else if (!(value instanceof BigDecimal))
						throw ExcelException.create(SAMessages.IMPORT_EXCEL_CHACK_ERROR,value,"Decimal");
						//new RuntimeException("获取Decimal类型数据失败！");
				} else if ("boolean".equalsIgnoreCase(dataType)) {
					if (value instanceof String)
						value = Boolean.parseBoolean((String) value);
					else if (!(value instanceof Boolean))
						throw ExcelException.create(SAMessages.IMPORT_EXCEL_CHACK_ERROR,value,"Boolean");
						//new RuntimeException("获取Boolean类型数据失败！");
				}
			} catch (Exception e) {
				throw ExcelException.create(e, SAMessages.IMPORT_EXCEL_PARSE_CELL_ERROR, sheetIndex,rowIndex,cell.getColumnIndex());
			}
		}
		return value;
	}
}