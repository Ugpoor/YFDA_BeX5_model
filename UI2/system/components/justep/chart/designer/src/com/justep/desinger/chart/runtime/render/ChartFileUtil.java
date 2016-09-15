package com.justep.desinger.chart.runtime.render;

import java.io.File;
import java.io.IOException;

import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;

public class ChartFileUtil extends ServletUtilities{

    private static String tempOneTimeFilePrefix = "justep-onetime-";

	public static String saveChartAsPNG(JFreeChart chart, int width, int height,ChartRenderingInfo info) throws IOException {
        if (chart == null) {
            throw new IllegalArgumentException("Null 'chart' argument.");   
        }     
        ServletUtilities.createTempDir();
        String prefix = tempOneTimeFilePrefix;
        File tempFile = File.createTempFile(prefix, ".png", new File(System.getProperty("java.io.tmpdir")));
        ChartUtilities.saveChartAsPNG(tempFile, chart, width, height, info);
        return tempFile.getName();
    }
	
}
