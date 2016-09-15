package com.justep.weixin.cp;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import me.chanjar.weixin.cp.api.WxCpInMemoryConfigStorage;

import org.apache.commons.io.IOUtils;
import org.xml.sax.InputSource;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

@XmlRootElement(name = "xml")
@XmlAccessorType(XmlAccessType.FIELD)
public class JustepCpConfigStorage {
	
	static final String DATA_MODEL ="/SA/weixin/data";
	private List<WxCpInMemoryConfigStorage> corps;
	
	public List<WxCpInMemoryConfigStorage> getCorps() {
		return corps;
	}

	public void setCorps(List<WxCpInMemoryConfigStorage> corps) {
		this.corps = corps;
	}

	private static InputStream queryConfig() {
		String queyConfigKsql = "SELECT SA_WeixinCp.sText as configStr from SA_WeixinCp SA_WeixinCp where " +
				"SA_WeixinCp ='weixinCp.cropsConfig'";
		Table table = KSQL.select(queyConfigKsql, null, JustepCpConfigStorage.DATA_MODEL, null);
		for (Iterator<Row> iterator = table.iterator(); iterator.hasNext();) {
			Row row = iterator.next();
			String configStr = (String)row.getValue("configStr");
			return IOUtils.toInputStream(configStr);
		}
		return null;
	}
	
	public static void updateConfig(String configStr) {
		String updateConfigKsql = "update SA_WeixinCp cp set cp.sText ='" + configStr + "'"
				+ " where cp = 'weixinCp.cropsConfig'";
		int affactRow = KSQL.executeUpdate(updateConfigKsql, null, JustepCpConfigStorage.DATA_MODEL, null);
		if (affactRow != 1) {
			throw new RuntimeException("weixin config 更新失败");
		}
	}
	
	public static List<WxCpInMemoryConfigStorage> init() {
		InputStream is1 = queryConfig();
		try {
			JustepCpConfigStorage configs = JustepCpConfigStorage.fromXml(is1);
			List<WxCpInMemoryConfigStorage> crops =  configs.getCorps();
			return crops;
		} catch (JAXBException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void main(String[] args) {
		InputStream is1 = JustepCpConfigStorage.class.getClassLoader().getResourceAsStream("config.xml");
		try {
			String config = IOUtils.toString(is1);
			
			config = config.replaceAll("[\\t\\n\\r]", "");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static JustepCpConfigStorage fromXml(InputStream is) throws JAXBException {
	    Unmarshaller um = JAXBContext.newInstance(JustepCpConfigStorage.class).createUnmarshaller();
	    InputSource inputSource = new InputSource(is);
	    inputSource.setEncoding("utf-8");
	    return (JustepCpConfigStorage) um.unmarshal(inputSource);
	}
}
