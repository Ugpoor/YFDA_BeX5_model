package com.justep.excel;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.dom4j.Element;

import com.justep.common.MessageUtils;
import com.justep.message.SAMessages;
import com.justep.system.action.ActionUtils;
import com.justep.system.context.ActionContext;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.SimpleTransform;

public class ExportGenerator {
	protected Logger logger = Logger.getLogger(ExportGenerator.class);
	private Element configElement;
	private Table data;
	private int offset = 0;
	protected ExportConfig configObj;

	protected String dateTimePatten = "yyyy-MM-dd HH:mm:ss";
	protected String datePatten = "yyyy-MM-dd";
	protected String timePatten = "HH:mm:ss";

	public ExportGenerator(Element configElement, Table data) {
		this.configElement = configElement;
		this.data = data;
		this.configObj = new ExportConfig(this.getConfigDataXml());
	}

	public static void generateBefore(Table data, HSSFWorkbook excel){
		//调用事件接口，没有代码
	}
	
	public static void generateAfter(Table data, HSSFWorkbook excel){
		//调用事件接口，没有代码
	}

	public void setDateTimePatten(String patten) {
		this.dateTimePatten = patten;
	}

	public void setTimePatten(String patten) {
		this.timePatten = patten;
	}

	public void setDatePatten(String patten) {
		this.datePatten = patten;
	}

	protected boolean isShowLabel() {
		String show = configElement.selectSingleNode("/root/config/show-label").getText();
		return "true".equals(show.trim().toLowerCase());
	}

	public void setConfigXml(Element e) {
		this.configElement = e;
	}

	public void setData(Table data) {
		this.data = data;
	}

	protected Element getConfigDataXml() {
		return (Element) this.configElement.selectSingleNode("/root/concept");
	}

	protected ExportConfig getConfigObj() {
		return this.configObj;
	}

	protected Table getData() {
		return this.data;
	}

	protected int getLabelRow() {
		String i = this.configElement.selectSingleNode("/root/config/start-row").getText();
		int v = Integer.valueOf(i) - 1 + this.offset;
		//this.offsetAdd(1);
		return v;

	}

	protected int getDataStartRow() {
		String i = this.configElement.selectSingleNode("/root/config/start-row").getText();
		return Integer.valueOf(i) - 1 + this.offset;
	}

	protected void offsetAdd(int i) {
		this.offset += i;
	}

	protected int generateLabel(HSSFSheet sheet, HSSFWorkbook book) {
		int rowNum = this.getLabelRow();
		Element configData = this.getConfigDataXml();
		HSSFRow row = sheet.createRow(rowNum);
		HSSFCell cell = null;
		HSSFCellStyle labelCellStyle = book.createCellStyle();
		HSSFFont font = book.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		labelCellStyle.setFont(font);
		labelCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		labelCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		String cellNo = configData.attributeValue(Const.CELLNO);
		if (null != cellNo && !"".equals(cellNo)) {
			int index = Integer.valueOf(cellNo) - 1;
			cell = row.createCell(index);
			cell.setCellValue(MessageUtils.getMessage(SAMessages.class, SAMessages.PRIMARY_KEY_NAME));
			cell.setCellStyle(labelCellStyle);
			Short width = null;
			try {
				width = Short.valueOf(configData.attributeValue(Const.WIDTH));
			} catch (Exception e) {
			}
			if (null != width)
				sheet.setColumnWidth(index, width * 36);
		}
		List<?> relations = configData.elements();
		for (Object relation : relations) {
			Element r = (Element) relation;
			cellNo = r.attributeValue(Const.CELLNO);
			if (null == cellNo || "".equals(cellNo)) // 未指定所在列，表示数据不导入excel
				continue;
			String label = r.attributeValue(Const.META_LABEL);
			if (null == label) // 未找到label的容错处理
				label = "";
			int index = Integer.valueOf(cellNo) - 1;
			cell = row.createCell(index);
			cell.setCellValue(label);
			cell.setCellStyle(labelCellStyle);
			Integer width = null;
			try {
				width = Integer.valueOf(r.attributeValue(Const.WIDTH));
			} catch (Exception e) {
			}
			if (null != width)
				sheet.setColumnWidth(index, width * 36);
		}
		return relations.size();
	}

	public HSSFWorkbook generate() {
		Table rows = this.getData();

		HSSFWorkbook book = new HSSFWorkbook();
		//使用action机制给出控制接口
		ActionContext actionContext = ActionUtils.getRequestContext().getActionContext();
		String process = actionContext.getProcess().getFullName();
		String activity = actionContext.getActivity().getName();
		String executor = actionContext.getExecutor();
		String executeContext = actionContext.getExecuteContext();
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("data", rows);
		p.put("excel", book);
		ActionUtils.invokeAction(process, activity, Const.EXPORT_BEFORE_ACTION, executor, executeContext, p);
		if (com.justep.util.Utils.isNotNull(rows)) {
			Iterator<Row> rowIt = rows.iterator();
			int startRowIndex = this.getDataStartRow();
			int i = startRowIndex;
			HSSFSheet sheet = null;
			int cellSum = 0;
			while (rowIt.hasNext()) {
				if (i > 65530)
					i = startRowIndex;
				Row row = rowIt.next();
				if (null == sheet || startRowIndex == i) {
					sheet = book.createSheet();
					if (this.isShowLabel())
						cellSum = this.generateLabel(sheet, book);
					setDefaultCellStyle(book, sheet, rows);
				}

				int j = this.generateData(sheet, book, row, i + 1);
				cellSum = j > cellSum ? j : cellSum;
				i++;
			}
			if (null == sheet) {
				sheet = book.createSheet();
				if (this.isShowLabel())
					cellSum = this.generateLabel(sheet, book);
				setDefaultCellStyle(book, sheet, rows);
			}
		}
		ActionUtils.invokeAction(process, activity, Const.EXPORT_AFTER_ACTION, executor, executeContext, p);
		return book;
	}

	private void setDefaultCellStyle(HSSFWorkbook book, HSSFSheet sheet, Table t){
		ExportConfig config = this.getConfigObj();
		for (String cellName : t.getColumnNames()) {
			ExportRelationConfig rConfig = config.getRelationConfig(cellName);
			if (null == rConfig || "".equals(rConfig.getExcelCellIndex()))
				continue;
			String type = t.getMetaData().getColumnMetaData(cellName).getType();
			int iNO = Integer.valueOf(rConfig.getExcelCellIndex()) - 1;
			if (SimpleTransform.DATETIME.equals(type)) {
				short df = book.createDataFormat().getFormat(dateTimePatten);
				HSSFCellStyle dateCellStyle = book.createCellStyle();
				dateCellStyle.setDataFormat(df);
				sheet.setDefaultColumnStyle(iNO, dateCellStyle);
				int w = sheet.getColumnWidth(iNO);
				if(w<5000)	sheet.setColumnWidth(iNO, 5000);
			} else if (SimpleTransform.DATE.equals(type)) {
				short df = book.createDataFormat().getFormat(datePatten);
				HSSFCellStyle dateCellStyle = book.createCellStyle();
				dateCellStyle.setDataFormat(df);
				sheet.setDefaultColumnStyle(iNO, dateCellStyle);
				int w = sheet.getColumnWidth(iNO);
				if(w<2800) sheet.setColumnWidth(iNO, 2800);
			} else if (SimpleTransform.TIME.equals(type)) {
				short df = book.createDataFormat().getFormat(timePatten);
				HSSFCellStyle dateCellStyle = book.createCellStyle();
				dateCellStyle.setDataFormat(df);
				sheet.setDefaultColumnStyle(iNO, dateCellStyle);
				int w = sheet.getColumnWidth(iNO);
				if(w<2200) sheet.setColumnWidth(iNO, 2200);
			}
		}
		
	}
	
	private int generateData(HSSFSheet sheet, HSSFWorkbook book, Row tRow, int rowIndex) {
		Table t = tRow.getTable();
		ExportConfig config = this.getConfigObj();
		HSSFCell cell = null;
		int cellSum = 0;
		HSSFRow row = sheet.createRow(rowIndex);
		if (config.getExcelCellNo() != null && !config.getExcelCellNo().equals("")) {
			cell = row.createCell(Integer.valueOf(config.getExcelCellNo()) - 1);
			cell.setCellValue(tRow.getString((String) t.getProperties().get(Table.PROP_NAME_ROWID)));
		}
		if (cellSum == 0)
			cellSum = t.getColumnCount();

		for (String cellName : t.getColumnNames()) {
			ExportRelationConfig rConfig = config.getRelationConfig(cellName);
			if (null == rConfig || "".equals(rConfig.getExcelCellIndex()))
				continue;
			Object value = tRow.getValue(cellName);
			int iNO = Integer.valueOf(rConfig.getExcelCellIndex()) - 1;
			if (value instanceof String) {
				row.createCell(iNO).setCellValue((String) value);
			} else if (value instanceof Integer) {
				cell = row.createCell(iNO);
				cell.setCellValue((Integer) value);
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			} else if (value instanceof Double) {
				cell = row.createCell(iNO);
				cell.setCellValue((Double) value);
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			} else if (value instanceof Float) {
				cell = row.createCell(iNO);
				cell.setCellValue((Float) value);
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			} else if (value instanceof BigDecimal) {
				cell = row.createCell(iNO);
				cell.setCellValue(((BigDecimal) value).doubleValue());
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			} else if (value instanceof Boolean) {
				cell = row.createCell(iNO);
				cell.setCellValue((Boolean) value);
				cell.setCellType(HSSFCell.CELL_TYPE_BOOLEAN);
			} else if (value instanceof Timestamp) {
				cell = row.createCell(iNO);
				cell.setCellValue(HSSFDateUtil.getExcelDate((Timestamp) value));
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			} else if (value instanceof Date) {
				cell = row.createCell(iNO);
				cell.setCellValue(HSSFDateUtil.getExcelDate((Date) value));
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			} else if (value instanceof Time) {
				cell = row.createCell(iNO);
				cell.setCellValue(HSSFDateUtil.getExcelDate((Time) value));
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			}
		}
		return cellSum;
	}
}
