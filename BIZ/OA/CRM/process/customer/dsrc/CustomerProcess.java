import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.justep.system.context.*;
import com.justep.system.data.*;
import com.justep.oa.OACommon;

public class CustomerProcess {

	private static final int[] AREA_CODE = new int[] { 45217, 45253, 45761, 46318, 46826, 47010, 47297, 47614, 48119, 
		48119, 49062, 49324, 49896, 50371, 50614, 50622, 50906, 51387, 51446, 52218, 52698, 52698, 52698, 52980, 53689, 54481 };
	
	public static final String ak = "EzfQTH533pbevnhohMX4QZRK";

	public static String getFirstAlpha(String text) {
		if (text == null || "".equals(text)) {
			return "";
		}
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < text.length(); i++) {
			sb.append(getAlpha(text.substring(i, i + 1)));
		}
		return sb.toString();
	}

	private static String getAlpha(String character) {
		byte[] bytes;
		try {
			bytes = character.getBytes("GBK");
		} catch (Exception e) {
			e.printStackTrace();
			return character;
		}
		if (bytes.length < 2) {
			return character;
		}
		int area = (short) bytes[0];
		int pos = (short) bytes[1];
		int code = (area << 8 & 0xff00) + (pos & 0xff);

		for (int i = 0; i < 26; i++) {
			int max = 55290;
			if (i != 25) {
				max = AREA_CODE[i + 1];
			}
			if (AREA_CODE[i] <= code && code < max) {
				return new String(new byte[] { (byte) (65 + i) });
			}
		}
		return character;
	}

/**
 * 返回输入地址的经纬度坐标 key lng(经度),lat(纬度)
 */
	public static Map<String, String> getGeocoderLatitude(String address) {
		BufferedReader in = null;
		try {
			// 将地址转换成utf-8的16进制
			address = URLEncoder.encode(address, "UTF-8");
			// 如果有代理，要设置代理，没代理可注释
			// System.setProperty("http.proxyHost","192.168.1.188");
			// System.setProperty("http.proxyPort","3128");
			URL tirc = new URL("http://api.map.baidu.com/geocoder/v2/?address=" + address + "&output=json&ak=" + ak + "&callback=showLocation");
			in = new BufferedReader(new InputStreamReader(tirc.openStream(), "UTF-8"));
			String res;
			StringBuilder sb = new StringBuilder("");
			while ((res = in.readLine()) != null) {
				sb.append(res.trim());
			}
			String str = sb.toString();
			Map<String, String> map = null;
			if (StringUtils.isNotEmpty(str)) {
				int lngStart = str.indexOf("lng\":");
				int lngEnd = str.indexOf(",\"lat");
				int latEnd = str.indexOf("},\"precise");
				if (lngStart > 0 && lngEnd > 0 && latEnd > 0) {
					String lng = str.substring(lngStart + 5, lngEnd);
					String lat = str.substring(lngEnd + 7, latEnd);
					map = new HashMap<String, String>();
					map.put("lng", lng);
					map.put("lat", lat);
					return map;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
/**
 * 客户信息保存前，生成拼音首字母，生成经纬度
 */
	public static void customerProcessBeforeSaveOA_CustomerAction() {
		// 获得table参数
		Table table = (Table) ContextHelper.getActionContext().getParameter("table");
		// 获得所有修改的行
		Iterator<Row> rows = table.iterator(com.justep.system.data.ModifyState.EDIT);
		Row row;
		while (rows.hasNext()) {
			row = rows.next();
			if(row.isModified("fName")){
				row.setString("fAbbr", getFirstAlpha(row.getString("fName")));
			}
			if(row.isModified("fProvince") || row.isModified("fCity") || row.isModified("fZone") || row.isModified("fAddr")){
				String address = row.getString("fProvince") + row.getString("fCity") + row.getString("fZone") + row.getString("fAddr");
				Map<String, String> itude = getGeocoderLatitude(address);
				if (itude != null) {
					row.setDecimal("flongitude", new BigDecimal(itude.get("lng")));
					row.setDecimal("fLatitude", new BigDecimal(itude.get("lat")));
				}
			}
		}
		// 获得所有新增的行
		rows = table.iterator(com.justep.system.data.ModifyState.NEW);
		while (rows.hasNext()) {
			row = rows.next();
			row.setString("fAbbr", getFirstAlpha(row.getString("fName")).trim());
			String address = row.getString("fProvince") + row.getString("fCity") + row.getString("fZone") + row.getString("fAddr");
			Map<String, String> itude = getGeocoderLatitude(address);
			if (itude != null) {
				row.setDecimal("flongitude", new BigDecimal(itude.get("lng")));
				row.setDecimal("fLatitude", new BigDecimal(itude.get("lat")));
			}
		}
	}
/**
 * 将创建者写入sa_Social表
 */
	public static void customerProcessAfterSaveOA_CustomerAction() {
		Table table = (Table)ContextHelper.getActionContext().getParameter("table");
		com.justep.oa.OACommon.updateSocial(table);		
	}
}