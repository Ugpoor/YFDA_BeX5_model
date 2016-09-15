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

public class ChartDialMeter1Composite extends Composite implements IChartComposite{

	private Text text_dial_value_indicator_color;
	private Text text_dial_annotation_radius;
	//private Text text_dial_dataset_index;
	private Text text_dial_rangle_outerRadius;
	private Text text_dial_rangle_innerRadius;
	private Text text_dial_value_indicatorAngle;
	private Text text_dial_value_indicatorRadius;
	private Combo combo_dial_annotation_fontSize;
	private Combo combo_dial_annotation_fontStyle;
	private Combo combo_dial_annotation_fontName;
	private Text text_dial_annotation;
	private Text text_dial_annotation_angle;
	private Text text_dial_background_yColor;
	private Text text_dial_background_xColor;
	private Text text_dial_frame_fgColor;
	private Text text_dial_frame_bgColor;
	private Text text_dial_view_height;
	private Text text_dial_view_width;
	private Text text_dial_view_y;
	private Text text_dial_view_x;

	private Combo combo_dial_value_indicator_fontName;
	private Combo combo_dial_value_indicator_fontStyle;
	private Combo combo_dial_value_indicator_fontSize;
	private Text text_dial_value_indicator_outlineColor;
	private Text text_dial_value_indicator_bgColor;
	
	Shell shell;
	private Button button_text_dial_value_indicator_color;
	private Button button_text_dial_background_yColor;
	private Button button_text_dial_background_xColor;
	private Button button_text_dial_frame_fgColor;
	private Button button_text_dial_frame_bgColor;
	private Button button_text_dial_value_indicator_outlineColor;
	private Button button_text_dial_value_indicator_bgColor;

	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartDialMeter1Composite(Composite parent, int style,XuiElement configE  , String currentChartType) {
		super(parent, style);
		this.owerElement = configE;
		this.currentChartType =currentChartType;
		this.shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}
	
	public void initDefaultValue() {
		
		combo_dial_annotation_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_dial_annotation_fontStyle.select(0);
		combo_dial_annotation_fontSize.select(5);
		
		combo_dial_value_indicator_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_dial_value_indicator_fontSize.select(5);
		combo_dial_value_indicator_fontStyle.select(0);
		
		text_dial_rangle_innerRadius.setText("0.80D");
		text_dial_rangle_outerRadius.setText("0.82D");
		
		
	}

	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(514, 22));
		label.setText("刻度盘设置");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
		
		
		final Group group_4 = new Group(this, SWT.NONE);
		group_4.setText("刻度盘分析值信息");
		final GridData gd_group_4 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_4.heightHint = 59;
		gd_group_4.widthHint = 510;
		group_4.setLayoutData(gd_group_4);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.marginWidth = 1;
		gridLayout_4.marginTop = 1;
		gridLayout_4.marginRight = 1;
		gridLayout_4.marginLeft = 1;
		gridLayout_4.marginHeight = 1;
		gridLayout_4.marginBottom = 1;
		gridLayout_4.numColumns = 10;
		group_4.setLayout(gridLayout_4);

		final Label label_21 = new Label(group_4, SWT.NONE);
		label_21.setLayoutData(new GridData());
		label_21.setText("圆心距离：");

		text_dial_value_indicatorRadius = new Text(group_4, SWT.BORDER);
		text_dial_value_indicatorRadius.setToolTipText("刻度盘分析值到圆心的距离(半径)");
		text_dial_value_indicatorRadius.setText("0.50");
		final GridData gd_text_dial_value_indicatorRadius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_value_indicatorRadius.setLayoutData(gd_text_dial_value_indicatorRadius);

		final Label label_22 = new Label(group_4, SWT.NONE);
		label_22.setLayoutData(new GridData());
		label_22.setText("交叉弧度：");

		text_dial_value_indicatorAngle = new Text(group_4, SWT.BORDER);
		text_dial_value_indicatorAngle.setToolTipText("刻度盘分析值与圆心水平线连接交叉线形成的弧度");
		text_dial_value_indicatorAngle.setText("-103.0");
		final GridData gd_text_dial_value_indicatorAngle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_value_indicatorAngle.setLayoutData(gd_text_dial_value_indicatorAngle);
		
		final Label label_9 = new Label(group_4, SWT.NONE);
		label_9.setLayoutData(new GridData());
		label_9.setText("轮廓颜色：");
		
		text_dial_value_indicator_outlineColor = new Text(group_4, SWT.BORDER);
		text_dial_value_indicator_outlineColor.setText("#FFFFFF");
		text_dial_value_indicator_outlineColor.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		text_dial_value_indicator_outlineColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_dial_value_indicator_outlineColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_dial_value_indicator_outlineColor = new Button(group_4, SWT.NONE);
		final GridData gd_button_text_dial_value_indicator_outlineColor = new GridData();
		button_text_dial_value_indicator_outlineColor.setLayoutData(gd_button_text_dial_value_indicator_outlineColor);
		button_text_dial_value_indicator_outlineColor.setText("..");
		
		final Label label_16 = new Label(group_4, SWT.NONE);
		label_16.setLayoutData(new GridData());
		label_16.setText("背景色：");
		
		text_dial_value_indicator_bgColor = new Text(group_4, SWT.BORDER);
		text_dial_value_indicator_bgColor.setText("#FFFFFF");
		text_dial_value_indicator_bgColor.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		text_dial_value_indicator_bgColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_dial_value_indicator_bgColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_dial_value_indicator_bgColor = new Button(group_4, SWT.NONE);
		final GridData gd_button_text_dial_value_indicator_bgColor = new GridData();
		button_text_dial_value_indicator_bgColor.setLayoutData(gd_button_text_dial_value_indicator_bgColor);
		button_text_dial_value_indicator_bgColor.setText("..");
		
		final Label label_23 = new Label(group_4, SWT.NONE);
		label_23.setLayoutData(new GridData());
		label_23.setText("字体名称：");

		combo_dial_value_indicator_fontName = new Combo(group_4, SWT.NONE);
		combo_dial_value_indicator_fontName.select(0);
		final GridData gd_combo_dial_value_indicator_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_dial_value_indicator_fontName.widthHint = 51;
		combo_dial_value_indicator_fontName.setLayoutData(gd_combo_dial_value_indicator_fontName);
		combo_dial_value_indicator_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_24 = new Label(group_4, SWT.NONE);
		label_24.setLayoutData(new GridData());
		label_24.setText("字体样式：");

		combo_dial_value_indicator_fontStyle = new Combo(group_4, SWT.NONE);
		combo_dial_value_indicator_fontStyle.select(0);
		final GridData gd_combo_dial_value_indicator_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_dial_value_indicator_fontStyle.setLayoutData(gd_combo_dial_value_indicator_fontStyle);
		combo_dial_value_indicator_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});
		
		final Label label_25 = new Label(group_4, SWT.NONE);
		label_25.setLayoutData(new GridData());
		label_25.setText("字体大小：");

		combo_dial_value_indicator_fontSize = new Combo(group_4, SWT.NONE);
		combo_dial_value_indicator_fontSize.select(5);
		final GridData gd_combo_dial_value_indicator_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		combo_dial_value_indicator_fontSize.setLayoutData(gd_combo_dial_value_indicator_fontSize);
		combo_dial_value_indicator_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_8 = new Label(group_4, SWT.NONE);
		label_8.setLayoutData(new GridData());
		label_8.setText("字体颜色：");

		text_dial_value_indicator_color = new Text(group_4, SWT.BORDER);
		text_dial_value_indicator_color.setText("#FFFFFF");
		final GridData gd_text_dial_value_indicator_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_value_indicator_color.setLayoutData(gd_text_dial_value_indicator_color);
		text_dial_value_indicator_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_dial_value_indicator_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_dial_value_indicator_color = new Button(group_4, SWT.NONE);
		final GridData gd_button_text_dial_value_indicator_color = new GridData();
		button_text_dial_value_indicator_color.setLayoutData(gd_button_text_dial_value_indicator_color);
		button_text_dial_value_indicator_color.setText("..");
		
		
		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("刻度盘分析值描述信息");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_3.heightHint = 76;
		gd_group_3.widthHint = 510;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.marginWidth = 1;
		gridLayout_3.marginTop = 1;
		gridLayout_3.marginRight = 1;
		gridLayout_3.marginLeft = 1;
		gridLayout_3.marginHeight = 1;
		gridLayout_3.marginBottom = 1;
		gridLayout_3.numColumns = 6;
		group_3.setLayout(gridLayout_3);

		final Label label_17 = new Label(group_3, SWT.NONE);
		label_17.setText("描述信息：");

		text_dial_annotation = new Text(group_3, SWT.BORDER);
		text_dial_annotation.setToolTipText("刻度盘分析值(刻度值)描述信息");
		text_dial_annotation.setText("描述");
		final GridData gd_text_dial_annotation = new GridData(SWT.FILL, SWT.CENTER, true, false, 5, 1);
		text_dial_annotation.setLayoutData(gd_text_dial_annotation);

		final Label label_18 = new Label(group_3, SWT.NONE);
		label_18.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		label_18.setText("字体名称：");

		combo_dial_annotation_fontName = new Combo(group_3, SWT.NONE);
		combo_dial_annotation_fontName.select(0);
		final GridData gd_combo_dial_annotation_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_dial_annotation_fontName.widthHint = 28;
		combo_dial_annotation_fontName.setLayoutData(gd_combo_dial_annotation_fontName);
		combo_dial_annotation_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_19 = new Label(group_3, SWT.NONE);
		label_19.setLayoutData(new GridData());
		label_19.setText("字体样式：");

		combo_dial_annotation_fontStyle = new Combo(group_3, SWT.NONE);
		combo_dial_annotation_fontStyle.select(0);
		final GridData gd_combo_dial_annotation_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_dial_annotation_fontStyle.setLayoutData(gd_combo_dial_annotation_fontStyle);
		combo_dial_annotation_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});
		
		final Label label_20 = new Label(group_3, SWT.NONE);
		label_20.setLayoutData(new GridData());
		label_20.setText("字体大小：");

		combo_dial_annotation_fontSize = new Combo(group_3, SWT.NONE);
		combo_dial_annotation_fontSize.select(5);
		final GridData gd_combo_dial_annotation_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_dial_annotation_fontSize.setLayoutData(gd_combo_dial_annotation_fontSize);
		combo_dial_annotation_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_14 = new Label(group_3, SWT.NONE);
		label_14.setLayoutData(new GridData());
		label_14.setText("圆心距离：");

		text_dial_annotation_radius = new Text(group_3, SWT.BORDER);
		text_dial_annotation_radius.setToolTipText("刻度盘分析值描述信息到圆心的距离(半径)");
		text_dial_annotation_radius.setText("0.70");
		final GridData gd_text_dial_annotation_radius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_annotation_radius.setLayoutData(gd_text_dial_annotation_radius);

		final Label label_15 = new Label(group_3, SWT.NONE);
		label_15.setLayoutData(new GridData());
		label_15.setText("交叉弧度：");

		text_dial_annotation_angle = new Text(group_3, SWT.BORDER);
		text_dial_annotation_angle.setToolTipText("刻度盘分析值描述信息与圆心水平线连接交叉线形成的弧度");
		text_dial_annotation_angle.setText("-140");
		final GridData gd_text_dial_annotation_angle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_annotation_angle.setLayoutData(gd_text_dial_annotation_angle);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		
		final Group group = new Group(this, SWT.NONE);
		group.setText("刻度盘刻度值区间扇形双轮廓线信息");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group.heightHint = 28;
		gd_group.widthHint = 510;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 5;
		group.setLayout(gridLayout);

		final Label label_27 = new Label(group, SWT.NONE);
		label_27.setText("内圆心距：");

		text_dial_rangle_innerRadius = new Text(group, SWT.BORDER);
		text_dial_rangle_innerRadius.setToolTipText("刻度盘刻度区间内扇形轮廓线到圆心的距离");
		text_dial_rangle_innerRadius.setText("0.80D");
		final GridData gd_text_dial_rangle_innerRadius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_dial_rangle_innerRadius.widthHint = 78;
		text_dial_rangle_innerRadius.setLayoutData(gd_text_dial_rangle_innerRadius);

		final Label label_28 = new Label(group, SWT.NONE);
		label_28.setText("外圆心距：");

		text_dial_rangle_outerRadius = new Text(group, SWT.BORDER);
		text_dial_rangle_outerRadius.setToolTipText("刻度盘刻度区间外扇形轮廓线到圆心的距离");
		text_dial_rangle_outerRadius.setText("0.82D");
		final GridData gd_text_dial_rangle_outerRadius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_dial_rangle_outerRadius.widthHint = 109;
		text_dial_rangle_outerRadius.setLayoutData(gd_text_dial_rangle_outerRadius);

		final Label label_2 = new Label(group, SWT.NONE);
		final GridData gd_label_2 = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_label_2.widthHint = 139;
		label_2.setLayoutData(gd_label_2);
		label_2.setText("         ");
		/*
		final Label label_29 = new Label(group, SWT.NONE);
		label_29.setText("数据集索引：");

		text_dial_dataset_index = new Text(group, SWT.BORDER);
		text_dial_dataset_index.setText("0");
		final GridData gd_text_dial_dataset_index = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_dataset_index.setLayoutData(gd_text_dial_dataset_index);
		*/
		
		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("刻度盘公共信息");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 107;
		gd_group_1.widthHint = 510;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.marginWidth = 1;
		gridLayout_1.marginTop = 1;
		gridLayout_1.marginRight = 1;
		gridLayout_1.marginLeft = 1;
		gridLayout_1.marginHeight = 1;
		gridLayout_1.marginBottom = 1;
		gridLayout_1.numColumns = 6;
		group_1.setLayout(gridLayout_1);

		final Label label_10 = new Label(group_1, SWT.NONE);
		label_10.setText("轮廓线背景色：");

		text_dial_frame_bgColor = new Text(group_1, SWT.BORDER);
		text_dial_frame_bgColor.setToolTipText("刻度盘整体轮廓线背景色");
		final GridData gd_text_dial_frame_bgColor = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_text_dial_frame_bgColor.widthHint = 114;
		text_dial_frame_bgColor.setLayoutData(gd_text_dial_frame_bgColor);
		text_dial_frame_bgColor.setText("#FFFFFF");
		text_dial_frame_bgColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_dial_frame_bgColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_dial_frame_bgColor = new Button(group_1, SWT.NONE);
		final GridData gd_button_text_dial_frame_bgColor = new GridData();
		button_text_dial_frame_bgColor.setLayoutData(gd_button_text_dial_frame_bgColor);
		button_text_dial_frame_bgColor.setText("..");

		final Label label_11 = new Label(group_1, SWT.NONE);
		label_11.setText("轮廓线前景色：");

		text_dial_frame_fgColor = new Text(group_1, SWT.BORDER);
		text_dial_frame_fgColor.setToolTipText("刻度盘整体轮廓线前景色");
		final GridData gd_text_dial_frame_fgColor = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_text_dial_frame_fgColor.widthHint = 114;
		text_dial_frame_fgColor.setLayoutData(gd_text_dial_frame_fgColor);
		text_dial_frame_fgColor.setText("#FFFFFF");
		text_dial_frame_fgColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_dial_frame_fgColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_dial_frame_fgColor = new Button(group_1, SWT.NONE);
		button_text_dial_frame_fgColor.setLayoutData(new GridData());
		button_text_dial_frame_fgColor.setText("..");

		final Label label_12 = new Label(group_1, SWT.NONE);
		label_12.setText("背景渐变起始色：");

		text_dial_background_xColor = new Text(group_1, SWT.BORDER);
		text_dial_background_xColor.setToolTipText("刻度盘整体渐变色起始色");
		final GridData gd_text_dial_background_xColor = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_text_dial_background_xColor.widthHint = 71;
		text_dial_background_xColor.setLayoutData(gd_text_dial_background_xColor);
		text_dial_background_xColor.setText("#FFFFFF");
		text_dial_background_xColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_dial_background_xColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_dial_background_xColor = new Button(group_1, SWT.NONE);
		final GridData gd_button_text_dial_background_xColor = new GridData();
		button_text_dial_background_xColor.setLayoutData(gd_button_text_dial_background_xColor);
		button_text_dial_background_xColor.setText("..");

		final Label label_13 = new Label(group_1, SWT.NONE);
		label_13.setText("背景渐变终止色：");

		text_dial_background_yColor = new Text(group_1, SWT.BORDER);
		text_dial_background_yColor.setToolTipText("刻度盘整体渐变色终止色");
		text_dial_background_yColor.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		text_dial_background_yColor.setText("#FFFFFF");
		text_dial_background_yColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_dial_background_yColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_dial_background_yColor = new Button(group_1, SWT.NONE);
		button_text_dial_background_yColor.setLayoutData(new GridData());
		button_text_dial_background_yColor.setText("..");

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setText("圆心左右移动：");

		text_dial_view_x = new Text(group_1, SWT.BORDER);
		text_dial_view_x.setToolTipText("刻度盘圆心左右移动位置调整(0为居中<0右移>0左移)");
		text_dial_view_x.setText("0.0");
		final GridData gd_text_dial_view_x = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		gd_text_dial_view_x.widthHint = 13;
		text_dial_view_x.setLayoutData(gd_text_dial_view_x);

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setText("圆心上下移动：");

		text_dial_view_y = new Text(group_1, SWT.BORDER);
		text_dial_view_y.setToolTipText("刻度盘圆心上下移动位置调整(0为居中<0下移>0上移)");
		text_dial_view_y.setText("0.0");
		final GridData gd_text_dial_view_y = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_dial_view_y.setLayoutData(gd_text_dial_view_y);

		final Label label_6 = new Label(group_1, SWT.NONE);
		label_6.setText("左右缩放比例：");

		text_dial_view_width = new Text(group_1, SWT.BORDER);
		text_dial_view_width.setToolTipText("刻度盘左右缩放比例(1为100%>1为缩放<1为放大)");
		text_dial_view_width.setText("1.0");
		final GridData gd_text_dial_view_width = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		gd_text_dial_view_width.widthHint = 103;
		text_dial_view_width.setLayoutData(gd_text_dial_view_width);

		final Label label_7 = new Label(group_1, SWT.NONE);
		label_7.setText("上下缩放比例：");

		text_dial_view_height = new Text(group_1, SWT.BORDER);
		text_dial_view_height.setToolTipText("刻度盘上下缩放比例(1为100%>1为缩放<1为放大)");
		text_dial_view_height.setText("1.0");
		final GridData gd_text_dial_view_height = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_dial_view_height.setLayoutData(gd_text_dial_view_height);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return;
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;

		XuiElement dialRangeInnerRadiusE = configElement.getChildByTagName("dial-rangle-inner-radius");
		if(dialRangeInnerRadiusE!=null){
			text_dial_rangle_innerRadius.setText(W3cDocumentHelper.getText(dialRangeInnerRadiusE.getOriginElement()));
		}
		XuiElement dialRangeOuterRadiusE = configElement.getChildByTagName("dial-rangle-outer-radius");
		if(dialRangeOuterRadiusE!=null){
			text_dial_rangle_outerRadius.setText(W3cDocumentHelper.getText(dialRangeOuterRadiusE.getOriginElement()));
		}
		/*
		XuiElement dialDataSetIndexE = configElement.getChildByTagName("dial-dataset-index");
		if(dialDataSetIndexE!=null){
			text_dial_dataset_index.setText(W3cDocumentHelper.getText(dialDataSetIndexE.getOriginElement()));
		}*/
		
		XuiElement dialViewE = configElement.getChildByTagName("dial-view");
		if (dialViewE!=null) {
			text_dial_view_x.setText(dialViewE.getProperyValue("x"));
			text_dial_view_y.setText(dialViewE.getProperyValue("y"));
			text_dial_view_width.setText(dialViewE.getProperyValue("width"));
			text_dial_view_height.setText(dialViewE.getProperyValue("height"));
		}
		XuiElement dialFrameE = configElement.getChildByTagName("dial-frame");
		if (dialFrameE!=null) {
			text_dial_frame_bgColor.setText(dialFrameE.getProperyValue("background-color"));
			text_dial_frame_fgColor.setText(dialFrameE.getProperyValue("foreground-color"));
			
			text_dial_frame_bgColor.setBackground(ColorUtil.hexRGBToSWTColor(dialFrameE.getProperyValue("background-color"),this.getDisplay()));
			text_dial_frame_bgColor.setForeground(ColorUtil.hexRGBToSWTColor(dialFrameE.getProperyValue("background-color"),this.getDisplay()));

			text_dial_frame_fgColor.setBackground(ColorUtil.hexRGBToSWTColor(dialFrameE.getProperyValue("foreground-color"),this.getDisplay()));
			text_dial_frame_fgColor.setForeground(ColorUtil.hexRGBToSWTColor(dialFrameE.getProperyValue("foreground-color"),this.getDisplay()));

		}
		XuiElement dialBgE = configElement.getChildByTagName("dial-background");
		if (dialBgE!=null) {
			text_dial_background_xColor.setText(dialBgE.getProperyValue("x-color"));
			text_dial_background_yColor.setText(dialBgE.getProperyValue("y-color"));
			
			text_dial_background_xColor.setBackground(ColorUtil.hexRGBToSWTColor(dialBgE.getProperyValue("x-color"),this.getDisplay()));
			text_dial_background_xColor.setForeground(ColorUtil.hexRGBToSWTColor(dialBgE.getProperyValue("x-color"),this.getDisplay()));
			
			text_dial_background_yColor.setBackground(ColorUtil.hexRGBToSWTColor(dialBgE.getProperyValue("y-color"),this.getDisplay()));
			text_dial_background_yColor.setForeground(ColorUtil.hexRGBToSWTColor(dialBgE.getProperyValue("y-color"),this.getDisplay()));

		}
		XuiElement dialAnnotationE = configElement.getChildByTagName("dial-annotation");
		if(dialAnnotationE!=null){
			text_dial_annotation.setText(W3cDocumentHelper.getText(dialAnnotationE.getOriginElement()));
		}
		XuiElement dialAnnotationFontE = configElement.getChildByTagName("dial-annotation-font");
		if(dialAnnotationFontE!=null){
			setDefaultComboValue(combo_dial_annotation_fontName,dialAnnotationFontE.getProperyValue("name"));
			combo_dial_annotation_fontStyle.select(Integer.parseInt(dialAnnotationFontE.getProperyValue("style")));
			setDefaultComboValue(combo_dial_annotation_fontSize,dialAnnotationFontE.getProperyValue("size"));
		}
		XuiElement dialAnnotationRadiusE = configElement.getChildByTagName("dial-annotation-radius");
		if(dialAnnotationRadiusE!=null){
			text_dial_annotation_radius.setText(W3cDocumentHelper.getText(dialAnnotationRadiusE.getOriginElement()));
		}
		XuiElement dialAnnotationAngleE = configElement.getChildByTagName("dial-annotation-angle");
		if(dialAnnotationAngleE!=null){
			text_dial_annotation_angle.setText(W3cDocumentHelper.getText(dialAnnotationAngleE.getOriginElement()));
		}
		XuiElement dialValueIndicatorRadiusE = configElement.getChildByTagName("dial-value-indicator-radius");
		if(dialValueIndicatorRadiusE!=null){
			text_dial_value_indicatorRadius.setText(W3cDocumentHelper.getText(dialValueIndicatorRadiusE.getOriginElement()));
		}
		XuiElement dialValueIndicatorAngleE = configElement.getChildByTagName("dial-value-indicator-angle");
		if(dialValueIndicatorAngleE!=null){
			text_dial_value_indicatorAngle.setText(W3cDocumentHelper.getText(dialValueIndicatorAngleE.getOriginElement()));
		}
		XuiElement dialValueIndicatorFontE = configElement.getChildByTagName("dial-value-indicator-font");
		if(dialValueIndicatorFontE!=null){
			setDefaultComboValue(combo_dial_value_indicator_fontName,dialValueIndicatorFontE.getProperyValue("name"));
			combo_dial_value_indicator_fontStyle.select(Integer.parseInt(dialValueIndicatorFontE.getProperyValue("style")));
			setDefaultComboValue(combo_dial_value_indicator_fontSize,dialValueIndicatorFontE.getProperyValue("size"));
		}
		XuiElement dialValueIndicatorColorE = configElement.getChildByTagName("dial-value-indicator-color");
		if(dialValueIndicatorColorE!=null){
			text_dial_value_indicator_color.setText(W3cDocumentHelper.getText(dialValueIndicatorColorE.getOriginElement()));
			
			text_dial_value_indicator_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(dialValueIndicatorColorE.getOriginElement()),this.getDisplay()));
			text_dial_value_indicator_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(dialValueIndicatorColorE.getOriginElement()),this.getDisplay()));
		}
		XuiElement dialValueIndicatorOutlineColorE = configElement.getChildByTagName("dial-value-indicator-outline-color");
		if(dialValueIndicatorOutlineColorE!=null){
			text_dial_value_indicator_outlineColor.setText(W3cDocumentHelper.getText(dialValueIndicatorOutlineColorE.getOriginElement()));
			
			text_dial_value_indicator_outlineColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(dialValueIndicatorOutlineColorE.getOriginElement()),this.getDisplay()));
			text_dial_value_indicator_outlineColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(dialValueIndicatorOutlineColorE.getOriginElement()),this.getDisplay()));

		}
		XuiElement dialValueIndicatorBgColorE = configElement.getChildByTagName("dial-value-indicator-background-color");
		if(dialValueIndicatorBgColorE!=null){
			text_dial_value_indicator_bgColor.setText(W3cDocumentHelper.getText(dialValueIndicatorBgColorE.getOriginElement()));
			
			text_dial_value_indicator_bgColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(dialValueIndicatorBgColorE.getOriginElement()),this.getDisplay()));
			text_dial_value_indicator_bgColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(dialValueIndicatorBgColorE.getOriginElement()),this.getDisplay()));

			
		}
	}

	public void registerEvent() {
		
		
		button_text_dial_value_indicator_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_value_indicator_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_value_indicator_color.setBackground(color);
					text_dial_value_indicator_color.setForeground(color);
					text_dial_value_indicator_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_dial_background_yColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_background_yColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_background_yColor.setBackground(color);
					text_dial_background_yColor.setForeground(color);
					text_dial_background_yColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_dial_background_xColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_background_xColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_background_xColor.setBackground(color);
					text_dial_background_xColor.setForeground(color);
					text_dial_background_xColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_dial_frame_fgColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_frame_fgColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_frame_fgColor.setBackground(color);
					text_dial_frame_fgColor.setForeground(color);
					text_dial_frame_fgColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});

		button_text_dial_frame_bgColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_frame_bgColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_frame_bgColor.setBackground(color);
					text_dial_frame_bgColor.setForeground(color);
					text_dial_frame_bgColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_dial_value_indicator_outlineColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_value_indicator_outlineColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_value_indicator_outlineColor.setBackground(color);
					text_dial_value_indicator_outlineColor.setForeground(color);
					text_dial_value_indicator_outlineColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_dial_value_indicator_bgColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_value_indicator_bgColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_value_indicator_bgColor.setBackground(color);
					text_dial_value_indicator_bgColor.setForeground(color);
					text_dial_value_indicator_bgColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		this.saveSelf(configElement, "dial-rangle-inner-radius",text_dial_rangle_innerRadius.getText());
		this.saveSelf(configElement, "dial-rangle-outer-radius", text_dial_rangle_outerRadius.getText());
		//this.saveSelf(configElement, "dial-dataset-index", text_dial_dataset_index.getText());
		
		String x = text_dial_view_x.getText();
		String y = text_dial_view_y.getText();
		String width = text_dial_view_width.getText();
		String height = text_dial_view_height.getText();
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("x", x);
		attrMap.put("y", y);
		attrMap.put("width", width);
		attrMap.put("height", height);
		this.saveSelf(configElement, "dial-view", "", attrMap);
		
		String bgc = text_dial_frame_bgColor.getText();
		String fgc = text_dial_frame_fgColor.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("background-color", bgc);
		attrMap.put("foreground-color", fgc);
		this.saveSelf(configElement, "dial-frame", "", attrMap);
		
		String xc = text_dial_background_xColor.getText();
		String yc = text_dial_background_yColor.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("x-color", xc);
		attrMap.put("y-color", yc);
		this.saveSelf(configElement, "dial-background", "", attrMap);
		
		this.saveSelf(configElement, "dial-annotation", text_dial_annotation.getText());
		
		String fontName = combo_dial_annotation_fontName.getItem(combo_dial_annotation_fontName.getSelectionIndex());
		String fontStyle = combo_dial_annotation_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_dial_annotation_fontSize.getItem(combo_dial_annotation_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "dial-annotation-font", "", attrMap);
		
		
		this.saveSelf(configElement, "dial-annotation-radius", text_dial_annotation_radius.getText());
		this.saveSelf(configElement, "dial-annotation-angle", text_dial_annotation_angle.getText());
		this.saveSelf(configElement, "dial-value-indicator-radius", text_dial_value_indicatorRadius.getText());
		this.saveSelf(configElement, "dial-value-indicator-angle", text_dial_value_indicatorAngle.getText());
		
		fontName = combo_dial_value_indicator_fontName.getItem(combo_dial_value_indicator_fontName.getSelectionIndex());
		fontStyle = combo_dial_value_indicator_fontStyle.getSelectionIndex()+"";
		fontSize = combo_dial_value_indicator_fontSize.getItem(combo_dial_value_indicator_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "dial-value-indicator-font", "", attrMap);
		
		this.saveSelf(configElement, "dial-value-indicator-color", text_dial_value_indicator_color.getText());		
		this.saveSelf(configElement, "dial-value-indicator-outline-color", text_dial_value_indicator_outlineColor.getText());
		this.saveSelf(configElement, "dial-value-indicator-background-color",  text_dial_value_indicator_bgColor.getText());
		
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
