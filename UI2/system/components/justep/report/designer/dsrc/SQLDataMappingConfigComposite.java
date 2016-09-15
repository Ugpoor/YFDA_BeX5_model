import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.CTabFolder;
import org.eclipse.swt.custom.CTabItem;
import org.eclipse.swt.custom.StyledText;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.ToolBar;
import org.eclipse.swt.widgets.ToolItem;

import com.justep.studio.data.DSUtil;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.data.DataSetChangedEvent;
import com.justep.studio.data.DataSetChangedListener;
import com.justep.studio.ui.exjface.DataSetTableViewer;
import com.swtdesigner.SWTResourceManager;

public class SQLDataMappingConfigComposite extends Composite{

	private Combo combo;
	private StyledText sql_text;
	private CTabFolder sqlTabFolder;
	
	private DataSet dataSet;
	private DataSetTableViewer tableViewer;
	
	private String dataId;
	private HashMap<String,List<FieldInfo>> useFieldMap;
	HashMap<String,String> sqlMap;
	private ToolItem addFieldToolItem;
	private ToolItem delFieldToolItem;
	private boolean isRefresh;
	
	public SQLDataMappingConfigComposite(Composite parent, int style,HashMap<String,List<FieldInfo>> useFieldMap) {
		super(parent, style);
		this.useFieldMap = useFieldMap;
		this.dataSet = this.createSQLDataSet();
		this.initLayout();
	}

	private void initLayout(){
		setLayout(new FillLayout(SWT.VERTICAL));

		sqlTabFolder = new CTabFolder(this, SWT.NONE);
		sqlTabFolder.setTabPosition(SWT.BOTTOM);

		final CTabItem designTabItem = new CTabItem(sqlTabFolder, SWT.NONE);
		designTabItem.setText("设计视图");

		final Composite designComposite = new Composite(sqlTabFolder, SWT.NONE);
		designTabItem.setControl(designComposite);

		final GridLayout gridLayout = new GridLayout();
		gridLayout.marginWidth = 0;
		gridLayout.marginHeight = 0;
		designComposite.setLayout(gridLayout);
		
		final ToolBar toolBar = new ToolBar(designComposite, SWT.NONE);
		toolBar.setLayoutData(new GridData(339, SWT.DEFAULT));

		addFieldToolItem = new ToolItem(toolBar, SWT.PUSH);
		addFieldToolItem.setText("新增字段映射");

		delFieldToolItem = new ToolItem(toolBar, SWT.PUSH);
		delFieldToolItem.setText("删除字段映射");
		
		tableViewer = new DataSetTableViewer(designComposite, SWT.BORDER | SWT.FULL_SELECTION);
		tableViewer.setDataSet(this.dataSet);
		Table table = tableViewer.getTable();
		final GridData gd_table = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_table.heightHint = 322;
		gd_table.widthHint = 573;
		table.setLayoutData(gd_table);
		table.setLinesVisible(true);
		table.setHeaderVisible(true);
		if (tableViewer.getTable().getItemCount() > 0) {
		}
		tableViewer.getTable().setFocus();
		tableViewer.getTable().select(0);
		tableViewer.updateSelectionData();
		
		
		final CTabItem sqlTabItem = new CTabItem(sqlTabFolder, SWT.NONE);
		sqlTabItem.setText("SQL语句");

		final Composite composite = new Composite(sqlTabFolder, SWT.NONE);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 3;
		composite.setLayout(gridLayout_1);
		sqlTabItem.setControl(composite);

		final Label xLabel = new Label(composite, SWT.NONE);
		xLabel.setText("数据库类型：");

		combo = new Combo(composite, SWT.NONE);
		combo.setText("                                                                 ");
		final GridData gd_combo = new GridData(SWT.LEFT, SWT.CENTER, true, false);
		gd_combo.widthHint = 121;
		combo.setLayoutData(gd_combo);

		final Label label = new Label(composite, SWT.NONE);
		label.setText("                                                   ");
		
		sql_text = new StyledText(composite, SWT.BORDER | SWT.MULTI | SWT.V_SCROLL
				| SWT.H_SCROLL | SWT.READ_ONLY);
		final GridData gd_sql_text = new GridData(SWT.FILL, SWT.CENTER, false, false, 3, 1);
		gd_sql_text.heightHint = 300;
		sql_text.setLayoutData(gd_sql_text);
		sql_text.setFont(SWTResourceManager.getFont("Arial", 10, SWT.NONE));
		
		sql_text.setEditable(false);
		//sql_text.setEnabled(false);
		
		initEvent();
	}
	
	
	private DataSet createSQLDataSet(){
		DataSet ds = new DataSet();
		DSUtil.createColumn(ds, "ref", "字段名称", "string", false, true, 180).setEditor("TextCellEditor");
		DSUtil.createColumn(ds, "path","字段映射", "string", false, true, 350).setEditor("TextCellEditor");
		return ds;
	}
	
	@SuppressWarnings("unchecked")
	public void refreshViewer(String dataId ,HashMap<String,String> sqlMap){
		this.dataId = dataId;
		this.sqlMap = sqlMap;
		this.isRefresh = true;
		this.sqlTabFolder.setSelection(0);
		
		this.dataSet.getDataRecords().clear();

		List<FieldInfo> useList = this.useFieldMap.get(this.dataId);
		if(useList == null || useList.size() == 0){	
			this.useFieldMap.put(this.dataId, new ArrayList<FieldInfo>());
		}else{
			for(FieldInfo f:useList){				
				Object[] values = new Object[] {f.getName(),f.getPath()};
				dataSet.addRecord(values);
			}
		}

		Iterator it = this.sqlMap.entrySet().iterator();
		int n = 0;
		while(it.hasNext()){
			it.next();		
			n++;
		}
		String temp [] = new String[n];
		int i=0;
		it = this.sqlMap.entrySet().iterator();
		while(it.hasNext()){
			Map.Entry<String, DatasetInfo> entry = (Entry<String, DatasetInfo>) it.next();
			String dtype = entry.getKey();	
			temp[i] = dtype;
			i++;
		}
		
		combo.setItems(temp);
		if(n>0){
			combo.select(0);
			String sql = this.sqlMap.get(temp[0]);
			sql_text.setText(sql);
		}
		
		tableViewer.setDataSet(this.dataSet);
		tableViewer.refresh();
		isRefresh = false;
		
	}
	
	private void initEvent(){
		
		combo.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) { 
            	String dtype = combo.getItems()[combo.getSelectionIndex()];          	           
            	String sql = sqlMap.get(dtype);
    			sql_text.setText(sql);       	
            }    
        });   
		
		this.dataSet.addDataSetChangedListener(new DataSetChangedListener (){			
			public void dataSetChanged(DataSetChangedEvent dce) {
				if(isRefresh){
					return;
				}
				
				//TODO：可以优化
				List<FieldInfo> useList = useFieldMap.get(dataId);
				useList.clear();
				
				List<DataRecord> dataRecordList = dataSet.getDataRecords();
				for(DataRecord dr : dataRecordList){
					String ref = dr.getString("ref");
					String path = dr.getString("path");	
					
					FieldInfo uInfo = new FieldInfo();
					uInfo.setName(ref);
					uInfo.setPath(path);
					useList.add(uInfo);
				}
				
			}
		});

		
		addFieldToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				isRefresh = true;
				tableViewer.getTable().forceFocus();
				if(tableViewer.getTable().getColumnCount()<=0){
					return;
				}
				Object[] values = new Object[] {"field"+dataSet.getData().size(),""};
				dataSet.addRecord(values);
				tableViewer.refresh();
				isRefresh = false;
			}
		});
		
		delFieldToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				if(tableViewer.getTable().getColumnCount()<=0){
					return;
				}
				List<DataRecord> list = dataSet.getSelectedRecord();
				if(list.size()>0){
					dataSet.deleteRecord(list.get(0));
					tableViewer.refresh();
				}
			}
		});
		
	}
}
