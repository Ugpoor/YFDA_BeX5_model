package com.justep.desinger.chart.property.config.composite.gantt;

import java.util.HashMap;

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
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ChartConfigHelper;
import com.justep.desinger.chart.util.ColorUtil;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.swtdesigner.SWTResourceManager;

public class ChartGanttGeneralComposite extends Composite implements IChartComposite{
	
	Shell shell;
	private Button button_text_background_color; //颜色选择
	
	private Text text_background_color;
	private Combo combo_background_alpha;
	private Combo combo_foreground_alpha;
	
	private XuiElement owerElement;
	private String currentChartType ;
	
	public ChartGanttGeneralComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
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
		combo_background_alpha.select(5);
		combo_foreground_alpha.select(8);
		text_background_color.setText("#FFFFFF");
	}

	public void initLayout() {
		
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 3;
		setLayout(gridLayout_1);
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		final GridData gd_label = new GridData(SWT.LEFT, SWT.CENTER, false, false, 3, 1);
		gd_label.heightHint = 23;
		gd_label.widthHint = 69;
		label.setLayoutData(gd_label);
		label.setText("其他");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 3, 1));

		final Label label_2 = new Label(this, SWT.NONE);
		label_2.setText("背景色：");

		text_background_color = new Text(this, SWT.BORDER);
		final GridData gd_text_background_color = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_text_background_color.widthHint = 592;
		text_background_color.setLayoutData(gd_text_background_color);
		text_background_color.setText("#FFFFFF");
		text_background_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_background_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_background_color = new Button(this, SWT.NONE);
		button_text_background_color.setLayoutData(new GridData(SWT.RIGHT, SWT.CENTER, false, false));
		button_text_background_color.setText("..");

		final Label label_3 = new Label(this, SWT.NONE);
		label_3.setText("背景透明度：");

		combo_background_alpha = new Combo(this, SWT.NONE);
		combo_background_alpha.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false, 2, 1));
		combo_background_alpha.select(5);
		combo_background_alpha.setItems(new String[] {"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f","1.0f"});

		final Label label_4 = new Label(this, SWT.NONE);
		label_4.setText("前景透明度：");

		combo_foreground_alpha = new Combo(this, SWT.NONE);
		combo_foreground_alpha.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false, 2, 1));
		combo_foreground_alpha.select(8);
		combo_foreground_alpha.setItems(new String[] {"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f","1.0f"});
		final GridData gd_text_2 = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_2.widthHint = 142;

	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		XuiElement bgColorE = configElement.getChildByTagName("background-color");
		if(bgColorE!=null){
			text_background_color.setText(W3cDocumentHelper.getText(bgColorE.getOriginElement()));
			text_background_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(bgColorE.getOriginElement()),this.getDisplay()));
			text_background_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(bgColorE.getOriginElement()),this.getDisplay()));
		}
		
		XuiElement bgAlphaE = configElement.getChildByTagName("background-alpha");
		if(bgAlphaE!=null){
			setDefaultComboValue(combo_background_alpha,W3cDocumentHelper.getText(bgAlphaE.getOriginElement()));
		}
		
		XuiElement fgAlphaE = configElement.getChildByTagName("foreground-alpha");
		if(fgAlphaE!=null){
			setDefaultComboValue(combo_foreground_alpha,W3cDocumentHelper.getText(fgAlphaE.getOriginElement()));
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
	
	public void registerEvent() {
		button_text_background_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_background_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_background_color.setBackground(color);
					text_background_color.setForeground(color);
					text_background_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		boolean b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "background-color",  text_background_color.getText(), new HashMap<String,String>());
		if(b){
			XuiElement bgColorE = getXuiElement(configElement, "background-color");
			W3cDocumentHelper.setElementText(bgColorE.getOriginElement(), text_background_color.getText());
		}else{
			configElement.removeChildren("background-color");
		}
		
		String bga = combo_background_alpha.getItem(combo_background_alpha.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "background-alpha",  bga, new HashMap<String,String>());
		if(b){
			XuiElement bgAlphaE = getXuiElement(configElement, "background-alpha");
			W3cDocumentHelper.setElementText(bgAlphaE.getOriginElement(), bga);
		}else{
			configElement.removeChildren("background-alpha");
		}
		
		String fga = combo_foreground_alpha.getItem(combo_foreground_alpha.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "foreground-alpha",  fga, new HashMap<String,String>());
		if(b){
			XuiElement bgAlphaE = getXuiElement(configElement, "foreground-alpha");
			W3cDocumentHelper.setElementText(bgAlphaE.getOriginElement(), fga);
		}else{
			configElement.removeChildren("foreground-alpha");
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
