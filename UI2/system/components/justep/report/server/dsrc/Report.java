import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Namespace;
import org.dom4j.QName;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.justep.filesystem.FileSystemWrapper;
import com.justep.report.ReportConstants;
import com.justep.report.xls.XLSTransUtils;
import com.justep.report.xls.XLSTransformer;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.util.PageUtils;
import com.justep.ui.xml.XMLConstants;
import com.justep.util.xls.CellLayoutConvert;
import com.justep.xbl.runtime.XBLException;
import com.justep.xls.Cell;
import com.justep.xls.Workbook;
import com.justep.xls.Worksheet;

public class Report implements ComponentTemplate {

	protected Map<String, Object> context;
	protected Element reportDef;
	protected Element rootE;
	protected String xid;
	protected String reportDefineID;
	protected String reportContentID;
	protected String reportExportFrameID;
	private String cacheFile;
	private Workbook workbook;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		this.context = context;
		this.reportDef = bound;
		this.xid = reportDef.attributeValue("xid");
		this.reportContentID = String.format("report_%s_content", xid);
		this.reportExportFrameID = String.format("report_%s_frame", xid);

		rootE = bound;

		//解析报表定义excel
		Document reportDoc = null;
		if (reportDef.attribute("src") != null && (!"".equals(reportDef.attribute("src").getValue()))) {
			String xlsFilePath = reportDef.attributeValue("src");
			reportDoc = generateReportDefine(xlsFilePath);
		} else {
			Element layoutContent = reportDef.element(new QName("layout-content", new Namespace("xui", "http://www.justep.com/xui")));
			try {
				String reportDocStr = CellLayoutConvert.convertToExcel(layoutContent.getText());
				workbook = new Workbook(DocumentHelper.parseText(reportDocStr));
				reportDoc = generateReportDefine("");
			} catch (Exception e) {
				throw new RuntimeException("cellLayout转换成excel失败", e);
			}
		}
		generateCacheChartReport(reportDoc);

		//存储excel解析出的信息，如页面设置，用于运行时配置
		try {
			generateReportSpan(reportDoc);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		//生成用于报表展示的容器div
		generateReportContentDiv();
	}

	/**
	 * 生成用于报表展示的容器div
	 */
	private void generateReportContentDiv() {
		Element contentDivE = rootE.addElement("div");
		contentDivE.addAttribute("xid", this.reportContentID);
		//contentDivE.addAttribute("style", "width:100%;height:100%;");

		//兼容旧版本 
		if (reportDef.attributeValue("width") != null) {
			contentDivE.addAttribute("width", reportDef.attributeValue("width"));
		}
		if (reportDef.attributeValue("height") != null) {
			contentDivE.addAttribute("height", reportDef.attributeValue("height"));
		}

		contentDivE.addAttribute("report-name", reportDef.attributeValue("reportName"));

		//Element frameE = rootE.addElement("iframe");
		//frameE.addAttribute("id", this.reportExportFrameID);
		//frameE.addAttribute("name", this.reportExportFrameID);
		//frameE.addAttribute("onReadyStateChange", String.format("var xbl=justep.xbl('%s'); if (xbl != null) xbl._hideWaittingDialog()", xid));
		//frameE.addAttribute("style", "position:absolute;top:-1000px;left:-1000px;width:1px;height:1px;");
	}

	/**
	 * 生成span，存储rdl相关数据用于前端配置
	 */
	private void generateReportSpan(Document reportDoc) throws UnsupportedEncodingException {
		Element e = DocumentHelper.createElement(new QName("span", XMLConstants.XHTML_NAMESPACE));
		e.addAttribute("style", "display:none");
		e.addAttribute("xblid", "attribute");

		Element layoutE = (Element) reportDoc.selectSingleNode("//child::*[local-name()='layout-set']/child::*[local-name()='layout']");
		if (layoutE != null) {
			e.addAttribute("paperType", getValue(layoutE.attributeValue("master-name")));
			e.addAttribute("pageWidth", getValue(layoutE.attributeValue("page-width")));
			e.addAttribute("pageHeight", getValue(layoutE.attributeValue("page-height")));
			e.addAttribute("orientation", getValue(layoutE.attributeValue("Orientation")));
			e.addAttribute("marginTop", getValue(layoutE.attributeValue("margin-top")));
			e.addAttribute("marginBottom", getValue(layoutE.attributeValue("margin-bottom")));
			e.addAttribute("marginLeft", getValue(layoutE.attributeValue("margin-left")));
			e.addAttribute("marginRight", getValue(layoutE.attributeValue("margin-right")));
			e.addAttribute("marginHeader", getValue(layoutE.attributeValue("margin-header")));
			e.addAttribute("marginFootter", getValue(layoutE.attributeValue("margin-footter")));
		}

		String temp = "";
		Element mappingE = (Element) reportDoc.selectSingleNode("//child::*[local-name()='mapping']");
		if (mappingE != null) {
			@SuppressWarnings("unchecked")
			List<Element> dataList = mappingE.elements();
			for (Element data : dataList) {
				String did = data.attributeValue("id");
				temp += did + ",";
			}
		}

		if (!temp.equals("")) {
			temp = temp.substring(0, temp.length() - 1);
			e.addAttribute("dataList", getValue(temp));
		}

		temp = "";
		@SuppressWarnings("unchecked")
		List<Element> reportObjectList = (List<Element>) reportDoc.selectNodes("//child::*[local-name()='report-object']");
		for (Element obj : reportObjectList) {
			String oid = obj.attributeValue("path");
			temp += oid + ",";
		}

		if (!temp.equals("")) {
			temp = temp.substring(0, temp.length() - 1);
			e.addAttribute("objectList", getValue(temp));
		}

		e.addAttribute("cacheFile", java.net.URLEncoder.encode(cacheFile, "UTF-8"));
		rootE.add(e);
	}

	private String getValue(String str) {
		return str == null ? "" : str;
	}

	private void generateCacheChartReport(Document report) {

		//TODO:验证是否需要缓存 监控当前.w文件目录中是否改变

		Document reportRD = generateCacheReportRequestTemplate();

		Element xreportViewE = (Element) reportRD.selectSingleNode("//child::*[name()='xreport:view']");
		xreportViewE.add((Element) report.getRootElement().clone());

		String reportRDFile = "";
		String wFilePath = (String) context.get(PageUtils.WINDOW_FILE_URL);
		String wFileName = wFilePath.substring(wFilePath.lastIndexOf("/") + 1, wFilePath.length() - 2);
		String basePath = wFilePath.substring(0, wFilePath.lastIndexOf("/") + 1);
		if (basePath != null) {
			String cacheDIRStr = basePath + ".cache";
			File temp = new File(FileSystemWrapper.instance().getRealPath(cacheDIRStr));
			if (!temp.exists()) {
				temp.mkdir();
			}
			cacheFile = basePath + ".cache/" + wFileName + ".report";
			reportRDFile = FileSystemWrapper.instance().getRealPath(cacheFile);
		}

		File rdlFile = new File(reportRDFile);
		if (rdlFile.exists()) {
			//文件存在 取节点替换 
			try {
				Document rdlDoc = fileToDOM(reportRDFile);
				Element chartRDE = (Element) rdlDoc.selectSingleNode("//child::*[@id='" + xid + "']");
				Element pE = null;
				if (chartRDE != null) {
					pE = chartRDE.getParent();
					pE.remove(chartRDE);
				} else {
					pE = rdlDoc.getRootElement().element("report-view");
				}
				pE.add((Element) reportRD.getRootElement().clone());
				try {
					writeReportFile(rdlDoc, reportRDFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			//创建模版文件 chartRD
			Document rdl = generateCacheReportTemplate();

			rdl.getRootElement().element("report-view").add((Element) reportRD.getRootElement().clone());
			try {
				writeReportFile(rdl, reportRDFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private Document generateCacheReportTemplate() {
		Document doc = DocumentHelper.createDocument();
		String rdl = "<report xmlns:xreport=\"http://www.justep.com/x5/xreport\" xmlns:rdl=\"http://www.justep.com/RDL\">" + "<report-model/>"
				+ "<report-view/>" + "</report>";
		try {
			doc = DocumentHelper.parseText(rdl);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return doc;
	}

	private Document generateCacheReportRequestTemplate() {
		Document doc = DocumentHelper.createDocument();
		String chartRD = "<request id=\"" + xid + "\" xmlns:xreport=\"http://www.justep.com/x5/xreport\" xmlns:rdl=\"http://www.justep.com/RDL\">"
				+ "<xreport:params>" + "<report-name></report-name>" + "<uiserver-url></uiserver-url>" + "<current-process></current-process>"
				+ "<current-activity></current-activity>" + "</xreport:params>" + "<xreport:model>" + "</xreport:model>"
				+ "<xreport:view output-type=\"\" >" + "</xreport:view>" + "</request>";
		try {
			doc = DocumentHelper.parseText(chartRD);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return doc;
	}

	private Document fileToDOM(String filePath) throws MalformedURLException, DocumentException, FileNotFoundException, UnsupportedEncodingException {
		Document doc = null;
		SAXReader reader = new SAXReader();
		File file = new File(filePath);
		FileInputStream fileInputStream = new FileInputStream(file);
		InputStreamReader inputStramReader = new InputStreamReader(fileInputStream, "utf-8");
		if (file.exists()) {
			doc = reader.read(inputStramReader);
		}
		return doc;
	}

	private void writeReportFile(Document doc, String targetFilePath) throws IOException {
		File tFile = new File(targetFilePath);
		if (!tFile.exists()) {
			tFile.createNewFile();
		}
		OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(targetFilePath), "UTF-8");
		XMLWriter writer = new XMLWriter(osw, OutputFormat.createPrettyPrint());
		writer.write(doc);
		writer.close();
		writer = null;
		osw = null;
		doc = null;
	}

	@SuppressWarnings("unchecked")
	private Document generateReportDefine(String xlsFilePath) throws XBLException {
		if (!"".equals(xlsFilePath)) {
			xlsFilePath = FileSystemWrapper.instance().getRealPath(xlsFilePath);
			/*
			//报表XLS模板文件必须以当前目录为基础的相对路径
			String wFilePath = (String) context.get(PageUtils.WINDOW_FILE_URL);
			String wAbsPath = FileSystemWrapper.instance().getRealPath(wFilePath);
			String canonicalPath = wAbsPath;
			File tempF = new File(wAbsPath);
			if (tempF.exists()) {
				try {
					canonicalPath = tempF.getCanonicalPath();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
			String basePath = canonicalPath.substring(0, canonicalPath.lastIndexOf(File.separator) + 1);
			if (basePath != null) {
				xlsFilePath = basePath + xlsFilePath;
			}
			*/
		}
		Document mappingDoc = generateReportMapping(reportDef);
		Document reportDoc = generateReportDoc(xlsFilePath, mappingDoc);

		List<Element> objects = (List<Element>) reportDoc.selectNodes("//rdl:report-object");
		for (Element object : objects) {
			String path = object.attributeValue("path");
			if (path == null) {
				throw new XBLException("报表对象单元格引用不能为空");
			}
			Element objDef = (Element) reportDef.getDocument().selectSingleNode(String.format("//*[@xid='%s']", path));
			if (objDef == null) {
				throw new XBLException(String.format("报表对象单元格引用的对象“%s”不存在", path));
			}

			String type = getObjectType(objDef.attributeValue("component"));
			object.addAttribute("type", type);
			object.addAttribute("get-object-define", getGetObjectDefine(type, path));
		}

		return reportDoc;
	}

	protected Document generateReportDoc(String xlsFilePath, Document mappingDoc) {
		if (mappingDoc == null) {
			mappingDoc = generateReportMapping(xlsFilePath);
		}
		if ("".equals(xlsFilePath)) {
			return XLSTransformer.transform(workbook, mappingDoc.getRootElement());
		} else {
			return XLSTransformer.transform(xlsFilePath, mappingDoc.getRootElement());

		}

	}

	/**
	 * 兼容旧版本 
	 * @param reportDef
	 * @return
	 */
	private Document generateReportMapping(Element reportDef) {
		Element mappingE = (Element) reportDef.selectSingleNode(".//child::*[local-name()='mapping']");
		if (mappingE == null) {
			return null;
		}
		Document mappingDoc = DocumentHelper.createDocument();
		Element rootE = mappingDoc.addElement("mapping");
		@SuppressWarnings("rawtypes")
		List eList = mappingE.elements();
		for (int i = 0; i < eList.size(); i++) {
			Element e = (Element) eList.get(i);
			rootE.add((Element) e.clone());
		}
		return mappingDoc;
	}

	@SuppressWarnings("unchecked")
	private Document generateReportMapping(String xlsFilePath) {
		StringBuffer sb = new StringBuffer();
		sb.append("<mapping>");
		HashMap<String, ArrayList<String>> map = generateReportMappingMap(xlsFilePath);
		@SuppressWarnings("rawtypes")
		Iterator it = map.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, ArrayList<String>> entry = (Map.Entry<String, ArrayList<String>>) it.next();
			String key = entry.getKey();
			ArrayList<String> value = entry.getValue();
			sb.append("<data xmlns=\"\" id=\"" + key + "\" path=\"record\" >");
			for (String v : value) {
				sb.append("<" + v + " path=\"" + v + "\" />");
			}
			sb.append("</data>");
		}
		sb.append("</mapping>");
		Document mappingDoc = DocumentHelper.createDocument();
		try {
			mappingDoc = DocumentHelper.parseText(sb.toString());
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return mappingDoc;
	}

	private HashMap<String, ArrayList<String>> generateReportMappingMap(String xlsFilePath) {
		//data-list属性可有可无   运行期环境无法获取data 列表

		HashMap<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		try {
			Workbook wb = null;
			if ("".equals(xlsFilePath)) {
				wb = workbook;
			} else {
				FileInputStream in = new FileInputStream(xlsFilePath);
				wb = new Workbook(in);
			}
			Worksheet sheet = wb.getSheet(0);
			int rowCount = sheet.getRowCount();
			int colCount = sheet.getColCount();

			//统计报表中所有的数据集
			ArrayList<String> didList = new ArrayList<String>();
			for (int r = 0; r < rowCount; r++) {
				for (int c = 0; c < colCount; c++) {
					Cell cell = sheet.getCell(r, c);
					if (cell != null) {
						String cellValue = cell.getValue();
						if (XLSTransUtils.isRepeatCell(cellValue)) {
							cellValue = XLSTransUtils.getRepeatFieldIDWithDataSet(cellValue);
							int index = cellValue.indexOf(".");
							if (index != -1) {
								String dataSetId = cellValue.substring(0, index);
								didList.add(dataSetId);
							}
						}
					}
				}
			}

			for (int r = 0; r < rowCount; r++) {
				for (int c = 0; c < colCount; c++) {
					Cell cell = sheet.getCell(r, c);
					if (cell != null) {

						String cellValue = cell.getValue();
						if (XLSTransUtils.isRepeatCell(cellValue)) {
							cellValue = XLSTransUtils.getRepeatFieldIDWithDataSet(cellValue);
						}

						if (cellValue != null) {
							int index = cellValue.indexOf(".");
							if (index != -1) {
								String dataSetId = cellValue.substring(0, index);
								//验证是否合法是否存在于.W文件中的DATA 定义
								if (didList.contains(dataSetId)) {
									if (!map.containsKey(dataSetId)) {
										map.put(dataSetId, new ArrayList<String>());
									}
									String feild = cellValue.substring(index + 1, cellValue.length());
									ArrayList<String> feildList = map.get(dataSetId);
									if (!feildList.contains(feild)) {
										feildList.add(feild);
									}
								}
							}
						}

						//公式分析 
						String formula = cell.getFormula();
						if (formula != null && !formula.equals("")) {
							if (!Pattern.compile(ReportConstants.REGEXPR_STAT_CELL).matcher(formula).find()) {
								Pattern pattern = Pattern.compile(ReportConstants.REGEXPR_STAT_FULL);
								Matcher matcher = pattern.matcher(formula);
								String expr;
								while (matcher.find()) {
									for (int type = 1; type < 6; type++) {
										expr = matcher.group(type);
										if (expr != null) {
											Pattern p = Pattern.compile("\\b[a-zA-Z_][a-zA-Z0-9_]*\\.[a-zA-Z_][a-zA-Z0-9_]*\\b");
											Matcher matcher2 = p.matcher(expr);
											while (matcher2.find()) {
												String word = matcher2.group();
												int n = word.indexOf(".");
												if (n != -1) {
													String dataSetId = word.substring(0, n);
													if (didList.contains(dataSetId)) {
														if (!map.containsKey(dataSetId)) {
															map.put(dataSetId, new ArrayList<String>());
														}
														String feild = word.substring(n + 1, word.length());
														ArrayList<String> feildList = map.get(dataSetId);
														if (!feildList.contains(feild)) {
															feildList.add(feild);
														}
													}
												}
											}
										}
									}
								}

							}
						}

						String comment = cell.getComment();
						if (comment != null && !comment.equals("")) {
							Pattern p = Pattern.compile("\\b[a-zA-Z_][a-zA-Z0-9_]*\\.[a-zA-Z_][a-zA-Z0-9_]*\\b");
							Matcher matcher2 = p.matcher(comment);
							while (matcher2.find()) {
								String word = matcher2.group();
								int n = word.indexOf(".");
								if (n != -1) {
									String dataSetId = word.substring(0, n);
									if (didList.contains(dataSetId)) {
										if (!map.containsKey(dataSetId)) {
											map.put(dataSetId, new ArrayList<String>());
										}
										String feild = word.substring(n + 1, word.length());
										ArrayList<String> feildList = map.get(dataSetId);
										if (!feildList.contains(feild)) {
											feildList.add(feild);
										}
									}
								}
							}
						}

					}
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return map;
	}

	private String getGetObjectDefine(String type, String id) {
		if ("chart".equals(type)) {
			return String.format("getchart_%s_define()", id);
		} else {
			return null;
		}
	}

	private String getObjectType(String component) {
		if (component != null && component.startsWith("/mobileUI/system/components/mobile/chart.xbl.xml")) {
			return "chart";
		} else {
			return null;
		}
	}

	public static void main(String[] args) {
		String str = "s1.UnitPrice*s1.Quantity";
		str = "SUM(STOCK)";
		//Pattern p = Pattern.compile("\\b[a-zA-Z_][a-zA-Z0-9_]*\\.[a-zA-Z_][a-zA-Z0-9_]*\\b");
		Pattern p = Pattern.compile("\\b[a-zA-Z_][a-zA-Z0-9_][^SUM]*\\b");
		Matcher matcher = p.matcher(str);
		while (matcher.find()) {
			String word = matcher.group();
			System.out.println(word);
		}

	}
}
