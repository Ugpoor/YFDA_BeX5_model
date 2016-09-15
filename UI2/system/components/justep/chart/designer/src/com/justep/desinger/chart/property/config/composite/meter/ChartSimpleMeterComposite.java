package com.justep.desinger.chart.property.config.composite.meter;

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

public class ChartSimpleMeterComposite extends Composite implements IChartComposite{
	
	private Combo combo_simple_tick_label_fontSize;
	private Combo combo_simple_tick_label_fontStyle;
	private Combo combo_simple_tick_label_fontName;
	
	private Text text_simple_tick_color;
	private Text text_simple_tick_size;
	private Text text_simple_tick_label_color;
	private Text text_simple_meter_angle;
	private Text text_simple_dial_outlineColor;
	private Text text_simple_dial_bgColor;
	private Text text_simple_needle_color;
	private Combo combo_simple_value_fontName;
	private Combo combo_simple_value_fontStyle;
	private Combo combo_simple_value_fontSize;
	private Text text_simple_value_util;
	private Text text_simple_value_color;
	
	Shell shell;
	private Button button_simple_tick_label_visible;
	private Button button_text_simple_tick_color;
	private Button button_text_simple_tick_label_color;
	private Button button_text_simple_dial_outlineColor;
	private Button button_text_simple_dial_bgColor;
	private Button button_text_simple_needle_color;
	private Button button_text_simple_value_color;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartSimpleMeterComposite(Composite parent, int style,XuiElement owerElement , String currentChartType) {
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
		button_simple_tick_label_visible.setSelection(true);
		combo_simple_tick_label_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_simple_tick_label_fontStyle.select(0);
		combo_simple_tick_label_fontSize.select(5);
		combo_simple_value_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_simple_value_fontSize.select(5);
		combo_simple_value_fontStyle.select(0);
	}

	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		final GridData gd_label = new GridData(SWT.LEFT, SWT.FILL, true, false);
		gd_label.heightHint = 22;
		gd_label.widthHint = 521;
		label.setLayoutData(gd_label);
		label.setText("简单仪表盘");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));

		//final Label label_2 = new Label(group_2, SWT.NONE);
		
		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("仪表盘刻度信息");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_3.heightHint = 83;
		gd_group_3.widthHint = 510;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.marginWidth = 1;
		gridLayout_3.marginTop = 1;
		gridLayout_3.marginRight = 1;
		gridLayout_3.marginLeft = 1;
		gridLayout_3.marginHeight = 1;
		gridLayout_3.marginBottom = 1;
		gridLayout_3.numColumns = 8;
		group_3.setLayout(gridLayout_3);

		button_simple_tick_label_visible = new Button(group_3, SWT.CHECK);
		button_simple_tick_label_visible.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 8, 1));
		button_simple_tick_label_visible.setText("仪表盘中是否显示刻度值");

		final Label label_17 = new Label(group_3, SWT.NONE);
		label_17.setLayoutData(new GridData());
		label_17.setText("刻度颜色：");

		text_simple_tick_color = new Text(group_3, SWT.BORDER);
		text_simple_tick_color.setToolTipText("仪表盘刻度值颜色");
		text_simple_tick_color.setText("#000000");
		final GridData gd_text_simple_tick_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_simple_tick_color.setLayoutData(gd_text_simple_tick_color);
		text_simple_tick_color.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_simple_tick_color.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_simple_tick_color = new Button(group_3, SWT.NONE);
		button_text_simple_tick_color.setLayoutData(new GridData());
		button_text_simple_tick_color.setText("..");

		final Label label_15 = new Label(group_3, SWT.NONE);
		label_15.setLayoutData(new GridData(SWT.RIGHT, SWT.CENTER, false, false));
		label_15.setText("数值颜色：");

		text_simple_tick_label_color = new Text(group_3, SWT.BORDER);
		text_simple_tick_label_color.setToolTipText("仪表盘中刻度值颜色");
		text_simple_tick_label_color.setText("#000000");
		final GridData gd_text_simple_tick_label_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_simple_tick_label_color.setLayoutData(gd_text_simple_tick_label_color);
		text_simple_tick_label_color.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_simple_tick_label_color.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_simple_tick_label_color = new Button(group_3, SWT.NONE);
		button_text_simple_tick_label_color.setLayoutData(new GridData());
		button_text_simple_tick_label_color.setText("..");

		final Label label_16 = new Label(group_3, SWT.NONE);
		label_16.setLayoutData(new GridData());
		label_16.setText("区间大小：");

		text_simple_tick_size = new Text(group_3, SWT.BORDER);
		text_simple_tick_size.setToolTipText("仪表盘刻度值区间(如：5 当前图表刻度范围1~100 则刻度个数为100/5=20个)");
		text_simple_tick_size.setText("5.0");
		final GridData gd_text_simple_tick_size = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_simple_tick_size.setLayoutData(gd_text_simple_tick_size);

		final Label label_18 = new Label(group_3, SWT.NONE);
		label_18.setLayoutData(new GridData());
		label_18.setText("字体名称：");

		combo_simple_tick_label_fontName = new Combo(group_3, SWT.NONE);
		combo_simple_tick_label_fontName.setToolTipText("刻度盘刻度值字体名称");
		combo_simple_tick_label_fontName.select(0);
		final GridData gd_combo_simple_tick_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		gd_combo_simple_tick_label_fontName.widthHint = 37;
		combo_simple_tick_label_fontName.setLayoutData(gd_combo_simple_tick_label_fontName);
		combo_simple_tick_label_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_19 = new Label(group_3, SWT.NONE);
		label_19.setLayoutData(new GridData(SWT.RIGHT, SWT.CENTER, false, false));
		label_19.setText("字体样式：");

		combo_simple_tick_label_fontStyle = new Combo(group_3, SWT.NONE);
		combo_simple_tick_label_fontStyle.setToolTipText("刻度盘刻度值字体样式");
		combo_simple_tick_label_fontStyle.select(0);
		final GridData gd_combo_simple_tick_label_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		combo_simple_tick_label_fontStyle.setLayoutData(gd_combo_simple_tick_label_fontStyle);
		combo_simple_tick_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});
		
		final Label label_20 = new Label(group_3, SWT.NONE);
		label_20.setLayoutData(new GridData());
		label_20.setText("字体大小：");

		combo_simple_tick_label_fontSize = new Combo(group_3, SWT.NONE);
		combo_simple_tick_label_fontSize.setToolTipText("刻度盘刻度值字体大小");
		combo_simple_tick_label_fontSize.select(5);
		final GridData gd_combo_simple_tick_label_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_simple_tick_label_fontSize.setLayoutData(gd_combo_simple_tick_label_fontSize);
		combo_simple_tick_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		
		final Group group_4 = new Group(this, SWT.NONE);
		group_4.setText("仪表盘指针信息");
		final GridData gd_group_4 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_4.heightHint = 57;
		gd_group_4.widthHint = 510;
		group_4.setLayoutData(gd_group_4);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.marginWidth = 1;
		gridLayout_4.marginTop = 1;
		gridLayout_4.marginRight = 1;
		gridLayout_4.marginLeft = 1;
		gridLayout_4.marginHeight = 1;
		gridLayout_4.marginBottom = 1;
		gridLayout_4.numColumns = 8;
		group_4.setLayout(gridLayout_4);

		final Label label_10 = new Label(group_4, SWT.NONE);
		label_10.setLayoutData(new GridData());
		label_10.setText("指针颜色：");

		text_simple_needle_color = new Text(group_4, SWT.BORDER);
		text_simple_needle_color.setToolTipText("仪表盘指针颜色");
		final GridData gd_text_simple_needle_color = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_text_simple_needle_color.widthHint = 113;
		text_simple_needle_color.setLayoutData(gd_text_simple_needle_color);
		text_simple_needle_color.setText("#0000FF");
		text_simple_needle_color.setBackground(ColorUtil.hexRGBToSWTColor("#0000FF",this.getDisplay()));
		text_simple_needle_color.setForeground(ColorUtil.hexRGBToSWTColor("#0000FF",this.getDisplay()));
				
		button_text_simple_needle_color = new Button(group_4, SWT.NONE);
		final GridData gd_button_2 = new GridData(SWT.LEFT, SWT.FILL, false, false);
		gd_button_2.widthHint = 24;
		button_text_simple_needle_color.setLayoutData(gd_button_2);
		button_text_simple_needle_color.setText("..");

		final Label label_21 = new Label(group_4, SWT.NONE);
		label_21.setLayoutData(new GridData());
		label_21.setText("数值颜色：");

		text_simple_value_color = new Text(group_4, SWT.BORDER);
		text_simple_value_color.setToolTipText("仪表盘指针值颜色(当前分析数据的颜色)");
		text_simple_value_color.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		text_simple_value_color.setText("#000000");
		text_simple_value_color.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_simple_value_color.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_simple_value_color = new Button(group_4, SWT.NONE);
		button_text_simple_value_color.setLayoutData(new GridData());
		button_text_simple_value_color.setText("..");

		final Label label_22 = new Label(group_4, SWT.NONE);
		label_22.setToolTipText("当前分析数据的计量单位(如：kg)");
		label_22.setLayoutData(new GridData());
		label_22.setText("计量单位：");

		text_simple_value_util = new Text(group_4, SWT.BORDER);
		text_simple_value_util.setToolTipText("仪表盘分析数据计量单位(如kg)");
		final GridData gd_text_simple_value_util = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_simple_value_util.widthHint = 8;
		text_simple_value_util.setLayoutData(gd_text_simple_value_util);
		
		final Label label_23 = new Label(group_4, SWT.NONE);
		label_23.setLayoutData(new GridData());
		label_23.setText("字体名称：");

		combo_simple_value_fontName = new Combo(group_4, SWT.NONE);
		combo_simple_value_fontName.setToolTipText("仪表盘指针值字体名称");
		combo_simple_value_fontName.select(0);
		final GridData gd_combo_simple_value_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		gd_combo_simple_value_fontName.widthHint = 117;
		combo_simple_value_fontName.setLayoutData(gd_combo_simple_value_fontName);
		combo_simple_value_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_24 = new Label(group_4, SWT.NONE);
		label_24.setLayoutData(new GridData());
		label_24.setText("字体样式：");

		combo_simple_value_fontStyle = new Combo(group_4, SWT.NONE);
		combo_simple_value_fontStyle.setToolTipText("仪表盘指针值字体样式");
		combo_simple_value_fontStyle.select(0);
		combo_simple_value_fontStyle.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1));
		combo_simple_value_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});
		
		final Label label_25 = new Label(group_4, SWT.NONE);
		label_25.setLayoutData(new GridData());
		label_25.setText("字体大小：");

		combo_simple_value_fontSize = new Combo(group_4, SWT.NONE);
		combo_simple_value_fontSize.setToolTipText("仪表盘指针值字体大小");
		combo_simple_value_fontSize.select(5);
		final GridData gd_combo_simple_value_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_simple_value_fontSize.widthHint = 30;
		combo_simple_value_fontSize.setLayoutData(gd_combo_simple_value_fontSize);
		combo_simple_value_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setText("其他");
		final GridData gd_group_2 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_2.heightHint = 35;
		gd_group_2.widthHint = 510;
		group_2.setLayoutData(gd_group_2);
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.marginWidth = 1;
		gridLayout_2.marginTop = 1;
		gridLayout_2.marginRight = 1;
		gridLayout_2.marginLeft = 1;
		gridLayout_2.marginHeight = 1;
		gridLayout_2.marginBottom = 1;
		gridLayout_2.numColumns = 9;
		group_2.setLayout(gridLayout_2);

		final Label label_11 = new Label(group_2, SWT.NONE);
		label_11.setLayoutData(new GridData());
		label_11.setText("背景颜色：");

		text_simple_dial_bgColor = new Text(group_2, SWT.BORDER);
		text_simple_dial_bgColor.setToolTipText("仪表盘刻度区域背景色");
		text_simple_dial_bgColor.setText("#FFFFFF");
		final GridData gd_text_simple_dial_bgColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_simple_dial_bgColor.widthHint = 56;
		text_simple_dial_bgColor.setLayoutData(gd_text_simple_dial_bgColor);
		text_simple_dial_bgColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_simple_dial_bgColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_simple_dial_bgColor = new Button(group_2, SWT.NONE);
		button_text_simple_dial_bgColor.setText("..");

		final Label label_12 = new Label(group_2, SWT.NONE);
		label_12.setLayoutData(new GridData());
		label_12.setText("轮廓线颜色：");

		text_simple_dial_outlineColor = new Text(group_2, SWT.BORDER);
		text_simple_dial_outlineColor.setToolTipText("仪表盘刻度区域轮廓线颜色");
		text_simple_dial_outlineColor.setText("#FFFFFF");
		final GridData gd_text_simple_dial_outlineColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_simple_dial_outlineColor.widthHint = 48;
		text_simple_dial_outlineColor.setLayoutData(gd_text_simple_dial_outlineColor);
		text_simple_dial_outlineColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_simple_dial_outlineColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_simple_dial_outlineColor = new Button(group_2, SWT.NONE);
		button_text_simple_dial_outlineColor.setLayoutData(new GridData());
		button_text_simple_dial_outlineColor.setText("..");

		final Label label_13 = new Label(group_2, SWT.NONE);
		label_13.setLayoutData(new GridData());
		label_13.setText("扇区角度：");

		text_simple_meter_angle = new Text(group_2, SWT.BORDER);
		text_simple_meter_angle.setToolTipText("仪表盘扇区角度(0~360)");
		text_simple_meter_angle.setText("260");
		final GridData gd_text_simple_meter_angle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_simple_meter_angle.widthHint = 49;
		text_simple_meter_angle.setLayoutData(gd_text_simple_meter_angle);
	}
	
	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		this.saveSelf(configElement, "simple-needle-color", text_simple_needle_color.getText());
		this.saveSelf(configElement, "simple-dial-background-color", text_simple_dial_bgColor.getText());
		this.saveSelf(configElement, "simple-dial-outline-color", text_simple_dial_outlineColor.getText());
		this.saveSelf(configElement, "simple-meter-angle", text_simple_meter_angle.getText());
		this.saveSelf(configElement, "simple-tick-label-color",  text_simple_tick_label_color.getText());
		this.saveSelf(configElement, "simple-tick-size", text_simple_tick_size.getText());
		this.saveSelf(configElement, "simple-tick-color", text_simple_tick_color.getText());
		
		this.saveSelf(configElement, "simple-tick-label-visible", ""+button_simple_tick_label_visible.getSelection());
		
		String fontName = combo_simple_tick_label_fontName.getItem(combo_simple_tick_label_fontName.getSelectionIndex());
		String fontStyle = combo_simple_tick_label_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_simple_tick_label_fontSize.getItem(combo_simple_tick_label_fontSize.getSelectionIndex());
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement,"simple-tick-label-font", "", attrMap);
		
		this.saveSelf(configElement, "simple-value-color",  text_simple_value_color.getText());
		this.saveSelf(configElement, "simple-units", text_simple_value_util.getText());

		fontName = combo_simple_value_fontName.getItem(combo_simple_value_fontName.getSelectionIndex());
		fontStyle = combo_simple_value_fontStyle.getSelectionIndex()+"";
		fontSize = combo_simple_value_fontSize.getItem(combo_simple_value_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "simple-value-font", "", attrMap);
		
		
		
		
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
	
		XuiElement simpleNeedleColorE = configElement.getChildByTagName("simple-needle-color");
		if(simpleNeedleColorE!=null){
			text_simple_needle_color.setText(W3cDocumentHelper.getText(simpleNeedleColorE.getOriginElement()));
			text_simple_needle_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleNeedleColorE.getOriginElement()),this.getDisplay()));
			text_simple_needle_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleNeedleColorE.getOriginElement()),this.getDisplay()));
		}
		XuiElement simpleDialBgColorE = configElement.getChildByTagName("simple-dial-background-color");
		if(simpleDialBgColorE!=null){
			text_simple_dial_bgColor.setText(W3cDocumentHelper.getText(simpleDialBgColorE.getOriginElement()));
			text_simple_dial_bgColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleDialBgColorE.getOriginElement()),this.getDisplay()));
			text_simple_dial_bgColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleDialBgColorE.getOriginElement()),this.getDisplay()));
		
		}
		XuiElement simpleDialOutColorE = configElement.getChildByTagName("simple-dial-outline-color");
		if(simpleDialOutColorE!=null){
			text_simple_dial_outlineColor.setText(W3cDocumentHelper.getText(simpleDialOutColorE.getOriginElement()));
			text_simple_dial_outlineColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleDialOutColorE.getOriginElement()),this.getDisplay()));
			text_simple_dial_outlineColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleDialOutColorE.getOriginElement()),this.getDisplay()));
		
		}
		XuiElement simpleMeterAngleE = configElement.getChildByTagName("simple-meter-angle");
		if(simpleMeterAngleE!=null){
			text_simple_meter_angle.setText(W3cDocumentHelper.getText(simpleMeterAngleE.getOriginElement()));
		}
		XuiElement simpleTickLanelVisibleE = configElement.getChildByTagName("simple-tick-label-visible");
		if(simpleTickLanelVisibleE!=null){
			boolean b = Boolean.parseBoolean(W3cDocumentHelper.getText(simpleTickLanelVisibleE.getOriginElement()));
			button_simple_tick_label_visible.setSelection(b);
			
			combo_simple_tick_label_fontSize.setEnabled(b);
			combo_simple_tick_label_fontStyle.setEnabled(b);
			combo_simple_tick_label_fontName.setEnabled(b);
			text_simple_tick_color.setEnabled(b);
			button_text_simple_tick_color.setEnabled(b);
			text_simple_tick_label_color.setEnabled(b);
			button_text_simple_tick_label_color.setEnabled(b);
			text_simple_tick_size.setEnabled(b);
			
		}else{
			combo_simple_tick_label_fontSize.setEnabled(true);
			combo_simple_tick_label_fontStyle.setEnabled(true);
			combo_simple_tick_label_fontName.setEnabled(true);
			text_simple_tick_color.setEnabled(true);
			button_text_simple_tick_color.setEnabled(true);
			text_simple_tick_label_color.setEnabled(true);
			button_text_simple_tick_label_color.setEnabled(true);
			text_simple_tick_size.setEnabled(true);
		}
		
		
		XuiElement simpleTickLabelColorE = configElement.getChildByTagName("simple-tick-label-color");
		if(simpleTickLabelColorE!=null){
			text_simple_tick_label_color.setText(W3cDocumentHelper.getText(simpleTickLabelColorE.getOriginElement()));
			text_simple_tick_label_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleTickLabelColorE.getOriginElement()),this.getDisplay()));
			text_simple_tick_label_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleTickLabelColorE.getOriginElement()),this.getDisplay()));
		
		}
		XuiElement simpleTickSizeE = configElement.getChildByTagName("simple-tick-size");
		if(simpleTickSizeE!=null){
			text_simple_tick_size.setText(W3cDocumentHelper.getText(simpleTickSizeE.getOriginElement()));
		}
		XuiElement simpleTickColorE = configElement.getChildByTagName("simple-tick-color");
		if(simpleTickColorE!=null){
			text_simple_tick_color.setText(W3cDocumentHelper.getText(simpleTickColorE.getOriginElement()));
			text_simple_tick_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleTickColorE.getOriginElement()),this.getDisplay()));
			text_simple_tick_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleTickColorE.getOriginElement()),this.getDisplay()));
		
		}
		XuiElement categoryTitleLabelFontE = configElement.getChildByTagName("simple-tick-label-font");
		if(categoryTitleLabelFontE!=null){
			setDefaultComboValue(combo_simple_tick_label_fontName,categoryTitleLabelFontE.getProperyValue("name"));
			combo_simple_tick_label_fontStyle.select(Integer.parseInt(categoryTitleLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_simple_tick_label_fontSize,categoryTitleLabelFontE.getProperyValue("size"));
		}
		XuiElement simpleValueColorE = configElement.getChildByTagName("simple-value-color");
		if(simpleValueColorE!=null){
			text_simple_value_color.setText(W3cDocumentHelper.getText(simpleValueColorE.getOriginElement()));
			text_simple_value_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleValueColorE.getOriginElement()),this.getDisplay()));
			text_simple_value_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(simpleValueColorE.getOriginElement()),this.getDisplay()));
		
		}
		XuiElement simpleUtilsE = configElement.getChildByTagName("simple-units");
		if(simpleUtilsE!=null){
			text_simple_value_util.setText(W3cDocumentHelper.getText(simpleUtilsE.getOriginElement()));
		}
		XuiElement categoryValueFontE = configElement.getChildByTagName("simple-value-font");
		if(categoryValueFontE!=null){
			setDefaultComboValue(combo_simple_value_fontName,categoryValueFontE.getProperyValue("name"));
			combo_simple_value_fontStyle.select(Integer.parseInt(categoryValueFontE.getProperyValue("style")));
			setDefaultComboValue(combo_simple_value_fontSize,categoryValueFontE.getProperyValue("size"));
		}
	}

	public void registerEvent() {
		

		button_simple_tick_label_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {             	
            	boolean b = button_simple_tick_label_visible.getSelection();
            	combo_simple_tick_label_fontSize.setEnabled(b);
    			combo_simple_tick_label_fontStyle.setEnabled(b);
    			combo_simple_tick_label_fontName.setEnabled(b);
    			text_simple_tick_color.setEnabled(b);
    			button_text_simple_tick_color.setEnabled(b);
    			text_simple_tick_label_color.setEnabled(b);
    			button_text_simple_tick_label_color.setEnabled(b);
    			text_simple_tick_size.setEnabled(b);
            }
		});
		
		button_text_simple_tick_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_simple_tick_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_simple_tick_color.setBackground(color);
					text_simple_tick_color.setForeground(color);
					text_simple_tick_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		
		button_text_simple_tick_label_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_simple_tick_label_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_simple_tick_label_color.setBackground(color);
					text_simple_tick_label_color.setForeground(color);
					text_simple_tick_label_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_simple_dial_outlineColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_simple_dial_outlineColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_simple_dial_outlineColor.setBackground(color);
					text_simple_dial_outlineColor.setForeground(color);
					text_simple_dial_outlineColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_simple_dial_bgColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_simple_dial_bgColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_simple_dial_bgColor.setBackground(color);
					text_simple_dial_bgColor.setForeground(color);
					text_simple_dial_bgColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		button_text_simple_needle_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_simple_needle_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_simple_needle_color.setBackground(color);
					text_simple_needle_color.setForeground(color);
					text_simple_needle_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		button_text_simple_value_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_simple_value_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_simple_value_color.setBackground(color);
					text_simple_value_color.setForeground(color);
					text_simple_value_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
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
