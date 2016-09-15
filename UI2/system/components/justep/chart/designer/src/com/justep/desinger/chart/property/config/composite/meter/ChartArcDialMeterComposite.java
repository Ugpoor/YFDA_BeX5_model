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

public class ChartArcDialMeterComposite extends Composite implements IChartComposite{
	
	private Text text_arcDial_frame_fgColor;
	private Text text_arcDial_scale_mitcolor;
	private Text text_arcDial_scale_matcolor;
	private Combo combo_arcDial_scale_tick_abelOffset;
	private Text text_arcDial_scale_tickRadius;
	private Text text_arcDial_scale_mtc;
	private Text text_arcDial_scale_mti;
	private Text text_arcDial_scale_upperBound;
	private Text text_arcDial_scale_lowerBound;
	private Text text_arcDial_bg_yColor;
	private Text text_arcDial_bg_xColor;
	private Text text_arcDial_frame_stroke;
	private Text text_arcDial_scale_startAngle;
	private Text text_arcDial_rangle_outerRadius;
	private Text text_arcDial_rangle_innerRadius;
	private Text text_arcDial_pointerRadius;
	private Text text_arcDial_scale_extent;
	private Text text_arcDial_frame_outerRadius;
	private Text text_arcDial_frame_innerRadius;
	private Text text_arcDial_frame_extent;
	private Text text_arcDial_frame_startAngle;
	private Text text_arcDial_view_height;
	private Text text_arcDial_view_width;
	private Text text_arcDial_view_y;
	private Text text_arcDial_view_x;
	private Combo combo_arcDial_scale_tick_label_fontName;
	private Combo combo_arcDial_scale_tick_label_fontStyle;
	private Combo combo_arcDial_scale_tick_label_fontSize;
	private Text text_arcDial_pointerColor;
	
	Shell shell;
	private Button button_arcDial_scaleVisible;
	private Button button_text_arcDial_frame_fgColor;
	private Button button_text_arcDial_scale_mitcolor;
	private Button button_text_arcDial_scale_matcolor;
	private Button button_text_arcDial_bg_yColor;
	private Button button_text_arcDial_bg_xColor;
	private Button button_text_arcDial_pointerColor;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartArcDialMeterComposite(Composite parent, int style,XuiElement owerElement  , String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType =currentChartType;
		this.shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}
	
	public void initDefaultValue() {
		
		button_arcDial_scaleVisible.setSelection(true);
		combo_arcDial_scale_tick_abelOffset.select(6);
		
		combo_arcDial_scale_tick_label_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_arcDial_scale_tick_label_fontSize.select(5);
		combo_arcDial_scale_tick_label_fontStyle.select(0);		
		
		text_arcDial_frame_innerRadius.setText("0.60");
		text_arcDial_frame_outerRadius.setText("0.90");
		text_arcDial_frame_fgColor.setText("#FFFFFF");
	}

	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(521, 21));
		label.setText("弧度刻度盘");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
		
		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("弧度刻度盘刻度值信息");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_3.heightHint = 123;
		gd_group_3.widthHint = 506;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.marginWidth = 1;
		gridLayout_3.marginTop = 2;
		gridLayout_3.marginRight = 1;
		gridLayout_3.marginLeft = 1;
		gridLayout_3.marginHeight = 1;
		gridLayout_3.marginBottom = 1;
		gridLayout_3.numColumns = 10;
		group_3.setLayout(gridLayout_3);

		button_arcDial_scaleVisible = new Button(group_3, SWT.CHECK);
		final GridData gd_button_arcDial_scaleVisible = new GridData(SWT.LEFT, SWT.CENTER, false, false, 6, 1);
		button_arcDial_scaleVisible.setLayoutData(gd_button_arcDial_scaleVisible);
		button_arcDial_scaleVisible.setText("刻度盘上是否要显示刻度");
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);

		final Label label_19 = new Label(group_3, SWT.NONE);
		label_19.setLayoutData(new GridData());
		label_19.setText("起始位置：");

		text_arcDial_scale_lowerBound = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_lowerBound.setToolTipText("弧度刻度盘刻度起始数值");
		text_arcDial_scale_lowerBound.setText("0");
		final GridData gd_text_arcDial_scale_lowerBound = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_scale_lowerBound.setLayoutData(gd_text_arcDial_scale_lowerBound);
		
		final Label label_20 = new Label(group_3, SWT.NONE);
		label_20.setLayoutData(new GridData());
		label_20.setText("终止位置：");

		text_arcDial_scale_upperBound = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_upperBound.setToolTipText("弧度刻度盘刻度终止数值");
		text_arcDial_scale_upperBound.setText("100");
		final GridData gd_text_arcDial_scale_upperBound = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_scale_upperBound.setLayoutData(gd_text_arcDial_scale_upperBound);

		final Label label_33 = new Label(group_3, SWT.NONE);
		label_33.setLayoutData(new GridData());
		label_33.setText("主刻增量：");

		text_arcDial_scale_mti = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_mti.setToolTipText("弧度刻度盘主刻度数据增量");
		text_arcDial_scale_mti.setText("10.0");
		final GridData gd_text_arcDial_scale_mti = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_arcDial_scale_mti.setLayoutData(gd_text_arcDial_scale_mti);

		final Label label_34 = new Label(group_3, SWT.NONE);
		label_34.setLayoutData(new GridData());
		label_34.setText("副刻度数：");

		text_arcDial_scale_mtc = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_mtc.setToolTipText("弧度刻度盘主刻度间副刻度个数");
		text_arcDial_scale_mtc.setText("4");
		final GridData gd_text_arcDial_scale_mtc = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_arcDial_scale_mtc.setLayoutData(gd_text_arcDial_scale_mtc);

		final Label label_14 = new Label(group_3, SWT.NONE);
		label_14.setLayoutData(new GridData());
		label_14.setText("起始半径：");

		text_arcDial_scale_startAngle = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_startAngle.setToolTipText("弧度刻度盘水平起始半径(相对于水平轴反方向角度)");
		text_arcDial_scale_startAngle.setText("115.0");
		final GridData gd_text_arcDial_scale_startAngle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_scale_startAngle.setLayoutData(gd_text_arcDial_scale_startAngle);

		final Label label_15 = new Label(group_3, SWT.NONE);
		label_15.setLayoutData(new GridData());
		label_15.setText("扩展范围：");

		text_arcDial_scale_extent = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_extent.setToolTipText("弧度刻度盘水平起始半径扩展范围");
		text_arcDial_scale_extent.setText("-50");
		final GridData gd_text_arcDial_scale_extent = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_scale_extent.setLayoutData(gd_text_arcDial_scale_extent);

		final Label label_37 = new Label(group_3, SWT.NONE);
		label_37.setLayoutData(new GridData());
		label_37.setText("主刻颜色：");

		text_arcDial_scale_matcolor = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_matcolor.setText("#000000");
		final GridData gd_text_arcDial_scale_matcolor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_arcDial_scale_matcolor.widthHint = 27;
		text_arcDial_scale_matcolor.setLayoutData(gd_text_arcDial_scale_matcolor);
		text_arcDial_scale_matcolor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_arcDial_scale_matcolor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_arcDial_scale_matcolor = new Button(group_3, SWT.NONE);
		button_text_arcDial_scale_matcolor.setText("..");

		final Label label_38 = new Label(group_3, SWT.NONE);
		label_38.setLayoutData(new GridData());
		label_38.setText("副刻颜色：");

		text_arcDial_scale_mitcolor = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_mitcolor.setText("#242424");
		final GridData gd_text_arcDial_scale_mitcolor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_arcDial_scale_mitcolor.widthHint = 30;
		text_arcDial_scale_mitcolor.setLayoutData(gd_text_arcDial_scale_mitcolor);
		text_arcDial_scale_mitcolor.setBackground(ColorUtil.hexRGBToSWTColor("#242424",this.getDisplay()));
		text_arcDial_scale_mitcolor.setForeground(ColorUtil.hexRGBToSWTColor("#242424",this.getDisplay()));
		
		button_text_arcDial_scale_mitcolor = new Button(group_3, SWT.NONE);
		button_text_arcDial_scale_mitcolor.setText("..");

		final Label label_39 = new Label(group_3, SWT.NONE);
		label_39.setLayoutData(new GridData());
		label_39.setText("字体名称：");

		combo_arcDial_scale_tick_label_fontName = new Combo(group_3, SWT.NONE);
		combo_arcDial_scale_tick_label_fontName.setToolTipText("刻度盘刻度值字体名称");
		combo_arcDial_scale_tick_label_fontName.select(0);
		final GridData gd_combo_arcDial_scale_tick_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_arcDial_scale_tick_label_fontName.widthHint = 58;
		combo_arcDial_scale_tick_label_fontName.setLayoutData(gd_combo_arcDial_scale_tick_label_fontName);
		combo_arcDial_scale_tick_label_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_24 = new Label(group_3, SWT.NONE);
		label_24.setLayoutData(new GridData());
		label_24.setText("字体样式：");

		combo_arcDial_scale_tick_label_fontStyle = new Combo(group_3, SWT.NONE);
		combo_arcDial_scale_tick_label_fontStyle.setToolTipText("刻度盘刻度值字体样式");
		combo_arcDial_scale_tick_label_fontStyle.select(0);
		final GridData gd_combo_arcDial_scale_tick_label_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_arcDial_scale_tick_label_fontStyle.setLayoutData(gd_combo_arcDial_scale_tick_label_fontStyle);
		combo_arcDial_scale_tick_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});
		
		final Label label_25 = new Label(group_3, SWT.NONE);
		label_25.setLayoutData(new GridData());
		label_25.setText("字体大小：");

		combo_arcDial_scale_tick_label_fontSize = new Combo(group_3, SWT.NONE);
		combo_arcDial_scale_tick_label_fontSize.setToolTipText("刻度盘刻度值字体大小");
		combo_arcDial_scale_tick_label_fontSize.select(5);
		combo_arcDial_scale_tick_label_fontSize.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1));
		combo_arcDial_scale_tick_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);

		final Label label_35 = new Label(group_3, SWT.NONE);
		label_35.setLayoutData(new GridData());
		label_35.setText("半径：");

		text_arcDial_scale_tickRadius = new Text(group_3, SWT.BORDER);
		text_arcDial_scale_tickRadius.setToolTipText("弧度刻度盘刻度半径(相当于圆心位置)");
		text_arcDial_scale_tickRadius.setText("0.88");
		final GridData gd_text_arcDial_scale_tickRadius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_scale_tickRadius.setLayoutData(gd_text_arcDial_scale_tickRadius);

		final Label label_36 = new Label(group_3, SWT.NONE);
		label_36.setLayoutData(new GridData());
		label_36.setText("偏移量：");

		combo_arcDial_scale_tick_abelOffset = new Combo(group_3, SWT.NONE);
		combo_arcDial_scale_tick_abelOffset.setToolTipText("弧度刻度盘刻度值相当于刻度盘的偏移量(刻度盘与刻度值之间的距离)");
		combo_arcDial_scale_tick_abelOffset.select(6);
		final GridData gd_combo_arcDial_scale_tick_abelOffset = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_arcDial_scale_tick_abelOffset.setLayoutData(gd_combo_arcDial_scale_tick_abelOffset);
		combo_arcDial_scale_tick_abelOffset.setItems(new String[]{"0.01","0.02","0.03","0.04","0.05","0.06","0.07","0.08","0.09","0.1"});
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		new Label(group_3, SWT.NONE);
		
		final Group group_4 = new Group(this, SWT.NONE);
		group_4.setText("弧度刻度盘扇区与指针信息");
		final GridData gd_group_4 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_4.heightHint = 30;
		gd_group_4.widthHint = 512;
		group_4.setLayoutData(gd_group_4);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.marginWidth = 1;
		gridLayout_4.marginTop = 2;
		gridLayout_4.marginRight = 1;
		gridLayout_4.marginLeft = 1;
		gridLayout_4.marginHeight = 1;
		gridLayout_4.marginBottom = 1;
		gridLayout_4.numColumns = 9;
		group_4.setLayout(gridLayout_4);

		final Label label_27 = new Label(group_4, SWT.NONE);
		label_27.setLayoutData(new GridData());
		label_27.setText("弧内半径：");

		text_arcDial_rangle_innerRadius = new Text(group_4, SWT.BORDER);
		text_arcDial_rangle_innerRadius.setToolTipText("弧度刻度盘中区分数据阶段性的扇区内半径");
		final GridData gd_text_arcDial_rangle_innerRadius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_arcDial_rangle_innerRadius.widthHint = 62;
		text_arcDial_rangle_innerRadius.setLayoutData(gd_text_arcDial_rangle_innerRadius);
		text_arcDial_rangle_innerRadius.setText("0.85D");

		final Label label_28 = new Label(group_4, SWT.NONE);
		label_28.setLayoutData(new GridData());
		label_28.setText("弧外半径：");

		text_arcDial_rangle_outerRadius = new Text(group_4, SWT.BORDER);
		text_arcDial_rangle_outerRadius.setToolTipText("弧度刻度盘中区分数据阶段性的扇区外半径");
		final GridData gd_text_arcDial_rangle_outerRadius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_arcDial_rangle_outerRadius.widthHint = 53;
		text_arcDial_rangle_outerRadius.setLayoutData(gd_text_arcDial_rangle_outerRadius);
		text_arcDial_rangle_outerRadius.setText("0.86D");

		final Label label_21 = new Label(group_4, SWT.NONE);
		label_21.setText("指针半径：");

		text_arcDial_pointerRadius = new Text(group_4, SWT.BORDER);
		text_arcDial_pointerRadius.setToolTipText("弧度刻度盘指针半径(具体分析值)");
		text_arcDial_pointerRadius.setText("0.82");
		final GridData gd_text_arcDial_pointerRadius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_arcDial_pointerRadius.widthHint = 59;
		text_arcDial_pointerRadius.setLayoutData(gd_text_arcDial_pointerRadius);
		
		final Label label_9 = new Label(group_4, SWT.NONE);
		label_9.setText("指针颜色：");
		
		text_arcDial_pointerColor = new Text(group_4, SWT.BORDER);
		text_arcDial_pointerColor.setToolTipText("弧度刻度盘指针颜色(具体分析值)");
		text_arcDial_pointerColor.setText("#0000FF");
		final GridData gd_text_arcDial_pointerColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_arcDial_pointerColor.widthHint = 23;
		text_arcDial_pointerColor.setLayoutData(gd_text_arcDial_pointerColor);
		text_arcDial_pointerColor.setBackground(ColorUtil.hexRGBToSWTColor("#0000FF",this.getDisplay()));
		text_arcDial_pointerColor.setForeground(ColorUtil.hexRGBToSWTColor("#0000FF",this.getDisplay()));
		
		button_text_arcDial_pointerColor = new Button(group_4, SWT.NONE);
		button_text_arcDial_pointerColor.setText("..");
		
		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setText("弧度刻度盘公共信息");
		final GridData gd_group_2 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_2.heightHint = 100;
		gd_group_2.widthHint = 512;
		group_2.setLayoutData(gd_group_2);
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.marginWidth = 1;
		gridLayout_2.marginTop = 2;
		gridLayout_2.marginRight = 1;
		gridLayout_2.marginLeft = 1;
		gridLayout_2.marginHeight = 1;
		gridLayout_2.marginBottom = 1;
		gridLayout_2.numColumns = 6;
		group_2.setLayout(gridLayout_2);

		final Label label_10 = new Label(group_2, SWT.NONE);
		label_10.setText("弧度起始半径：");

		text_arcDial_frame_startAngle = new Text(group_2, SWT.BORDER);
		text_arcDial_frame_startAngle.setToolTipText("刻度盘弧度起始半径(整体刻度盘)");
		text_arcDial_frame_startAngle.setText("60.0");
		final GridData gd_text_arcDial_frame_startAngle = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_arcDial_frame_startAngle.setLayoutData(gd_text_arcDial_frame_startAngle);

		final Label label_11 = new Label(group_2, SWT.NONE);
		label_11.setText("弧度扩展范围：");

		text_arcDial_frame_extent = new Text(group_2, SWT.BORDER);
		text_arcDial_frame_extent.setToolTipText("刻度盘弧度扩展范围(整体刻度盘)");
		text_arcDial_frame_extent.setText("60.0");
		final GridData gd_text_arcDial_frame_extent = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_arcDial_frame_extent.setLayoutData(gd_text_arcDial_frame_extent);

		final Label label_12 = new Label(group_2, SWT.NONE);
		label_12.setLayoutData(new GridData());
		label_12.setText("内半径：");

		text_arcDial_frame_innerRadius = new Text(group_2, SWT.BORDER);
		text_arcDial_frame_innerRadius.setToolTipText("弧度刻度盘内半径");
		text_arcDial_frame_innerRadius.setText("0.60");
		final GridData gd_text_arcDial_frame_innerRadius = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_arcDial_frame_innerRadius.setLayoutData(gd_text_arcDial_frame_innerRadius);

		final Label label_13 = new Label(group_2, SWT.NONE);
		label_13.setLayoutData(new GridData());
		label_13.setText("外半径：");

		text_arcDial_frame_outerRadius = new Text(group_2, SWT.BORDER);
		text_arcDial_frame_outerRadius.setToolTipText("弧度刻度盘外半径");
		text_arcDial_frame_outerRadius.setText("0.90");
		final GridData gd_text_arcDial_frame_outerRadius = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_arcDial_frame_outerRadius.setLayoutData(gd_text_arcDial_frame_outerRadius);

		final Label label_31 = new Label(group_2, SWT.NONE);
		label_31.setLayoutData(new GridData());
		label_31.setText("背景渐变起始色：");

		text_arcDial_bg_xColor = new Text(group_2, SWT.BORDER);
		text_arcDial_bg_xColor.setText("#FFFFFF");
		final GridData gd_text_arcDial_bg_xColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_bg_xColor.setLayoutData(gd_text_arcDial_bg_xColor);
		text_arcDial_bg_xColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_arcDial_bg_xColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_arcDial_bg_xColor = new Button(group_2, SWT.NONE);
		button_text_arcDial_bg_xColor.setLayoutData(new GridData());
		button_text_arcDial_bg_xColor.setText("..");

		final Label label_32 = new Label(group_2, SWT.NONE);
		label_32.setLayoutData(new GridData());
		label_32.setText("背景渐变终止色：");

		text_arcDial_bg_yColor = new Text(group_2, SWT.BORDER);
		text_arcDial_bg_yColor.setText("#FFFFFF");
		final GridData gd_text_arcDial_bg_yColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_bg_yColor.setLayoutData(gd_text_arcDial_bg_yColor);
		text_arcDial_bg_yColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_arcDial_bg_yColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		
		button_text_arcDial_bg_yColor = new Button(group_2, SWT.NONE);
		button_text_arcDial_bg_yColor.setText("..");

		final Label label_8 = new Label(group_2, SWT.NONE);
		label_8.setLayoutData(new GridData());
		label_8.setText("刻度盘前景色：");

		text_arcDial_frame_fgColor = new Text(group_2, SWT.BORDER);
		text_arcDial_frame_fgColor.setText("#FFFFFF");
		final GridData gd_text_arcDial_frame_fgColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_frame_fgColor.setLayoutData(gd_text_arcDial_frame_fgColor);
		text_arcDial_frame_fgColor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_arcDial_frame_fgColor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		
		button_text_arcDial_frame_fgColor = new Button(group_2, SWT.NONE);
		button_text_arcDial_frame_fgColor.setText("..");

		final Label label_30 = new Label(group_2, SWT.NONE);
		label_30.setLayoutData(new GridData());
		label_30.setText("边框描边特效：");

		text_arcDial_frame_stroke = new Text(group_2, SWT.BORDER);
		text_arcDial_frame_stroke.setText("3.0f");
		final GridData gd_text_arcDial_frame_stroke = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_arcDial_frame_stroke.setLayoutData(gd_text_arcDial_frame_stroke);

		new Label(group_2, SWT.NONE);
		new Label(group_2, SWT.NONE);
		new Label(group_2, SWT.NONE);
		new Label(group_2, SWT.NONE);
		new Label(group_2, SWT.NONE);
		
		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("弧度刻度盘圆心位置信息");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 53;
		gd_group_1.widthHint = 511;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.marginWidth = 1;
		gridLayout_1.marginTop = 2;
		gridLayout_1.marginRight = 1;
		gridLayout_1.marginLeft = 1;
		gridLayout_1.marginHeight = 1;
		gridLayout_1.marginBottom = 1;
		gridLayout_1.numColumns = 4;
		group_1.setLayout(gridLayout_1);

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setText("圆心左右移动：");

		text_arcDial_view_x = new Text(group_1, SWT.BORDER);
		text_arcDial_view_x.setToolTipText("弧度刻度盘圆心左右移动");
		text_arcDial_view_x.setText("0.21");
		final GridData gd_text_arcDial_view_x = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_view_x.setLayoutData(gd_text_arcDial_view_x);

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setText("圆心上下移动：");

		text_arcDial_view_y = new Text(group_1, SWT.BORDER);
		text_arcDial_view_y.setToolTipText("弧度刻度盘圆心上下移动");
		text_arcDial_view_y.setText("0.0");
		final GridData gd_text_arcDial_view_y = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_view_y.setLayoutData(gd_text_arcDial_view_y);

		final Label label_6 = new Label(group_1, SWT.NONE);
		label_6.setText("左右缩放比例：");

		text_arcDial_view_width = new Text(group_1, SWT.BORDER);
		text_arcDial_view_width.setToolTipText("弧度刻度盘圆心左右缩放比例");
		text_arcDial_view_width.setText("0.58");
		final GridData gd_text_arcDial_view_width = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_view_width.setLayoutData(gd_text_arcDial_view_width);

		final Label label_7 = new Label(group_1, SWT.NONE);
		label_7.setText("上下缩放比例：");

		text_arcDial_view_height = new Text(group_1, SWT.BORDER);
		text_arcDial_view_height.setToolTipText("弧度刻度盘圆心上下缩放比例");
		text_arcDial_view_height.setText("0.30");
		final GridData gd_text_arcDial_view_height = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_arcDial_view_height.setLayoutData(gd_text_arcDial_view_height);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");

		this.saveSelf(configElement, "arc-dial-rangle-inner-radius",text_arcDial_rangle_innerRadius.getText());
		this.saveSelf(configElement, "arc-dial-rangle-outer-radius",text_arcDial_rangle_outerRadius.getText());
		
		String x = text_arcDial_view_x.getText();
		String y = text_arcDial_view_y.getText();
		String width =  text_arcDial_view_width.getText();
		String height = text_arcDial_view_height.getText();
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("x", x);
		attrMap.put("y", y);
		attrMap.put("width", width);
		attrMap.put("height", height);
		this.saveSelf(configElement, "arc-dial-view", "", attrMap);
		
		String sa =  text_arcDial_frame_startAngle.getText();
		String e = text_arcDial_frame_extent.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("start-angle", sa);
		attrMap.put("extent", e);
		this.saveSelf(configElement, "arc-dial-frame", "", attrMap);
		
		this.saveSelf(configElement, "arc-dial-frame-inner-radius", text_arcDial_frame_innerRadius.getText());
		this.saveSelf(configElement, "arc-dial-frame-outer-radius", text_arcDial_frame_outerRadius.getText());
		this.saveSelf(configElement, "arc-dial-frame-foreground-color", text_arcDial_frame_fgColor.getText());
		this.saveSelf(configElement, "arc-dial-frame-stroke",  text_arcDial_frame_stroke.getText());
		
		String xc =  text_arcDial_bg_xColor.getText();
		String yc = text_arcDial_bg_yColor.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("x-color", xc);
		attrMap.put("y-color", yc);
		this.saveSelf(configElement, "arc-dial-background", "", attrMap);
		
		
		String v = "" + button_arcDial_scaleVisible.getSelection();
		String l = text_arcDial_scale_lowerBound.getText();
		String u = text_arcDial_scale_upperBound.getText();
		String s = text_arcDial_scale_startAngle.getText();
		String ee = text_arcDial_scale_extent.getText();
		String mti = text_arcDial_scale_mti.getText();
		String mtc = text_arcDial_scale_mtc.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("visible", v);
		attrMap.put("lower-bound", l);
		attrMap.put("upper-bound", u);
		attrMap.put("start-angle", s);
		attrMap.put("extent", ee);
		attrMap.put("major-tick-increment", mti);
		attrMap.put("minor-tick-count", mtc);
		this.saveSelf(configElement, "arc-dial-scale", "", attrMap);
		
		
		this.saveSelf(configElement, "arc-dial-scale-tick-radius", text_arcDial_scale_tickRadius.getText());
		this.saveSelf(configElement, "arc-dial-scale-tick-label-offset", combo_arcDial_scale_tick_abelOffset.getText());
		this.saveSelf(configElement, "arc-dial-scale-major-tick-color", text_arcDial_scale_matcolor.getText());
		this.saveSelf(configElement, "arc-dial-scale-minor-tick-color",text_arcDial_scale_mitcolor.getText());

		String fontName = combo_arcDial_scale_tick_label_fontName.getItem(combo_arcDial_scale_tick_label_fontName.getSelectionIndex());
		String fontStyle = combo_arcDial_scale_tick_label_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_arcDial_scale_tick_label_fontSize.getItem(combo_arcDial_scale_tick_label_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "arc-dial-scale-tick-label-font", "", attrMap);
		
		this.saveSelf(configElement, "arc-dial-pointer-radius", text_arcDial_pointerRadius.getText());
		this.saveSelf(configElement, "arc-dial-pointer-color", text_arcDial_pointerColor.getText());
		
		
		
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
		
		if (this.owerElement == null) return;
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		
		XuiElement arcDialRangeInnerRadiusE = configElement.getChildByTagName("arc-dial-rangle-inner-radius");
		if(arcDialRangeInnerRadiusE!=null){
			text_arcDial_rangle_innerRadius.setText(W3cDocumentHelper.getText(arcDialRangeInnerRadiusE.getOriginElement()));
		}
		XuiElement arcDialRangeOuterRadiusE = configElement.getChildByTagName("arc-dial-rangle-outer-radius");
		if(arcDialRangeOuterRadiusE!=null){
			text_arcDial_rangle_outerRadius.setText(W3cDocumentHelper.getText(arcDialRangeOuterRadiusE.getOriginElement()));
		}
		XuiElement arcDialViewE = configElement.getChildByTagName("arc-dial-view");
		if (arcDialViewE!=null) {
			text_arcDial_view_x.setText(arcDialViewE.getProperyValue("x"));
			text_arcDial_view_y.setText(arcDialViewE.getProperyValue("y"));
			text_arcDial_view_width.setText(arcDialViewE.getProperyValue("width"));
			text_arcDial_view_height.setText(arcDialViewE.getProperyValue("height"));
		}
		XuiElement arcDialFrameE = configElement.getChildByTagName("arc-dial-frame");
		if (arcDialViewE!=null) {
			text_arcDial_frame_startAngle.setText(arcDialFrameE.getProperyValue("start-angle"));
			text_arcDial_frame_extent.setText(arcDialFrameE.getProperyValue("extent"));
		}
		XuiElement arcDialFrameInnerRadiusE = configElement.getChildByTagName("arc-dial-frame-inner-radius");
		if(arcDialFrameInnerRadiusE!=null){
			text_arcDial_frame_innerRadius.setText(W3cDocumentHelper.getText(arcDialFrameInnerRadiusE.getOriginElement()));
		}
		XuiElement arcDialFrameOuterRadiusE = configElement.getChildByTagName("arc-dial-frame-outer-radius");
		if(arcDialFrameOuterRadiusE!=null){
			text_arcDial_frame_outerRadius.setText(W3cDocumentHelper.getText(arcDialFrameOuterRadiusE.getOriginElement()));
		}
		XuiElement arcDialFramefgColorE = configElement.getChildByTagName("arc-dial-frame-foreground-color");
		if(arcDialFramefgColorE!=null){
			text_arcDial_frame_fgColor.setText(W3cDocumentHelper.getText(arcDialFramefgColorE.getOriginElement()));
			text_arcDial_frame_fgColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(arcDialFramefgColorE.getOriginElement()),this.getDisplay()));
			text_arcDial_frame_fgColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(arcDialFramefgColorE.getOriginElement()),this.getDisplay()));
		}
		XuiElement arcDialFrameStrokeE = configElement.getChildByTagName("arc-dial-frame-stroke");
		if(arcDialFrameStrokeE!=null){
			text_arcDial_frame_stroke.setText(W3cDocumentHelper.getText(arcDialFrameStrokeE.getOriginElement()));
		}
		XuiElement arcDialBgE = configElement.getChildByTagName("arc-dial-background");
		if(arcDialBgE!=null){
			text_arcDial_bg_xColor.setText(arcDialBgE.getProperyValue("x-color"));
			text_arcDial_bg_yColor.setText(arcDialBgE.getProperyValue("y-color"));
			
			text_arcDial_bg_xColor.setBackground(ColorUtil.hexRGBToSWTColor(arcDialBgE.getProperyValue("x-color"),this.getDisplay()));
			text_arcDial_bg_xColor.setForeground(ColorUtil.hexRGBToSWTColor(arcDialBgE.getProperyValue("x-color"),this.getDisplay()));
			
			text_arcDial_bg_yColor.setBackground(ColorUtil.hexRGBToSWTColor(arcDialBgE.getProperyValue("y-color"),this.getDisplay()));
			text_arcDial_bg_yColor.setForeground(ColorUtil.hexRGBToSWTColor(arcDialBgE.getProperyValue("y-color"),this.getDisplay()));
		}

		XuiElement arcDialScaleE = configElement.getChildByTagName("arc-dial-scale");
		if(arcDialScaleE!=null){
			boolean b = Boolean.parseBoolean(arcDialScaleE.getProperyValue("visible"));
			button_arcDial_scaleVisible.setSelection(b);
			
			text_arcDial_scale_lowerBound.setText(arcDialScaleE.getProperyValue("lower-bound"));
			text_arcDial_scale_upperBound.setText(arcDialScaleE.getProperyValue("upper-bound"));
			text_arcDial_scale_startAngle.setText(arcDialScaleE.getProperyValue("start-angle"));
			text_arcDial_scale_extent.setText(arcDialScaleE.getProperyValue("extent"));
			text_arcDial_scale_mti.setText(arcDialScaleE.getProperyValue("major-tick-increment"));
			text_arcDial_scale_mtc.setText(arcDialScaleE.getProperyValue("minor-tick-count"));
		
			
			text_arcDial_scale_lowerBound.setEnabled(b);
			text_arcDial_scale_upperBound.setEnabled(b);
			text_arcDial_scale_startAngle.setEnabled(b);
			text_arcDial_scale_extent.setEnabled(b);
			text_arcDial_scale_mti.setEnabled(b);
			text_arcDial_scale_mtc.setEnabled(b);
			
			combo_arcDial_scale_tick_label_fontName.setEnabled(b);
			combo_arcDial_scale_tick_label_fontStyle.setEnabled(b);
			combo_arcDial_scale_tick_label_fontSize.setEnabled(b);
			
			text_arcDial_scale_mitcolor.setEnabled(b);
			text_arcDial_scale_matcolor.setEnabled(b);
			
			combo_arcDial_scale_tick_abelOffset.setEnabled(b);
			text_arcDial_scale_tickRadius.setEnabled(b);
			
		}
		
		
		
		XuiElement arcDialScaleTickRadiusE = configElement.getChildByTagName("arc-dial-scale-tick-radius");
		if(arcDialScaleTickRadiusE!=null){
			text_arcDial_scale_tickRadius.setText(W3cDocumentHelper.getText(arcDialScaleTickRadiusE.getOriginElement()));
		}
		XuiElement arcDialScaleTickLabelOffsetE = configElement.getChildByTagName("arc-dial-scale-tick-label-offset");
		if(arcDialScaleTickLabelOffsetE!=null){
			setDefaultComboValue(combo_arcDial_scale_tick_abelOffset, W3cDocumentHelper.getText(arcDialScaleTickLabelOffsetE.getOriginElement()));
		}
		XuiElement arcDialScaleMatColorE = configElement.getChildByTagName("arc-dial-scale-major-tick-color");
		if(arcDialScaleMatColorE!=null){
			text_arcDial_scale_matcolor.setText(W3cDocumentHelper.getText(arcDialScaleMatColorE.getOriginElement()));
			
			text_arcDial_scale_matcolor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(arcDialScaleMatColorE.getOriginElement()),this.getDisplay()));
			text_arcDial_scale_matcolor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(arcDialScaleMatColorE.getOriginElement()),this.getDisplay()));
		
		}
		XuiElement arcDialScaleMitColorE = configElement.getChildByTagName("arc-dial-scale-minor-tick-color");
		if(arcDialScaleMitColorE!=null){
			text_arcDial_scale_mitcolor.setText(W3cDocumentHelper.getText(arcDialScaleMitColorE.getOriginElement()));
			text_arcDial_scale_mitcolor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(arcDialScaleMitColorE.getOriginElement()),this.getDisplay()));
			text_arcDial_scale_mitcolor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(arcDialScaleMitColorE.getOriginElement()),this.getDisplay()));
		}
		
		XuiElement arcDialScalTickLabelFontE = configElement.getChildByTagName("arc-dial-scale-tick-label-font");
		if(arcDialScalTickLabelFontE!=null){
			setDefaultComboValue(combo_arcDial_scale_tick_label_fontName,arcDialScalTickLabelFontE.getProperyValue("name"));
			combo_arcDial_scale_tick_label_fontStyle.select(Integer.parseInt(arcDialScalTickLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_arcDial_scale_tick_label_fontSize,arcDialScalTickLabelFontE.getProperyValue("size"));
		}
		XuiElement arcDialPointerRadiusE = configElement.getChildByTagName("arc-dial-pointer-radius");
		if(arcDialPointerRadiusE!=null){
			text_arcDial_pointerRadius.setText(W3cDocumentHelper.getText(arcDialPointerRadiusE.getOriginElement()));
		}
		
		XuiElement arcDialPointerColorE = configElement.getChildByTagName("arc-dial-pointer-color");
		if(arcDialPointerColorE!=null){
			text_arcDial_pointerColor.setText(W3cDocumentHelper.getText(arcDialPointerColorE.getOriginElement()));
			text_arcDial_pointerColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(arcDialPointerColorE.getOriginElement()),this.getDisplay()));
			text_arcDial_pointerColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(arcDialPointerColorE.getOriginElement()),this.getDisplay()));
		}
	}

	public void registerEvent() {
		button_arcDial_scaleVisible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {   
            	boolean b = button_arcDial_scaleVisible.getSelection();
            	text_arcDial_scale_lowerBound.setEnabled(b);
            	text_arcDial_scale_upperBound.setEnabled(b);
            	text_arcDial_scale_startAngle.setEnabled(b);
            	text_arcDial_scale_extent.setEnabled(b);
            	text_arcDial_scale_mti.setEnabled(b);
            	text_arcDial_scale_mtc.setEnabled(b);
            	
            	combo_arcDial_scale_tick_label_fontName.setEnabled(b);
            	combo_arcDial_scale_tick_label_fontStyle.setEnabled(b);
            	combo_arcDial_scale_tick_label_fontSize.setEnabled(b);
            	
            	text_arcDial_scale_mitcolor.setEnabled(b);
            	text_arcDial_scale_matcolor.setEnabled(b);
            	
            	combo_arcDial_scale_tick_abelOffset.setEnabled(b);
            	text_arcDial_scale_tickRadius.setEnabled(b);
            }
		});
				
		button_text_arcDial_frame_fgColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_arcDial_frame_fgColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_arcDial_frame_fgColor.setBackground(color);
					text_arcDial_frame_fgColor.setForeground(color);
					text_arcDial_frame_fgColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_arcDial_scale_mitcolor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_arcDial_scale_mitcolor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_arcDial_scale_mitcolor.setBackground(color);
					text_arcDial_scale_mitcolor.setForeground(color);
					text_arcDial_scale_mitcolor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_arcDial_scale_matcolor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_arcDial_scale_matcolor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_arcDial_scale_matcolor.setBackground(color);
					text_arcDial_scale_matcolor.setForeground(color);
					text_arcDial_scale_matcolor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_arcDial_bg_yColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_arcDial_bg_yColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_arcDial_bg_yColor.setBackground(color);
					text_arcDial_bg_yColor.setForeground(color);
					text_arcDial_bg_yColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_arcDial_bg_xColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_arcDial_bg_xColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_arcDial_bg_xColor.setBackground(color);
					text_arcDial_bg_xColor.setForeground(color);
					text_arcDial_bg_xColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_arcDial_pointerColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_arcDial_pointerColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_arcDial_pointerColor.setBackground(color);
					text_arcDial_pointerColor.setForeground(color);
					text_arcDial_pointerColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
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
