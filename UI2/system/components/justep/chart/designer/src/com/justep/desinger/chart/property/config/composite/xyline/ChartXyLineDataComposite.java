package com.justep.desinger.chart.property.config.composite.xyline;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.CLabel;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.RGB;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.ColorDialog;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.common.ChartConstant;
import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ChartConfigHelper;
import com.justep.desinger.chart.util.ColorUtil;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.swtdesigner.SWTResourceManager;

public class ChartXyLineDataComposite extends Composite implements IChartComposite{

	Shell shell;
	private Button button_text_serie_title_color;
	private Button button_text_serie_tick_label_fontColor;
	private Button button_serie_double_axis_visible;
	private Button button_serie_number_auto_visible;
	private Button button_serie_number_visible;
	
	
	private Text text_serie_tick_label_fontColor;
	private Combo combo_serie_tick_label_fontSize;
	private Combo combo_serie_tick_label_fontStyle;
	private Combo combo_serie_tick_label_fontName;
	private Text text_serie_number_format;
	private Text text_serie_number_step;
	private Text text_serie_number_end;
	private Text text_serie_number_start;
	private Combo combo_serie_upper_margin;
	private Combo combo_serie_two_axis_location;
	private Combo combo_serie_one_axis_location;
	private Combo combo_serie_title_fontSize;
	private Text text_serie_title_color;
	private Text text_serie_title;
	
	private Combo combo_serie_title_fontStyle;
	private Combo combo_serie_title_fontName;
	
	private XuiElement owerElement;
	private String currentChartType;

	public ChartXyLineDataComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType = currentChartType;
		this.shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
		
	}

	public void initDefaultValue() {
		combo_serie_title_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_serie_title_fontStyle.select(0);
		combo_serie_title_fontSize.select(5);
		
		combo_serie_one_axis_location.select(0);
		combo_serie_two_axis_location.select(3);
		combo_serie_upper_margin.select(0);
		
		combo_serie_tick_label_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_serie_tick_label_fontStyle.select(0);
		combo_serie_tick_label_fontSize.select(5);
		
		button_serie_number_auto_visible.setSelection(true);
		button_serie_number_visible.setSelection(true);
		
	}
	
	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		String doubleAxis = "" + button_serie_double_axis_visible.getSelection();
		String oneAxis = combo_serie_one_axis_location.getItem(combo_serie_one_axis_location.getSelectionIndex());
		String towAxis = combo_serie_two_axis_location.getItem(combo_serie_two_axis_location.getSelectionIndex());
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("double-axis", doubleAxis);
		attrMap.put("one-axis-location", oneAxis);
		attrMap.put("two-axis-location", towAxis);
		this.saveSelf(configElement, "serie", "", attrMap);

		this.saveSelf(configElement, "serie-title", text_serie_title.getText());
		
		this.saveSelf(configElement, "serie-title-color", text_serie_title_color.getText());
		
		String fontName = combo_serie_title_fontName.getItem(combo_serie_title_fontName.getSelectionIndex());
		String fontStyle = combo_serie_title_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_serie_title_fontSize.getItem(combo_serie_title_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "serie-title-font", "", attrMap);
		

		this.saveSelf(configElement, "serie-upper-margin",  combo_serie_upper_margin.getItem(combo_serie_upper_margin.getSelectionIndex()));
		
		String visible = "" + button_serie_number_visible.getSelection();
		String auto = "" + button_serie_number_auto_visible.getSelection();
		String start = text_serie_number_start.getText();
		String end = text_serie_number_end.getText();
		String step = text_serie_number_step.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("visible", visible);
		attrMap.put("auto", auto);
		attrMap.put("start", start);
		attrMap.put("end", end);
		attrMap.put("step", step);
		this.saveSelf(configElement, "serie-number", "", attrMap);
	
		this.saveSelf(configElement, "serie-number-format", text_serie_number_format.getText());
		
		fontName = combo_serie_tick_label_fontName.getItem(combo_serie_tick_label_fontName.getSelectionIndex());
		fontStyle = combo_serie_tick_label_fontStyle.getSelectionIndex()+"";
		fontSize = combo_serie_tick_label_fontSize.getItem(combo_serie_tick_label_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "serie-tick-label-font", "", attrMap);
		
		this.saveSelf(configElement, "serie-tick-label-color", text_serie_tick_label_fontColor.getText());
				
	}
	
	private void saveSelf(XuiElement configElement ,String tagName ,String tagValue){
		boolean b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType,tagName, tagValue, new HashMap<String,String>());
		if(b){
			XuiElement eE = getXuiElement(configElement,tagName);
			W3cDocumentHelper.setElementText(eE.getOriginElement(), tagValue);
		}else{
			configElement.removeChildren(tagName);
		}
	}
	
	@SuppressWarnings("unchecked")
	private void saveSelf(XuiElement configElement ,String tagName ,String tagValue, HashMap<String,String> attrMap){
		boolean b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, tagName, tagValue, attrMap);
		if(b){			
			XuiElement eE = getXuiElement(configElement, tagName);
			Iterator it = attrMap.entrySet().iterator();
			while(it.hasNext()){
				Map.Entry<String,String> entry = (Map.Entry<String,String>)it.next();
				String key = entry.getKey();
				String value = entry.getValue();				
				eE.getXuiDataModel().setPropertyValue(eE, key, value);
			}
			W3cDocumentHelper.setElementText(eE.getOriginElement(), tagValue);
		}else{
			configElement.removeChildren(tagName);
		}
	}
	
	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		
		XuiElement serieE = configElement.getChildByTagName("serie");
		if(serieE!=null){
			boolean b = Boolean.parseBoolean(serieE.getProperyValue("double-axis"));
			button_serie_double_axis_visible.setSelection(b);
			setDefaultComboValue(combo_serie_one_axis_location,serieE.getProperyValue("one-axis-location"));
			setDefaultComboValue(combo_serie_two_axis_location,serieE.getProperyValue("two-axis-location"));
			if(b){
				combo_serie_two_axis_location.setEnabled(true);
			}else{
				combo_serie_two_axis_location.setEnabled(false);
			}
		}else{
			button_serie_double_axis_visible.setSelection(false);
			combo_serie_two_axis_location.setEnabled(false);
		}
		
		
		XuiElement serieTitleE = configElement.getChildByTagName("serie-title");
		if(serieTitleE!=null){
			text_serie_title.setText(W3cDocumentHelper.getText(serieTitleE.getOriginElement()));
		}
		XuiElement serieTitleColorE = configElement.getChildByTagName("serie-title-color");
		if(serieTitleColorE!=null){
			text_serie_title_color.setText(W3cDocumentHelper.getText(serieTitleColorE.getOriginElement()));
			text_serie_title_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(serieTitleColorE.getOriginElement()),this.getDisplay()));
			text_serie_title_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(serieTitleColorE.getOriginElement()),this.getDisplay()));
		}
		XuiElement serieTitleFontE = configElement.getChildByTagName("serie-title-font");
		if(serieTitleFontE!=null){
			setDefaultComboValue(combo_serie_title_fontName,serieTitleFontE.getProperyValue("name"));
			combo_serie_title_fontStyle.select(Integer.parseInt(serieTitleFontE.getProperyValue("style")));
			setDefaultComboValue(combo_serie_title_fontSize,serieTitleFontE.getProperyValue("size"));
		}
		XuiElement serieUpperMarginE = configElement.getChildByTagName("serie-upper-margin");
		if(serieUpperMarginE!=null){
			setDefaultComboValue(combo_serie_upper_margin,W3cDocumentHelper.getText(serieUpperMarginE.getOriginElement()));
		}
		XuiElement serieNumberE = configElement.getChildByTagName("serie-number");
		if(serieNumberE!=null){
			boolean vb = Boolean.parseBoolean(serieNumberE.getProperyValue("visible"));
			boolean autoB = Boolean.parseBoolean(serieNumberE.getProperyValue("auto"));
			
			button_serie_number_visible.setSelection(vb);
			button_serie_number_auto_visible.setSelection(autoB);
		
			text_serie_number_start.setText(serieNumberE.getProperyValue("start"));
			text_serie_number_end.setText(serieNumberE.getProperyValue("end"));
			text_serie_number_step.setText(serieNumberE.getProperyValue("step"));
			
			
			text_serie_tick_label_fontColor.setEnabled(vb);
			combo_serie_tick_label_fontSize.setEnabled(vb);
			combo_serie_tick_label_fontStyle.setEnabled(vb);
			combo_serie_tick_label_fontName.setEnabled(vb);			
			button_serie_number_auto_visible.setEnabled(vb);
			
			
			
			text_serie_number_format.setEnabled(vb);
			combo_serie_upper_margin.setEnabled(vb);
			
			if(!vb){				
				button_serie_double_axis_visible.setEnabled(vb);			
				combo_serie_two_axis_location.setEnabled(vb);
				combo_serie_one_axis_location.setEnabled(vb);	
			}
			
			combo_serie_title_fontSize.setEnabled(vb);
			text_serie_title_color.setEnabled(vb);			
			button_text_serie_title_color.setEnabled(vb);
			button_text_serie_tick_label_fontColor.setEnabled(vb);
			text_serie_title.setEnabled(vb);
			combo_serie_title_fontStyle.setEnabled(vb);
			combo_serie_title_fontName.setEnabled(vb);
	
			text_serie_number_step.setEnabled(false);
			text_serie_number_end.setEnabled(false);
			text_serie_number_start.setEnabled(false);
			
			if(vb){
				if(autoB){				
					text_serie_number_step.setEnabled(false);
					text_serie_number_end.setEnabled(false);
					text_serie_number_start.setEnabled(false);
				}else{		
					text_serie_number_step.setEnabled(true);
					text_serie_number_end.setEnabled(true);
					text_serie_number_start.setEnabled(true);
				}
			}
			
		}else{
			
			button_serie_number_auto_visible.setEnabled(true);
			
			text_serie_tick_label_fontColor.setEnabled(true);
			combo_serie_tick_label_fontSize.setEnabled(true);
			combo_serie_tick_label_fontStyle.setEnabled(true);
			combo_serie_tick_label_fontName.setEnabled(true);
			
			text_serie_number_format.setEnabled(true);
			combo_serie_upper_margin.setEnabled(true);
			/*
			button_serie_double_axis_visible.setEnabled(true);
			combo_serie_two_axis_location.setEnabled(true);
			combo_serie_one_axis_location.setEnabled(true);
			*/
			combo_serie_title_fontSize.setEnabled(true);
			text_serie_title_color.setEnabled(true);
			
			button_text_serie_title_color.setEnabled(true);
			button_text_serie_tick_label_fontColor.setEnabled(true);
			
			
			text_serie_title.setEnabled(true);
			combo_serie_title_fontStyle.setEnabled(true);
			combo_serie_title_fontName.setEnabled(true);
			
			text_serie_number_start.setEnabled(false);
			text_serie_number_end.setEnabled(false);
			text_serie_number_step.setEnabled(false);
		}
	
		XuiElement serieNumberFormatE = configElement.getChildByTagName("serie-number-format");
		if(serieNumberFormatE!=null){
			text_serie_number_format.setText(W3cDocumentHelper.getText(serieNumberFormatE.getOriginElement()));
		}
		XuiElement serieTickLabelFontE = configElement.getChildByTagName("serie-tick-label-font");
		if(serieTickLabelFontE!=null){
			setDefaultComboValue(combo_serie_tick_label_fontName,serieTickLabelFontE.getProperyValue("name"));
			combo_serie_tick_label_fontStyle.select(Integer.parseInt(serieTickLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_serie_tick_label_fontSize,serieTickLabelFontE.getProperyValue("size"));
		}
		XuiElement serieTickLabelFontColorE = configElement.getChildByTagName("serie-tick-label-color");
		if(serieTickLabelFontColorE!=null){
			text_serie_tick_label_fontColor.setText(W3cDocumentHelper.getText(serieTickLabelFontColorE.getOriginElement()));
			text_serie_tick_label_fontColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(serieTickLabelFontColorE.getOriginElement()),this.getDisplay()));
			text_serie_tick_label_fontColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(serieTickLabelFontColorE.getOriginElement()),this.getDisplay()));
		}
	}
	
	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(521, 22));
		label.setText("数据轴");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));

		button_serie_number_visible = new Button(this, SWT.CHECK);
		button_serie_number_visible.setText("图表是否显示数据轴");
		
		final Group group = new Group(this, SWT.NONE);
		group.setText("数据轴描述信息");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group.heightHint = 59;
		gd_group.widthHint = 510;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 9;
		group.setLayout(gridLayout);

		final Label label_6 = new Label(group, SWT.NONE);
		label_6.setText("描述信息：");

		text_serie_title = new Text(group, SWT.BORDER);
		text_serie_title.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 8, 1));
		text_serie_title.setText("数据");

		final Label label_7 = new Label(group, SWT.NONE);
		label_7.setText("字体名称：");

		combo_serie_title_fontName = new Combo(group, SWT.NONE);
		combo_serie_title_fontName.select(0);
		final GridData gd_combo_serie_title_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_title_fontName.widthHint = 64;
		combo_serie_title_fontName.setLayoutData(gd_combo_serie_title_fontName);
		combo_serie_title_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_8 = new Label(group, SWT.NONE);
		label_8.setText("字体样式：");

		combo_serie_title_fontStyle = new Combo(group, SWT.NONE);
		combo_serie_title_fontStyle.select(0);
		combo_serie_title_fontStyle.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_serie_title_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});

		final Label label_9 = new Label(group, SWT.NONE);
		label_9.setText("字体大小：");

		combo_serie_title_fontSize = new Combo(group, SWT.NONE);
		combo_serie_title_fontSize.select(5);
		final GridData gd_combo_serie_title_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_title_fontSize.widthHint = 42;
		combo_serie_title_fontSize.setLayoutData(gd_combo_serie_title_fontSize);
		combo_serie_title_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_5 = new Label(group, SWT.NONE);
		label_5.setLayoutData(new GridData());
		label_5.setText("字体颜色：");

		text_serie_title_color = new Text(group, SWT.BORDER);
		text_serie_title_color.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		text_serie_title_color.setText("#000000");
		text_serie_title_color.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_serie_title_color.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		
		button_text_serie_title_color = new Button(group, SWT.NONE);
		button_text_serie_title_color.setText("..");
		
		final GridData gd_text_2 = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_2.widthHint = 142;
		
		
		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("数据坐标刻度值");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_3.heightHint = 103;
		gd_group_3.widthHint = 510;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout3 = new GridLayout();
		gridLayout3.numColumns = 9;
		group_3.setLayout(gridLayout3);

		button_serie_number_auto_visible = new Button(group_3, SWT.CHECK);
		button_serie_number_auto_visible.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false, 9, 1));
		button_serie_number_auto_visible.setText("是否采用系统自动设定数据轴数据刻度值信息");

		final Label label_13 = new Label(group_3, SWT.NONE);
		label_13.setLayoutData(new GridData());
		label_13.setText("起始数值：");

		text_serie_number_start = new Text(group_3, SWT.BORDER);
		text_serie_number_start.setText("0");
		final GridData gd_text_serie_number_start = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_serie_number_start.setLayoutData(gd_text_serie_number_start);

		final Label label_14 = new Label(group_3, SWT.NONE);
		label_14.setLayoutData(new GridData());
		label_14.setText("终止位置：");

		text_serie_number_end = new Text(group_3, SWT.BORDER);
		text_serie_number_end.setText("1000");
		final GridData gd_text_serie_number_end = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_serie_number_end.setLayoutData(gd_text_serie_number_end);

		final Label label_15 = new Label(group_3, SWT.NONE);
		label_15.setLayoutData(new GridData());
		label_15.setText("步长：");

		text_serie_number_step = new Text(group_3, SWT.BORDER);
		text_serie_number_step.setText("100");
		final GridData gd_text_serie_number_step = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_serie_number_step.setLayoutData(gd_text_serie_number_step);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);

		final Label label_17 = new Label(group_3, SWT.NONE);
		label_17.setLayoutData(new GridData());
		label_17.setText("数值字体：");

		combo_serie_tick_label_fontName = new Combo(group_3, SWT.NONE);
		combo_serie_tick_label_fontName.select(0);
		final GridData gd_combo_serie_tick_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_tick_label_fontName.widthHint = 69;
		combo_serie_tick_label_fontName.setLayoutData(gd_combo_serie_tick_label_fontName);
		combo_serie_tick_label_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_18 = new Label(group_3, SWT.NONE);
		label_18.setLayoutData(new GridData());
		label_18.setText("字体样式：");

		combo_serie_tick_label_fontStyle = new Combo(group_3, SWT.NONE);
		combo_serie_tick_label_fontStyle.select(0);
		final GridData gd_combo_serie_tick_label_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_serie_tick_label_fontStyle.setLayoutData(gd_combo_serie_tick_label_fontStyle);
		combo_serie_tick_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});

		final Label label_19 = new Label(group_3, SWT.NONE);
		label_19.setLayoutData(new GridData());
		label_19.setText("字体大小：");

		combo_serie_tick_label_fontSize = new Combo(group_3, SWT.NONE);
		combo_serie_tick_label_fontSize.select(5);
		final GridData gd_combo_serie_tick_label_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_tick_label_fontSize.widthHint = 40;
		combo_serie_tick_label_fontSize.setLayoutData(gd_combo_serie_tick_label_fontSize);
		combo_serie_tick_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_20 = new Label(group_3, SWT.NONE);
		label_20.setLayoutData(new GridData());
		label_20.setText("字体颜色：");

		text_serie_tick_label_fontColor = new Text(group_3, SWT.BORDER);
		text_serie_tick_label_fontColor.setText("#000000");
		final GridData gd_text_serie_tick_label_fontColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_serie_tick_label_fontColor.setLayoutData(gd_text_serie_tick_label_fontColor);
		text_serie_tick_label_fontColor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_serie_tick_label_fontColor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_serie_tick_label_fontColor = new Button(group_3, SWT.NONE);
		button_text_serie_tick_label_fontColor.setText("..");

		final Label label_16 = new Label(group_3, SWT.NONE);
		label_16.setLayoutData(new GridData());
		label_16.setText("数据格式：");

		text_serie_number_format = new Text(group_3, SWT.BORDER);
		text_serie_number_format.setText("####");
		final GridData gd_text_serie_number_format = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_serie_number_format.setLayoutData(gd_text_serie_number_format);

		final Label label_2 = new Label(group_3, SWT.NONE);
		label_2.setLayoutData(new GridData());
		label_2.setText("距顶距离：");

		combo_serie_upper_margin = new Combo(group_3, SWT.NONE);
		combo_serie_upper_margin.setToolTipText("数据项最大数据值高度距顶端距离");
		combo_serie_upper_margin.select(0);
		combo_serie_upper_margin.setLayoutData( new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_serie_upper_margin.setItems(new String[] {"0.1","0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1.0"});
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setText("双数据轴");
		final GridData gd_group_2 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_2.heightHint = 87;
		gd_group_2.widthHint = 510;
		group_2.setLayoutData(gd_group_2);
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.numColumns = 2;
		group_2.setLayout(gridLayout_2);

		button_serie_double_axis_visible = new Button(group_2, SWT.CHECK);
		button_serie_double_axis_visible.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1));
		button_serie_double_axis_visible.setText("是否采用双数据轴描述数据");

		final Label label_11 = new Label(group_2, SWT.NONE);
		label_11.setLayoutData(new GridData());
		label_11.setText("主数据轴显示位置：");

		combo_serie_one_axis_location = new Combo(group_2, SWT.NONE);
		combo_serie_one_axis_location.select(0);
		combo_serie_one_axis_location.setItems(new String[] {"TOP_OR_LEFT", "TOP_OR_RIGHT", "BOTTOM_OR_LEFT", "BOTTOM_OR_RIGHT"});
		combo_serie_one_axis_location.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));

		final Label label_12 = new Label(group_2, SWT.NONE);
		label_12.setText("副数据轴显示位置：");

		combo_serie_two_axis_location = new Combo(group_2, SWT.NONE);
		combo_serie_two_axis_location.select(3);
		combo_serie_two_axis_location.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_serie_two_axis_location.setItems(new String[] {"TOP_OR_LEFT", "TOP_OR_RIGHT", "BOTTOM_OR_LEFT", "BOTTOM_OR_RIGHT"});
		
	}

	public void registerEvent() {
		button_text_serie_title_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_serie_title_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_serie_title_color.setBackground(color);
					text_serie_title_color.setForeground(color);
					text_serie_title_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		
		button_text_serie_tick_label_fontColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_serie_title_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_serie_tick_label_fontColor.setBackground(color);
					text_serie_tick_label_fontColor.setForeground(color);
					text_serie_tick_label_fontColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		
		button_serie_double_axis_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {             	
            	combo_serie_two_axis_location.setEnabled(button_serie_double_axis_visible.getSelection());            	
            }    
        });   
		
		button_serie_number_auto_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {             	
            	text_serie_number_step.setEnabled(!button_serie_number_auto_visible.getSelection());  
				text_serie_number_end.setEnabled(!button_serie_number_auto_visible.getSelection());  
				text_serie_number_start.setEnabled(!button_serie_number_auto_visible.getSelection());  
            }    
        });   
		
		button_serie_number_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {             	
            				
            	button_serie_number_auto_visible.setEnabled(button_serie_number_visible.getSelection());   
                       	
            	text_serie_tick_label_fontColor.setEnabled(button_serie_number_visible.getSelection());   
				combo_serie_tick_label_fontSize.setEnabled(button_serie_number_visible.getSelection());   
				combo_serie_tick_label_fontStyle.setEnabled(button_serie_number_visible.getSelection());   
				combo_serie_tick_label_fontName.setEnabled(button_serie_number_visible.getSelection());   
				
				text_serie_number_format.setEnabled(button_serie_number_visible.getSelection());   
				text_serie_number_step.setEnabled(button_serie_number_visible.getSelection());   
				text_serie_number_end.setEnabled(button_serie_number_visible.getSelection());   
				text_serie_number_start.setEnabled(button_serie_number_visible.getSelection());   
				combo_serie_upper_margin.setEnabled(button_serie_number_visible.getSelection());  
				
				if(button_serie_number_visible.getSelection()){
					button_serie_double_axis_visible.setEnabled(true);  
					combo_serie_one_axis_location.setEnabled(true);  						
					if(button_serie_double_axis_visible.getSelection()){
						combo_serie_two_axis_location.setEnabled(true);  
					}else{
						combo_serie_two_axis_location.setEnabled(false);  
					}
				}else{
					button_serie_double_axis_visible.setEnabled(false);  
					combo_serie_two_axis_location.setEnabled(false);  
					combo_serie_one_axis_location.setEnabled(false);  
				}
				
				combo_serie_title_fontSize.setEnabled(button_serie_number_visible.getSelection());  
				text_serie_title_color.setEnabled(button_serie_number_visible.getSelection());  
				
				button_text_serie_title_color.setEnabled(button_serie_number_visible.getSelection());  
				button_text_serie_tick_label_fontColor.setEnabled(button_serie_number_visible.getSelection());  
				
				
				text_serie_title.setEnabled(button_serie_number_visible.getSelection());  
				combo_serie_title_fontStyle.setEnabled(button_serie_number_visible.getSelection());  
				combo_serie_title_fontName.setEnabled(button_serie_number_visible.getSelection());  
				
				if(button_serie_number_visible.getSelection() && button_serie_number_auto_visible.getSelection()){
					text_serie_number_step.setEnabled(false);  
					text_serie_number_end.setEnabled(false);  
					text_serie_number_start.setEnabled(false);  
				}else if (button_serie_number_visible.getSelection() && !button_serie_number_auto_visible.getSelection()){
					text_serie_number_step.setEnabled(true);  
					text_serie_number_end.setEnabled(true);   
					text_serie_number_start.setEnabled(true);  
				}
				
            }    
        });   
	}

	/**
	 * @param combo
	 * @param v
	 */
	private void setDefaultComboValue(Combo combo , String v){
		String [] items = combo.getItems();
		for(int i=0; i<items.length; i++){
			if(items[i].equalsIgnoreCase(v)){
				combo.select(i);
				break;
			}
		}
	}
	
	private XuiElement getXuiElement(XuiElement parentElement,String tagName){
		XuiElement xuiE = parentElement.getChildByTagName(tagName);
		if(xuiE == null){
			if("config".equals(tagName)){
				xuiE = parentElement.getXuiDataModel().addElement(tagName, parentElement, null, null, "<config></config>", null);
			}else{
				xuiE = parentElement.getXuiDataModel().addElement(tagName, parentElement, tagName);
			}
		}
		return xuiE;
	}
}
