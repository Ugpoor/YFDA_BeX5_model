package com.justep.desinger.chart.property.config.composite.line;

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

public class ChartLineGeneralComposite extends Composite implements IChartComposite{

	Shell shell;
	private Button button_text_bgc; //颜色选择
	private Text text_bgcolor;
	private Combo combo_background_alpha;
	private Combo combo_foreground_alpha;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartLineGeneralComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType = currentChartType;
		shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}

	public void initDefaultValue() {
		combo_background_alpha.select(5);
		combo_foreground_alpha.select(8);
		text_bgcolor.setText("#FFFFFF");
		text_bgcolor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_bgcolor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
	}

	public void initLayout() {
		
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 3;
		setLayout(gridLayout_1);
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(55, 21));
		label.setText("其他");
		new Label(this, SWT.NONE);
		new Label(this, SWT.NONE);

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 3, 1));

		final Label label_2 = new Label(this, SWT.NONE);
		label_2.setText("背景色：");

		text_bgcolor = new Text(this, SWT.BORDER);
		final GridData gd_text_bgcolor = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_text_bgcolor.widthHint = 468;
		text_bgcolor.setLayoutData(gd_text_bgcolor);
		text_bgcolor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_bgcolor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));

		button_text_bgc = new Button(this, SWT.NONE);
		button_text_bgc.setText("..");

		final Label label_3 = new Label(this, SWT.NONE);
		label_3.setText("背景透明度：");

		combo_background_alpha = new Combo(this, SWT.NONE);
		final GridData gd_combo_background_alpha = new GridData(SWT.FILL, SWT.FILL, false, false, 2, 1);
		gd_combo_background_alpha.widthHint = 337;
		combo_background_alpha.setLayoutData(gd_combo_background_alpha);
		combo_background_alpha.setItems(new String[] {"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f","1.0f"});

		final Label label_4 = new Label(this, SWT.NONE);
		label_4.setText("前景透明度：");

		combo_foreground_alpha = new Combo(this, SWT.NONE);
		combo_foreground_alpha.setLayoutData(new GridData(SWT.FILL, SWT.FILL, false, false, 2, 1));
		combo_foreground_alpha.setItems(new String[] {"0.1f", "0.2f", "0.3f", "0.4f", "0.5f", "0.6f", "0.7f", "0.8f", "0.9f", "1.0f"});
		final GridData gd_text_2 = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_2.widthHint = 142;

	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		XuiElement bgColorE = configElement.getChildByTagName("background-color");
		if(bgColorE!=null){
			text_bgcolor.setText(W3cDocumentHelper.getText(bgColorE.getOriginElement()));
			text_bgcolor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(bgColorE.getOriginElement()),this.getDisplay()));
			text_bgcolor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(bgColorE.getOriginElement()),this.getDisplay()));
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
		button_text_bgc.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_bgcolor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_bgcolor.setBackground(color);
					text_bgcolor.setForeground(color);
					text_bgcolor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		this.saveSelf(configElement, "background-color", text_bgcolor.getText());
		this.saveSelf(configElement, "background-alpha",combo_background_alpha.getItem(combo_background_alpha.getSelectionIndex()));
		this.saveSelf(configElement, "foreground-alpha", combo_foreground_alpha.getItem(combo_foreground_alpha.getSelectionIndex()));
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
