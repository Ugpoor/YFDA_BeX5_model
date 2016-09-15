package com.justep.desinger.chart.property.config.composite.gantt;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.CLabel;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartGanttComposite extends Composite implements IChartComposite{

	private Combo combo_href_model;
	private Text text_href_title;
	private Text text_map_tool_tip_dateFormat;
	private Text text_map_tool_tip_labelFormat;
	private Combo combo_serie_tickLabel_fontSize;
	private Combo combo_serie_tickLabel_fontStyle;
	private Combo combo_serie_tickLabel_fontName;
	private Text text_serie_tick_labelColor;
	private Combo combo_serie_twoAxis_location;
	private Combo combo_serie_oneAxis_location;
	private Combo combo_serie_double_axis;
	private Combo combo_serie_title_fontSize;
	private Combo combo_serie_title_fontStyle;
	private Combo combo_serie_title_fontName;
	private Text text_serie_title_color;
	private Text text_serie_title;
	private Combo combo_category_tick_label_fontSize;
	private Combo combo_category_tick_label_fontStyle;
	private Combo combo_category_tick_label_fontName;
	private Text text_category_tick_labelColor;
	private Text text_category_item_labelAngle;
	private Combo combo_category_title_fontSize;
	private Combo combo_category_title_fontStyle;
	private Combo combo_category_title_fontName;
	private Text text_category_titleColor;
	private Text text_category_title;
	private Text text_date_format;
	private Combo combo_background_alpha;
	private Combo combo_foreground_alpha;
	private Text text_background_color;
	private XuiElement owerElement;
	
	public ChartGanttComposite(Composite parent, int style,XuiElement owerElement) {
		super(parent, style);
		this.owerElement = owerElement;
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}
	
	public void initDefaultValue() {
		combo_background_alpha.select(5);
		combo_foreground_alpha.select(8);
		
		combo_category_title_fontName.select(0);
		combo_category_title_fontStyle.select(0);
		combo_category_title_fontSize.select(0);
		combo_category_tick_label_fontName.select(0);
		combo_category_tick_label_fontStyle.select(0);
		combo_category_tick_label_fontSize.select(0);
		
		combo_serie_title_fontStyle.select(0);
		combo_serie_title_fontSize.select(0);
		combo_serie_title_fontName.select(0);
		
		combo_serie_double_axis.select(1);
		combo_serie_oneAxis_location.select(0);
		combo_serie_twoAxis_location.select(3);
		
		combo_serie_tickLabel_fontName.select(0);
		combo_serie_tickLabel_fontSize.select(0);
		combo_serie_tickLabel_fontStyle.select(0);
	}

	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setLayoutData(new GridData(521, 15));
		label.setText("甘特图");
		
		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
		
		final Group group = new Group(this, SWT.NONE);
		group.setText("公共参数");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group.heightHint = 58;
		gd_group.widthHint = 510;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 4;
		group.setLayout(gridLayout);

		final Label label_2 = new Label(group, SWT.NONE);
		label_2.setText("背景色：");

		text_background_color = new Text(group, SWT.BORDER);
		text_background_color.setText("#FFFFFF");
		final GridData gd_text_background_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_background_color.setLayoutData(gd_text_background_color);

		final Label label_4 = new Label(group, SWT.NONE);
		label_4.setText("背景透明度：");

		combo_background_alpha = new Combo(group, SWT.NONE);
		final GridData gd_combo_background_alpha = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_background_alpha.setLayoutData(gd_combo_background_alpha);
		combo_background_alpha.setItems(new String[]{"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f","1.0f"});
		
		final Label label_3 = new Label(group, SWT.NONE);
		label_3.setText("前景透明度：");

		combo_foreground_alpha = new Combo(group, SWT.NONE);
		final GridData gd_combo_foreground_alpha = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_foreground_alpha.setLayoutData(gd_combo_foreground_alpha);
		combo_foreground_alpha.setItems(new String[]{"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f","1.0f"});

		final Label label_5 = new Label(group, SWT.NONE);
		label_5.setText("日期格式：");

		text_date_format = new Text(group, SWT.BORDER);
		text_date_format.setText("yyyy-MM-dd ");
		final GridData gd_text_date_format = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_date_format.setLayoutData(gd_text_date_format);
		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setText("分类轴相关参数");
		final GridData gd_group_2 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_2.heightHint = 106;
		gd_group_2.widthHint = 510;
		group_2.setLayoutData(gd_group_2);
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.numColumns = 6;
		group_2.setLayout(gridLayout_2);

		final Label label_6 = new Label(group_2, SWT.NONE);
		label_6.setText("标题：");

		text_category_title = new Text(group_2, SWT.BORDER);
		text_category_title.setText("类别");
		final GridData gd_text_category_title = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_category_title.setLayoutData(gd_text_category_title);

		final Label label_7 = new Label(group_2, SWT.NONE);
		label_7.setText("标题字体颜色：");

		text_category_titleColor = new Text(group_2, SWT.BORDER);
		text_category_titleColor.setText("#000000");
		final GridData gd_text_category_titleColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_category_titleColor.setLayoutData(gd_text_category_titleColor);

		final Label label_8 = new Label(group_2, SWT.NONE);
		label_8.setText("字体名称：");

		combo_category_title_fontName = new Combo(group_2, SWT.NONE);
		final GridData gd_combo_category_title_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_title_fontName.setLayoutData(gd_combo_category_title_fontName);
		combo_category_title_fontName.setItems(new String[]{"黑体"});

		final Label label_9 = new Label(group_2, SWT.NONE);
		label_9.setText("字体样式：");

		combo_category_title_fontStyle = new Combo(group_2, SWT.NONE);
		final GridData gd_combo_category_title_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_title_fontStyle.setLayoutData(gd_combo_category_title_fontStyle);
		combo_category_title_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});

		final Label label_10 = new Label(group_2, SWT.NONE);
		label_10.setText("字体大小：");

		combo_category_title_fontSize = new Combo(group_2, SWT.NONE);
		final GridData gd_combo_category_title_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_title_fontSize.setLayoutData(gd_combo_category_title_fontSize);
		combo_category_title_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_11 = new Label(group_2, SWT.NONE);
		label_11.setText("信息偏移度：");

		text_category_item_labelAngle = new Text(group_2, SWT.BORDER);
		text_category_item_labelAngle.setText("0");
		final GridData gd_text_category_item_labelAngle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_category_item_labelAngle.setLayoutData(gd_text_category_item_labelAngle);

		final Label label_12 = new Label(group_2, SWT.NONE);
		label_12.setText("描述字体颜色：");

		text_category_tick_labelColor = new Text(group_2, SWT.BORDER);
		text_category_tick_labelColor.setText("#000000");
		final GridData gd_text_category_tick_labelColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_category_tick_labelColor.setLayoutData(gd_text_category_tick_labelColor);

		final Label label_13 = new Label(group_2, SWT.NONE);
		label_13.setText("字体名称：");

		combo_category_tick_label_fontName = new Combo(group_2, SWT.NONE);
		final GridData gd_combo_category_tick_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_tick_label_fontName.setLayoutData(gd_combo_category_tick_label_fontName);
		combo_category_tick_label_fontName.setItems(new String[]{"黑体"});

		final Label label_14 = new Label(group_2, SWT.NONE);
		label_14.setText("字体样式：");

		combo_category_tick_label_fontStyle = new Combo(group_2, SWT.NONE);
		final GridData gd_combo_category_tick_label_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_tick_label_fontStyle.setLayoutData(gd_combo_category_tick_label_fontStyle);
		combo_category_tick_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});

		final Label label_15 = new Label(group_2, SWT.NONE);
		label_15.setText("字体大小：");

		combo_category_tick_label_fontSize = new Combo(group_2, SWT.NONE);
		final GridData gd_combo_category_tick_label_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_tick_label_fontSize.setLayoutData(gd_combo_category_tick_label_fontSize);
		combo_category_tick_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		new Label(group_2, SWT.NONE);
		new Label(group_2, SWT.NONE);
		new Label(group_2, SWT.NONE);
		new Label(group_2, SWT.NONE);
		
		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("数据轴相关参数");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_group_3.heightHint = 106;
		gd_group_3.widthHint = 510;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.numColumns = 6;
		group_3.setLayout(gridLayout_3);

		final Label label_16 = new Label(group_3, SWT.NONE);
		label_16.setText("描述信息：");

		text_serie_title = new Text(group_3, SWT.BORDER);
		text_serie_title.setText("任务");
		final GridData gd_text_serie_title = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_serie_title.setLayoutData(gd_text_serie_title);

		final Label label_17 = new Label(group_3, SWT.NONE);
		label_17.setText("描述字体颜色：");

		text_serie_title_color = new Text(group_3, SWT.BORDER);
		text_serie_title_color.setText("#000000");
		final GridData gd_text_serie_title_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_serie_title_color.setLayoutData(gd_text_serie_title_color);

		final Label label_18 = new Label(group_3, SWT.NONE);
		label_18.setText("字体名称：");

		combo_serie_title_fontName = new Combo(group_3, SWT.NONE);
		combo_serie_title_fontName.setLayoutData( new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_serie_title_fontName.setItems(new String[]{"黑体"});

		final Label label_19 = new Label(group_3, SWT.NONE);
		label_19.setText("字体样式：");

		combo_serie_title_fontStyle = new Combo(group_3, SWT.NONE);
		combo_serie_title_fontStyle.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_serie_title_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});

		final Label label_20 = new Label(group_3, SWT.NONE);
		label_20.setText("字体大小：");

		combo_serie_title_fontSize = new Combo(group_3, SWT.NONE);
		combo_serie_title_fontSize.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_serie_title_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_21 = new Label(group_3, SWT.NONE);
		label_21.setText("显示双轴：");

		combo_serie_double_axis = new Combo(group_3, SWT.NONE);
		combo_serie_double_axis.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_serie_double_axis.setItems(new String[]{"true","false"});

		final Label label_22 = new Label(group_3, SWT.NONE);
		label_22.setText("主轴位置：");

		combo_serie_oneAxis_location = new Combo(group_3, SWT.NONE);
		final GridData gd_combo_serie_oneAxis_location = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_serie_oneAxis_location.setLayoutData(gd_combo_serie_oneAxis_location);
		combo_serie_oneAxis_location.setItems(new String[]{"TOP_OR_LEFT","TOP_OR_RIGHT","BOTTOM_OR_LEFT","BOTTOM_OR_RIGHT "});

		final Label label_23 = new Label(group_3, SWT.NONE);
		label_23.setText("副轴位置：");

		combo_serie_twoAxis_location = new Combo(group_3, SWT.NONE);
		final GridData gd_combo_serie_twoAxis_location = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_serie_twoAxis_location.setLayoutData(gd_combo_serie_twoAxis_location);
		combo_serie_twoAxis_location.setItems(new String[]{"TOP_OR_LEFT","TOP_OR_RIGHT","BOTTOM_OR_LEFT","BOTTOM_OR_RIGHT "});

		final Label label_24 = new Label(group_3, SWT.NONE);
		label_24.setText("坐标值颜色：");

		text_serie_tick_labelColor = new Text(group_3, SWT.BORDER);
		text_serie_tick_labelColor.setText("#000000");
		text_serie_tick_labelColor.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));

		final Label label_25 = new Label(group_3, SWT.NONE);
		label_25.setText("字体名称：");

		combo_serie_tickLabel_fontName = new Combo(group_3, SWT.NONE);
		final GridData gd_combo_serie_tickLabel_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_serie_tickLabel_fontName.setLayoutData(gd_combo_serie_tickLabel_fontName);
		combo_serie_tickLabel_fontName.setItems(new String[] {"黑体 "});

		final Label label_19_1 = new Label(group_3, SWT.NONE);
		label_19_1.setText("字体样式：");

		combo_serie_tickLabel_fontStyle = new Combo(group_3, SWT.NONE);
		final GridData gd_combo_serie_tickLabel_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_serie_tickLabel_fontStyle.setLayoutData(gd_combo_serie_tickLabel_fontStyle);
		combo_serie_tickLabel_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});

		final Label label_20_1 = new Label(group_3, SWT.NONE);
		label_20_1.setText("字体大小：");

		combo_serie_tickLabel_fontSize = new Combo(group_3, SWT.NONE);
		combo_serie_tickLabel_fontSize.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_serie_tickLabel_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		
		final Group group_4 = new Group(this, SWT.NONE);
		group_4.setText("热点链接与热点提示相关参数");
		final GridData gd_group_4 = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_group_4.heightHint = 54;
		gd_group_4.widthHint = 510;
		group_4.setLayoutData(gd_group_4);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.numColumns = 4;
		group_4.setLayout(gridLayout_4);

		final Label label_26 = new Label(group_4, SWT.NONE);
		label_26.setText("提示信息格式：");

		text_map_tool_tip_labelFormat = new Text(group_4, SWT.BORDER);
		text_map_tool_tip_labelFormat.setText("{0}: ({1}, {2})");
		final GridData gd_text_map_tool_tip_labelFormat = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_map_tool_tip_labelFormat.setLayoutData(gd_text_map_tool_tip_labelFormat);

		final Label label_27 = new Label(group_4, SWT.NONE);
		label_27.setText("日期格式：");

		text_map_tool_tip_dateFormat = new Text(group_4, SWT.BORDER);
		text_map_tool_tip_dateFormat.setText("yyyy-MM-dd");
		final GridData gd_text_map_tool_tip_dateFormat = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_map_tool_tip_dateFormat.setLayoutData(gd_text_map_tool_tip_dateFormat);

		final Label label_28 = new Label(group_4, SWT.NONE);
		label_28.setText("基准链接模式：");

		combo_href_model = new Combo(group_4, SWT.NONE);
		final GridData gd_combo_href_model = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_href_model.setLayoutData(gd_combo_href_model);
		combo_href_model.setItems(new String[]{"window","dialog","replace"});

		final Label label_29 = new Label(group_4, SWT.NONE);
		label_29.setText("基准链接标题：");

		text_href_title = new Text(group_4, SWT.BORDER);
		final GridData gd_text_href_title = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_href_title.setLayoutData(gd_text_href_title);
		
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		XuiElement bgColorE = configElement.getChildByTagName("background-color");
		if(bgColorE!=null){
			text_background_color.setText(W3cDocumentHelper.getText(bgColorE.getOriginElement()));
		}
		XuiElement bgAlphaE = configElement.getChildByTagName("background-alpha");
		if(bgAlphaE!=null){
			setDefaultComboValue(combo_background_alpha,W3cDocumentHelper.getText(bgAlphaE.getOriginElement()));
		}
		XuiElement fgAlphaE = configElement.getChildByTagName("foreground-alpha");
		if(fgAlphaE!=null){
			setDefaultComboValue(combo_foreground_alpha,W3cDocumentHelper.getText(fgAlphaE.getOriginElement()));
		}
		XuiElement dateFormatE = configElement.getChildByTagName("date-format");
		if(dateFormatE!=null){
			text_date_format.setText(W3cDocumentHelper.getText(dateFormatE.getOriginElement()));
		}
		XuiElement categoryTitleE = configElement.getChildByTagName("category-title");
		if(categoryTitleE!=null){
			text_category_title.setText(W3cDocumentHelper.getText(categoryTitleE.getOriginElement()));
		}
		XuiElement categoryTitleColorE = configElement.getChildByTagName("category-title-color");
		if(categoryTitleColorE!=null){
			text_category_titleColor.setText(W3cDocumentHelper.getText(categoryTitleColorE.getOriginElement()));
		}
		XuiElement categoryTitleFontE = configElement.getChildByTagName("category-title-font");
		if(categoryTitleFontE!=null){
			setDefaultComboValue(combo_category_title_fontName,categoryTitleFontE.getProperyValue("name"));
			combo_category_title_fontStyle.select(Integer.parseInt(categoryTitleFontE.getProperyValue("style")));
			setDefaultComboValue(combo_category_title_fontSize,categoryTitleFontE.getProperyValue("size"));
		}
		XuiElement categoryItemlabelAngleE = configElement.getChildByTagName("category-item-label-angle");
		if(categoryItemlabelAngleE!=null){
			text_category_item_labelAngle.setText(W3cDocumentHelper.getText(categoryItemlabelAngleE.getOriginElement()));
		}
		XuiElement categoryTickLabelColorE = configElement.getChildByTagName("category-tick-label-color");
		if(categoryTickLabelColorE!=null){
			text_category_tick_labelColor.setText(W3cDocumentHelper.getText(categoryTickLabelColorE.getOriginElement()));
		}
		XuiElement categoryTickLabelFontE = configElement.getChildByTagName("category-tick-label-font");
		if(categoryTickLabelFontE!=null){
			setDefaultComboValue(combo_category_tick_label_fontName,categoryTickLabelFontE.getProperyValue("name"));
			combo_category_tick_label_fontStyle.select(Integer.parseInt(categoryTickLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_category_tick_label_fontSize,categoryTickLabelFontE.getProperyValue("size"));
		}
		XuiElement serieTitleE = configElement.getChildByTagName("serie-title");
		if(serieTitleE!=null){
			text_serie_title.setText(W3cDocumentHelper.getText(serieTitleE.getOriginElement()));
		}
		XuiElement serieTitleColorE = configElement.getChildByTagName("serie-title-color");
		if(serieTitleColorE!=null){
			text_serie_title_color.setText(W3cDocumentHelper.getText(serieTitleColorE.getOriginElement()));
		}
		XuiElement serieTitleFontE = configElement.getChildByTagName("serie-title-font");
		if(categoryTickLabelFontE!=null){
			setDefaultComboValue(combo_serie_title_fontName,serieTitleFontE.getProperyValue("name"));
			combo_serie_title_fontStyle.select(Integer.parseInt(serieTitleFontE.getProperyValue("style")));
			setDefaultComboValue(combo_serie_title_fontSize,serieTitleFontE.getProperyValue("size"));
		}
		XuiElement serieE = getXuiElement(configElement, "serie");
		if(serieE!=null){
			setDefaultComboValue(combo_serie_double_axis,serieE.getProperyValue("double-axis"));
			setDefaultComboValue(combo_serie_oneAxis_location,serieE.getProperyValue("one-axis-location"));
			setDefaultComboValue(combo_serie_twoAxis_location,serieE.getProperyValue("two-axis-location"));
		}
		XuiElement serieTiockLabelColorE = configElement.getChildByTagName("serie-tick-label-color");
		if(serieTiockLabelColorE!=null){
			text_serie_tick_labelColor.setText(W3cDocumentHelper.getText(serieTiockLabelColorE.getOriginElement()));
		}
		XuiElement serieTiickLabelFontE = configElement.getChildByTagName("serie-tick-label-font");
		if(serieTiickLabelFontE!=null){
			setDefaultComboValue(combo_serie_tickLabel_fontName,serieTiickLabelFontE.getProperyValue("name"));
			combo_serie_tickLabel_fontStyle.select(Integer.parseInt(serieTiickLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_serie_tickLabel_fontSize,serieTiickLabelFontE.getProperyValue("size"));
		}
		XuiElement mapTipLabelFormatE = configElement.getChildByTagName("map-tool-tip-label-format");
		if(mapTipLabelFormatE!=null){
			text_map_tool_tip_labelFormat.setText(W3cDocumentHelper.getText(mapTipLabelFormatE.getOriginElement()));
		}
		XuiElement mapTipDateFormatE = configElement.getChildByTagName("map-tool-tip-date-format");
		if(mapTipDateFormatE!=null){
			text_map_tool_tip_dateFormat.setText(W3cDocumentHelper.getText(mapTipDateFormatE.getOriginElement()));
		}
		XuiElement hrefE = configElement.getChildByTagName("href");
		if(hrefE!=null){
			setDefaultComboValue(combo_href_model,hrefE.getProperyValue("model"));
			text_href_title.setText(hrefE.getProperyValue("title"));
		}
	}

	public void registerEvent() {
		
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		XuiElement bgColorE = getXuiElement(configElement, "background-color");
		W3cDocumentHelper.setElementText(bgColorE.getOriginElement(), text_background_color.getText());
		XuiElement bgAlphaE = getXuiElement(configElement, "background-alpha");
		W3cDocumentHelper.setElementText(bgAlphaE.getOriginElement(), combo_background_alpha.getItem(combo_background_alpha.getSelectionIndex()));
		XuiElement fgAlphaE = getXuiElement(configElement, "foreground-alpha");
		W3cDocumentHelper.setElementText(fgAlphaE.getOriginElement(), combo_foreground_alpha.getItem(combo_foreground_alpha.getSelectionIndex()));
		XuiElement dateFormatE = getXuiElement(configElement, "date-format");
		W3cDocumentHelper.setElementText(dateFormatE.getOriginElement(), text_date_format.getText());
		XuiElement categoryTitleE = getXuiElement(configElement, "category-title");
		W3cDocumentHelper.setElementText(categoryTitleE.getOriginElement(), text_category_title.getText());
		XuiElement categoryTitleColorE = getXuiElement(configElement, "category-title-color");
		W3cDocumentHelper.setElementText(categoryTitleColorE.getOriginElement(), text_category_titleColor.getText());
		XuiElement categoryTitleFontE = getXuiElement(configElement, "category-title-font");
		categoryTitleFontE.getXuiDataModel().setPropertyValue(categoryTitleFontE, "name", combo_category_title_fontName.getItem(combo_category_title_fontName.getSelectionIndex()));
		categoryTitleFontE.getXuiDataModel().setPropertyValue(categoryTitleFontE, "style", combo_category_title_fontStyle.getSelectionIndex()+"");
		categoryTitleFontE.getXuiDataModel().setPropertyValue(categoryTitleFontE, "size", combo_category_title_fontSize.getItem(combo_category_title_fontSize.getSelectionIndex()));
		XuiElement categoryItemlabelAngleE = getXuiElement(configElement, "category-item-label-angle");
		W3cDocumentHelper.setElementText(categoryItemlabelAngleE.getOriginElement(), text_category_item_labelAngle.getText());
		XuiElement categoryTickLabelColorE = getXuiElement(configElement, "category-tick-label-color");
		W3cDocumentHelper.setElementText(categoryTickLabelColorE.getOriginElement(), text_category_tick_labelColor.getText());
		XuiElement categoryTickLabelFontE = getXuiElement(configElement, "category-tick-label-font");
		categoryTickLabelFontE.getXuiDataModel().setPropertyValue(categoryTickLabelFontE, "name", combo_category_tick_label_fontName.getItem(combo_category_tick_label_fontName.getSelectionIndex()));
		categoryTickLabelFontE.getXuiDataModel().setPropertyValue(categoryTickLabelFontE, "style", combo_category_tick_label_fontStyle.getSelectionIndex()+"");
		categoryTickLabelFontE.getXuiDataModel().setPropertyValue(categoryTickLabelFontE, "size", combo_category_tick_label_fontSize.getItem(combo_category_tick_label_fontSize.getSelectionIndex()));
		XuiElement serieTitleE = getXuiElement(configElement, "serie-title");
		W3cDocumentHelper.setElementText(serieTitleE.getOriginElement(), text_serie_title.getText());
		XuiElement serieTitleColorE = getXuiElement(configElement, "serie-title-color");
		W3cDocumentHelper.setElementText(serieTitleColorE.getOriginElement(), text_serie_title_color.getText());
		XuiElement serieTitleFontE = getXuiElement(configElement, "serie-title-font");
		serieTitleFontE.getXuiDataModel().setPropertyValue(serieTitleFontE, "name", combo_serie_title_fontName.getItem(combo_serie_title_fontName.getSelectionIndex()));
		serieTitleFontE.getXuiDataModel().setPropertyValue(serieTitleFontE, "style", combo_serie_title_fontStyle.getSelectionIndex()+"");
		serieTitleFontE.getXuiDataModel().setPropertyValue(serieTitleFontE, "size", combo_serie_title_fontSize.getItem(combo_serie_title_fontSize.getSelectionIndex()));
		XuiElement serieE = getXuiElement(configElement, "serie");
		serieE.getXuiDataModel().setPropertyValue(serieE, "double-axis", combo_serie_double_axis.getItem(combo_serie_double_axis.getSelectionIndex()));
		serieE.getXuiDataModel().setPropertyValue(serieE, "one-axis-location", combo_serie_oneAxis_location.getItem(combo_serie_oneAxis_location.getSelectionIndex()));
		serieE.getXuiDataModel().setPropertyValue(serieE, "two-axis-location", combo_serie_twoAxis_location.getItem(combo_serie_twoAxis_location.getSelectionIndex()));
		XuiElement serieTiockLabelColorE = getXuiElement(configElement, "serie-tick-label-color");
		W3cDocumentHelper.setElementText(serieTiockLabelColorE.getOriginElement(), text_serie_tick_labelColor.getText());
		XuiElement serieTiickLabelFontE = getXuiElement(configElement, "serie-tick-label-font");
		serieTiickLabelFontE.getXuiDataModel().setPropertyValue(serieTiickLabelFontE, "name", combo_serie_tickLabel_fontName.getItem(combo_serie_tickLabel_fontName.getSelectionIndex()));
		serieTiickLabelFontE.getXuiDataModel().setPropertyValue(serieTiickLabelFontE, "style", combo_serie_tickLabel_fontStyle.getSelectionIndex()+"");
		serieTiickLabelFontE.getXuiDataModel().setPropertyValue(serieTiickLabelFontE, "size", combo_serie_tickLabel_fontSize.getItem(combo_serie_tickLabel_fontSize.getSelectionIndex()));
		XuiElement mapTipLabelFormatE = getXuiElement(configElement, "map-tool-tip-label-format");
		W3cDocumentHelper.setElementText(mapTipLabelFormatE.getOriginElement(), text_map_tool_tip_labelFormat.getText());
		XuiElement mapTipDateFormatE = getXuiElement(configElement, "map-tool-tip-date-format");
		W3cDocumentHelper.setElementText(mapTipDateFormatE.getOriginElement(), text_map_tool_tip_dateFormat.getText());
		XuiElement hrefE = getXuiElement(configElement,"href");
		hrefE.getXuiDataModel().setPropertyValue(hrefE, "model", combo_href_model.getItem(combo_href_model.getSelectionIndex()));
		hrefE.getXuiDataModel().setPropertyValue(hrefE, "title", text_href_title.getText());
		
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
