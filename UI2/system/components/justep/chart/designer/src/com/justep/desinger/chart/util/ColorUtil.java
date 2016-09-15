package com.justep.desinger.chart.util;

import org.eclipse.swt.graphics.Device;

public class ColorUtil {

	public static org.eclipse.swt.graphics.Color hexRGBToSWTColor(String hexRgb ,Device device){
		if(hexRgb == null || hexRgb.equals("")){
			hexRgb = "#FFFFFF";
		}
		java.awt.Color c = new java.awt.Color(Integer.parseInt(hexRgb.substring(1), 16));
		int r = c.getRed();
		int g = c.getGreen();
		int b = c.getBlue();
		return new org.eclipse.swt.graphics.Color(device,r,g,b);
	}
	
	
	public static String SWTColorToHexRGB(org.eclipse.swt.graphics.Color swtColor){
		int r = swtColor.getRed();
		int g = swtColor.getGreen();
		int b = swtColor.getBlue();
		java.awt.Color nC = new java.awt.Color(r,g,b);
		String hexRgb = "#" + Integer.toHexString(nC.getRGB()).substring(2);
		return hexRgb;
	}
	
}
