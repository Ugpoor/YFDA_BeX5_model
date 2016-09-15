package com.justep.desinger.chart.data.composite;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.TableTreeViewer;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.TableTree;
import org.eclipse.swt.events.ControlAdapter;
import org.eclipse.swt.events.ControlEvent;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.RGB;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.ColorDialog;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.TableColumn;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.data.composite.datatree.DataEntry;
import com.justep.desinger.chart.data.composite.datatree.DataTableModel;
import com.justep.desinger.chart.data.composite.datatree.DataTreeContentProvider;
import com.justep.desinger.chart.data.composite.datatree.DataTreeLabelProvider;
import com.justep.desinger.chart.data.composite.datatree.Team;
import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ColorUtil;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;

@SuppressWarnings("deprecation")
public class GanttChartDataConfigComposite extends Composite implements IChartComposite{

	private TableTree tableTree;
	Shell shell;
	private XuiElement cSeriesE ;
	private HashMap<String ,String []> dataMap = new HashMap<String ,String []>();
	private String [] dataIds;
	
	private Text text_link;
	private Text text_link_title;
	private Combo combo_link_model;

	private Text text_color;
	private Button button_text_color; //颜色选择
	private Text combo_group_title;
	private Combo combo_dataset_ref;
	private Combo combo_catagory_axis;
	private Combo combo_start_date;
	private Combo combo_end_date;
	
	private Text text_hidden_data;
	
	private Button button_add;
	private Button button_delete;
	private Button button_apply;
	
	private TableTreeViewer ttv;
	private DataTableModel dataTableModel = new DataTableModel();
	
	public GanttChartDataConfigComposite(Composite parent, int style ,XuiElement cSeriesE ,String [] dataIds,HashMap<String ,String []> dataMap) {
		super(parent, style);		
		this.cSeriesE = cSeriesE;	
		this.dataIds = dataIds;
		this.dataMap = dataMap;
		this.shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();	
		initSelfDefaultValue();
	}
 
	public void initDefaultValue() {
		if(dataIds != null) combo_dataset_ref.setItems(dataIds);
		combo_dataset_ref.select(0);
		
		combo_link_model.setItems(new String[] {"window", "dialog", "replace"});
		combo_link_model.select(-1);
		
	}

	public void initSelfDefaultValue() {
		String baseRef = cSeriesE.getProperyValue("ref");
		String ref = baseRef;
		
		List<?> dataList = this.cSeriesE.getChildListByTagName("data");
		for(int i=0; i< dataList.size(); i++){
			XuiElement dataE = (XuiElement)dataList.get(i);

			String sRef = dataE.getProperyValue("ref");
			String title = dataE.getProperyValue("title");
			String categoryAxis = dataE.getProperyValue("categoryAxis");
			String startDate = dataE.getProperyValue("startDate");
			String endDate = dataE.getProperyValue("endDate");
			String color = dataE.getProperyValue("color");
			
			if(sRef == null || sRef.equals("")){
				sRef = ref;
			}
			
			Team team = new Team();
			team.setId(UUID.randomUUID().toString().replaceAll("-", ""));	
			
			team.add(new DataEntry("data",sRef,title,categoryAxis,startDate,endDate,color));
			
			XuiElement hrefE = dataE.getChildByTagName("href");
			if(hrefE != null){
				String href = W3cDocumentHelper.getText(hrefE.getOriginElement());	
				href = href.replaceAll("&", "&amp;");
				String model = hrefE.getProperyValue("model");
				String hrefTitle = hrefE.getProperyValue("title");
				team.add(new DataEntry("link",sRef,href,model,hrefTitle,"",""));
			}else{
				team.add(new DataEntry("link",sRef,"","","","",""));
			}
		
			dataTableModel.getTeamList().add(team);			
		
		}
		ttv.refresh();
		ttv.expandAll();
	}
	
	public void saveSelfConfig() {
		this.cSeriesE.removeChildren("data");
		ArrayList<Team> teamList = dataTableModel.getTeamList();
		for(int i=0; i<teamList.size(); i++){
			Team team = teamList.get(i);
			XuiElement dataE = cSeriesE.getXuiDataModel().addElement("data", cSeriesE,null,null, "<data title=\"\" categoryAxis=\"\" startDate=\"\" endDate=\"\" ref=\"\" ></data>",null); 
			ArrayList<DataEntry> dataEntryList = team.getDataEntrys();
			for(int j=0; j<dataEntryList.size(); j++){
				DataEntry entry = dataEntryList.get(j);
				String type = entry.getType();
				if(type.equalsIgnoreCase("data")){
					dataE.getXuiDataModel().setPropertyValue(dataE, "ref", entry.getParam1());
					dataE.getXuiDataModel().setPropertyValue(dataE, "title", entry.getParam2());
					dataE.getXuiDataModel().setPropertyValue(dataE, "categoryAxis", entry.getParam3());
					dataE.getXuiDataModel().setPropertyValue(dataE, "startDate", entry.getParam4());
					dataE.getXuiDataModel().setPropertyValue(dataE, "endDate", entry.getParam5());
					if(entry.getParam6() != null && !entry.getParam6().equals("")){
						dataE.getXuiDataModel().setPropertyValue(dataE, "color", entry.getParam6());
					}
				}else if(type.equalsIgnoreCase("link")){
					if(entry.getParam2() != null && !entry.getParam2().equals("")){
						XuiElement hrefE = dataE.getXuiDataModel().addElement("href", dataE, "href");
						W3cDocumentHelper.setElementText(hrefE.getOriginElement(),entry.getParam2());
						hrefE.getXuiDataModel().setPropertyValue(hrefE, "model", entry.getParam3());
						hrefE.getXuiDataModel().setPropertyValue(hrefE, "title", entry.getParam4());
					}
				}
			}
		}
		
	}

	
	public void registerEvent() {
		ttv.addSelectionChangedListener(new ISelectionChangedListener() {
			public void selectionChanged(SelectionChangedEvent event) {
				if (event.getSelection().isEmpty()) {
					System.out.println("Selected Nothing");
					return;
				}
				if (event.getSelection() instanceof IStructuredSelection) {
					IStructuredSelection selection = (IStructuredSelection) event.getSelection();
					StringBuffer selected = new StringBuffer();
					for (Iterator<?> iterator = selection.iterator(); iterator.hasNext();) {
						Object element = iterator.next();
						String cid = "";
						if (element instanceof Team) {
							cid = ((Team) element).getId();
						} else if (element instanceof DataEntry) {
							// cid = ((DataEntry) element).getCategoryAxis();
							cid = ((DataEntry) element).getTeam().getId();
						}
						selected.append("" + cid);
						selected.append(", ");
					}
					if (selected.length() > 0) {
						selected.setLength(selected.length() - 2);
					}
					
					rander(selected.toString());
					
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
		
		combo_dataset_ref.addSelectionListener(new SelectionListener() {   	           
            public void widgetDefaultSelected(SelectionEvent e) {   
                setSelectedValue(((Combo)e.widget).getSelectionIndex());   
            }             
            public void widgetSelected(SelectionEvent e) {   
                setSelectedValue(((Combo)e.widget).getSelectionIndex());                
                String cdataId = dataIds[((Combo)e.widget).getSelectionIndex()];
                String [] fields = dataMap.get(cdataId);
               
                combo_catagory_axis.setItems(fields);
                combo_start_date.setItems(fields);
                combo_end_date.setItems(fields);
                
                combo_catagory_axis.select(-1);
                combo_start_date.select(-1);
                combo_end_date.select(-1);
				
            }            
            private void setSelectedValue(int value) {   
                //l.setText(String.valueOf(value));   
            }   
        });   
		
		
		//新增
		button_add.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){
                
                text_hidden_data.setText("");
                
                text_link.setText("");
            	text_link_title.setText("");
            	combo_link_model.setItems(new String[]{});
            	combo_link_model.select(-1);

            	text_color.setText("");
            	text_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
        		text_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
        		
            	combo_group_title.setText("");
            	
            	if(dataIds != null) combo_dataset_ref.setItems(dataIds);
                combo_catagory_axis.setItems(new String[]{});
                combo_start_date.setItems(new String[]{});
                combo_end_date.setItems(new String[]{});
                
                combo_dataset_ref.select(-1);
            	combo_catagory_axis.select(-1);
            	combo_start_date.select(-1);
                combo_end_date.select(-1);

		    }
		});
		
		button_delete.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){           	
            	String hiddenData = text_hidden_data.getText();
            	if(hiddenData != null && !hiddenData.equals("")){
            		Team team = dataTableModel.findTeam(hiddenData);
            		dataTableModel.getTeamList().remove(team);
            		ttv.setInput(dataTableModel);
                	ttv.refresh();
                	ttv.expandAll();    
                	
                	text_hidden_data.setText("");
                    
                    text_link.setText("");
                	text_link_title.setText("");
                	combo_link_model.setItems(new String[]{});
                	combo_link_model.select(-1);

                	text_color.setText("");
                	text_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
            		text_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
            		
                	combo_group_title.setText("");
                	
                	if(dataIds != null) combo_dataset_ref.setItems(dataIds);
                    combo_catagory_axis.setItems(new String[]{});
                    combo_start_date.setItems(new String[]{});
                    combo_end_date.setItems(new String[]{});

                    combo_dataset_ref.select(0);
                	combo_catagory_axis.select(-1);
                	combo_start_date.select(-1);
                    combo_end_date.select(-1);
            	}              
		    }
		});
		
		//应用
		button_apply.addSelectionListener(new SelectionAdapter(){
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
             	String g_title = combo_group_title.getText();
             	          	
             	String cAxis = "";
             	if(combo_catagory_axis.getSelectionIndex()!= -1){          
             		cAxis = combo_catagory_axis.getItem(combo_catagory_axis.getSelectionIndex());
             		
             	}            	
             	String sD = "";
             	if(combo_start_date.getSelectionIndex()!= -1){          
             		sD = combo_start_date.getItem(combo_start_date.getSelectionIndex());             		
             	}
             	
             	String eD = "";
             	if(combo_end_date.getSelectionIndex()!= -1){          
             		eD = combo_end_date.getItem(combo_end_date.getSelectionIndex());             		
             	}
             	
  	
            	String hiddenData = text_hidden_data.getText();
            	if(hiddenData != null && !hiddenData.equals("")){
            		Team team = dataTableModel.findTeam(hiddenData);
            		team.updateDataByGantt(d_ref, g_title, cAxis, sD , eD, d_color);
            		team.updateLink(d_ref, link, linkModel, linkTitle);
            	}else{
            		String newIndex = UUID.randomUUID().toString().replaceAll("-", "");
            		Team team = new Team();
            		team.setId(newIndex);           		
            		team.add(new DataEntry("data",d_ref, g_title, cAxis, sD,eD, d_color));
            		team.add(new DataEntry("link",d_ref, link, linkModel, linkTitle,"",""));          		
            		text_hidden_data.setText(newIndex);
            		dataTableModel.getTeamList().add(team);
            	}
            	
            	ttv.setInput(dataTableModel);
            	ttv.refresh();
            	ttv.expandAll();
		    }
		});
		
	}

	
	public void rander(String teamId) {
			
		Team team = dataTableModel.findTeam(teamId);
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
						combo_start_date.setItems(dataMap.get(entry.getParam1()));
						combo_end_date.setItems(dataMap.get(entry.getParam1()));
					}
					
					if(entry.getParam2()!= null && !entry.getParam2().equals("") ){
						combo_group_title.setText(entry.getParam2());
					}else{
						combo_group_title.setText("");
					}
					
					if(entry.getParam3()!= null && !entry.getParam3().equals("") ){
						combo_catagory_axis.select(getIndex(entry.getParam3(),this.dataMap.get(entry.getParam1())));
					}else{
						combo_catagory_axis.select(-1);
					}
					
					if(entry.getParam4()!= null && !entry.getParam4().equals("") ){
						combo_start_date.select(getIndex(entry.getParam4(),this.dataMap.get(entry.getParam1())));
					}else{
						combo_start_date.select(-1);
					}
					
					if(entry.getParam5()!= null && !entry.getParam5().equals("") ){
						combo_end_date.select(getIndex(entry.getParam5(),this.dataMap.get(entry.getParam1())));
					}else{
						combo_end_date.select(-1);
					}
					
					if(entry.getParam6()!= null && !entry.getParam6().equals("") ){
						text_color.setText(entry.getParam6());
						text_color.setBackground(ColorUtil.hexRGBToSWTColor(entry.getParam6(),this.getDisplay()));
		        		text_color.setForeground(ColorUtil.hexRGBToSWTColor(entry.getParam6(),this.getDisplay()));
					}else{
						text_color.setText("");
						text_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		        		text_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
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



	public void initLayout() {
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.horizontalSpacing = 0;
		setLayout(gridLayout_3);
	    
		final Group group_2 = new Group(this, SWT.NONE);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.marginHeight = 0;
		gridLayout_4.horizontalSpacing = 0;
		gridLayout_4.marginWidth = 0;
		group_2.setLayout(gridLayout_4);
		group_2.setLayoutData(new GridData(SWT.FILL, SWT.FILL, false, true));
		
		ttv = new TableTreeViewer(group_2, SWT.FULL_SELECTION);
		tableTree = ttv.getTableTree();
		tableTree.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true));
		
		// Set the content and label providers
		ttv.setContentProvider(new DataTreeContentProvider());
		ttv.setLabelProvider(new DataTreeLabelProvider());
		ttv.setInput(dataTableModel);

		// Set up the table
		final Table table = ttv.getTableTree().getTable();
		final TableColumn column1 = new TableColumn(table, SWT.LEFT);  //数据源
		final TableColumn column2 = new TableColumn(table, SWT.LEFT);  //分组
		final TableColumn column3 = new TableColumn(table, SWT.RIGHT); //分类轴
		final TableColumn column4 = new TableColumn(table, SWT.RIGHT); //起始时间
		final TableColumn column5 = new TableColumn(table, SWT.RIGHT); //终止时间
		final TableColumn column6 = new TableColumn(table, SWT.RIGHT); //颜色
		
		ttv.expandAll();
		
		for (int i = 0, n = table.getColumnCount(); i < n; i++) {
			table.getColumn(i).pack();
		}

		table.setHeaderVisible(true);
		table.setLinesVisible(true);
		
		group_2.addControlListener(new ControlAdapter() {
		    public void controlResized(ControlEvent e) {
		      Rectangle area = group_2.getClientArea();
		      Point preferredSize = table.computeSize(SWT.DEFAULT, SWT.DEFAULT);
		      int width = area.width - 2*table.getBorderWidth();
		      if (preferredSize.y > area.height + table.getHeaderHeight()) {
		        Point vBarSize = table.getVerticalBar().getSize();
		        width -= vBarSize.x;
		      }
		      Point oldSize = table.getSize();
		      if (oldSize.x > area.width) {
		        column1.setWidth(width/5);
		        column2.setWidth(width/5);
		        column3.setWidth(width/5);
		        column4.setWidth(width/5);
		        column5.setWidth(width/5);
		        column6.setWidth(width - (column1.getWidth()+column2.getWidth()+column3.getWidth()+column4.getWidth()+column5.getWidth()));
		        table.setSize(area.width, area.height);
		      } else {
		        table.setSize(area.width, area.height);
		        column1.setWidth(width/5);
		        column2.setWidth(width/5);
		        column3.setWidth(width/5);
		        column4.setWidth(width/5);
		        column5.setWidth(width/5);
		        column6.setWidth(width - (column1.getWidth()+column2.getWidth()+column3.getWidth()+column4.getWidth()+column5.getWidth()));
		      }
		    }
		  });
	
		final Composite composite = new Composite(this, SWT.NONE);
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.marginHeight = 0;
		gridLayout_2.marginWidth = 0;
		gridLayout_2.numColumns = 5;
		composite.setLayout(gridLayout_2);
		final GridData gd_composite = new GridData(SWT.FILL, SWT.CENTER, true, false);
		composite.setLayoutData(gd_composite);
		//new Label(group, SWT.NONE);
		
		text_hidden_data = new Text(composite, SWT.BORDER);
		text_hidden_data.setLayoutData(new GridData(SWT.LEFT, SWT.FILL, false, true));
		text_hidden_data.setVisible(false);

		final Label label_9 = new Label(composite, SWT.NONE);
		label_9.setLayoutData(new GridData(SWT.LEFT, SWT.FILL, true, true));
		label_9.setText("  ");

		button_add = new Button(composite, SWT.NONE);
		button_add.setLayoutData(new GridData(SWT.LEFT, SWT.FILL, false, true));
		button_add.setText("新增");

		button_delete = new Button(composite, SWT.NONE);
		button_delete.setLayoutData(new GridData(SWT.LEFT, SWT.FILL, false, true));
		button_delete.setText("删除");

		button_apply = new Button(composite, SWT.NONE);
		button_apply.setLayoutData(new GridData(SWT.LEFT, SWT.FILL, false, true));
		button_apply.setText("应用");
		

		final Group group = new Group(this, SWT.NONE);
		group.setText("数据");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true,false);
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 5;
		group.setLayout(gridLayout);

		final Label label = new Label(group, SWT.NONE);
		label.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label.setText("数据源：");

		combo_dataset_ref = new Combo(group, SWT.NONE);
		final GridData gd_combo_dataset_ref = new GridData(SWT.FILL,
				SWT.CENTER, true, true);
		combo_dataset_ref.setLayoutData(gd_combo_dataset_ref);

		final Label label_7 = new Label(group, SWT.NONE);
		label_7.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_7.setText("颜色：");

		text_color = new Text(group, SWT.BORDER);
		final GridData gd_text_color = new GridData(SWT.FILL, SWT.CENTER, true,
				true);
		text_color.setLayoutData(gd_text_color);
		text_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_color = new Button(group, SWT.NONE);
		button_text_color.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		button_text_color.setText("..");

		final Label label_6 = new Label(group, SWT.NONE);
		label_6.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_6.setText("分组标题：");

		combo_group_title = new Text(group, SWT.BORDER);
		final GridData gd_combo_group_title = new GridData(SWT.FILL,
				SWT.CENTER, true, true);
		combo_group_title.setLayoutData(gd_combo_group_title);
		
		final Label label_1 = new Label(group, SWT.NONE);
		label_1.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_1.setText("分类轴：");

		combo_catagory_axis = new Combo(group, SWT.NONE);
		final GridData gd_combo_catagory_axis = new GridData(SWT.FILL,
				SWT.CENTER, true, true, 2, 1);
		combo_catagory_axis.setLayoutData(gd_combo_catagory_axis);

		final Label label_2 = new Label(group, SWT.NONE);
		label_2.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_2.setText("起始时间：");

		combo_start_date = new Combo(group, SWT.NONE);
		final GridData gd_combo_start_date = new GridData(SWT.FILL,
				SWT.CENTER, true, true);
		combo_start_date.setLayoutData(gd_combo_start_date);

		final Label label_8 = new Label(group, SWT.NONE);
		label_8.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_8.setText("终止时间：");

		combo_end_date = new Combo(group, SWT.NONE);
		final GridData gd_combo_end_date = new GridData(SWT.FILL, SWT.CENTER, true, true, 2, 1);
		combo_end_date.setLayoutData(gd_combo_end_date);

		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("图表链接");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 55;
		gd_group_1.widthHint = 595;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 4;
		group_1.setLayout(gridLayout_1);

		final Label label_3 = new Label(group_1, SWT.NONE);
		label_3.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_3.setText("链接地址：");

		text_link = new Text(group_1, SWT.BORDER);
		final GridData gd_text_link = new GridData(SWT.FILL, SWT.CENTER, true,
				true, 3, 1);
		gd_text_link.widthHint = 27;
		text_link.setLayoutData(gd_text_link);

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_4.setText("链接模式：");

		combo_link_model = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_link_model = new GridData(SWT.FILL, SWT.CENTER,
				true, true);
		combo_link_model.setLayoutData(gd_combo_link_model);

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_5.setText("链接标题：");

		text_link_title = new Text(group_1, SWT.BORDER);
		final GridData gd_text_link_title = new GridData(SWT.FILL, SWT.CENTER,
				true, true);
		text_link_title.setLayoutData(gd_text_link_title);
		
	}
}
