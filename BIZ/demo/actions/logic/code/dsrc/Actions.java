import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;

import org.dom4j.*;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.justep.filesystem.FileSystemWrapper;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.*;
import com.justep.system.opm.api.AuthorizeHelper;
import com.justep.system.opm.api.DataPolicy;
import com.justep.system.opm.api.PermissionHelper;
import com.justep.system.opm.api.RoleHelper;
import com.justep.system.opm.api.RoleKind;
import com.justep.system.process.ProcessUtils;
import com.justep.system.process.TaskDB;
import com.justep.system.transform.Transform;
import com.justep.system.util.CommonUtils;
import com.justep.util.Utils;

import demo.DemoObject;

public class Actions {

	public static void demoHasAction1() {
		System.out.println("demoHasAction1：在activity1中引用，只能在activity1中执行");
	}

	public static void demoHasAction2() {
		System.out.println("demoHasAction2：在activity2中引用，只能在activity2中执行");
	}

	public static void demoHasAction3() {
		System.out.println("demoHasAction3：在process中引用，可以process的所有activity中执行");
	}

	public static void demoHasAction4() {
		System.out.println("demoHasAction4：全局action，可见就可以执行");
	}

	public static String demoActionParams(String param_string, Integer param_integer, Long param_long, Double param_double, Float param_float,
			Timestamp param_datetime, java.sql.Date param_date, Time param_time, Boolean param_boolean, BigDecimal param_decimal, List<?> param_list,
			Map<?, ?> param_map, Object param_object, Document param_xml, Table param_table) throws InterruptedException, IOException {
		String result = "";
		result = result + ((param_string != null) ? "\n" + "param_string: " + param_string : "");
		result = result + ((param_integer != null) ? "\n" + "param_integer: " + param_integer : "");
		result = result + ((param_long != null) ? "\n" + "param_long: " + param_long : "");
		result = result + ((param_double != null) ? "\n" + "param_double: " + param_double : "");
		result = result + ((param_float != null) ? "\n" + "param_float: " + param_float : "");
		result = result + ((param_datetime != null) ? "\n" + "param_datetime: " + param_datetime : "");
		result = result + ((param_date != null) ? "\n" + "param_date: " + param_date : "");
		result = result + ((param_time != null) ? "\n" + "param_time: " + param_time : "");
		result = result + ((param_boolean != null) ? "\n" + "param_boolean: " + param_boolean : "");
		result = result + ((param_decimal != null) ? "\n" + "param_decimal: " + param_decimal : "");
		result = result + ((param_list != null) ? "\n" + "param_list: " + Transform.toString(param_list) : "");
		result = result + ((param_map != null) ? "\n" + "param_map: " + param_map : "");
		result = result + ((param_object != null) ? "\n" + "param_object: " + param_object : "");
		result = result + ((param_xml != null) ? "\n" + "param_xml: \n" + param_xml.asXML() : "");
		result = result + ((param_table != null) ? "\n" + "param_table: " + param_table.size() + "行" : "");
		return result;
	}

	private static int RETURN_SIMPLE_FLAG = 0;

	public static Object demoReturnSimple() {
		RETURN_SIMPLE_FLAG++;
		switch (RETURN_SIMPLE_FLAG % 7) {
		case 0:
			return "北京起步科技有限公司";
		case 1:
			return 123456789;
		case 2:
			return 123456.789;
		case 3:
			return new java.sql.Date((new java.util.Date()).getTime());
		case 4:
			return new java.sql.Time((new java.util.Date()).getTime());
		case 5:
			return new java.sql.Timestamp((new java.util.Date()).getTime());
		case 6:
			return true;
		default:
			return null;
		}
	}

	public static List<Object> demoReturnList() {
		List<Object> list = new ArrayList<Object>();
		list.add("北京起步科技有限公司");
		list.add(123456789);
		list.add(123456.789);
		list.add(new java.sql.Timestamp((new java.util.Date()).getTime()));
		list.add(true);
		return list;
	}

	public static Map<String, Object> demoReturnMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("string", "北京起步科技有限公司");
		map.put("long", 123456789);
		map.put("double", 123456.789);
		map.put("datetime", new java.sql.Timestamp((new java.util.Date()).getTime()));
		map.put("boolean", true);
		return map;
	}

	public static Document demoReturnXML() throws DocumentException {
		Document dom = DocumentHelper.parseText("<root>北京起步科技有限公司<product>X5.2.6</product></root>");
		return dom;
	}

	public static Table demoReturnTable() {
		Table table = KSQL.select("SELECT SA_OPOrg, SA_OPOrg.sName, SA_OPOrg.sFName FROM SA_OPOrg SA_OPOrg LIMIT 0,20 ", null, "/system/data", null);
		table.getProperties().put(Table.PROP_NAME_ROWID, "SA_OPOrg");
		return table;
	}

	public static Object demoReturnObject() {
		DemoObject demo = new DemoObject();
		demo.setName("比尔盖茨");
		demo.setSex("男");
		demo.setAge(57);
		return demo;
	}

	public static String demoAsync() throws InterruptedException {
		Thread.sleep(3000);
		return "服务端动作耗时三秒，执行成功。";
	}

	public static String demoUploadFile(String fileName, InputStream file) throws IOException {
		Utils.check(Utils.isNotEmptyString(fileName) && file != null, "请选择上传文件！");
		// 文件名解码
		fileName = URLDecoder.decode(fileName, "UTF-8").replaceAll("\\\\", "/");
		int fileSize = (file == null ? 0 : ((InputStream) file).available());

		// 保存文件
		String bizRoot = FileSystemWrapper.instance().getBase();
		String cachePath = bizRoot + "/demo/actions/fileCache/";
		String cacheFileName = cachePath + CommonUtils.getNameOfFile(fileName);
		FileOutputStream out = new FileOutputStream(cacheFileName);
		copyStream(file, out, 1024);
		out.close();
		return "文件\"" + fileName + "\"上传成功！\n文件大小：" + fileSize + "字节。"; 
	}

	private static long copyStream(InputStream input, OutputStream output, int bufferSize) throws IOException {
		byte[] buffer = new byte[bufferSize];
		int readCount = 0;
		long allCount = 0;
		while (true) {
			readCount = input.read(buffer);
			if (readCount > 0) {
				output.write(buffer, 0, readCount);
				output.flush();
				allCount += readCount;
			} else
				break;
		}
		return allCount;
	}

	public static InputStream demoDownloadFile(String fileName) throws IOException {
		String bizRoot = FileSystemWrapper.instance().getBase();
		String cachePath = bizRoot + "/demo/actions/fileCache/";
		String cacheFileName = cachePath + CommonUtils.getNameOfFile(fileName);

		// 返回文件流
		File file = new File(cacheFileName);
		FileInputStream in = new FileInputStream(file);
		return in;
	}

	public static String demoBatchAction1() {
		return "服务端动作1执行成功。";
	}

	public static String demoBatchAction2() {
		return "服务端动作2执行成功。";
	}

	public static Table createDEMO_ProjectPlan(Table table,String concept,Map<String, String> defaultValues,String fnModel,String myParam){
		System.out.println("defaultValues -> " + defaultValues);
		System.out.println("myParam -> " + myParam);
		
		defaultValues.put("CreatorName", "currentPersonName()");
		return BizData.create(table, concept, defaultValues, fnModel);
	}

	public static int saveDEMO_BookView(String concept,String dataModel,String fnModel,List<?> insertRange,List<?>deleteRange,List<?> updateRange,String readOnly,String notNull,Table table) throws NamingException, SQLException{
		// 获取JDBC的连接并开启事务（***注意如果不能处理异常就不要捕获异常）
		Connection conn = ModelUtils.getConnectionInTransaction("/demo/actions/data");

		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row row = rows.next();
			ModifyState rowState = row.getState();
			
			int id = row.getInt("fBookID");
			String name = row.getString("fBookName");
			BigDecimal price = row.getDecimal("fPrice");
			String ISBN = row.getString("fISBN");
			Integer amount = row.getInteger("fAmount");
			
			if (ModifyState.NEW.equals(rowState)) {
				addBook(conn, id, name, price, ISBN);
				addBookStore(conn, id, amount);
			} else if (ModifyState.EDIT.equals(rowState)) {
				updateBook(conn, id, name, price, ISBN);
				updateBookStore(conn, id, amount);
			} else if (ModifyState.DELETE.equals(rowState)) {
				delBook(conn, id);
				delBookStore(conn, id);
			}
		}
		
		return table.size();
//		return BizData.save(table, concept, insertRange, deleteRange, updateRange, readOnly, notNull, dataModel, fnModel);
	}
	
	private static void addBook(Connection conn, int id, String name, BigDecimal price, String ISBN) throws SQLException {
		PreparedStatement pstmt = conn.prepareStatement("insert into DEMO_Book ($clientName, fBookID, fBookName, fPrice, fISBN) values ($clientValue, ?, ?, ?, ?) ");
		try {
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setBigDecimal(3, price);
			pstmt.setString(4, ISBN);
			pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	private static void updateBook(Connection conn, int id, String name, BigDecimal price, String ISBN) throws SQLException {
		PreparedStatement pstmt = conn.prepareStatement("update DEMO_Book set fBookName = ?, fPrice = ?, fISBN = ? where fBookID = ? and $clientFilter(NULL)");
		try {
			pstmt.setString(1, name);
			pstmt.setBigDecimal(2, price);
			pstmt.setString(3, ISBN);
			pstmt.setInt(4, id);
			if (pstmt.executeUpdate() != 1) {
				throw new SQLException("更新DEMO_Book失败，fBookID = " + id);
			}
		} finally {
			pstmt.close();
		}
	}
	
	private static void delBook(Connection conn, int id) throws SQLException {
		PreparedStatement pstmt = conn.prepareStatement("delete from DEMO_Book where fBookID = ? and $clientFilter");
		try {
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	private static void addBookStore(Connection conn, int id, Integer amount) throws SQLException {
		// 如果库存为空，忽略新增库存记录
		if (amount == null) {
			return;
		}
		PreparedStatement pstmt = conn.prepareStatement("insert into DEMO_BookStore ($clientName, fBookID, fAmount) values ($clientValue, ?, ?) ");
		try {
			pstmt.setInt(1, id);
			pstmt.setInt(2, amount);
			pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	private static void updateBookStore(Connection conn, int id, Integer amount) throws SQLException {
		// 如果库存为空，删除库存记录
		if (amount == null) {
			delBookStore(conn, id);
		} else {
			PreparedStatement pstmt = conn.prepareStatement("update DEMO_BookStore set fAmount = ? where fBookID = ? and $clientFilter(NULL)");
			try {
				pstmt.setInt(1, amount);
				pstmt.setInt(2, id);
				// 如果更新库存记录行数为0，新增一行库存记录
				if (pstmt.executeUpdate() == 0) {
					addBookStore(conn, id, amount);
				}
			} finally {
				pstmt.close();
			}
		}
	}
	
	private static void delBookStore(Connection conn, int id) throws SQLException {
		PreparedStatement pstmt = conn.prepareStatement("delete from DEMO_BookStore where fBookID = ? and $clientFilter(NULL)");
		try {
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public static Table queryDEMO_BookXML(String concept,String select,String from,String aggregate,String dataModel,String fnModel,String condition,List<?> range,Boolean distinct,String idColumn,String filter,Integer limit,Integer offset,String columns,String orderBy,String aggregateColumns,Map<?, ?> variables) throws DocumentException{
		String bizRoot = FileSystemWrapper.instance().getBase();
		// 读取XML文件
		SAXReader reader = new SAXReader();
		Document dom = reader.read(new File(bizRoot + "/demo/actions/process/standardActionExtend/bookXML/book.xml"));
		List<Element> books = dom.getRootElement().elements();

		// 创建table
		Table table = TableUtils.createTable(null, "fBookID", "Integer", "fBookName", "String", "fISBN", "String", "fPrice", "Decimal");
		// 遍历XML的book，利用offset和limit做分页处理
		for (int i = offset; i < Math.min(books.size(), offset + limit); i++) {
			Element book = books.get(i);
			int id = Integer.parseInt(book.attributeValue("id"));
			String name = book.elementText("name");
			String ISBN = book.elementText("ISBN");
			String price = book.elementText("price");

			Row row = table.appendRow();
			row.setInt("fBookID", id);
			row.setString("fBookName", name);
			row.setString("fISBN", ISBN);
			if (Utils.isNotEmptyString(price)) {
				row.setDecimal("fPrice", BigDecimal.valueOf(Double.parseDouble(price)));
			}
			row.setState(ModifyState.NONE);
		}
		// 设置table的主键列，必须的
		table.getProperties().put(Table.PROP_NAME_ROWID, "fBookID");
		// 设置table的总行数，bizData分页需要
		table.getProperties().put(Table.PROP_DB_COUNT, books.size());

		return table;
	}

	public static int saveDEMO_BookXML(List<?> insertRange,List<?> deleteRange,List<?> updateRange,String concept,String dataModel,String fnModel,String readOnly,String notNull,Table table) throws DocumentException, IOException{
		String bizRoot = FileSystemWrapper.instance().getBase();
		// 读取XML
		String fileName = bizRoot + "/demo/actions/process/standardActionExtend/bookXML/book.xml";
		SAXReader reader = new SAXReader();
		Document dom = reader.read(new File(fileName));
		Element books = dom.getRootElement();
		
		// 遍历table，按行状态更改XML
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row row = rows.next();
			ModifyState rowState = row.getState();
			
			int id = row.getInt("fBookID");
			String name = row.getString("fBookName");
			BigDecimal price = row.getDecimal("fPrice");
			String ISBN = row.getString("fISBN");
			
			if (ModifyState.NEW.equals(rowState)) {
				addBookXML(books, id, name, price, ISBN);
			} else if (ModifyState.EDIT.equals(rowState)) {
				updateBookXML(books, id, name, price, ISBN);
			} else if (ModifyState.DELETE.equals(rowState)) {
				delBookXML(books, id);
			}
		}

		// 保存XML
		XMLWriter writer = new XMLWriter(new FileOutputStream(fileName));
		writer.write(dom);
		writer.close();
		return table.size();
	}

	private static void addBookXML(Element books, int id, String name, BigDecimal price, String ISBN) {
		Element book = books.addElement("book");
		book.addAttribute("id", String.valueOf(id));
		book.addElement("name").setText(name);
		book.addElement("ISBN").setText(ISBN);
		book.addElement("price").setText(price == null ? "" : price.toPlainString());
	}
	
	private static void updateBookXML(Element books, int id, String name, BigDecimal price, String ISBN) {
		Node node = books.selectSingleNode("book[@id='" + String.valueOf(id) + "']");
		if (node == null) {
			addBookXML(books, id, name, price, ISBN);
		} else  {
			Element book = (Element) node;
			book.element("name").setText(name);
			book.element("ISBN").setText(ISBN);
			book.element("price").setText(price == null ? "" : price.toPlainString());
		}
	}
	
	private static void delBookXML(Element books, int id) {
		Node node = books.selectSingleNode("book[@id='" + String.valueOf(id) + "']");
		if (node != null) {
			node.detach();
		}
	}
	
	public static String startBorrowBook(String bookName,java.sql.Date startDate,java.sql.Date endDate,String borrower) throws UnsupportedEncodingException{
		bookName = URLDecoder.decode(bookName, "UTF-8");
		borrower = URLDecoder.decode(borrower, "UTF-8");

		// 构造借书申请数据
		String ksql = "insert into DEMO_BorrowBook b (b, b.fBookName, b.fStartDate, b.fEndDate, b.fBorrower, b.version) "
			+ " values (:id, :bookName, :startDate, :endDate, :borrower, 0) ";
		String id = CommonUtils.createGUID();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("bookName", bookName);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		params.put("borrower", borrower);
		KSQL.executeUpdate(ksql, params, "/demo/actions/data", null);

		String executor = ContextHelper.getPersonMember().getFID();
		String title = "借书申请（" + bookName + " - " + borrower + "）"; 
		// 发起流程
		List<Map<String, String>> startDom = ProcessUtils.startProcess("/demo/actions/process/integration/integrationProcess", title, id, executor);
		// 从流程启动的返回值中获取第一个待办任务的ID
		String task = startDom.get(0).get("task");

		/*
		 * 代码设置ProcessControl，控制流转
		 * 
		//1、首先获取某个任务后续的流转数据结构
		ProcessControl control = ProcessUtils.advanceProcessQuery(task);
		//2、获得后续可能流转的环节
		List<ProcessControlItem> flowTos = control.getFlowTos();
		for (int i = 0; i < flowTos.size(); i++) {
			ProcessControlItem flowTo = flowTos.get(i);
			//3、获取环节ID做判断
			String activity = flowTo.getUnit();
			if (activity.equals("xxxxActivity")) {
				//4、留下要流转的环节，并自定义执行者
				flowTo.clearExecutors();
				flowTo.addExecutor(ContextHelper.getPersonMember());
			} else {
				//5、移走后续不流转的环节
				control.removeFlowTo(flowTo);
			}
		}
		//6、按定制的ProcessControl流转
		ProcessUtils.advanceProcess(task, control);
		*/
		
		// 流转到第二个环节
		ProcessUtils.advanceProcess(task, null);
		
		// 获取并返回流程实例ID
		String pi = TaskDB.queryFlowIdByTask(task);
		return pi;
	}

	public static Object invokeService(String namespace, String address, String operation, Object[] params) throws MalformedURLException, RemoteException, ServiceException {
		// 调用WebService
		org.apache.axis.client.Service service = new org.apache.axis.client.Service();
		org.apache.axis.client.Call call = (org.apache.axis.client.Call) service.createCall();
		call.setOperationName(new QName(namespace, operation));
		call.setTargetEndpointAddress(new java.net.URL(address));

		return call.invoke(params);
	}

	public static Object invokeTestWebService(Integer a,Integer b) throws MalformedURLException, RemoteException, ServiceException{
		// 调用测试WebService
		Object[] testParams = {a, b};
		Object testResult = invokeService("http://localhost:8080/axis/Test.jws", "http://localhost:8080/axis/Test.jws", "sum", testParams);
		return testResult;
	}

	public static Map<String, Object> getUserNameAndPassword() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", ContextHelper.getPerson().getID());
		Table table = KSQL.select("select p.sPassword from SA_OPPerson p where p = :id", params, "/system/data", null);
		String password = table.iterator().next().getString("sPassword");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("userID", ContextHelper.getPerson().getID());
		result.put("userName", ContextHelper.getPerson().getName());
		result.put("password", password);
		return result;
	}

	private static final String DEMO_ParamAccess_ROLE_HUABEI = "DEMO_ParamAccess_ROLE_HUABEI";  
	public static void paramAccessCreateDataPermission(){
		// 创建数据角色
		RoleHelper.appendRole(DEMO_ParamAccess_ROLE_HUABEI, DEMO_ParamAccess_ROLE_HUABEI, "动作参数的访问权限_华北", RoleKind.data, "演示", null, null);
		// 创建参数策略
		DataPolicy dataPolicy = DataPolicy.create();
		List<String> values = new ArrayList<String>();
		values.add("AND(DEMO_Orders.fShipRegion = '华北')");
		dataPolicy.addParamPolicy("queryDEMO_OrdersAction", "查询组织机构", "range", "范围", DataPolicy.DATAKIND_EXPR, values);
		// 在角色中创建包含参数策略的数据权限
		PermissionHelper.appendDataPermission(DEMO_ParamAccess_ROLE_HUABEI, "/demo/actions/process/paramAccess/paramAccessProcess", "mainActivity", 
				"/动作案例/动作参数的访问权限", dataPolicy);
	}

	public static void paramAccessAuthorize(){
		// 给当前人员成员授权
		AuthorizeHelper.appendAuthorize(ContextHelper.getPersonMember().getID(), DEMO_ParamAccess_ROLE_HUABEI, null);
	}
}