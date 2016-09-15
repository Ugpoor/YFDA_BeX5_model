package com.justep.chart.validate;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.ArrayList;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;


public class ValidateTest {

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
	 * @param args
	 */
	public static void main(String[] args) {
		String chartPath ="E:\\10workspace\\ui-tomcat-5.5.27\\webapps\\chartValidate\\demo\\chart.xml";
		try {
			Document chartDoc = ValidateTest.fileToDOM(chartPath);
			ValidateHelper cvh = new ValidateHelper(chartDoc,"error");
			cvh.executeValidate();
			ArrayList<ValidateResult> vrList = cvh.getValidateList();
			for(ValidateResult vr : vrList){
				System.out.println(vr.toString());
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
	}

}
