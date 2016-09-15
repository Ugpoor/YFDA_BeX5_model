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

public class ChartDialMeter2Composite extends Composite implements IChartComposite{
	
	private Text text_dial_scale_minor_tickColor;
	private Text text_dial_scale_major_tickColor;
	private Text text_dial_scale_tick_labelOffset;
	private Combo combo_dial_scale_tickRadius;
	private Text text_dial_scale_mtc;
	private Text text_dial_scale_mti;
	private Text text_dial_scale_extent;
	private Text text_dial_scale_startAngle;
	private Text text_dial_scale_upperBound;
	private Combo combo_dial_scale_tickLabel_fontSize;
	private Combo combo_dial_scale_tickLabel_fontStyle;
	private Combo combo_dial_scale_tickLabel_fontName;
	private Text text_dial_frame_bgColor;
	private Text text_dial_pointer_fillColor;
	private Text text_dial_pointer_widthRadius;
	private Text text_dial_pointerRadius;
	private Text text_dial_scale_lowerBound;
	private Text text_dial_pointer_outlineColor;
	
	Shell shell;
	private Button button_dial_scale_visible;
	private Button button_text_dial_scale_minor_tickColor;
	private Button button_text_dial_scale_major_tickColor;
	private Button button_text_dial_pointer_outlineColor;
	private Button button_text_dial_pointer_fillColor;	
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartDialMeter2Composite(Composite parent, int style,XuiElement owerElement  , String currentChartType) {
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
			
		combo_dial_scale_tickLabel_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_dial_scale_tickLabel_fontSize.select(5);
		combo_dial_scale_tickLabel_fontStyle.select(0);
				
		button_dial_scale_visible.setSelection(true);
		
		combo_dial_scale_tickRadius.select(8);
	}

	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(521, 22));
		label.setText("刻度区间与指针");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
		
		final Group group = new Group(this, SWT.NONE);
		group.setText("刻度盘刻度值信息");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group.heightHint = 125;
		gd_group.widthHint = 507;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 10;
		group.setLayout(gridLayout);

		button_dial_scale_visible = new Button(group, SWT.CHECK);
		final GridData gd_button_dial_scale_visible = new GridData(SWT.LEFT, SWT.CENTER, false, false, 10, 1);
		button_dial_scale_visible.setLayoutData(gd_button_dial_scale_visible);
		button_dial_scale_visible.setText("刻度盘上是否要显示刻度");

		final Label label_26 = new Label(group, SWT.NONE);
		final GridData gd_label_26 = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_label_26.widthHint = 58;
		label_26.setLayoutData(gd_label_26);
		label_26.setText("起始位置：");

		text_dial_scale_lowerBound = new Text(group, SWT.BORDER);
		text_dial_scale_lowerBound.setText("0");
		final GridData gd_text_dial_scale_lowerBound = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_scale_lowerBound.setLayoutData(gd_text_dial_scale_lowerBound);

		final Label label_3 = new Label(group, SWT.NONE);
		label_3.setLayoutData(new GridData());
		label_3.setText("终止位置：");

		text_dial_scale_upperBound = new Text(group, SWT.BORDER);
		text_dial_scale_upperBound.setText("100");
		final GridData gd_text_dial_scale_upperBound = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_scale_upperBound.setLayoutData(gd_text_dial_scale_upperBound);

		final Label label_30 = new Label(group, SWT.NONE);
		label_30.setLayoutData(new GridData());
		label_30.setText("主刻增量：");

		text_dial_scale_mti = new Text(group, SWT.BORDER);
		text_dial_scale_mti.setText("10");
		final GridData gd_text_dial_scale_mti = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_dial_scale_mti.setLayoutData(gd_text_dial_scale_mti);

		final Label label_31 = new Label(group, SWT.NONE);
		label_31.setLayoutData(new GridData());
		label_31.setText("副刻度数：");

		text_dial_scale_mtc = new Text(group, SWT.BORDER);
		text_dial_scale_mtc.setText("4");
		final GridData gd_text_dial_scale_mtc = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		gd_text_dial_scale_mtc.widthHint = 60;
		text_dial_scale_mtc.setLayoutData(gd_text_dial_scale_mtc);

		final Label label_27 = new Label(group, SWT.NONE);
		label_27.setLayoutData(new GridData());
		label_27.setText("起始半径：");

		text_dial_scale_startAngle = new Text(group, SWT.BORDER);
		text_dial_scale_startAngle.setText("-120");
		final GridData gd_text_dial_scale_startAngle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_scale_startAngle.setLayoutData(gd_text_dial_scale_startAngle);

		final Label label_29 = new Label(group, SWT.NONE);
		label_29.setLayoutData(new GridData());
		label_29.setText("扩展范围：");

		text_dial_scale_extent = new Text(group, SWT.BORDER);
		text_dial_scale_extent.setText("-300");
		final GridData gd_text_dial_scale_extent = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_scale_extent.setLayoutData(gd_text_dial_scale_extent);

		final Label label_34 = new Label(group, SWT.NONE);
		label_34.setLayoutData(new GridData());
		label_34.setText("主刻颜色：");

		text_dial_scale_major_tickColor = new Text(group, SWT.BORDER);
		text_dial_scale_major_tickColor.setText("#000000");
		final GridData gd_text_dial_scale_major_tickColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_dial_scale_major_tickColor.widthHint = 61;
		text_dial_scale_major_tickColor.setLayoutData(gd_text_dial_scale_major_tickColor);
		text_dial_scale_major_tickColor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_dial_scale_major_tickColor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		
		button_text_dial_scale_major_tickColor = new Button(group, SWT.NONE);
		button_text_dial_scale_major_tickColor.setText("..");

		final Label dialscalemajortickcolorLabel = new Label(group, SWT.NONE);
		dialscalemajortickcolorLabel.setLayoutData(new GridData());
		dialscalemajortickcolorLabel.setText("副刻颜色：");

		text_dial_scale_minor_tickColor = new Text(group, SWT.BORDER);
		text_dial_scale_minor_tickColor.setText("#242424");
		final GridData gd_text_dial_scale_minor_tickColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_dial_scale_minor_tickColor.widthHint = 59;
		text_dial_scale_minor_tickColor.setLayoutData(gd_text_dial_scale_minor_tickColor);
		text_dial_scale_minor_tickColor.setBackground(ColorUtil.hexRGBToSWTColor("#242424",this.getDisplay()));
		text_dial_scale_minor_tickColor.setForeground(ColorUtil.hexRGBToSWTColor("#242424",this.getDisplay()));
		
		button_text_dial_scale_minor_tickColor = new Button(group, SWT.NONE);
		button_text_dial_scale_minor_tickColor.setText("..");

		final Label label_35 = new Label(group, SWT.NONE);
		label_35.setLayoutData(new GridData());
		label_35.setText("刻度字体：");

		combo_dial_scale_tickLabel_fontName = new Combo(group, SWT.NONE);
		combo_dial_scale_tickLabel_fontName.select(0);
		combo_dial_scale_tickLabel_fontName.setItems(ChartConstant.getSYSFontList());
		final GridData gd_combo_dial_scale_tickLabel_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_dial_scale_tickLabel_fontName.widthHint = 62;
		combo_dial_scale_tickLabel_fontName.setLayoutData(gd_combo_dial_scale_tickLabel_fontName);

		final Label label_19 = new Label(group, SWT.NONE);
		label_19.setLayoutData(new GridData());
		label_19.setText("字体样式：");

		combo_dial_scale_tickLabel_fontStyle = new Combo(group, SWT.NONE);
		combo_dial_scale_tickLabel_fontStyle.select(0);
		final GridData gd_combo_dial_scale_tickLabel_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_dial_scale_tickLabel_fontStyle.setLayoutData(gd_combo_dial_scale_tickLabel_fontStyle);
		combo_dial_scale_tickLabel_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});
		
		final Label label_20 = new Label(group, SWT.NONE);
		label_20.setLayoutData(new GridData());
		label_20.setText("字体大小：");

		combo_dial_scale_tickLabel_fontSize = new Combo(group, SWT.NONE);
		combo_dial_scale_tickLabel_fontSize.select(5);
		final GridData gd_combo_dial_scale_tickLabel_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		combo_dial_scale_tickLabel_fontSize.setLayoutData(gd_combo_dial_scale_tickLabel_fontSize);
		combo_dial_scale_tickLabel_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);

		final Label label_32 = new Label(group, SWT.NONE);
		label_32.setLayoutData(new GridData());
		label_32.setText("半径：");

		combo_dial_scale_tickRadius = new Combo(group, SWT.NONE);
		combo_dial_scale_tickRadius.select(8);
		final GridData gd_combo_dial_scale_tickRadius = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_dial_scale_tickRadius.widthHint = 51;
		combo_dial_scale_tickRadius.setLayoutData(gd_combo_dial_scale_tickRadius);
		combo_dial_scale_tickRadius.setItems(new String[]{"0.10","0.20","0.30","0.40","0.50","0.60","0.70","0.80","0.90","1.0"});

		final Label label_33 = new Label(group, SWT.NONE);
		label_33.setLayoutData(new GridData());
		label_33.setText("偏移量：");

		text_dial_scale_tick_labelOffset = new Text(group, SWT.BORDER);
		text_dial_scale_tick_labelOffset.setText("0.15");
		final GridData gd_text_dial_scale_tick_labelOffset = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_dial_scale_tick_labelOffset.widthHint = 77;
		text_dial_scale_tick_labelOffset.setLayoutData(gd_text_dial_scale_tick_labelOffset);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		
		
		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("刻度盘指针信息");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 55;
		gd_group_1.widthHint = 509;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 8;
		group_1.setLayout(gridLayout_1);

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setText("指针半径：");

		text_dial_pointerRadius = new Text(group_1, SWT.BORDER);
		text_dial_pointerRadius.setText("0.9");
		final GridData gd_text_dial_pointerRadius = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_dial_pointerRadius.setLayoutData(gd_text_dial_pointerRadius);

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setText("宽度半径：");

		text_dial_pointer_widthRadius = new Text(group_1, SWT.BORDER);
		text_dial_pointer_widthRadius.setText("0.03");
		final GridData gd_text_dial_pointer_widthRadius = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_dial_pointer_widthRadius.setLayoutData(gd_text_dial_pointer_widthRadius);

		final Label label_10 = new Label(group_1, SWT.NONE);
		label_10.setLayoutData(new GridData());
		label_10.setText("圆心半径：");

		text_dial_frame_bgColor = new Text(group_1, SWT.BORDER);
		text_dial_frame_bgColor.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		text_dial_frame_bgColor.setText("0.02");

		final Label label_7 = new Label(group_1, SWT.NONE);
		label_7.setText("轮廓线颜色：");

		text_dial_pointer_outlineColor  = new Text(group_1, SWT.BORDER);
		text_dial_pointer_outlineColor.setText("#0000FF");
		final GridData gd_text_dial_view_height = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_pointer_outlineColor.setLayoutData(gd_text_dial_view_height);
		text_dial_pointer_outlineColor.setBackground(ColorUtil.hexRGBToSWTColor("#0000FF",this.getDisplay()));
		text_dial_pointer_outlineColor.setForeground(ColorUtil.hexRGBToSWTColor("#0000FF",this.getDisplay()));
		
		
		button_text_dial_pointer_outlineColor = new Button(group_1, SWT.NONE);
		button_text_dial_pointer_outlineColor.setText("..");

		final Label label_6 = new Label(group_1, SWT.NONE);
		label_6.setLayoutData(new GridData());
		label_6.setText("填充色：");

		text_dial_pointer_fillColor = new Text(group_1, SWT.BORDER);
		text_dial_pointer_fillColor.setText("#0000FF");
		final GridData gd_text_dial_pointer_fillColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_dial_pointer_fillColor.setLayoutData(gd_text_dial_pointer_fillColor);
		text_dial_pointer_fillColor.setBackground(ColorUtil.hexRGBToSWTColor("#0000FF",this.getDisplay()));
		text_dial_pointer_fillColor.setForeground(ColorUtil.hexRGBToSWTColor("#0000FF",this.getDisplay()));
		
		
		button_text_dial_pointer_fillColor = new Button(group_1, SWT.NONE);
		button_text_dial_pointer_fillColor.setText("..");
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return;
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		XuiElement dialScaleE = configElement.getChildByTagName("dial-scale");
		if(dialScaleE!=null){
			boolean b = Boolean.parseBoolean(dialScaleE.getProperyValue("visible"));
			button_dial_scale_visible.setSelection(b);

			text_dial_scale_lowerBound.setText(dialScaleE.getProperyValue("lower-bound"));
			text_dial_scale_upperBound.setText(dialScaleE.getProperyValue("upper-bound"));
			text_dial_scale_startAngle.setText(dialScaleE.getProperyValue("start-angle"));
			text_dial_scale_extent.setText(dialScaleE.getProperyValue("extent"));
			text_dial_scale_mti.setText(dialScaleE.getProperyValue("major-tick-increment"));
			text_dial_scale_mtc.setText(dialScaleE.getProperyValue("minor-tick-count"));
			
			combo_dial_scale_tickLabel_fontSize.setEnabled(b);
			combo_dial_scale_tickLabel_fontStyle.setEnabled(b);
			combo_dial_scale_tickLabel_fontName.setEnabled(b);
			text_dial_scale_tick_labelOffset.setEnabled(b);
			combo_dial_scale_tickRadius.setEnabled(b);
			
			text_dial_scale_lowerBound.setEnabled(b);
			text_dial_scale_upperBound.setEnabled(b);
			text_dial_scale_startAngle.setEnabled(b);
			text_dial_scale_extent.setEnabled(b);
			text_dial_scale_mti.setEnabled(b);
			text_dial_scale_mtc.setEnabled(b);
			
			text_dial_scale_minor_tickColor.setEnabled(b);
			text_dial_scale_major_tickColor.setEnabled(b);
			button_text_dial_scale_minor_tickColor.setEnabled(b);
			button_text_dial_scale_major_tickColor.setEnabled(b);
		}else{
			
		}
		
		XuiElement dialScaleTickRadiusE = configElement.getChildByTagName("dial-scale-tick-radius");
		if(dialScaleTickRadiusE!=null){
			setDefaultComboValue(combo_dial_scale_tickRadius, W3cDocumentHelper.getText(dialScaleTickRadiusE.getOriginElement()));
		}
		XuiElement dialScaleTickLabelOffsetE = configElement.getChildByTagName("dial-scale-tick-label-offset");
		if(dialScaleTickLabelOffsetE!=null){
			text_dial_scale_tick_labelOffset.setText(W3cDocumentHelper.getText(dialScaleTickLabelOffsetE.getOriginElement()));
		}
		XuiElement dialScaleMtcE = configElement.getChildByTagName("dial-scale-major-tick-color");
		if(dialScaleMtcE!=null){
			text_dial_scale_mtc.setText(W3cDocumentHelper.getText(dialScaleMtcE.getOriginElement()));
		}
		XuiElement dialScaleMtiE = configElement.getChildByTagName("dial-scale-minor-tick-color");
		if(dialScaleMtiE!=null){
			text_dial_scale_mti.setText(W3cDocumentHelper.getText(dialScaleMtiE.getOriginElement()));
		}
		XuiElement dialScaleTickLabelFontE = configElement.getChildByTagName("dial-scale-tick-label-font");
		if(dialScaleTickLabelFontE!=null){
			setDefaultComboValue(combo_dial_scale_tickLabel_fontName,dialScaleTickLabelFontE.getProperyValue("name"));
			combo_dial_scale_tickLabel_fontStyle.select(Integer.parseInt(dialScaleTickLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_dial_scale_tickLabel_fontSize,dialScaleTickLabelFontE.getProperyValue("size"));
		}
		XuiElement dialPointerRadiusE = configElement.getChildByTagName("dial-pointer-radius");
		if(dialPointerRadiusE!=null){
			text_dial_pointerRadius.setText(W3cDocumentHelper.getText(dialPointerRadiusE.getOriginElement()));
		}
		XuiElement dialScalePointWidthRadiusE = configElement.getChildByTagName("dial-pointer-width-radius");
		if(dialScalePointWidthRadiusE!=null){
			text_dial_pointer_widthRadius.setText(W3cDocumentHelper.getText(dialScalePointWidthRadiusE.getOriginElement()));
		}
		XuiElement dialScalePointFillColorE = configElement.getChildByTagName("dial-pointer-fill-color");
		if(dialScalePointFillColorE!=null){
			text_dial_pointer_fillColor.setText(W3cDocumentHelper.getText(dialScalePointFillColorE.getOriginElement()));
		}
		XuiElement dialScalePointerOutlineColorE = configElement.getChildByTagName("dial-pointer-outline-color");
		if(dialScalePointerOutlineColorE!=null){
			text_dial_pointer_outlineColor.setText(W3cDocumentHelper.getText(dialScalePointerOutlineColorE.getOriginElement()));
		}
	}

	public void registerEvent() {

		button_text_dial_scale_minor_tickColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_scale_minor_tickColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_scale_minor_tickColor.setBackground(color);
					text_dial_scale_minor_tickColor.setForeground(color);
					text_dial_scale_minor_tickColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_dial_scale_major_tickColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_scale_major_tickColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_scale_major_tickColor.setBackground(color);
					text_dial_scale_major_tickColor.setForeground(color);
					text_dial_scale_major_tickColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_dial_pointer_outlineColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_pointer_outlineColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_pointer_outlineColor.setBackground(color);
					text_dial_pointer_outlineColor.setForeground(color);
					text_dial_pointer_outlineColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_dial_pointer_fillColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_dial_pointer_fillColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_dial_pointer_fillColor.setBackground(color);
					text_dial_pointer_fillColor.setForeground(color);
					text_dial_pointer_fillColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_dial_scale_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {             	
            	boolean b = button_dial_scale_visible.getSelection();
            	combo_dial_scale_tickLabel_fontSize.setEnabled(b);
        		combo_dial_scale_tickLabel_fontStyle.setEnabled(b);
        		combo_dial_scale_tickLabel_fontName.setEnabled(b);
        		text_dial_scale_tick_labelOffset.setEnabled(b);
        		combo_dial_scale_tickRadius.setEnabled(b);
        		
        		text_dial_scale_lowerBound.setEnabled(b);
        		text_dial_scale_upperBound.setEnabled(b);
        		text_dial_scale_startAngle.setEnabled(b);
        		text_dial_scale_extent.setEnabled(b);
        		text_dial_scale_mti.setEnabled(b);
        		text_dial_scale_mtc.setEnabled(b);      
        		
        		text_dial_scale_minor_tickColor.setEnabled(b);
    			text_dial_scale_major_tickColor.setEnabled(b);
    			button_text_dial_scale_minor_tickColor.setEnabled(b);
    			button_text_dial_scale_major_tickColor.setEnabled(b);
    			
            }
		});
		
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		String v = "" +button_dial_scale_visible.getSelection();
		String l = text_dial_scale_lowerBound.getText();
		String u = text_dial_scale_upperBound.getText();
		String s = text_dial_scale_startAngle.getText();
		String e = text_dial_scale_extent.getText();
		String mti = text_dial_scale_mti.getText();
		String mtc = text_dial_scale_mtc.getText();
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("visible", v);
		attrMap.put("lower-bound", l);
		attrMap.put("upper-bound", u);
		attrMap.put("start-angle", s);
		attrMap.put("extent", e);
		attrMap.put("major-tick-increment", mti);
		attrMap.put("minor-tick-count", mtc);
		this.saveSelf(configElement, "dial-scale", "", attrMap);
		
		this.saveSelf(configElement, "dial-scale-tick-radius", combo_dial_scale_tickRadius.getItem(combo_dial_scale_tickRadius.getSelectionIndex()));
		this.saveSelf(configElement, "dial-scale-tick-label-offset", text_dial_scale_tick_labelOffset.getText());
		this.saveSelf(configElement, "dial-scale-major-tick-color", text_dial_scale_major_tickColor.getText());
		this.saveSelf(configElement, "dial-scale-minor-tick-color", text_dial_scale_minor_tickColor.getText());
		
		String fontName = combo_dial_scale_tickLabel_fontName.getItem(combo_dial_scale_tickLabel_fontName.getSelectionIndex());
		String fontStyle = combo_dial_scale_tickLabel_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_dial_scale_tickLabel_fontSize.getItem(combo_dial_scale_tickLabel_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "dial-scale-tick-label-font", "", attrMap);
		
		this.saveSelf(configElement, "dial-pointer-radius", text_dial_pointerRadius.getText()); 
		this.saveSelf(configElement, "dial-pointer-width-radius", text_dial_pointer_widthRadius.getText());
		this.saveSelf(configElement, "dial-pointer-fill-color", text_dial_pointer_fillColor.getText());
		this.saveSelf(configElement, "dial-pointer-outline-color", text_dial_pointer_outlineColor.getText());
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
