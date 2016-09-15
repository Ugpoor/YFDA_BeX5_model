import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.dom4j.*;

import com.justep.excel.Const;
import com.justep.excel.ExcelException;
import com.justep.excel.ExportGenerator;
import com.justep.excel.ImportGenerator;
import com.justep.message.SAMessages;
import com.justep.system.data.*;

public class Excel {
	private static long DeleteExcelTempFileTime = -1;
	private static long Interval = 7;
	private static String getTempDir() {
		return System.getProperty("java.io.tmpdir");
	}

	//删除几天前的excel文件
	private static void DeleteExcelTempFile(){
		long t = Interval*24*60*60*1000;
		long ct = System.currentTimeMillis();
		Date d = new Date();
		if(ct-DeleteExcelTempFileTime>=t){
			DeleteExcelTempFileTime = ct;
			File tempDir = new File(getTempDir());
			for(File f:tempDir.listFiles()){
				if(f.isFile() && f.getAbsolutePath().endsWith(".excel.tmp") && d.getTime()-t>=f.lastModified())
					try {
						f.delete();//删除失败,忽略异常
					} catch (Exception e) {}
			}
		}
	}
	
	public static Object downloadExportExcel(String fileName) {
		//删除目录下的临时文件
		DeleteExcelTempFile();
		FileInputStream fis = null;
		File tempDir = new File(getTempDir());
		File file = new File(tempDir.getAbsolutePath()+File.separator+fileName);
		if (file.getAbsolutePath().startsWith(tempDir.getAbsolutePath())) {
			try {
				fis = new FileInputStream(file);
			} catch (FileNotFoundException e) {
				throw ExcelException.create(e, SAMessages.EXPORT_EXCEL_FILE_NOT_FOUND);
				//new RuntimeException("获取文件失败！", e);
			}
		} else
			throw ExcelException.create(SAMessages.EXPORT_EXCEL_FILE_READ_ERROR);
			//new RuntimeException("获取文件失败，超出获取文件权限范围！");
		return fis;
	}

	@SuppressWarnings("unchecked")
	private static Table getDBData(Map<String, Object> queryActionParam) {
		if (com.justep.util.Utils.isNull(queryActionParam))
			return null;
		return (Table) com.justep.system.action.ActionUtils.invokeAction(
				(String)queryActionParam.get("process"), (String)queryActionParam.get("activity"),
				(String)queryActionParam.get("action"), (String)queryActionParam.get("executor"),
				(Map<String, Object>)queryActionParam.get("parameters"));
	}

	public static String exportExcel(String from, Document config, Table data,
			Map<String, Object> queryActionParam) {
		if (Const.KIND_DB.equalsIgnoreCase(from)) {
			data = getDBData(queryActionParam);
		}

		ExportGenerator excel = new ExportGenerator(
				config.getRootElement(), data);
		HSSFWorkbook book;
		book = excel.generate();
		String path = createFile(book);
		return path;
	}  

	public static Object importExcel(Document config, Map<String, Object> createActionParam, Map<String, Object> saveActionParam){
		return new ImportGenerator().generate(config, createActionParam, saveActionParam);
	}

	public static Map<String, String> uploadImportExcel(InputStream excel, InputStream mapping){
		//删除目录下的临时文件
		DeleteExcelTempFile();
		HashMap<String, String> result = new HashMap<String, String>();
		result.put("excel", createFile(excel));
		result.put("mapping", createFile(mapping));
		return result;
	}
	
	private static String createFile(HSSFWorkbook book) {
		String name = java.util.UUID.randomUUID().toString();
		File file = new File(getTempDir() + "/" + name + ".excel.tmp");
		if (file.exists())
			file.delete();
		FileOutputStream output;
		try {
			output = new FileOutputStream(file);
			try {
				book.write(output);
				output.flush();
			} finally {
				output.close();
			}
		} catch (Exception e) {
			throw ExcelException.create(e, SAMessages.EXPORT_EXCEL_ERROR);
			//new RuntimeException("导出excel失败!", e);
		}
		return file.getName();
	}

	private static String createFile(InputStream in) {
		String name = java.util.UUID.randomUUID().toString();
		File file = new File(getTempDir() + "/" + name + ".excel.tmp");
		if (file.exists())
			file.delete();
		FileOutputStream output;
		try {
			output = new FileOutputStream(file);
			try {
				byte[] bs = new byte[1024*4];
				int i = -1;
				while ((i = in.read(bs)) != -1) {
					output.write(bs, 0, i);
				}
				output.flush();
			} finally {
				output.close();
			}
		} catch (Exception e) {
			throw ExcelException.create(e, SAMessages.EXPORT_EXCEL_ERROR);
			//throw new RuntimeException("导出excel失败!", e);
		}
		return file.getAbsolutePath();
	}
}