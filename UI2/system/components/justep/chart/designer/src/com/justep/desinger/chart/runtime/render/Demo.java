package com.justep.desinger.chart.runtime.render;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.desinger.chart.runtime.data.ChartTempDataHelper;

public class Demo {

	/**
	 * 解析XML文件获取DOM对象
	 * 
	 * @param filePath
	 *            文件路径
	 * @return
	 * @throws DocumentException
	 * @throws MalformedURLException
	 * @throws FileNotFoundException 
	 * @throws UnsupportedEncodingException 
	 */
	public static Document fileToDOM(String filePath) throws MalformedURLException, DocumentException, FileNotFoundException, UnsupportedEncodingException {
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

	/**
	 * 解析XML流获取DOM对象
	 * 
	 * @param filePath
	 *            文件路径
	 * @return
	 * @throws DocumentException
	 */
	public static Document streamToDOM(InputStream in) throws DocumentException {
		Document doc = null;
		SAXReader reader = new SAXReader();
		doc = reader.read(in);
		return doc;
	}

	/**
	 * 解析XML字符串到DOM对象
	 * 
	 * @param str
	 * @return
	 * @throws DocumentException
	 */
	public static Document stringToDOM(String str) throws DocumentException {
		return DocumentHelper.parseText(str);
	}
	
	/**
	 * @param args
	 * @throws DocumentException 
	 * @throws UnsupportedEncodingException 
	 * @throws FileNotFoundException 
	 * @throws MalformedURLException 
	 */
	public static void main(String[] args){
		
		String filePath="E:\\v5.0.0.1500_20100623191428\\studio\\workspace\\chartTest\\chart2.xml";
		Document fdoc = null;
		try {
			fdoc = fileToDOM(filePath);
		}  catch (Exception e) {
			e.printStackTrace();
		}
		Element chartComponentE = fdoc.getRootElement();
		Element seriesSetE = (Element) chartComponentE.selectSingleNode("//series-set");
		Document dataDoc = ChartTempDataHelper.generateTempDataDoc(seriesSetE);
		
		//System.out.println(dataDoc.asXML());

		ChartRender chartRender = new ChartRender(chartComponentE ,dataDoc);
		String info = chartRender.executeChart();
		System.out.println(info);
	}
	
	
}
