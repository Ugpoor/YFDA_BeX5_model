import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jacob.activeX.ActiveXComponent;  
import com.jacob.com.ComThread;  
import com.jacob.com.Dispatch;  
import com.jacob.com.Variant; 
import com.justep.server.LoadDllUtil;

public class CreateGridExcel extends com.justep.ui.impl.JProcessorImpl {
	public static final int EXCEL_XML = 46;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoadDllUtil.loadDll();
		String reportType = request.getParameter("excelType");
		String gridField = request.getParameter("gridField");
		String selectcolumns = request.getParameter("selectcolumns");
		String groupcolumns = request.getParameter("groupcolumns");
		String pathname = request.getParameter("pathname");
		String title = request.getParameter("title");
		String dataId = request.getParameter("dataId");
		String groupField = request.getParameter("groupField");
		String crossCellField = request.getParameter("crossCellField");
		String crossRowField = request.getParameter("crossRowField");
		String crossCountField = request.getParameter("crossCountField");
		String cellCount = request.getParameter("isCellCount");
		String rowCount = request.getParameter("isRowCount");
		
		try {
			if ("gridReport".equals(reportType)) {
				Map<String, Object> map = this.getMap(gridField, selectcolumns, groupcolumns, pathname, title, dataId, groupField);
				this.createGridReport(map);
				this.excelToXml(pathname, pathname.substring(0, pathname.length()-4)+"xml");
			} else if ("groupReport".equals(reportType)) {
				Map<String, Object> map = this.getMap(gridField, selectcolumns, groupcolumns, pathname, title, dataId, groupField);
				this.createGroupReport(map);
				this.excelToXml(pathname, pathname.substring(0, pathname.length()-4)+"xml");
			} else if ("crossReport".equals(reportType)) {
				Map<String, Object> map = this.getMap(crossCellField,crossRowField,crossCountField,cellCount,rowCount, pathname, title, dataId); 
				this.createCrossReport(map);
				this.excelToXml(pathname, pathname.substring(0, pathname.length()-4)+"xml");
			}

		} catch (Exception e) {
			response.getWriter().println("error");
		}

	}

	private Map<String, Object> getMap(String crossCellField, String crossRowField, String crossCountField,String cellCount,String rowCount, String pathname, String title, String dataId) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (crossCellField != null && !"".equals(crossCellField.trim())) {
			List<String> list = new ArrayList<String>();
			for (String field : crossCellField.split(",")) {
				list.add(field);
			}
			map.put("cellList", list);
		}
		if (crossRowField != null && !"".equals(crossRowField.trim())) {
			List<String> list = new ArrayList<String>();
			for (String field : crossRowField.split(",")) {
				list.add(field);
			}
			map.put("rowList", list);
		}
		if (crossCountField != null && !"".equals(crossCountField.trim())) {
			List<String> list = new ArrayList<String>();
			for (String field : crossCountField.split(",")) {
				list.add(field);
			}
			map.put("countList", list);
		}
		
		map.put("pathname", pathname);
		map.put("title", title);
		map.put("dataId", dataId);
		map.put("rowCount", rowCount);
		map.put("cellCount", cellCount);
		return map;
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	private Map<String, Object> getMap(String gridField, String selectcolumns, String groupcolumns, String pathname, String title, String dataId, String groupField) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (gridField != null && !"".equals(gridField.trim())) {
			List<String> list = new ArrayList<String>();
			for (String field : gridField.split(",")) {
				list.add(field);
			}
			map.put("gridField", list);
		}

		if (selectcolumns != null && !"".equals(selectcolumns.trim())) {
			List<String> list = new ArrayList<String>();
			for (String selectString : selectcolumns.split(",")) {
				list.add(selectString);
			}
			map.put("select", list);
		}
		if (groupcolumns != null && !"".equals(groupcolumns.trim())) {
			List<String> list = new ArrayList<String>();
			for (String selectString : groupcolumns.split(",")) {
				list.add(selectString);
			}
			map.put("group", list);
		}
		map.put("pathname", pathname);
		map.put("title", title);
		map.put("dataId", dataId);
		map.put("groupField", groupField);
		return map;
	}
	
	private void createCrossReport(Map<String, Object> map) {
		String pathname = (String) map.get("pathname");
		String title = (String) map.get("title");
		if (this.fileexit(pathname)) {
			XSSFWorkbook workbook = this.getWorkbook();
			this.setHeaderVal(workbook, title, 1);
			this.fillCrossField(workbook, map);
			try {
				workbook.write(this.getOutputStream(pathname));
				System.out.println("文件创建成功");
			} catch (IOException e) {

			}
		}
	}
	@SuppressWarnings("unchecked")
	private boolean fillCrossField(XSSFWorkbook workbook, Map<String, Object> map) {
		boolean flag = true;
		String dataId = (String) map.get("dataId");
		boolean isRowCount = this.isTrue((String) map.get("rowCount"));// 根据行字段求和
		boolean isCellCount = this.isTrue((String) map.get("cellCount"));// 根据列字段求和
		List<String> rowList = (List<String>) map.get("rowList");// 行字段 aa
		int rowListSize = rowList == null ? 0 : rowList.size();
		List<String> cellList = (List<String>) map.get("cellList");// 列字段bb
		int cellListSize = cellList == null ? 0 : cellList.size();
		List<String> countList = (List<String>) map.get("countList");// 求和字段
		int countListSize = countList == null ? 0 : countList.size();
		XSSFSheet xssfSheet = this.getsheet(workbook);
		// 行字段,横向排列
		// 行字段所在行
		XSSFRow rowFieldRow = xssfSheet.createRow(cellListSize + 1);
		for (int i = 0; i < rowListSize; i++) {
			XSSFCell cell = rowFieldRow.createCell(i);
			cell.setCellValue(dataId + ".group(" + dataId + "." + rowList.get(i) + ")");
		}
		// 列字段,纵向排列
		for (int i = 0; i < cellListSize; i++) {
			XSSFRow row = xssfSheet.createRow(1 + i);
			XSSFCell cell = row.createCell(rowListSize);
			cell.setCellValue(dataId + ".grouph(" + dataId + "." + cellList.get(i) + ")");
		}
		// 求和字段
		// 获得求和字段所在行 getRow()如果不存在，返回null
		XSSFRow countRow = xssfSheet.getRow(1 + cellListSize);
		if (countRow == null) {// 如果不存在，行字段为空
			countRow = xssfSheet.createRow(1 + cellListSize);
		}
		for (int i = 0; i < countListSize; i++) {
			XSSFCell cell = countRow.createCell(rowListSize + i);
			String countField = countList.get(i);
			if (countField.contains("-")) {
				String field = countField.split("-")[0];
				String countType = countField.split("-")[1];
				cell.setCellValue("=" + countType + "(" + dataId + "." + field + ")");
			} else {
				cell.setCellValue(dataId + "." + countField);
			}
		}

		// 根据行字段求和统计,选中该项，行字段必须不为空，否则不生效
		if (rowListSize != 0 && isRowCount) {
			int rownum = xssfSheet.getPhysicalNumberOfRows();// 获取行字段所在行的下一行行号
			for (int i = 0; i < rowListSize; i++) {
				XSSFRow sumRow = xssfSheet.createRow(rownum + i);
				XSSFCell titleCell = sumRow.createCell(rowListSize - 1 - i);// '合计'单元格
				titleCell.setCellValue("合计");
				// 求和
				for (int j = 0; j < countListSize; j++) {
					XSSFCell sumCell = sumRow.createCell(rowListSize + j);
					sumCell.setCellFormula("SUM(" + this.indexToColumn(rowListSize + 1 + j) + (rownum + i) + ")");
				}
				// 合并单元格
				this.merge(workbook, cellListSize + 1, cellListSize + rowListSize - i, i, i);// 合并行字段单元格
				this.merge(workbook, xssfSheet.getLastRowNum(), xssfSheet.getLastRowNum(), titleCell.getColumnIndex(), rowListSize-1);
			}
		}
		// 根据列字段求和统计,选中该项，行字段必须不为空，否则不生效
		if (cellListSize != 0 && isCellCount) {
			int rownum = countRow.getRowNum() - 1;// 获得统计字段所在行号，如果是excel中
													// 的行号需+1，此处获取列字段所占行的最后一行，需-1
			for (int i = 0; i < cellListSize; i++) {
				XSSFRow sumRow = xssfSheet.getRow(rownum - i);
				XSSFCell titleCell = sumRow.createCell(rowListSize + countListSize + i);
				titleCell.setCellValue("合计");
				// 求和
				// 统计字段所在行求和
				XSSFCell sumCell = countRow.createCell(rowListSize + countListSize + i);
				if (i == 0) {
					String str = "";
					for (int k = 0; k < countListSize; k++) {
						str += this.indexToColumn(rowListSize + 1 + k) + (countRow.getRowNum() + 1) + "+";
					}
					sumCell.setCellFormula("SUM(" + (str.substring(0, str.length() - 1)) + ")");
				} else {
					sumCell.setCellFormula("SUM(" + this.indexToColumn(countRow.getLastCellNum() - 1) + (countRow.getRowNum() + 1) + ")");
				}
				// 如果isRowCount == true
				for (int j = 1; j <= rowListSize; j++) {
					XSSFRow row = xssfSheet.getRow(countRow.getRowNum() + j);
					XSSFCell cell = row.createCell(rowListSize + countListSize + i);
					cell.setCellFormula("SUM(" + this.indexToColumn(countRow.getLastCellNum()) + (countRow.getRowNum() + j) + ")");
				}

				// 合并列单元格
				this.merge(workbook, 1 + i, 1 + i, rowListSize, rowListSize+countListSize + cellListSize-2 - i);// 合并列字段单元格
				this.merge(workbook, titleCell.getRowIndex(), rownum, titleCell.getColumnIndex(), titleCell.getColumnIndex());// 合并列求和
			}

		}
		
		if (rowListSize != 0 && cellListSize != 0) {
			XSSFRow row = xssfSheet.getRow(1);
			XSSFCell cell = row.createCell(0);
			String title = "";
			for (int i = 0; i < rowListSize; i++) {
				title += "||"; 
			}
			cell.setCellValue(title);
			this.merge(workbook, 1, cellListSize, 0, rowListSize-1);
		}
		
		for (int i = 0; i < xssfSheet.getPhysicalNumberOfRows(); i++) {
			XSSFRow row = xssfSheet.getRow(i + 1);
			if (row != null) {
				for (Cell cell : row) {
					cell.setCellStyle(this.commonStyle(workbook));
				}

			}
		}
		return flag;
	}

	private boolean isTrue(String param) {
		return "true".equals(param);
	}
	
	private void merge(XSSFWorkbook workbook, int firstRow, int lastRow, int firstCol, int lastCol) {
		XSSFSheet sheet = workbook.getSheetAt(0);
		sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, firstCol, lastCol));
		RegionUtil.setBorderBottom(HSSFCellStyle.BORDER_THIN, new CellRangeAddress(firstRow, lastRow, firstCol, lastCol), sheet, workbook);
		RegionUtil.setBorderLeft(HSSFCellStyle.BORDER_THIN, new CellRangeAddress(firstRow, lastRow, firstCol, lastCol), sheet, workbook);
		RegionUtil.setBorderRight(HSSFCellStyle.BORDER_THIN, new CellRangeAddress(firstRow, lastRow, firstCol, lastCol), sheet, workbook);
		RegionUtil.setBorderTop(HSSFCellStyle.BORDER_THIN, new CellRangeAddress(firstRow, lastRow, firstCol, lastCol), sheet, workbook);
	}
	@SuppressWarnings("unchecked")
	private void createGroupReport(Map<String, Object> map) throws Exception {
		String pathname = map.get("pathname").toString();
		String title = map.get("title").toString();
		String dataId = map.get("dataId").toString();
		String groupField = (String) map.get("groupField");
		List<String> groupList = (List<String>) map.get("group");// 格式全部为ds1.group(ds1.a)
		List<String> selectList = (List<String>) map.get("select");// 第一个格式为ds1.select(ds1.c)，其他为ds1.d,此类型的下一行对应单元格为该列求和
		int headerColumns = (groupList != null ? groupList.size() : 0) + (selectList != null ? selectList.size() : 0); // 对行首进行合并单元格
		this.fileexit(pathname);
		XSSFWorkbook workbook = this.getWorkbook();
		this.setHeaderVal(workbook, title, headerColumns);
		this.fillGroupField(workbook, groupList, selectList, dataId, groupField);
		workbook.write(this.getOutputStream(pathname));
		System.out.println("创建" + pathname + "成功！");
	}

	// 对分组报表进行赋值

	private void fillGroupField(XSSFWorkbook workbook, List<String> groupList, List<String> selectList, String dataId, String groupField) {
		boolean flag = false;
		int rowIndex = 1;
		XSSFRow titleRow = workbook.getSheetAt(0).createRow(rowIndex);
		XSSFRow valueRow = workbook.getSheetAt(0).createRow(rowIndex + 1);
		XSSFRow countRow = workbook.getSheetAt(0).createRow(rowIndex + 2);
		if (groupList != null && selectList != null) {
			for (int i = 0; i < groupList.size(); i++) {
				String field = groupList.get(i);
				XSSFCell titleCell = titleRow.createCell(i);
				XSSFCell valueCell = valueRow.createCell(i);
				titleCell.setCellStyle(this.commonStyle(workbook, false));
				valueCell.setCellStyle(this.commonStyle(workbook));
				titleCell.setCellValue(groupList.get(i));
				valueCell.setCellValue(dataId + ".group(" + dataId + "." + field + ")");
				if (groupField != null && groupField.equals(field)) {
					flag = true;
					this.merge(workbook, valueCell.getRowIndex(),valueCell.getRowIndex() + 1,i,i);
				}
			}
			int cellNum = titleRow.getLastCellNum();
			if (cellNum == -1){
				cellNum = 0;
			}
			for (int i = 0; i < selectList.size(); i++) {
				String field = selectList.get(i);
				String fieldValue = field.split("-")[0];
				String countType = field.split("-")[1];
				XSSFCell titleCell = titleRow.createCell(cellNum + i);
				XSSFCell valueCell = valueRow.createCell(cellNum + i);
				titleCell.setCellStyle(this.commonStyle(workbook, false));
				valueCell.setCellStyle(this.commonStyle(workbook));
				titleCell.setCellValue(fieldValue);
				if (i == 0) {
					valueCell.setCellValue(dataId + ".select(" + dataId + "." + fieldValue + ")");
				} else {
					valueCell.setCellValue(dataId + "." + fieldValue);
				}
				if (flag) {
					XSSFCell countCell = countRow.createCell(cellNum + i);
					countCell.setCellStyle(this.commonStyle(workbook));
					countCell.setCellFormula(countType + "(" + this.indexToColumn(countCell.getColumnIndex() + 1) + countCell.getRowIndex() + ")");
				}
			}
		}
	}

	/**
	 * 创建网格报表
	 * 
	 * @param map
	 */
	@SuppressWarnings("unchecked")
	private void createGridReport(Map<String, Object> map) {
		String pathname = map.get("pathname").toString();
		String title = map.get("title").toString();
		String dataId = map.get("dataId").toString();
		List<String> selectList = (List<String>) map.get("gridField");
		int megerColumns = (selectList == null) ? 0 : selectList.size();
		this.fileexit(pathname);// 文件存在的话.删除
		XSSFWorkbook workbook = this.getWorkbook();
		this.setHeaderVal(workbook, title, megerColumns);
		this.fillGridField(workbook, dataId, selectList);
		FileOutputStream os = null;
		try {
			os = this.getOutputStream(pathname);
			workbook.write(os);
			System.out.println("文件已创建");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void fillGridField(XSSFWorkbook workbook, String dataId, List<String> selectList) {
		int lastRowNum = this.getsheet(workbook).getLastRowNum();
		XSSFRow titleRow = this.getsheet(workbook).createRow(lastRowNum + 1);
		XSSFRow valueRow = this.getsheet(workbook).createRow(lastRowNum + 2);
		if (selectList != null) {
			for (int i = 0; i < selectList.size(); i++) {
				String field = selectList.get(i);
				XSSFCell titleCell = titleRow.createCell(i);
				XSSFCell valueCell = valueRow.createCell(i);
				titleCell.setCellStyle(this.commonStyle(workbook, false));
				titleCell.setCellValue(field);
				valueCell.setCellStyle(this.commonStyle(workbook));
				if (i == 0) {
					valueCell.setCellValue(dataId + ".select(" + dataId + "." + field + ")");
				} else {
					valueCell.setCellValue(dataId + "." + field);
				}
			}
		}

	}

	private XSSFSheet getsheet(XSSFWorkbook workbook) {
		return workbook.getSheetAt(0);
	}

	private void setHeaderVal(XSSFWorkbook workbook, String title, int headerColumns) {
		XSSFCell headerCell = this.createCell(workbook, 0, 0);
		headerCell.setCellStyle(this.commonStyle(workbook, true));
		headerCell.setCellValue(title);
		this.merge(workbook, 0,0,0,headerColumns-1);
	}

	private XSSFWorkbook getWorkbook() {
		return new XSSFWorkbook();
	}

	private FileOutputStream getOutputStream(String pathname) {
		try {
			return new FileOutputStream(pathname);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 设置正文字体,宋体，大小16
	 * 
	 * @return
	 */
	private XSSFFont commonFont(XSSFWorkbook workbook) {
		XSSFFont font = workbook.createFont();
		font.setFontName("宋体");
		return font;
	}

	/**
	 * 格式居中,如果是标题，设置标题字体大小
	 * 
	 * @param font
	 * @return
	 */
	private XSSFCellStyle commonStyle(XSSFWorkbook workbook, boolean isHeader) {
		XSSFCellStyle style = workbook.createCellStyle();
		XSSFFont font = this.commonFont(workbook);
		if (isHeader) {
			font.setFontHeightInPoints((short) 18);
		} else {
			style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			style.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
		}
		style.setFont(font);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		return style;
	}

	private XSSFCellStyle commonStyle(XSSFWorkbook workbook) {
		XSSFCellStyle style = workbook.createCellStyle();
		style.setFont(this.commonFont(workbook));
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		return style;
	}

	/**
	 * 判断文件是否存在
	 * 
	 * @param pathname
	 * @return
	 */
	private boolean fileexit(String pathname) {
		boolean flag = true;
		try {
			File file = new File(pathname);
			if (file.exists()) {
				file.delete();
				System.out.println("文件已存在，文件已删除");
			}
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	private XSSFSheet createSheet(XSSFWorkbook workbook) {
		return workbook.createSheet();
	}

	@SuppressWarnings("unused")
	private XSSFSheet createSheet(XSSFWorkbook workbook, String title) {
		return workbook.createSheet(title);
	}

	private XSSFRow createRow(XSSFWorkbook workbook, int index) {
		return this.createSheet(workbook).createRow(index);
	}

	/**
	 * @param workbook
	 * @param cellindex列
	 * @param rowindex
	 *            行
	 * @return
	 */
	private XSSFCell createCell(XSSFWorkbook workbook, int cellindex, int rowindex) {
		return this.createRow(workbook, rowindex).createCell(rowindex);
	}

	/**
	 * 用于将excel表格中列索引转成列号字母，从A对应1开始
	 * 
	 * @param index
	 *            列索引
	 * @return 列号
	 */
	private String indexToColumn(int index) {
		if (index <= 0) {
			try {
				throw new Exception("Invalid parameter");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		index--;
		String column = "";
		do {
			if (column.length() > 0) {
				index--;
			}
			column = ((char) (index % 26 + (int) 'A')) + column;
			index = (int) ((index - index % 26) / 26);
		} while (index > 0);
		return column;
	}
	
	 private  void excelToXml(String xlsfile, String xmlfile) {  
	        // 初始化  
	        ComThread.InitSTA();  
	        ActiveXComponent app = new ActiveXComponent("Excel.Application"); // 启动Excel  
	        try {  
	            app.setProperty("Visible", new Variant(false));  
	            Dispatch excels = app.getProperty("Workbooks").toDispatch();  
	            Dispatch excel = Dispatch.invoke(  
	                    excels,  
	                    "Open",  
	                    Dispatch.Method,  
	                    new Object[] { xlsfile, new Variant(false),  
	                            new Variant(true) }, new int[1]).toDispatch();  
	            Dispatch.invoke(excel, "SaveAs", Dispatch.Method, new Object[] {  
	                    xmlfile, new Variant(EXCEL_XML) }, new int[1]);  
	            Variant f = new Variant(false);  
	            Dispatch.call(excel, "Close", f);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        } finally {  
	            app.invoke("Quit", new Variant[] {});  
	            ComThread.Release();  
	        }  
	    }
}
