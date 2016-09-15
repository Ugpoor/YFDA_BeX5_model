package com.justep.desinger.chart.data.composite;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.SelectionChangedEvent;
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
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.Text;

import swing2swt.layout.BorderLayout;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ColorUtil;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.exjface.DataSetTableViewer;

public class ChartGeneralNoAutoDataConfigComposite extends Composite implements IChartComposite{
	
	Shell shell;
	private XuiElement cSeriesE ;
	private HashMap<String ,String []> dataMap = new HashMap<String ,String []>();
	private String [] dataIds;
	
	private Text text_link;
	private Text text_link_title;
	private Combo combo_link_model;

	private Text text_color;
	private Button button_text_color; //颜色选择
	private Combo combo_dataset_ref;
	private Text text_group_title;
	private Combo combo_catagory_axis;
	private Combo combo_number_axis;
	
	private Text text_hidden_data;
	
	private Button button_add;
	private Button button_delete;
//	private Button button_apply;
	
	private DataSet dataset;
	private DataSetTableViewer tableViewer;	
	private Table table;
	
	private int selectFlag = 0;
	
	public ChartGeneralNoAutoDataConfigComposite(Composite parent, int style ,XuiElement cSeriesE ,String [] dataIds,HashMap<String ,String []> dataMap) {
		super(parent, style);		
		this.cSeriesE = cSeriesE;	
		this.dataIds = dataIds;
		this.dataMap = dataMap;
		shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();	
		initSelfDefaultValue();
		//ttv.refresh();
		//ttv.expandAll();
	}
	
	public void initDefaultValue() {
		
		if(dataIds != null) combo_dataset_ref.setItems(dataIds);
		combo_dataset_ref.select(0);
        String [] fields = dataMap.get(combo_dataset_ref.getText());
        if(fields != null){
        	combo_catagory_axis.setItems(fields);
        	combo_number_axis.setItems(fields);
        }
		
		combo_link_model.setItems(new String[] {"window", "dialog", "replace"});
		combo_link_model.select(-1);
		
	}

	public void initSelfDefaultValue() {
		String baseRef = cSeriesE.getProperyValue("ref");
		String ref = baseRef;
		
		List<XuiElement> dataList = this.cSeriesE.getChildListByTagName("data");
		for(int i=0; i< dataList.size(); i++){
			XuiElement dataE = (XuiElement)dataList.get(i);

			String autoData =  dataE.getProperyValue("autoData");
			if(autoData == null || autoData.equals("") || autoData.equalsIgnoreCase("false")){
				
				String sRef = dataE.getProperyValue("ref");
				String title = dataE.getProperyValue("title");
				String categoryAxis = dataE.getProperyValue("categoryAxis");
				String numberAxis = dataE.getProperyValue("numberAxis");
				String color = dataE.getProperyValue("color");
				
				if(sRef == null || sRef.equals("")){
					sRef = ref;
				}

				XuiElement hrefE = dataE.getChildByTagName("href");
				String href = "";
				String model = "";
				String hrefTitle = "";
				if(hrefE != null){
					href = W3cDocumentHelper.getText(hrefE.getOriginElement());
					href = href.replaceAll("&", "&amp;");
					model = hrefE.getProperyValue("model");
					hrefTitle = hrefE.getProperyValue("title");
				}
			
            	String v1 = sRef == null?"":sRef;
            	String v2 = title == null?"":title;
            	String v3 = categoryAxis == null?"":categoryAxis;
            	String v4 = numberAxis == null?"":numberAxis;
            	String v5 = color == null?"":color;
            	String v6 = model == null?"":model;
            	String v7 = hrefTitle == null?"":hrefTitle;
            	String v8 = href == null?"":href;
            	
            	dataset.addRecord(new Object[] {v1,v2,v3,v4,v5,v6,v7,v8});
            	DataRecord dr = dataset.getDataRecord(0);
            	List<DataRecord> dl = new ArrayList<DataRecord>();
            	dl.add(dr);
            	dataset.setSelectedRecord(dl);            	
            	table.setSelection(0);
            	tableViewer.refresh();	
            	
            	selectFlag = 1;
				combo_dataset_ref.setText(v1);
				text_group_title.setText(v2);
				combo_catagory_axis.setText(v3);
				combo_number_axis.setText(v4);
				text_color.setText(v5);
				combo_link_model.setText(v6);
				text_link_title.setText(v7);
				text_link.setText(v8);
				selectFlag = 0;

			}
		}
		
	}

	public void saveSelfConfig() {
		List<DataRecord> drl = dataset.getDataRecords(); 
		
		for(DataRecord dr : drl){
			StringBuffer datasb = new StringBuffer();
			StringBuffer linksb = new StringBuffer();
			
			
			String v1 = dr.getString("data");
			String v2 = dr.getString("title");
			String v3 = dr.getString("categoryAxis");
			String v4 = dr.getString("numberAxis");
			String v5 = dr.getString("color");
			String v6 = dr.getString("hrefModel");
			String v7 = dr.getString("hrefTitle");
			String v8 = dr.getString("hrefURL");

			datasb.append("<data ");
			datasb.append(" ref=\"" + v1 +"\" ");
			datasb.append(" title=\"" + v2 +"\" ");
			datasb.append(" categoryAxis=\"" + v3 +"\" ");
			datasb.append(" numberAxis=\"" + v4 +"\" ");
			if(!v5.equals("")) datasb.append(" color=\"" + v4 +"\" ");
			datasb.append(" >");
			if(!v6.equals("") || !v7.equals("") || !v8.equals("")){
				linksb.append(" <href ");						
				linksb.append(" model=\"" + v6 +"\" ");
				linksb.append(" title=\"" + v7 +"\" ");						
				linksb.append(">");
				linksb.append(v8);
				linksb.append("</href>");
			}
			
			if(datasb != null && !datasb.toString().equals("")){
				datasb.append(linksb.toString());
				datasb.append("</data>");
				cSeriesE.getXuiDataModel().addElement("data", cSeriesE, null,null, datasb.toString(),null); 
			}
		}
	}

	
	
	public void rander(String teamId) {
		
/*		Team team = dataTableModel.findTeam(teamId);
		this.text_hidden_data.setText(teamId);
		
		if(team != null){
			ArrayList<DataEntry> entryList = (ArrayList<DataEntry>) team.getDataEntrys();
			for(int i=0; i<entryList.size(); i++){
				DataEntry entry = entryList.get(i);
				String type = entry.getType();
				if(type.equals("data")){
					
					if(entry.getParam1() != null && !entry.getParam1().equals("")){
						combo_dataset_ref.select(getIndex(entry.getParam1(),this.dataIds));
						combo_catagory_axis.setItems(dataMap.get(entry.getParam1()));
						combo_number_axis.setItems(dataMap.get(entry.getParam1()));
					}
					
					if(entry.getParam2()!= null && !entry.getParam2().equals("") ){
						text_group_title.setText(entry.getParam2());
					}else{
						text_group_title.setText("");
					}
					
					if(entry.getParam3()!= null && !entry.getParam3().equals("") ){
						combo_catagory_axis.select(getIndex(entry.getParam3(),this.dataMap.get(entry.getParam1())));
					}else{
						combo_catagory_axis.select(-1);
					}
					
					if(entry.getParam4()!= null && !entry.getParam4().equals("") ){
						combo_number_axis.select(getIndex(entry.getParam4(),this.dataMap.get(entry.getParam1())));
					}else{
						combo_number_axis.select(-1);
					}
					
					if(entry.getParam5()!= null && !entry.getParam5().equals("") ){
						text_color.setText(entry.getParam5());
						text_color.setBackground(ColorUtil.hexRGBToSWTColor(entry.getParam5(),shell.getDisplay()));
		        		text_color.setForeground(ColorUtil.hexRGBToSWTColor(entry.getParam5(),shell.getDisplay()));
					}else{
						text_color.setText("");
						text_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
		        		text_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
					}
				
				}else if(type.equals("link")){
					
					if(entry.getParam2()!= null && !entry.getParam2().equals("") ){						
						text_link.setText(entry.getParam2());
					}else{
						text_link.setText("");
					}
					if(entry.getParam3()!= null && !entry.getParam3().equals("") ){
						combo_link_model.select(getIndex(entry.getParam3(),new String[] {"window", "dialog", "replace"}));
					}else{
						combo_link_model.select(-1);
					}
					
					if(entry.getParam4()!= null && !entry.getParam4().equals("") ){
						text_link_title.setText(entry.getParam4());
					}else{
						text_link_title.setText("");
					}
					
				}
			}
		}
*/	}
	
	
/*	private int getIndex(String key , String [] infos){
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
*/	
	
	
	public void initLayout() {
		BorderLayout borderLayout = new BorderLayout(0,0);
		this.setLayout(borderLayout);

		final GridLayout gridLayout0 = new GridLayout();
		gridLayout0.marginWidth = 0;
		gridLayout0.marginHeight = 0;
		gridLayout0.horizontalSpacing = 0;

		Composite groupcom = new Composite(this, SWT.NONE);
		groupcom.setLayout(gridLayout0);
		groupcom.setLayoutData(BorderLayout.NORTH);

		final Group group = new Group(groupcom, SWT.NONE);
		group.setText("数据(data)");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, true);
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.marginHeight = 0;
		gridLayout.numColumns = 5;
		group.setLayout(gridLayout);
		
		final Group group_1 = new Group(groupcom, SWT.NONE);
		group_1.setText("链接(href)");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, true);
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.marginHeight = 0;
		gridLayout_1.numColumns = 4;
		group_1.setLayout(gridLayout_1);
		
		final Group group_table = new Group(this, SWT.NONE);
		group_table.setText("分组数据项");
		group_table.setLayoutData(BorderLayout.CENTER);
		group_table.setLayout(new BorderLayout(0, 0));

		final Composite composite = new Composite(group_table, SWT.NONE);
		composite.setLayoutData(BorderLayout.WEST);
		composite.setLayout(new GridLayout());
		
		button_add = new Button(composite, SWT.NONE);
		button_add.setText("新增");

		button_delete = new Button(composite, SWT.NONE);
		button_delete.setText("删除");

/*		button_apply = new Button(composite, SWT.NONE);
		button_apply.setText("保存");
*/		
		//创建数据集
		dataset = new DataSet();
		dataset.addColumn("data").setDataType("String").setHeader("数据集");
		dataset.addColumn("title").setDataType("String").setHeader("分组标题");
		dataset.addColumn("categoryAxis").setDataType("String").setHeader("分类轴");
		dataset.addColumn("numberAxis").setDataType("String").setHeader("数据轴");
		dataset.addColumn("color").setDataType("String").setHeader("颜色");
		dataset.addColumn("hrefModel").setDataType("String").setHeader("链接模式");
		dataset.addColumn("hrefTitle").setDataType("String").setHeader("链接标题");
		dataset.addColumn("hrefURL").setDataType("String").setHeader("链接地址");
		
		tableViewer = new DataSetTableViewer(group_table, SWT.BORDER | SWT.FULL_SELECTION);
		table = tableViewer.getTable();
		table.setLinesVisible(true);
		table.setHeaderVisible(true);	
		table.setLayoutData(BorderLayout.CENTER);
		tableViewer.setDataSet(dataset);
		
		final Label label = new Label(group, SWT.NONE);
		label.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label.setText("数据源：");

		combo_dataset_ref = new Combo(group, SWT.NONE);
		final GridData gd_combo_dataset_ref = new GridData(SWT.FILL, SWT.CENTER, true, true);
		combo_dataset_ref.setLayoutData(gd_combo_dataset_ref);
		new Label(group, SWT.NONE);
		
		text_hidden_data = new Text(group, SWT.BORDER);
		final GridData gd_text_hidden_data = new GridData(SWT.FILL, SWT.CENTER, true, true, 2, 1);
		text_hidden_data.setLayoutData(gd_text_hidden_data);

		final Label label_6 = new Label(group, SWT.NONE);
		label_6.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_6.setText("分组标题：");

		text_group_title = new Text(group, SWT.BORDER);
		final GridData gd_text_group_title = new GridData(SWT.FILL,
				SWT.CENTER, true, true);
		text_group_title.setLayoutData(gd_text_group_title);
		
		final Label label_1 = new Label(group, SWT.NONE);
		label_1.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_1.setText("分类轴：");

		combo_catagory_axis = new Combo(group, SWT.NONE);
		final GridData gd_combo_catagory_axis = new GridData(SWT.FILL,
				SWT.CENTER, true, true, 2, 1);
		combo_catagory_axis.setLayoutData(gd_combo_catagory_axis);
		text_hidden_data.setVisible(false);

		final Label label_2 = new Label(group, SWT.NONE);
		label_2.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_2.setText("数据轴：");

		combo_number_axis = new Combo(group, SWT.NONE);
		final GridData gd_combo_number_axis = new GridData(SWT.FILL,
				SWT.CENTER, true, true);
		combo_number_axis.setLayoutData(gd_combo_number_axis);

		final Label label_7 = new Label(group, SWT.NONE);
		label_7.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_7.setText("颜色：");

		text_color = new Text(group, SWT.BORDER);
		final GridData gd_text_color = new GridData(SWT.FILL, SWT.CENTER, true,true);
		text_color.setLayoutData(gd_text_color);
		text_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_color = new Button(group, SWT.NONE);
		button_text_color.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		button_text_color.setText("...");


		final Label label_3 = new Label(group_1, SWT.NONE);
		label_3.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false));
		label_3.setText("链接地址：");

		text_link = new Text(group_1, SWT.BORDER);
		final GridData gd_text_link = new GridData(SWT.FILL, SWT.CENTER, true, false, 3, 1);
		gd_text_link.widthHint = 27;
		text_link.setLayoutData(gd_text_link);

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false));
		label_4.setText("链接模式：");

		combo_link_model = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_link_model = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_link_model.setLayoutData(gd_combo_link_model);

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false));
		label_5.setText("链接标题：");

		text_link_title = new Text(group_1, SWT.BORDER);
		final GridData gd_text_link_title = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_link_title.setLayoutData(gd_text_link_title);
	}

	public void registerEvent() {
		tableViewer.addSelectionChangedListener(new ISelectionChangedListener() {
			public void selectionChanged(SelectionChangedEvent event) {
				if (!event.getSelection().isEmpty()) {
					selectFlag = 1;
					int idx = table.getSelectionIndex();
					String v1 = dataset.getString(idx,"data");
					String v2 = dataset.getString(idx,"title");
					String v3 = dataset.getString(idx,"categoryAxis");
					String v4 = dataset.getString(idx,"numberAxis");
					String v5 = dataset.getString(idx,"color");
					String v6 = dataset.getString(idx,"hrefModel");
					String v7 = dataset.getString(idx,"hrefTitle");
					String v8 = dataset.getString(idx,"hrefURL");

					combo_dataset_ref.setText(v1);
					text_group_title.setText(v2);
					combo_catagory_axis.setText(v3);
					combo_number_axis.setText(v4);
					combo_link_model.setText(v6);
					text_link_title.setText(v7);
					text_link.setText(v8);
					
					text_color.setText(v5);
					if(v5 != null && !"".equals(v5)){
						text_color.setBackground(ColorUtil.hexRGBToSWTColor(v5,shell.getDisplay()));
		        		text_color.setForeground(ColorUtil.hexRGBToSWTColor(v5,shell.getDisplay()));
					}else{
						text_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
		        		text_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
					}
					
					
					selectFlag = 0;
				}
			}
		});
		
		button_text_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_color.setBackground(color);
					text_color.setForeground(color);
					text_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		combo_dataset_ref.addSelectionListener(new SelectionAdapter() {   	           
            public void widgetSelected(SelectionEvent e) {   
            	String cdataId = dataIds[((Combo)e.widget).getSelectionIndex()];
            	String [] fields = dataMap.get(cdataId);
            	combo_catagory_axis.setItems(fields);
            	combo_number_axis.setItems(fields);
            	combo_catagory_axis.select(-1);
            	combo_number_axis.select(-1);
                	
            	if(selectFlag == 0){
                	String value = ((Combo)e.widget).getText();
                	List<DataRecord> rds = dataset.getSelectedRecord();
                	for(DataRecord rd :rds){
                		rd.setValue("data", value);
                	}
                	tableViewer.refresh();                	
                }
            }            
        });  
		
		combo_dataset_ref.addListener(SWT.Modify, new Listener() {    
			public void handleEvent(Event e) {
				if(selectFlag == 0){
					String value = combo_dataset_ref.getText();
					List<DataRecord> rds = dataset.getSelectedRecord();
					for(DataRecord rd :rds){
						rd.setValue("data", value);
					}
					tableViewer.refresh();					
				}
			}    
		});
		
		combo_catagory_axis.addSelectionListener(new SelectionAdapter() {   	           
            public void widgetSelected(SelectionEvent e) {   
            	if(selectFlag == 0){
            		String value = ((Combo)e.widget).getText();
            		List<DataRecord> rds = dataset.getSelectedRecord();
            		for(DataRecord rd :rds){
            			rd.setValue("categoryAxis", value);
            		}
            		tableViewer.refresh();
            	}
            }            
        });   

		combo_catagory_axis.addListener(SWT.Modify, new Listener() {    
			public void handleEvent(Event e) {
				if(selectFlag == 0){
					String value = combo_catagory_axis.getText();
					List<DataRecord> rds = dataset.getSelectedRecord();
					for(DataRecord rd :rds){
						rd.setValue("categoryAxis", value);
					}
					tableViewer.refresh();					
				}
			}    
		});

		
		combo_number_axis.addSelectionListener(new SelectionAdapter() {   	           
            public void widgetSelected(SelectionEvent e) {   
            	if(selectFlag == 0){
            		String value = ((Combo)e.widget).getText();
            		List<DataRecord> rds = dataset.getSelectedRecord();
            		for(DataRecord rd :rds){
            			rd.setValue("numberAxis", value);
            		}
            		tableViewer.refresh();            		
            	}
            }            
        });   
		
		combo_number_axis.addListener(SWT.Modify, new Listener() {    
			public void handleEvent(Event e) {    
				if(selectFlag == 0){
					String value = combo_number_axis.getText();
					List<DataRecord> rds = dataset.getSelectedRecord();
					for(DataRecord rd :rds){
						rd.setValue("numberAxis", value);
					}
					tableViewer.refresh();					
				}
			}    
		});

		text_group_title.addListener(SWT.Modify, new Listener() {    
			public void handleEvent(Event e) {    
				if(selectFlag == 0){
					String value = text_group_title.getText();
					List<DataRecord> rds = dataset.getSelectedRecord();
					for(DataRecord rd :rds){
						rd.setValue("title", value);
					}
					tableViewer.refresh();					
				}
			}    
		});

		text_color.addListener(SWT.Modify, new Listener() {    
			public void handleEvent(Event e) { 
				if(selectFlag == 0){
					String value = text_color.getText();
					List<DataRecord> rds = dataset.getSelectedRecord();
					for(DataRecord rd :rds){
						rd.setValue("color", value);
					}	
					tableViewer.refresh();					
				}
			}    
		});

		combo_link_model.addSelectionListener(new SelectionAdapter() {   	           
            public void widgetSelected(SelectionEvent e) {   
            	if(selectFlag == 0){
            		String value = ((Combo)e.widget).getText();
            		List<DataRecord> rds = dataset.getSelectedRecord();
            		for(DataRecord rd :rds){
            			rd.setValue("hrefModel", value);
            		}
            		tableViewer.refresh();
            	}
            }            
        });   

		combo_link_model.addListener(SWT.Modify, new Listener() {    
			public void handleEvent(Event e) {    
				if(selectFlag == 0){
					String value = combo_link_model.getText();
					List<DataRecord> rds = dataset.getSelectedRecord();
					for(DataRecord rd :rds){
						rd.setValue("hrefModel", value);
					}
					tableViewer.refresh();
					
				}
			}    
		});
		
		text_link_title.addListener(SWT.Modify, new Listener() {    
			public void handleEvent(Event e) {    
				if(selectFlag == 0){
					String value = text_link_title.getText();
					List<DataRecord> rds = dataset.getSelectedRecord();
					for(DataRecord rd :rds){
						rd.setValue("hrefTitle", value);
					}	
					tableViewer.refresh();
					
				}
			}    
		});

		text_link.addListener(SWT.Modify, new Listener() {    
			public void handleEvent(Event e) {    
				if(selectFlag == 0){
					String value = text_link.getText();
					List<DataRecord> rds = dataset.getSelectedRecord();
					for(DataRecord rd :rds){
						rd.setValue("hrefURL", value);
					}	
					tableViewer.refresh();
					
				}
			}    
		});
		
		//新增
		button_add.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){
            	String v1 = combo_dataset_ref.getText();
            	String v2 = text_group_title.getText();
            	String v3 = combo_catagory_axis.getText();
            	String v4 = combo_number_axis.getText();
            	String v5 = text_color.getText();         	
            	String v6 = combo_link_model.getText();
            	String v7 = text_link_title.getText();
            	String v8 = text_link.getText();
            	
            	dataset.addRecord(new Object[] {v1,v2,v3,v4,v5,v6,v7,v8});
            	DataRecord dr = dataset.getDataRecord(0);
            	List<DataRecord> dl = new ArrayList<DataRecord>();
            	dl.add(dr);
            	dataset.setSelectedRecord(dl);            	
            	table.setSelection(0);
            	tableViewer.refresh();
            	
            	selectFlag = 1;

                text_hidden_data.setText("");
                combo_link_model.select(-1);
                combo_link_model.setText("");
                text_link.setText("");
            	text_link_title.setText("");

            	text_group_title.setText("");
                text_color.setText("");
                text_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
                text_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));

                combo_dataset_ref.select(0);
            	combo_catagory_axis.select(-1);
            	combo_number_axis.select(-1);
            	
            	combo_catagory_axis.setText("");
            	combo_number_axis.setText("");
            	
            	selectFlag = 0;
		    }
		});
		
		button_delete.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){           	
            	if(tableViewer.getTable().getColumnCount()<=0){
            		return;
            	}
            	List<DataRecord> list = dataset.getSelectedRecord();
            	
            	if(list.size()>0){
            		dataset.deleteRecord(list.get(0));
            		DataRecord dr = dataset.getDataRecord(0);
            		List<DataRecord> dl = new ArrayList<DataRecord>();
            		dl.add(dr);
            		dataset.setSelectedRecord(dl);            	
            		table.setSelection(0);
            		tableViewer.refresh();

					selectFlag = 1;
					int idx = table.getSelectionIndex();
					String v1 = dataset.getString(idx,"data");
					String v2 = dataset.getString(idx,"title");
					String v3 = dataset.getString(idx,"categoryAxis");
					String v4 = dataset.getString(idx,"numberAxis");
					String v5 = dataset.getString(idx,"color");
					String v6 = dataset.getString(idx,"hrefModel");
					String v7 = dataset.getString(idx,"hrefTitle");
					String v8 = dataset.getString(idx,"hrefURL");

					combo_dataset_ref.setText(v1);
					text_group_title.setText(v2);
					combo_catagory_axis.setText(v3);
					combo_number_axis.setText(v4);
					text_color.setText(v5);
					combo_link_model.setText(v6);
					text_link_title.setText(v7);
					text_link.setText(v8);
					
					selectFlag = 0;
            		
            	}
		    }
		});
		
		//应用
/*		button_apply.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){
            	
            	String link = text_link.getText();
             	String linkTitle = text_link_title.getText();
             	String linkModel = "";
             	if(combo_link_model.getSelectionIndex() != -1){
             		linkModel = combo_link_model.getItem(combo_link_model.getSelectionIndex());
             	}             	
             	String d_color = text_color.getText();            	
             	String d_ref="";
             	if(combo_dataset_ref.getSelectionIndex()!= -1){             		
             		d_ref = combo_dataset_ref.getItem(combo_dataset_ref.getSelectionIndex());
             	}            	
             	String g_title = text_group_title.getText();
             	          	
             	String cAxis = "";
             	if(combo_catagory_axis.getSelectionIndex()!= -1){          
             		cAxis = combo_catagory_axis.getItem(combo_catagory_axis.getSelectionIndex());
             		
             	}            	
             	String nAxis = "";
             	if(combo_number_axis.getSelectionIndex()!= -1){          
             		nAxis = combo_number_axis.getItem(combo_number_axis.getSelectionIndex());             		
             	}
  	
            	String hiddenData = text_hidden_data.getText();
            	if(hiddenData != null && !hiddenData.equals("")){
            		Team team = dataTableModel.findTeam(hiddenData);
            		team.updateData(d_ref, g_title, cAxis, nAxis, d_color);
            		team.updateLink(d_ref, link, linkModel, linkTitle);
            	}else{
            		String newIndex = UUID.randomUUID().toString().replaceAll("-", "");
            		Team team = new Team();
            		team.setId(newIndex);           		
            		team.add(new DataEntry("data",d_ref, g_title, cAxis, nAxis, d_color,""));
            		team.add(new DataEntry("link",d_ref, link, linkModel, linkTitle,"",""));          		
            		text_hidden_data.setText(newIndex);
            		dataTableModel.getTeamList().add(team);
            	}
            	
            	
            	ttv.setInput(dataTableModel);
            	ttv.refresh();
            	ttv.expandAll();
		    }
		});
*/		
		
	}
}
