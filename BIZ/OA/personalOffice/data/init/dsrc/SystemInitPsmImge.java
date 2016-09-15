import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;

import com.justep.filesystem.FileSystemWrapper;
import com.justep.system.data.BlobUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

public class SystemInitPsmImge {
	
	public static void initImge() throws IOException{
		String path  = FileSystemWrapper.instance().getRealPath("/OA/image");
		File file = new File(path);
		String fileFullNames[];
		fileFullNames = file.list();
		HashSet<String> fileNames = new HashSet<String>();
		for(int i = 0; i < fileFullNames.length; i++){
			String fileName = fileFullNames[i];
			int no = fileName.indexOf(".");
			String name = fileName.substring(0,no);
			fileNames.add(name);
		}
		String ksql = "select SA_OPPerson , SA_OPPerson.sLoginName from SA_OPPerson SA_OPPerson";
		Table result = KSQL.select(ksql, null, "/system/data", null);
		Iterator<Row> rows = result.iterator();
		java.io.InputStream  blob ;
		while(rows.hasNext()) {  
			Row row  = rows.next();
			String loginName = row.getString("sLoginName");
			if(fileNames.contains(loginName)){
				blob = CommonUtils.getInputStreamByFile("/OA/image/"+loginName+".jpg");
				BlobUtils.update("/system/data", "SA_OPPerson", "sPhoto", "sPhotoLastModified", row.getString("SA_OPPerson"), "", blob);
				blob.close();
			}
		} 
	}
}