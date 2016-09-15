package com.justep.desinger.chart.data.composite;

import java.util.HashMap;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
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

public class PieChartDataConfigComposite extends Composite implements IChartComposite{

	private XuiElement cSeriesE ;
	private HashMap<String ,String []> dataMap = new HashMap<String ,String []>();
	private String [] dataIds;
	
	private Combo combo_dataset_ref;
	private Combo combo_dataset_categoryaxis;
	private Combo combo_dataset_numberaxis;

	private Text text_href;
	private Combo combo_href_model;
	private Text text_href_title;
	
	public PieChartDataConfigComposite(Composite parent, int style ,XuiElement cSeriesE ,String [] dataIds,HashMap<String ,String []> dataMap) {
		super(parent, style);		
		this.cSeriesE = cSeriesE;	
		this.dataIds = dataIds;
		this.dataMap = dataMap;
		
		initLayout();
		registerEvent();
		initDefaultValue();	
		initSelfDefaultValue();
	}

	public void initDefaultValue() {

	}

	public void initSelfDefaultValue() {
		if(dataIds != null) combo_dataset_ref.setItems(dataIds);
		String baseRef = cSeriesE.getProperyValue("ref");
		String ref = baseRef;
		
		XuiElement dataE = this.cSeriesE.getChildByTagName("data");
		if(dataE != null){
			String sRef = dataE.getProperyValue("ref");
			String categoryAxis = dataE.getProperyValue("categoryAxis");
			String numberAxis = dataE.getProperyValue("numberAxis");
			
			if(sRef != null && !sRef.equals("")){
				ref = sRef;
			}
						
			if(ref != null && !ref.equals("")){
				combo_dataset_ref.select(getIndex(ref,this.dataIds));
				combo_dataset_categoryaxis.setItems(dataMap.get(ref));
				combo_dataset_numberaxis.setItems(dataMap.get(ref));

				if(categoryAxis != null && !categoryAxis.equals("")){
					combo_dataset_categoryaxis.select(getIndex(categoryAxis, this.dataMap.get(ref)) );
				}
				
				if(numberAxis != null && !numberAxis.equals("")){
					combo_dataset_numberaxis.select(getIndex(numberAxis, this.dataMap.get(ref)) );
				}
				
			}
						
			XuiElement chartHrefE = dataE.getChildByTagName("href");
			if(chartHrefE != null){
				String model = chartHrefE.getProperyValue("model");
				String title = chartHrefE.getProperyValue("title");
				String href = W3cDocumentHelper.getText(chartHrefE.getOriginElement());
				
				href = href.replaceAll("&", "&amp;");
				
				text_href.setText(href);
				if(model== null || model.equals("")){
					combo_href_model.select(-1);
				}else{					
					combo_href_model.select(getIndex(model,new String[] {"window", "dialog", "replace"}));
				}
				text_href_title.setText(title);
				
			}

		}else{			
			if(ref != null && !ref.equals("")){			
				combo_dataset_ref.select(getIndex(ref,this.dataIds));
				combo_dataset_categoryaxis.setItems(dataMap.get(ref));
				combo_dataset_numberaxis.setItems(dataMap.get(ref));
				combo_dataset_categoryaxis.select(-1);
				combo_dataset_numberaxis.select(-1);
			}
		}
		
	}
	
	private int getIndex(String key , String [] infos){
		if(key == null || key.equals("")){
			return -1;
		}
		for(int i=0; i<infos.length; i++){
			if(infos[i].equalsIgnoreCase(key)){
				return i;
			}
		}
		return -1;
	}

	public void registerEvent() {
				
		combo_dataset_ref.addSelectionListener(new SelectionListener() {   	           
            public void widgetDefaultSelected(SelectionEvent e) {   
                setSelectedValue(((Combo)e.widget).getSelectionIndex());   
            }             
            public void widgetSelected(SelectionEvent e) {   
                setSelectedValue(((Combo)e.widget).getSelectionIndex());                
                String cdataId = dataIds[((Combo)e.widget).getSelectionIndex()];
                String [] fields = dataMap.get(cdataId);
                combo_dataset_categoryaxis.setItems(fields);
    			combo_dataset_numberaxis.setItems(fields);
    			combo_dataset_categoryaxis.select(-1);
				combo_dataset_numberaxis.select(-1);
            }            
            private void setSelectedValue(int value) {   
                //l.setText(String.valueOf(value));   
            }   
        });   

		
	}

	/**
	 * 保存用户配置信息
	 */
	public void saveSelfConfig() {
		
		XuiElement dataE = getChildXuiElement("data" ,cSeriesE);
	
		dataE.getXuiDataModel().setPropertyValue(dataE, "categoryAxis", getComboSelectedValue(this.combo_dataset_categoryaxis));
		dataE.getXuiDataModel().setPropertyValue(dataE, "numberAxis", getComboSelectedValue(this.combo_dataset_numberaxis));
		dataE.getXuiDataModel().setPropertyValue(dataE, "ref", getComboSelectedValue(this.combo_dataset_ref));
		
		String hrefText = this.text_href.getText();
		if(hrefText != null && !hrefText.equals("")){
			XuiElement hrefE = getChildXuiElement("href" ,dataE);
			W3cDocumentHelper.setElementText(hrefE.getOriginElement(), this.text_href.getText());
			hrefE.getXuiDataModel().setPropertyValue(hrefE, "model", getComboSelectedValue(this.combo_href_model));
			hrefE.getXuiDataModel().setPropertyValue(hrefE, "title", this.text_href_title.getText());
		}else{
			XuiElement hrefE = dataE.getChildByTagName("href");
			if(hrefE != null){
				dataE.removeChildren("href");
			}
		}
		
	}

	private XuiElement getChildXuiElement(String tagName ,XuiElement cxuiE){ 
		XuiElement xuiE = cxuiE.getChildByTagName(tagName);
		if(xuiE == null){
			if(tagName.equalsIgnoreCase("data")){
				xuiE = cxuiE.getXuiDataModel().addElement("seriesData", cSeriesE,null,null, "<data categoryAxis=\"\" numberAxis=\"\" ref=\"\"></data>",null); 
			}else if(tagName.equalsIgnoreCase("href")){
				xuiE = cxuiE.getXuiDataModel().addElement("href", cxuiE,null,null, "<href model=\"\" title=\"\"></href>",null); 
			}else{
				xuiE = cxuiE.getXuiDataModel().addElement(tagName, cxuiE, tagName);
			}
		}
		return xuiE;
	}
	
	
	/**
	 * 获取下拉框选择值
	 * @param combo
	 * @return
	 */
	private String getComboSelectedValue(Combo combo){
		int n = combo.getSelectionIndex();
		if(n == -1){
			return "";
		}
		return combo.getItem(n);
	}
	
	public void initLayout() {
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.marginWidth = 0;
		gridLayout_2.marginHeight = 0;
		gridLayout_2.horizontalSpacing = 0;
		setLayout(gridLayout_2);

	    final Group group = new Group(this, SWT.NONE);
	    group.setText("数据");
	    final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
	    gd_group.heightHint = 55;
	    gd_group.widthHint = 475;
	    group.setLayoutData(gd_group);
	    final GridLayout gridLayout = new GridLayout();
	    gridLayout.marginWidth = 1;
	    gridLayout.marginTop = 1;
	    gridLayout.marginRight = 1;
	    gridLayout.marginLeft = 1;
	    gridLayout.marginHeight = 1;
	    gridLayout.marginBottom = 1;
	    gridLayout.numColumns = 4;
	    group.setLayout(gridLayout);

	    final Label label_1 = new Label(group, SWT.NONE);
	    label_1.setText("数据源：");

	    combo_dataset_ref = new Combo(group, SWT.NONE);
	    final GridData gd_combo_dataset_ref = new GridData(SWT.FILL, SWT.CENTER, true, false);
	    gd_combo_dataset_ref.widthHint = 98;
	    combo_dataset_ref.setLayoutData(gd_combo_dataset_ref);

	    final Label label_8 = new Label(group, SWT.NONE);
	    label_8.setLayoutData(new GridData(45, SWT.DEFAULT));

	    final Label label_9 = new Label(group, SWT.NONE);
	    final GridData gd_label_9 = new GridData(SWT.FILL, SWT.CENTER, false, false);
	    gd_label_9.widthHint = 107;
	    label_9.setLayoutData(gd_label_9);

	    final Label label_2 = new Label(group, SWT.NONE);
	    label_2.setText("分类轴：");

	    combo_dataset_categoryaxis = new Combo(group, SWT.NONE);
	    final GridData gd_combo_dataset_categoryaxis = new GridData(SWT.FILL, SWT.CENTER, true, false);
	    combo_dataset_categoryaxis.setLayoutData(gd_combo_dataset_categoryaxis);

	    final Label label_3 = new Label(group, SWT.NONE);
	    label_3.setLayoutData(new GridData());
	    label_3.setText("数据轴：");

	    combo_dataset_numberaxis = new Combo(group, SWT.NONE);
	    final GridData gd_combo_dataset_numberaxis = new GridData(SWT.FILL, SWT.CENTER, true, false);
	    gd_combo_dataset_numberaxis.widthHint = 99;
	    combo_dataset_numberaxis.setLayoutData(gd_combo_dataset_numberaxis);

	    final Group group_1 = new Group(this, SWT.NONE);
	    group_1.setText("图表链接");
	    final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
	    gd_group_1.heightHint = 57;
	    gd_group_1.widthHint = 474;
	    group_1.setLayoutData(gd_group_1);
	    final GridLayout gridLayout_1 = new GridLayout();
	    gridLayout_1.marginWidth = 1;
	    gridLayout_1.marginTop = 1;
	    gridLayout_1.marginRight = 1;
	    gridLayout_1.marginLeft = 1;
	    gridLayout_1.marginHeight = 1;
	    gridLayout_1.marginBottom = 1;
	    gridLayout_1.numColumns = 4;
	    group_1.setLayout(gridLayout_1);

	    final Label label_5 = new Label(group_1, SWT.NONE);
	    label_5.setText("链接地址：");

	    text_href = new Text(group_1, SWT.BORDER);
	    final GridData gd_text_href = new GridData(SWT.FILL, SWT.FILL, true, false, 3, 1);
	    text_href.setLayoutData(gd_text_href);

	    final Label label_6 = new Label(group_1, SWT.NONE);
	    label_6.setText("链接模式：");

	    combo_href_model = new Combo(group_1, SWT.NONE);
	    combo_href_model.setItems(new String[] {"window", "dialog", "replace"});
	    final GridData gd_combo_href_model = new GridData(SWT.FILL, SWT.CENTER, true, false);
	    combo_href_model.setLayoutData(gd_combo_href_model);

	    final Label label_7 = new Label(group_1, SWT.NONE);
	    label_7.setText("链接标题：");

	    text_href_title = new Text(group_1, SWT.BORDER);
	    final GridData gd_text_href_title = new GridData(SWT.FILL, SWT.CENTER, true, false);
	    text_href_title.setLayoutData(gd_text_href_title);
	}
}
