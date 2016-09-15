package com.justep.desinger.chart.runtime.render;

import org.dom4j.Document;

public class DomUtil {

	public static Document parse(org.w3c.dom.Document doc) {
		if (doc == null) {
			return (null);
		}
		org.dom4j.io.DOMReader xmlReader = new org.dom4j.io.DOMReader();
		return (xmlReader.read(doc));
		
	}
	
}
