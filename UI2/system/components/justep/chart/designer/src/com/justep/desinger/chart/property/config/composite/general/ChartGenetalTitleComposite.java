package com.justep.desinger.chart.property.config.composite.general;

import java.util.HashMap;

import org.eclipse.swt.SWT;
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

public class ChartGenetalTitleComposite extends Composite implements IChartComposite{
	
	Shell shell;
	
	//有效性
	private Button botton_title_visible;
	
	private Button button_text_bgc; //颜色选择
	
	//标题
	private Text text_bgc;
	private Text text_title;
	private Combo combo_title_p;
	
	//校正
	private Combo combo_title_v;
	private Combo combo_title_h;

	//字体
	private Combo combo_title_font_size;
	private Combo combo_title_font_style;
	private Combo combo_title_font_name;

	//边框
	private Combo combo_title_border_bottom;
	private Combo combo_title_border_right;
	private Combo combo_title_border_left;
	private Combo combo_title_border_top;
	private Combo combo_title_padding_right;
	private Combo combo_title_padding_bottom;
	private Combo combo_title_margin_bottom;
	private Combo combo_title_margin_right;
	private Combo combo_title_padding_left;
	private Combo combo_title_padding_top;
	private Combo combo_title_margin_left;
	private Combo combo_title_margin_top;
	
	private XuiElement configE;
	
	public ChartGenetalTitleComposite(Composite parent, int style,XuiElement configE) {
		super(parent, style);
		this.configE = configE;
		shell = this.getShell();
		
		final GridLayout gridLayout_5 = new GridLayout();
		gridLayout_5.numColumns = 2;
		gridLayout_5.marginTop = 5;
		gridLayout_5.marginRight = 5;
		gridLayout_5.marginLeft = 5;
		setLayout(gridLayout_5);

		final Label label_title = new Label(this, SWT.NONE);
		label_title.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1));
		label_title.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label_title.setText("标题");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1));

		botton_title_visible = new Button(this, SWT.CHECK);
		final GridData gd_botton_title_visible = new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1);
		gd_botton_title_visible.heightHint = 23;
		gd_botton_title_visible.widthHint = 247;
		botton_title_visible.setLayoutData(gd_botton_title_visible);
		botton_title_visible.setText("图表是否显示标题");

		final Label label_title_text = new Label(this, SWT.NONE);
		label_title_text.setLayoutData(new GridData());
		label_title_text.setText("图表标题：");

		text_title = new Text(this, SWT.BORDER);
		final GridData gd_text_title = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_title.widthHint = 435;
		text_title.setLayoutData(gd_text_title);
		text_title.setText("Justep 图表");
		
		
		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("公共信息");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1);
		gd_group_1.heightHint = 55;
		gd_group_1.widthHint = 504;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.marginTop = 1;
		gridLayout_1.marginRight = 1;
		gridLayout_1.marginLeft = 1;
		gridLayout_1.marginWidth = 1;
		gridLayout_1.marginHeight = 1;
		gridLayout_1.numColumns = 9;
		group_1.setLayout(gridLayout_1);

		final Label label_title_p = new Label(group_1, SWT.NONE);
		final GridData gd_label_title_p = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_label_title_p.widthHint = 40;
		label_title_p.setLayoutData(gd_label_title_p);
		label_title_p.setText("标题位置：");

		combo_title_p = new Combo(group_1, SWT.NONE);
		combo_title_p.select(0);
		combo_title_p.setItems(new String[] {"TOP", "LEFT", "RIGHT", "BOTTOM"});
		final GridData gd_combo_title_p = new GridData(SWT.FILL, SWT.BOTTOM, true, false);
		gd_combo_title_p.widthHint = 33;
		combo_title_p.setLayoutData(gd_combo_title_p);
		
		final Label label_8 = new Label(group_1, SWT.NONE);
		label_8.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		label_8.setText("水平对齐：");

		combo_title_h = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_title_h = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_title_h.widthHint = 36;
		combo_title_h.setLayoutData(gd_combo_title_h);
		combo_title_h.select(1);
		combo_title_h.setItems(new String[] {"LEFT", "CENTER", "RIGHT"});

		final Label label_9 = new Label(group_1, SWT.NONE);
		label_9.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		label_9.setText("垂直对齐：");

		combo_title_v = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_title_v = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_title_v.widthHint = 38;
		combo_title_v.setLayoutData(gd_combo_title_v);
		combo_title_v.select(1);
		combo_title_v.setItems(new String[] {"TOP", "CENTER", "BOTTOM"});

		final Label label_title_bgc = new Label(group_1, SWT.NONE);
		label_title_bgc.setLayoutData(new GridData());
		label_title_bgc.setText("背景色：");

		text_bgc = new Text(group_1, SWT.BORDER);
		text_bgc.setText("#FFFFFF");
		final GridData gd_text_bgc = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_bgc.widthHint = 24;
		text_bgc.setLayoutData(gd_text_bgc);
		text_bgc.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_bgc.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_bgc = new Button(group_1, SWT.NONE);
		button_text_bgc.setText("..");

		final Label label_font_name = new Label(group_1, SWT.NONE);
		label_font_name.setLayoutData(new GridData());
		label_font_name.setText("字体名称：");
		
		
		combo_title_font_name = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_title_font_name = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_title_font_name.widthHint = 33;
		combo_title_font_name.setLayoutData(gd_combo_title_font_name);
		//combo_title_font_name.setItems(new String[] {"黑体"});
		combo_title_font_name.setItems(ChartConstant.getSYSFontList());
		combo_title_font_name.select(0);

		final Label label_title_font_style = new Label(group_1, SWT.NONE);
		final GridData gd_label_title_font_style = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_label_title_font_style.widthHint = 40;
		label_title_font_style.setLayoutData(gd_label_title_font_style);
		label_title_font_style.setText("字体样式：");

		combo_title_font_style = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_title_font_style = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_title_font_style.widthHint = 27;
		combo_title_font_style.setLayoutData(gd_combo_title_font_style);
		combo_title_font_style.select(0);
		combo_title_font_style.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});

		final Label label_title_font_size = new Label(group_1, SWT.NONE);
		label_title_font_size.setLayoutData(new GridData());
		label_title_font_size.setText("字体大小：");

		combo_title_font_size = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_title_font_size = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_title_font_size.widthHint = 22;
		combo_title_font_size.setLayoutData(gd_combo_title_font_size);
		combo_title_font_size.select(6);
		combo_title_font_size.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);

		final Group group_4 = new Group(this, SWT.NONE);
		group_4.setText("边距");
		final GridData gd_group_4 = new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1);
		gd_group_4.heightHint = 84;
		gd_group_4.widthHint = 502;
		group_4.setLayoutData(gd_group_4);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.marginWidth = 1;
		gridLayout_4.marginTop = 1;
		gridLayout_4.marginLeft = 1;
		gridLayout_4.marginRight = 1;
		gridLayout_4.marginBottom = 1;
		gridLayout_4.marginHeight = 1;
		gridLayout_4.numColumns = 9;
		group_4.setLayout(gridLayout_4);

		final Label label_10 = new Label(group_4, SWT.NONE);
		label_10.setText("边框");

		final Label label_11 = new Label(group_4, SWT.NONE);
		label_11.setText("上：");

		combo_title_border_top = new Combo(group_4, SWT.NONE);
		combo_title_border_top.select(0);
		combo_title_border_top.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_border_top = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_border_top.setLayoutData(gd_combo_title_border_top);

		final Label label_12 = new Label(group_4, SWT.NONE);
		label_12.setText("左：");

		combo_title_border_left = new Combo(group_4, SWT.NONE);
		combo_title_border_left.select(0);
		combo_title_border_left.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_border_left = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_border_left.setLayoutData(gd_combo_title_border_left);

		final Label label_13 = new Label(group_4, SWT.NONE);
		label_13.setText("右：");

		combo_title_border_right = new Combo(group_4, SWT.NONE);
		combo_title_border_right.select(0);
		combo_title_border_right.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_border_right = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_border_right.setLayoutData(gd_combo_title_border_right);

		final Label label_14 = new Label(group_4, SWT.NONE);
		label_14.setText("下：");

		combo_title_border_bottom = new Combo(group_4, SWT.NONE);
		combo_title_border_bottom.select(0);
		combo_title_border_bottom.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_border_bottom = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_border_bottom.setLayoutData(gd_combo_title_border_bottom);

		final Label label_15 = new Label(group_4, SWT.NONE);
		label_15.setText("边距");

		final Label label_16 = new Label(group_4, SWT.NONE);
		label_16.setText("上：");

		combo_title_margin_top = new Combo(group_4, SWT.NONE);
		combo_title_margin_top.select(1);
		combo_title_margin_top.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_margin_top = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_margin_top.setLayoutData(gd_combo_title_margin_top);

		final Label label_17 = new Label(group_4, SWT.NONE);
		label_17.setText("左：");

		combo_title_margin_left = new Combo(group_4, SWT.NONE);
		combo_title_margin_left.select(1);
		combo_title_margin_left.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_margin_left = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_margin_left.setLayoutData(gd_combo_title_margin_left);

		final Label label_18 = new Label(group_4, SWT.NONE);
		label_18.setText("右：");

		combo_title_margin_right = new Combo(group_4, SWT.NONE);
		combo_title_margin_right.select(1);
		combo_title_margin_right.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_margin_right = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_margin_right.setLayoutData(gd_combo_title_margin_right);

		final Label label_19 = new Label(group_4, SWT.NONE);
		label_19.setText("下：");

		combo_title_margin_bottom = new Combo(group_4, SWT.NONE);
		combo_title_margin_bottom.select(1);
		combo_title_margin_bottom.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_margin_bottom = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_margin_bottom.setLayoutData(gd_combo_title_margin_bottom);

		final Label label_20 = new Label(group_4, SWT.NONE);
		label_20.setText("间隙");

		final Label label_21 = new Label(group_4, SWT.NONE);
		label_21.setText("上：");

		combo_title_padding_top = new Combo(group_4, SWT.NONE);
		combo_title_padding_top.select(1);
		combo_title_padding_top.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_padding_top = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_padding_top.setLayoutData(gd_combo_title_padding_top);

		final Label label_22 = new Label(group_4, SWT.NONE);
		label_22.setText("左：");

		combo_title_padding_left = new Combo(group_4, SWT.NONE);
		combo_title_padding_left.select(1);
		combo_title_padding_left.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_padding_left = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_padding_left.setLayoutData(gd_combo_title_padding_left);

		final Label label_23 = new Label(group_4, SWT.NONE);
		label_23.setText("右：");

		combo_title_padding_right = new Combo(group_4, SWT.NONE);
		combo_title_padding_right.select(1);
		combo_title_padding_right.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_padding_right = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_padding_right.setLayoutData(gd_combo_title_padding_right);

		final Label label_24 = new Label(group_4, SWT.NONE);
		label_24.setText("下：");

		combo_title_padding_bottom = new Combo(group_4, SWT.NONE);
		combo_title_padding_bottom.select(1);
		combo_title_padding_bottom.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_title_padding_bottom = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_title_padding_bottom.setLayoutData(gd_combo_title_padding_bottom);
		
		
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
		
	}

	/**
	 * 控件事件注册
	 */
	public void registerEvent(){
		//有效性控制
		botton_title_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {    
            	text_bgc.setEnabled(botton_title_visible.getSelection());  
            	button_text_bgc.setEnabled(botton_title_visible.getSelection());  
            	text_title.setEnabled(botton_title_visible.getSelection());  
            	combo_title_padding_right.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_padding_bottom.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_margin_bottom.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_margin_right.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_padding_left.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_padding_top.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_margin_left.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_margin_top.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_border_bottom.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_border_right.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_border_left.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_border_top.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_v.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_h.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_font_size.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_font_style.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_font_name.setEnabled(botton_title_visible.getSelection()); 
            	combo_title_p.setEnabled(botton_title_visible.getSelection()); 
            }    
        });   
		
		button_text_bgc.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_bgc.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_bgc.setBackground(color);
					text_bgc.setForeground(color);
					text_bgc.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
	}
	
	/**
	 * 初始化面板中控件的默认值
	 */
	public void initDefaultValue(){	
		
		botton_title_visible.setSelection(true);
		
		text_bgc.setText("#FFFFFF");
		text_title.setText("Justep图表");
		
		combo_title_p.select(0);
		combo_title_font_name.select(ChartConstant.getSYSFontList().length-1);
		combo_title_font_style.select(0);
		combo_title_font_size.select(9);
		combo_title_h.select(1);
		combo_title_v.select(1);
		combo_title_border_top.select(0);
		combo_title_border_left.select(0);
		combo_title_border_right.select(0);
		combo_title_border_bottom.select(0);		
		combo_title_padding_right.select(1);
		combo_title_padding_bottom.select(1);
		combo_title_margin_bottom.select(1);
		combo_title_margin_right.select(1);
		combo_title_padding_left.select(1);
		combo_title_padding_top.select(1);
		combo_title_margin_left.select(1);
		combo_title_margin_top.select(1);		
		
	}
	
	/**
	 * 根据用户自定义配置初始化属性配置面板
	 */
	public void initSelfDefaultValue(){
		if(this.configE == null){//原则上不允许也不会出现NULL
			return;
		}
		
		XuiElement titleE = this.configE.getChildByTagName("title");
		if(titleE != null){
			String titleVisible = titleE.getProperyValue("visible");
			if(titleVisible == null || titleVisible.equalsIgnoreCase("true") || titleVisible.equals("")){
				botton_title_visible.setSelection(true);
			}else{
				botton_title_visible.setSelection(false);
				text_bgc.setEnabled(false);  
				button_text_bgc.setEnabled(false);  
            	text_title.setEnabled(false);  
            	combo_title_padding_right.setEnabled(false); 
            	combo_title_padding_bottom.setEnabled(false); 
            	combo_title_margin_bottom.setEnabled(false); 
            	combo_title_margin_right.setEnabled(false); 
            	combo_title_padding_left.setEnabled(false); 
            	combo_title_padding_top.setEnabled(false); 
            	combo_title_margin_left.setEnabled(false); 
            	combo_title_margin_top.setEnabled(false); 
            	combo_title_border_bottom.setEnabled(false); 
            	combo_title_border_right.setEnabled(false); 
            	combo_title_border_left.setEnabled(false); 
            	combo_title_border_top.setEnabled(false); 
            	combo_title_v.setEnabled(false); 
            	combo_title_h.setEnabled(false); 
            	combo_title_font_size.setEnabled(false); 
            	combo_title_font_style.setEnabled(false); 
            	combo_title_font_name.setEnabled(false); 
            	combo_title_p.setEnabled(false); 
			}
			
			String titlePosition = titleE.getProperyValue("position");
			if(titlePosition == null || titlePosition.equals("")){
			}else{
				setDefaultComboValue(this.combo_title_p,titlePosition);
			}
			
			this.text_title.setText(W3cDocumentHelper.getText(titleE.getOriginElement()));
			
		}		
		
		XuiElement titleBgcE = this.configE.getChildByTagName("title-background-color");
		if(titleBgcE != null){
			String textBgc = W3cDocumentHelper.getText(titleBgcE.getOriginElement());
			this.text_bgc.setText(textBgc);
			this.text_bgc.setForeground(ColorUtil.hexRGBToSWTColor(textBgc,this.getDisplay()));
			this.text_bgc.setBackground(ColorUtil.hexRGBToSWTColor(textBgc,this.getDisplay()));
		}
		
		XuiElement titleValignmentE = this.configE.getChildByTagName("title-vertical-alignment");
		if(titleValignmentE != null){
			setDefaultComboValue(this.combo_title_v,W3cDocumentHelper.getText(titleValignmentE.getOriginElement()));
		}
		
		XuiElement titleHalignmentE = this.configE.getChildByTagName("title-horizontal-alignment");
		if(titleHalignmentE != null){
			setDefaultComboValue(this.combo_title_h,W3cDocumentHelper.getText(titleHalignmentE.getOriginElement()));
		}
		
		
		
		XuiElement titleBorderE = this.configE.getChildByTagName("title-border");
		if(titleBorderE != null){
			setDefaultComboValue(this.combo_title_border_top,titleBorderE.getProperyValue("top"));
			setDefaultComboValue(this.combo_title_border_left,titleBorderE.getProperyValue("left"));
			setDefaultComboValue(this.combo_title_border_right,titleBorderE.getProperyValue("right"));
			setDefaultComboValue(this.combo_title_border_bottom,titleBorderE.getProperyValue("bottom"));
		}

		XuiElement titleMarginE = this.configE.getChildByTagName("title-margin");
		if(titleMarginE != null){
			setDefaultComboValue(this.combo_title_margin_top,titleMarginE.getProperyValue("top"));
			setDefaultComboValue(this.combo_title_margin_left,titleMarginE.getProperyValue("left"));
			setDefaultComboValue(this.combo_title_margin_right,titleMarginE.getProperyValue("right"));
			setDefaultComboValue(this.combo_title_margin_bottom,titleMarginE.getProperyValue("bottom"));
		}
		
		XuiElement titlePaddingE = this.configE.getChildByTagName("title-padding");
		if(titlePaddingE != null){
			setDefaultComboValue(this.combo_title_padding_top,titlePaddingE.getProperyValue("top"));
			setDefaultComboValue(this.combo_title_padding_left,titlePaddingE.getProperyValue("left"));
			setDefaultComboValue(this.combo_title_padding_right,titlePaddingE.getProperyValue("right"));
			setDefaultComboValue(this.combo_title_padding_bottom,titlePaddingE.getProperyValue("bottom"));
		}
		
		XuiElement titleFontE = this.configE.getChildByTagName("title-font");
		if(titleFontE != null){
			setDefaultComboValue(this.combo_title_font_name,titleFontE.getProperyValue("name"));
			this.combo_title_font_style.select(Integer.parseInt(titleFontE.getProperyValue("style")));
			setDefaultComboValue(this.combo_title_font_size,titleFontE.getProperyValue("size"));
		}
	}
	
	/**
	 * 
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
	
	/**
	 * 保存用户自定义
	 */
	public void saveSelfConfig() {
				
		//标题
		String titleText = text_title.getText();
		String titleP = combo_title_p.getItem(combo_title_p.getSelectionIndex());
		boolean visible = this.botton_title_visible.getSelection();		
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("position", titleP);
		if(visible){
			attrMap.put("visible", "true");
		}else{
			attrMap.put("visible", "false");
		}		
		boolean b = ChartConfigHelper.getChartConfigHelper().compare("common", "title", titleText, attrMap);
		
		if(b){			
			XuiElement titleE = getXuiElement("title");	
			W3cDocumentHelper.setElementText(titleE.getOriginElement(), titleText);
			if(this.botton_title_visible.getSelection()){
				titleE.getXuiDataModel().setPropertyValue(titleE, "visible", "true");
			}else{
				titleE.getXuiDataModel().setPropertyValue(titleE, "visible", "false");
			}
			titleE.getXuiDataModel().setPropertyValue(titleE, "position", titleP);
		}else{
			this.configE.removeChildren("title");
		}
		
		//标题背景色
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "title-background-color",  text_bgc.getText(), new HashMap<String,String>());
		if(b){
			XuiElement titleBackgroundColorE = getXuiElement("title-background-color");		
			W3cDocumentHelper.setElementText(titleBackgroundColorE.getOriginElement(), text_bgc.getText());
		}else{
			this.configE.removeChildren("title-background-color");
		}
		
		
		//标题垂直校正
		String title_v =  combo_title_v.getItem(combo_title_v.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "title-vertical-alignment", title_v , new HashMap<String,String>());
		if(b){
			XuiElement titleValignmentE = getXuiElement("title-vertical-alignment");
			W3cDocumentHelper.setElementText(titleValignmentE.getOriginElement(), title_v);
		}else{
			this.configE.removeChildren("title-vertical-alignment");
		}
		
		//标题水平校正
		String title_h = combo_title_h.getItem(combo_title_h.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "title-horizontal-alignment", title_h , new HashMap<String,String>());
		if(b){
			XuiElement titleHalignmentE = getXuiElement("title-horizontal-alignment");
			W3cDocumentHelper.setElementText(titleHalignmentE.getOriginElement(), title_h);
		}else{
			this.configE.removeChildren("title-horizontal-alignment");
		}
		
		//边框
		String borderTop=this.combo_title_border_top.getItem(this.combo_title_border_top.getSelectionIndex());
		String borderLeft=this.combo_title_border_left.getItem(this.combo_title_border_left.getSelectionIndex());
	    String borderRight=this.combo_title_border_right.getItem(this.combo_title_border_right.getSelectionIndex());
		String borderBottom=this.combo_title_border_bottom.getItem(this.combo_title_border_bottom.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("top", borderTop);
		attrMap.put("left", borderLeft);
		attrMap.put("right", borderRight);
		attrMap.put("bottom", borderBottom);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "title-border", "" , attrMap);
		if(b){
			XuiElement titleBorderE = getXuiElement("title-border");
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "top", borderTop);
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "left", borderLeft);
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "right", borderRight);
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "bottom", borderBottom);
		}else{
			this.configE.removeChildren("title-border");
		}
		
		//边距
		String marginTop = this.combo_title_margin_top.getItem(this.combo_title_margin_top.getSelectionIndex());
		String marginLeft = this.combo_title_margin_left.getItem(this.combo_title_margin_left.getSelectionIndex());
		String marginRight = this.combo_title_margin_right.getItem(this.combo_title_margin_right.getSelectionIndex());
		String marginBottom = this.combo_title_margin_bottom.getItem(this.combo_title_margin_bottom.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("top", marginTop);
		attrMap.put("left", marginLeft);
		attrMap.put("right", marginRight);
		attrMap.put("bottom", marginBottom);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "title-margin", "" , attrMap);
		if(b){
			XuiElement titleMarginE = getXuiElement("title-margin");
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "top", marginTop);
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "left", marginLeft);
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "right", marginRight);
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "bottom", marginBottom);
		}else{
			this.configE.removeChildren("title-margin");
		}
		
		//填充
		String paddingTop = this.combo_title_padding_top.getItem(this.combo_title_padding_top.getSelectionIndex());
		String paddingLeft = this.combo_title_padding_left.getItem(this.combo_title_padding_left.getSelectionIndex());
		String paddingRight = this.combo_title_padding_right.getItem(this.combo_title_padding_right.getSelectionIndex());
		String paddingBottom = this.combo_title_padding_bottom.getItem(this.combo_title_padding_bottom.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("top", paddingTop);
		attrMap.put("left", paddingLeft);
		attrMap.put("right", paddingRight);
		attrMap.put("bottom", paddingBottom);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "title-padding", "" , attrMap);
		if(b){
			XuiElement titlePaddingE = getXuiElement("title-padding");
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "top", paddingTop);
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "left", paddingLeft );
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "right", paddingRight);
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "bottom", paddingBottom);
		}else{
			this.configE.removeChildren("title-padding");
		}
		
		//字体
		String fontName = this.combo_title_font_name.getItem(this.combo_title_font_name.getSelectionIndex());
		String fontStyle =  ""+this.combo_title_font_style.getSelectionIndex();
		String fontSize = this.combo_title_font_size.getItem(this.combo_title_font_size.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "title-font", "" , attrMap);
		if(b){
			XuiElement titleFontE = getXuiElement("title-font");
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "name", fontName);
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "style",fontStyle);
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "size", fontSize);
		}else{
			this.configE.removeChildren("title-font");
		}
		
	}

	private XuiElement getXuiElement(String tagName){
		XuiElement xuiE = this.configE.getChildByTagName(tagName);
		if(xuiE == null){
			xuiE = this.configE.getXuiDataModel().addElement(tagName, this.configE, tagName);
		}
		return xuiE;
	}
	
	
	public void initLayout(){
	}

}
