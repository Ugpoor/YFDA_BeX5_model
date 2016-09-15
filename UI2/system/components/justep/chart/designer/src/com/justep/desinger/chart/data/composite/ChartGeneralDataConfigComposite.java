package com.justep.desinger.chart.data.composite;

import java.util.HashMap;
import java.util.List;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.StackLayout;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartGeneralDataConfigComposite extends Composite implements IChartComposite{

	private XuiElement cSeriesE ;
	@SuppressWarnings("unused")
	private HashMap<String ,String []> dataMap = new HashMap<String ,String []>();
	@SuppressWarnings("unused")
	private String [] dataIds;
	
	private StackLayout stackLayout = new StackLayout();
	private Button botton_title_visible;
	private Composite composite;
	private Composite chartGeneralAutoDataConfigComposite;
	private Composite chartGeneralNoAutoDataConfigComposite;
	
	public ChartGeneralDataConfigComposite(Composite parent, int style ,XuiElement cSeriesE ,String [] dataIds,HashMap<String ,String []> dataMap) {
		super(parent, style);		
		this.cSeriesE = cSeriesE;	
		this.dataIds = dataIds;
		this.dataMap = dataMap;
		
		initLayout();
		chartGeneralNoAutoDataConfigComposite = new ChartGeneralNoAutoDataConfigComposite(composite,SWT.NONE,cSeriesE,dataIds,dataMap);
		chartGeneralAutoDataConfigComposite = new ChartGeneralAutoDataConfigComposite(composite,SWT.NONE,cSeriesE,dataIds,dataMap);
		registerEvent();
		initDefaultValue();	
		initSelfDefaultValue();
	}
	
	
	public void initDefaultValue() {
		botton_title_visible.setSelection(true);
		stackLayout.topControl = chartGeneralAutoDataConfigComposite;
		composite.layout();
	}
	
	public void initSelfDefaultValue() {
		List<?> dataList = this.cSeriesE.getChildListByTagName("data");
		if(dataList.size()>0){
			XuiElement dataE = (XuiElement) dataList.get(0);
			String autoData = dataE.getProperyValue("autoData");
			if(autoData == null || autoData.equals("") || autoData.equals("false")){
				autoData = "false";
			}
			if(autoData.equals("false")){
				botton_title_visible.setSelection(false);
				stackLayout.topControl = chartGeneralNoAutoDataConfigComposite;
				composite.layout();
			}else{
				botton_title_visible.setSelection(true);
				stackLayout.topControl = chartGeneralAutoDataConfigComposite;
				composite.layout();
			}
		}else{
			//默认显示自动DATA设置页面
			botton_title_visible.setSelection(true);
			
			stackLayout.topControl = chartGeneralAutoDataConfigComposite;
			composite.layout();
		}
		
	}

	public void saveSelfConfig() {
		this.cSeriesE.removeChildren("data");
		if(this.botton_title_visible.getSelection()){
			((ChartGeneralAutoDataConfigComposite)chartGeneralAutoDataConfigComposite).saveSelfConfig();
		}else{
			((ChartGeneralNoAutoDataConfigComposite)chartGeneralNoAutoDataConfigComposite).saveSelfConfig();
		}
	}

	public void registerEvent() {
		botton_title_visible.addSelectionListener(new SelectionAdapter() {    
			public void widgetSelected(SelectionEvent e) {   
				if(botton_title_visible.getSelection()){					
					stackLayout.topControl = chartGeneralAutoDataConfigComposite;
				}else{
					stackLayout.topControl = chartGeneralNoAutoDataConfigComposite;
				}
				composite.layout();
			}    
		});    	
	}
	
	public void initLayout() {
		final GridLayout gridLayout_5 = new GridLayout();
		gridLayout_5.marginWidth = 0;
		gridLayout_5.marginHeight = 0;
		gridLayout_5.horizontalSpacing = 0;
		setLayout(gridLayout_5);

		botton_title_visible = new Button(this, SWT.CHECK);
		botton_title_visible.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		botton_title_visible.setText("自动根据数据进行分组显示");
		botton_title_visible.setSelection(true);
		
		composite = new Composite(this, SWT.NONE);
		composite.setLayout(stackLayout);
		final GridData gd_composite = new GridData(SWT.FILL, SWT.FILL, true, true);
		gd_composite.heightHint = 450;
		gd_composite.widthHint = 600;
		composite.setLayoutData(gd_composite);
		
	}

}
