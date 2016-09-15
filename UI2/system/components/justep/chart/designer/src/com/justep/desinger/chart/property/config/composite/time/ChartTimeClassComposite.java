package com.justep.desinger.chart.property.config.composite.time;

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

public class ChartTimeClassComposite extends Composite implements IChartComposite{

	private Text text_date_format;
	private Combo combo_time_period;
	
	private Text combo_tick_label_fontColor;
	
	private Text text_category_item_label_number_format;
	private Text text_category_item_label_corlor;
	private Combo combo_category_item_label_fontStyle;
	private Combo combo_category_item_label_fontSize;
	private Combo combo_category_item_label_fontName;
	
	private Text text_category_title_color;
	private Text text_category_title;
	private Combo combo_category_title_fontSize;
	private Combo combo_category_title_fontStyle;
	private Combo combo_category_title_fontName;
	
	private Combo combo_tick_label_fontSize;
	private Combo combo_tick_label_fontStyle;
	private Combo combo_tick_label_fontName;
	
	Shell shell;
	private Button button_category_item_label_visible;
	private Button button_text_category_title_color;
	private Button button_combo_tick_label_fontColor;
	private Button button_text_category_item_label_corlor;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartTimeClassComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
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

		combo_category_title_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_category_title_fontStyle.select(0);
		combo_category_title_fontSize.select(5);
		
		combo_category_item_label_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_category_item_label_fontStyle.select(0);
		combo_category_item_label_fontSize.select(5);
		
		combo_tick_label_fontSize.select(5);
		combo_tick_label_fontStyle.select(0);
		combo_tick_label_fontName.select(ChartConstant.getSYSFontList().length-1);
		
		combo_time_period.select(2);
		text_date_format.setText("yyyy-MM-dd");
		
		button_category_item_label_visible.setSelection(false);
		
		button_category_item_label_visible.setSelection(false);
		text_category_item_label_number_format.setEnabled(false);
		text_category_item_label_corlor.setEnabled(false);
		combo_category_item_label_fontStyle.setEnabled(false);
		combo_category_item_label_fontSize.setEnabled(false);
		combo_category_item_label_fontName.setEnabled(false);	
	}

	public void saveSelfConfig() {
		
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		this.saveSelf(configElement, "category-title", text_category_title.getText());
		this.saveSelf(configElement, "category-title-color", text_category_title_color.getText());
		
		String fontName = combo_category_title_fontName.getItem(combo_category_title_fontName.getSelectionIndex());
		String fontStyle = combo_category_title_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_category_title_fontSize.getItem(combo_category_title_fontSize.getSelectionIndex());
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "category-title-font", "", attrMap);
		
		
		this.saveSelf(configElement, "category-item-label-visible",""+button_category_item_label_visible.getSelection());
		
		fontName = combo_category_item_label_fontName.getItem(combo_category_item_label_fontName.getSelectionIndex());
		fontStyle = combo_category_item_label_fontStyle.getSelectionIndex()+"";
		fontSize = combo_category_item_label_fontSize.getItem(combo_category_item_label_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "category-item-label-font", "", attrMap);

		this.saveSelf(configElement, "category-item-label-color", text_category_item_label_corlor.getText());
		this.saveSelf(configElement, "category-item-label-number-format", text_category_item_label_number_format.getText());
		this.saveSelf(configElement, "category-tick-label-color", combo_tick_label_fontColor.getText());
		
		fontName = combo_tick_label_fontName.getItem(combo_tick_label_fontName.getSelectionIndex());
		fontStyle = combo_tick_label_fontStyle.getSelectionIndex()+"";
		fontSize = combo_tick_label_fontSize.getItem(combo_tick_label_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement,"category-tick-label-font", "", attrMap);

		String timePeriod = combo_time_period.getItem(combo_time_period.getSelectionIndex());
		String dateFormat = text_date_format.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("time-period", timePeriod);
		this.saveSelf(configElement, "date-format", dateFormat, attrMap);
		
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
		XuiElement categoryTitleE = configElement.getChildByTagName("category-title");
		if(categoryTitleE!=null){
			text_category_title.setText(W3cDocumentHelper.getText(categoryTitleE.getOriginElement()));
		}
		XuiElement categoryTitleColorE = configElement.getChildByTagName("category-title-color");
		if(categoryTitleColorE!=null){
			text_category_title_color.setText(W3cDocumentHelper.getText(categoryTitleColorE.getOriginElement()));
			text_category_title_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryTitleColorE.getOriginElement()),this.getDisplay()));
			text_category_title_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryTitleColorE.getOriginElement()),this.getDisplay()));
		}else{
			text_category_title_color.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
			text_category_title_color.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		}
		
		XuiElement categoryTitleFontE = configElement.getChildByTagName("category-title-font");
		if(categoryTitleFontE!=null){
			setDefaultComboValue(combo_category_title_fontName,categoryTitleFontE.getProperyValue("name"));
			combo_category_title_fontStyle.select(Integer.parseInt(categoryTitleFontE.getProperyValue("style")));
			setDefaultComboValue(combo_category_title_fontSize,categoryTitleFontE.getProperyValue("size"));
		}
		
		XuiElement categoryItemLabelVisibleE = configElement.getChildByTagName("category-item-label-visible");
		if(categoryItemLabelVisibleE!=null){
			boolean b = Boolean.parseBoolean(W3cDocumentHelper.getText(categoryItemLabelVisibleE.getOriginElement()));
			button_category_item_label_visible.setSelection(b);
			text_category_item_label_number_format.setEnabled(b);
			text_category_item_label_corlor.setEnabled(b);
			combo_category_item_label_fontStyle.setEnabled(b);
			combo_category_item_label_fontSize.setEnabled(b);
			combo_category_item_label_fontName.setEnabled(b);
		}else{
			button_category_item_label_visible.setSelection(false);
			text_category_item_label_number_format.setEnabled(false);
			text_category_item_label_corlor.setEnabled(false);
			combo_category_item_label_fontStyle.setEnabled(false);
			combo_category_item_label_fontSize.setEnabled(false);
			combo_category_item_label_fontName.setEnabled(false);	
		}
		
		XuiElement categoryItemLabelFontE = configElement.getChildByTagName("category-item-label-font");
		if(categoryItemLabelFontE!=null){
			setDefaultComboValue(combo_category_item_label_fontName,categoryItemLabelFontE.getProperyValue("name"));
			combo_category_item_label_fontStyle.select(Integer.parseInt(categoryItemLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_category_item_label_fontSize,categoryItemLabelFontE.getProperyValue("size"));
		}
		XuiElement categoryItemLabelColorE = configElement.getChildByTagName("category-item-label-color");
		if(categoryItemLabelColorE!=null){
			text_category_item_label_corlor.setText(W3cDocumentHelper.getText(categoryItemLabelColorE.getOriginElement()));
			text_category_item_label_corlor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryItemLabelColorE.getOriginElement()),this.getDisplay()));
			text_category_item_label_corlor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryItemLabelColorE.getOriginElement()),this.getDisplay()));
		}else{
			text_category_item_label_corlor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
			text_category_item_label_corlor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		}
		
		XuiElement categoryItemNumberFormatE = configElement.getChildByTagName("category-item-label-number-format");
		if(categoryItemNumberFormatE!=null){
			text_category_item_label_number_format.setText(W3cDocumentHelper.getText(categoryItemNumberFormatE.getOriginElement()));
		}
		
		XuiElement categoryTickLabelFontE = configElement.getChildByTagName("category-tick-label-font");
		if(categoryTickLabelFontE!=null){
			setDefaultComboValue(combo_tick_label_fontName,categoryTickLabelFontE.getProperyValue("name"));
			combo_tick_label_fontStyle.select(Integer.parseInt(categoryTickLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_tick_label_fontSize,categoryTickLabelFontE.getProperyValue("size"));
		}
		XuiElement categoryTickLabelColorE = configElement.getChildByTagName("category-tick-label-color");
		if(categoryTickLabelColorE!=null){
			combo_tick_label_fontColor.setText(W3cDocumentHelper.getText(categoryTickLabelColorE.getOriginElement()));
			combo_tick_label_fontColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryTickLabelColorE.getOriginElement()),this.getDisplay()));
			combo_tick_label_fontColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryTickLabelColorE.getOriginElement()),this.getDisplay()));
		}else{
			combo_tick_label_fontColor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
			combo_tick_label_fontColor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		}
		
		
		XuiElement dateFormatE = configElement.getChildByTagName("date-format");
		if(dateFormatE!=null){
			text_date_format.setText(W3cDocumentHelper.getText(dateFormatE.getOriginElement()));
			setDefaultComboValue(combo_time_period,dateFormatE.getProperyValue("time-period"));
		}
		
		
	}
	
	public void initLayout() {
		
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(521, 24));
		label.setText("分类轴");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));

		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("分类轴描述信息");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 56;
		gd_group_1.widthHint = 510;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 9;
		group_1.setLayout(gridLayout_1);

		final Label label_6 = new Label(group_1, SWT.NONE);
		label_6.setText("描述信息：");

		text_category_title = new Text(group_1, SWT.BORDER);
		text_category_title.setText("分类");
		text_category_title.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 8, 1));

		final Label label_7 = new Label(group_1, SWT.NONE);
		label_7.setText("字体名称：");

		combo_category_title_fontName = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_category_title_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_category_title_fontName.widthHint = 47;
		combo_category_title_fontName.setLayoutData(gd_combo_category_title_fontName);
		combo_category_title_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_8 = new Label(group_1, SWT.NONE);
		label_8.setText("字体样式：");

		combo_category_title_fontStyle = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_category_title_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_category_title_fontStyle.widthHint = 30;
		combo_category_title_fontStyle.setLayoutData(gd_combo_category_title_fontStyle);
		combo_category_title_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});

		final Label label_9 = new Label(group_1, SWT.NONE);
		label_9.setText("字体大小：");

		combo_category_title_fontSize = new Combo(group_1, SWT.NONE);
		combo_category_title_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		final GridData gd_combo_category_title_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_title_fontSize.setLayoutData(gd_combo_category_title_fontSize);
		
		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setLayoutData(new GridData());
		label_5.setText("字体颜色：");

		text_category_title_color = new Text(group_1, SWT.BORDER);
		text_category_title_color.setText("#000000");
		final GridData gd_text_category_title_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_category_title_color.widthHint = 25;
		text_category_title_color.setLayoutData(gd_text_category_title_color);
		text_category_title_color.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_category_title_color.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_category_title_color = new Button(group_1, SWT.NONE);
		button_text_category_title_color.setText("..");
		
		final GridData gd_text_2 = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_2.widthHint = 142;

		final Group group_4 = new Group(this, SWT.NONE);
		group_4.setText("分类轴各组信息");
		final GridData gd_group_4 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_4.heightHint = 58;
		gd_group_4.widthHint = 510;
		group_4.setLayoutData(gd_group_4);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.numColumns = 9;
		group_4.setLayout(gridLayout_4);
		
		final Label label_29 = new Label(group_4, SWT.NONE);
		label_29.setText("字体名称：");

		combo_tick_label_fontName = new Combo(group_4, SWT.NONE);
		final GridData gd_combo_tick_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_tick_label_fontName.widthHint = 50;
		combo_tick_label_fontName.setLayoutData(gd_combo_tick_label_fontName);
		combo_tick_label_fontName.setItems(ChartConstant.getSYSFontList());
		
		final Label label_30 = new Label(group_4, SWT.NONE);
		label_30.setText("字体样式：");

		combo_tick_label_fontStyle = new Combo(group_4, SWT.NONE);
		final GridData gd_combo_tick_label_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_tick_label_fontStyle.widthHint = 30;
		combo_tick_label_fontStyle.setLayoutData(gd_combo_tick_label_fontStyle);
		combo_tick_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});
		
		final Label label_31 = new Label(group_4, SWT.NONE);
		label_31.setText("字体大小：");

		combo_tick_label_fontSize = new Combo(group_4, SWT.NONE);
		combo_tick_label_fontSize.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_tick_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_10 = new Label(group_4, SWT.NONE);
		label_10.setLayoutData(new GridData());
		label_10.setText("字体颜色：");

		combo_tick_label_fontColor = new Text(group_4, SWT.BORDER);
		combo_tick_label_fontColor.setText("#000000");
		final GridData gd_combo_tick_label_fontColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_tick_label_fontColor.widthHint = 28;
		combo_tick_label_fontColor.setLayoutData(gd_combo_tick_label_fontColor);
		combo_tick_label_fontColor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		combo_tick_label_fontColor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_combo_tick_label_fontColor = new Button(group_4, SWT.NONE);
		button_combo_tick_label_fontColor.setText("..");

		final Label label_4 = new Label(group_4, SWT.NONE);
		label_4.setText("日期周期：");

		combo_time_period = new Combo(group_4, SWT.NONE);
		combo_time_period.setToolTipText("分类轴组信息所表现的日期周期(年/月/日/小时/分钟/秒/毫秒/时间段)");
		combo_time_period.select(2);
		combo_time_period.setItems(new String[] {"year", "month", "day", "hour", "minute", "second", "millisecond", "fixedmillisecond"});
		final GridData gd_combo_time_period = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_time_period.widthHint = 29;
		combo_time_period.setLayoutData(gd_combo_time_period);

		final Label label_11 = new Label(group_4, SWT.NONE);
		label_11.setText("日期格式：");

		text_date_format = new Text(group_4, SWT.BORDER);
		text_date_format.setToolTipText("分类轴组信息所表现的日期格式");
		text_date_format.setText("yyyy-MM-dd");
		final GridData gd_text_date_format = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_date_format.setLayoutData(gd_text_date_format);
		new Label(group_4, SWT.NONE);
		new Label(group_4, SWT.NONE);
		new Label(group_4, SWT.NONE);
		new Label(group_4, SWT.NONE);
		
		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("分类轴中各组中各项数据信息");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_3.heightHint = 82;
		gd_group_3.widthHint = 510;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.numColumns = 9;
		group_3.setLayout(gridLayout_3);

		button_category_item_label_visible = new Button(group_3, SWT.CHECK);
		button_category_item_label_visible.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 6, 1));
		button_category_item_label_visible.setText("分类轴中各组各数据项上是否显示当前数据值");
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);

		final Label label_26 = new Label(group_3, SWT.NONE);
		label_26.setText("字体名称：");

		combo_category_item_label_fontName = new Combo(group_3, SWT.NONE);
		final GridData gd_combo_category_item_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_category_item_label_fontName.widthHint = 40;
		combo_category_item_label_fontName.setLayoutData(gd_combo_category_item_label_fontName);
		combo_category_item_label_fontName.setItems(ChartConstant.getSYSFontList());
		
		final Label label_27 = new Label(group_3, SWT.NONE);
		label_27.setText("字体样式：");

		combo_category_item_label_fontStyle = new Combo(group_3, SWT.NONE);
		combo_category_item_label_fontStyle.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_category_item_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});
		
		final Label label_28 = new Label(group_3, SWT.NONE);
		label_28.setText("字体大小：");

		combo_category_item_label_fontSize = new Combo(group_3, SWT.NONE);
		combo_category_item_label_fontSize.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_category_item_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
	
		final Label label_2 = new Label(group_3, SWT.NONE);
		label_2.setLayoutData(new GridData());
		label_2.setText("字体颜色：");

		text_category_item_label_corlor = new Text(group_3, SWT.BORDER);
		text_category_item_label_corlor.setText("#000000");
		final GridData gd_text_category_item_label_corlor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_category_item_label_corlor.widthHint = 28;
		text_category_item_label_corlor.setLayoutData(gd_text_category_item_label_corlor);
		text_category_item_label_corlor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_category_item_label_corlor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_category_item_label_corlor = new Button(group_3, SWT.NONE);
		button_text_category_item_label_corlor.setText("..");
		
		final Label label_3 = new Label(group_3, SWT.NONE);
		label_3.setLayoutData(new GridData());
		label_3.setText("数值格式：");

		text_category_item_label_number_format = new Text(group_3, SWT.BORDER);
		text_category_item_label_number_format.setText("######.00");
		text_category_item_label_number_format.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 3, 1));
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		
		
	}

	public void registerEvent() {
		button_category_item_label_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {              	
    			text_category_item_label_number_format.setEnabled(button_category_item_label_visible.getSelection());
    			text_category_item_label_corlor.setEnabled(button_category_item_label_visible.getSelection());
    			combo_category_item_label_fontStyle.setEnabled(button_category_item_label_visible.getSelection());
    			combo_category_item_label_fontSize.setEnabled(button_category_item_label_visible.getSelection());
    			combo_category_item_label_fontName.setEnabled(button_category_item_label_visible.getSelection());
            }    
        });   
		
		button_text_category_title_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_category_title_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_category_title_color.setBackground(color);
					text_category_title_color.setForeground(color);
					text_category_title_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_combo_tick_label_fontColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(combo_tick_label_fontColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					combo_tick_label_fontColor.setBackground(color);
					combo_tick_label_fontColor.setForeground(color);
					combo_tick_label_fontColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_category_item_label_corlor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_category_item_label_corlor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_category_item_label_corlor.setBackground(color);
					text_category_item_label_corlor.setForeground(color);
					text_category_item_label_corlor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
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
