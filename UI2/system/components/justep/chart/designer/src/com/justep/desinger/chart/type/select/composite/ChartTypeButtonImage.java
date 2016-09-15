package com.justep.desinger.chart.type.select.composite;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.ScrolledComposite;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.RowLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;

import com.justep.desinger.chart.common.ChartConstant;

public class ChartTypeButtonImage extends Composite{
	
	private Composite mainComposite;
	private ScrolledComposite scrolledComposite;
	private static String ChartType = "";
	
	public ChartTypeButtonImage(Composite parent, int style, String defaultType) {
		super(parent, style);
		this.setLayout(new FillLayout());
		createLayout(this,defaultType);
	}
	
	public void createLayout(Composite parent,String chartType){
		scrolledComposite = new ScrolledComposite(this, SWT.BORDER | SWT.V_SCROLL);
		mainComposite = new Composite(scrolledComposite,SWT.NONE);
		mainComposite.setLayout(new RowLayout());
		scrolledComposite.setContent(mainComposite);
		scrolledComposite.setExpandHorizontal(true);
		scrolledComposite.setExpandVertical(true);
		createImage(chartType);
	}
	
	public void createImage(String chartType){
		String[][] imagesPath = ChartConstant.chartImageMap.get(chartType);
		System.out.println("选择的图表类型："+chartType);
		Control [] children = mainComposite.getChildren();
		//清除原有image
		for (int i = 0, c = children.length; i < c; i++) {
			Button cc = (Button)children[i];
			cc.dispose();
		}
		//点击一个button时其它抬起
		Listener listener = new Listener () {   
            public void handleEvent (Event e) {   
            	Button b = ((Button) e.widget);
            	Control [] children = mainComposite.getChildren();
        		for (int i = 0, c = children.length; i < c; i++) {
        			Button cc = (Button)children[i];
        			cc.setSelection(false);
        		}
            	b.setSelection(true);  
            	
            }   
        };   
		
		for(int i = 0,c = imagesPath.length;i < c;i ++){
			String path = ChartConstant.basePath + imagesPath[i][0];
			Image img = new Image(null,path);
			Button button = new Button(mainComposite, SWT.TOGGLE);
			button.setImage(img);
			button.addSelectionListener(new MySelectionListener());
			button.setData(imagesPath[i][1]);
			button.addListener (SWT.Selection, listener);
			if(i == 0) {
				button.setSelection(true);
				ChartType = imagesPath[i][1];
			}
		}
		if(chartType.equals("bar")) {
			scrolledComposite.setMinHeight(580);
		}else{
			scrolledComposite.setMinHeight(380);
		}
		mainComposite.layout();
	}
	
	private static final class MySelectionListener extends SelectionAdapter{
		public void widgetSelected(SelectionEvent e){
			String chartName = (String)((Button) e.getSource()).getData();
			System.out.println("选择的图表名称："+chartName);
			ChartType = chartName;
		}
	}
	
	public String getChartType(){
		return ChartType;
	}
}
