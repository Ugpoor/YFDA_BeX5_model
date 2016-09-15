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
import com.justep.studio.ui.editors.xui.XuiElement;

public class ThermometerlMeterChartDataConfigComposite extends Composite implements IChartComposite{

	private XuiElement cSeriesE ;
	private HashMap<String ,String []> dataMap = new HashMap<String ,String []>();
	private String [] dataIds;
	
	private Combo combo_dataset_value;
	private Combo combo_dataset_ref;
	private Text _upper;
	private Text _lower;

	public ThermometerlMeterChartDataConfigComposite(Composite parent, int style ,XuiElement cSeriesE ,String [] dataIds,HashMap<String ,String []> dataMap) {
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
		if(dataIds != null) combo_dataset_ref.setItems(dataIds);			
		_lower.setText("");
		_upper.setText("");
	}

	public void initSelfDefaultValue() {
		String baseRef = cSeriesE.getProperyValue("ref");
		String ref = baseRef;
		
		XuiElement dataE = this.cSeriesE.getChildByTagName("data");
		if(dataE != null){
			String sRef = dataE.getProperyValue("ref");
			String value = dataE.getProperyValue("value");
			
			if(sRef != null && !sRef.equals("")){
				ref = sRef;
			}
			
			if(ref != null && !ref.equals("")){
				combo_dataset_ref.select(getIndex(ref,this.dataIds));
				combo_dataset_value.setItems(dataMap.get(ref));
				if(value != null && !value.equals("")){
					combo_dataset_value.select(getIndex(value, this.dataMap.get(ref)) );
				}
			}
		}else{
			if(ref != null && !ref.equals("")){			
				combo_dataset_ref.select(getIndex(ref,this.dataIds));
			}
		}
		
		XuiElement configE = getChildXuiElement("config",this.cSeriesE);

		XuiElement dialScaleE = configE.getChildByTagName("thermometer-range");
		if(dialScaleE != null){
			String lower = dialScaleE.getProperyValue("lower");
			String upper = dialScaleE.getProperyValue("upper");			
			_lower.setText(lower);
			_upper.setText(upper);		
		}

	}
	
	private XuiElement getChildXuiElement(String tagName ,XuiElement cxuiE){
		XuiElement xuiE = cxuiE.getChildByTagName(tagName);
		if(xuiE == null){
			xuiE = cxuiE.getXuiDataModel().addElement(tagName, cxuiE, tagName);
		}
		return xuiE;
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
                combo_dataset_value.setItems(fields);
            }            
            private void setSelectedValue(int value) {    
            }   
        }); 

	}
	
	
	
	public void saveSelfConfig() {
			
		this.cSeriesE.removeChildren("data");

		XuiElement dataE = cSeriesE.getXuiDataModel().addElement("data", cSeriesE,null,null, "<data value=\"\" ref=\"\" ></data>",null); 		
		dataE.getXuiDataModel().setPropertyValue(dataE, "ref", getComboSelectedValue(this.combo_dataset_ref));
		dataE.getXuiDataModel().setPropertyValue(dataE, "value", getComboSelectedValue(this.combo_dataset_value));
		
		
		XuiElement configE = this.cSeriesE.getChildByTagName("config");
		configE.removeChildren("thermometer-range");
		XuiElement dialScaleE = configE.getXuiDataModel().addElement("thermometer-range", configE,null,null, "<thermometer-range lower=\"0\" upper=\"100\" />",null); 		
		dialScaleE.getXuiDataModel().setPropertyValue(dialScaleE, "lower", this._lower.getText());
		dialScaleE.getXuiDataModel().setPropertyValue(dialScaleE, "upper", this._upper.getText());
		
	}
	
	private String getComboSelectedValue(Combo combo){
		int n = combo.getSelectionIndex();
		if(n == -1){
			return "";
		}
		return combo.getItem(n);
	}
	
	public void initLayout() {
		setLayout(new GridLayout());
		
		final Label labelx = new Label(this, SWT.NONE);
	    labelx.setText("数据源设置");

	    final Label label_x = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
	    label_x.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
	    
		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("数据");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 57;
		gd_group_1.widthHint = 595;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 4;
		group_1.setLayout(gridLayout_1);

		final Label label_3 = new Label(group_1, SWT.NONE);
		label_3.setText("数据源：");

		combo_dataset_ref = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_dataset_ref = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_dataset_ref.setLayoutData(gd_combo_dataset_ref);

		final Label label_9 = new Label(group_1, SWT.NONE);
		label_9.setText("数据值：");

		combo_dataset_value = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_dataset_value = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_dataset_value.setLayoutData(gd_combo_dataset_value);

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setText("起始位：");

		_lower = new Text(group_1, SWT.BORDER);
		final GridData gd__lower = new GridData(SWT.FILL, SWT.CENTER, true, false);
		_lower.setLayoutData(gd__lower);

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setText("终止值：");

		_upper = new Text(group_1, SWT.BORDER);
		final GridData gd__upper = new GridData(SWT.FILL, SWT.CENTER, true, false);
		_upper.setLayoutData(gd__upper);

	}

}
