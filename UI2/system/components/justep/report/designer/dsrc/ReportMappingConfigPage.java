import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.SashForm;
import org.eclipse.swt.custom.StackLayout;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Text;

import com.justep.design.model.ModelConstant;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.ui.editors.xui.IPropertyDialogPage;
import com.justep.studio.ui.editors.xui.IPropertyValueStrategy;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiDataModel;
import com.justep.studio.ui.editors.xui.XuiDataSourceManager;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ReportMappingConfigPage extends Composite implements IPropertyDialogPage {

	private StackLayout stackLayout = new StackLayout();
	private Composite contentComp;
	private Composite sqlDataMappingConfigComposite;
	private Composite generalDataMappingConfigComposite;
	
	private Text datasetPath;
	private org.eclipse.swt.widgets.List dataList;
	
	private PropertyItem propertyItem;

	private HashMap<String,DatasetInfo> sysDatasetMap = new HashMap<String,DatasetInfo>();
	private HashMap<String,List<FieldInfo>> sysFieldMap = new HashMap<String,List<FieldInfo>>();
	
	private HashMap<String,DatasetInfo> useDatasetMap = new HashMap<String,DatasetInfo>();
	private HashMap<String,List<FieldInfo>> useFieldMap = new HashMap<String,List<FieldInfo>>();
	
	private String currentDatasetID;
	
	private static final String XBL_COMPONENT_BIZ_DATA = "data.xbl.xml#bizData";
	private static final String XBL_COMPONENT_COMMON_DATA = "data.xbl.xml#data";
	private static final String XBL_COMPONENT_REPORT_DATA = "reportData.xbl.xml#data";
	private static final String DATA_TYPE_BIZ = "bizData";
	private static final String DATA_TYPE_REPORT = "reportData";
	private static final String DATA_TYPE_COMMON = "commonData";
	
	
	public ReportMappingConfigPage(Composite parent, int style) {
		super(parent, style);
		super.setSize(750, 500);
		this.initLayout();
		this.initEvent();
		
		
		//System.out.println("***************************");
		//DataSet ds = XuiDataSourceManager.getDataRelationDataSet(null);
		
		
	}

	private void initLayout(){
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 4;
		setLayout(gridLayout);
		
		final Label label = new Label(this, SWT.NONE);
		label.setText("数据集信息");

		final Label label_1 = new Label(this, SWT.NONE);
		label_1.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 3, 1));
		label_1.setText("数据集关系映射信息");
		dataList = new org.eclipse.swt.widgets.List(this, SWT.BORDER);
		final GridData gd_list = new GridData(SWT.FILL, SWT.FILL, false, false, 1, 3);
		gd_list.widthHint = 125;
		gd_list.heightHint = 396;
		dataList.setLayoutData(gd_list);
		
		final Label label_3 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_3.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false, 3, 1));
		new Label(this, SWT.NONE);

		final Label label_2 = new Label(this, SWT.NONE);
		label_2.setText("数据集映射：");

		datasetPath = new Text(this, SWT.BORDER);
		datasetPath.setText("record");
		final GridData gd_datasetPath = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_datasetPath.widthHint = 436;
		datasetPath.setLayoutData(gd_datasetPath);

		final SashForm sashForm = new SashForm(this, SWT.NONE);
		final GridData gd_sashForm = new GridData(SWT.FILL, SWT.FILL, false, false, 3, 1);
		gd_sashForm.heightHint = 359;
		gd_sashForm.widthHint = 563;
		sashForm.setLayoutData(gd_sashForm);
		
		contentComp = new Composite(sashForm, SWT.NONE);
		contentComp.setLayout(stackLayout);
		
		generalDataMappingConfigComposite = new GeneralDataMappingConfigComposite(contentComp,SWT.NONE,sysFieldMap,useFieldMap);
		stackLayout.topControl = generalDataMappingConfigComposite;
		contentComp.layout();
	}

	private void initEvent(){
		
		dataList.addSelectionListener(new SelectionListener() {
			public void widgetSelected(SelectionEvent e) {
				String[] items = dataList.getSelection();
				if(items.length == 0){
					return;
				}

				String selectd = items[0];
				DatasetInfo dInfo = sysDatasetMap.get(selectd);
				
				currentDatasetID = selectd;
				String dType = dInfo.getDatasetType();
				
				DatasetInfo uInfo = useDatasetMap.get(selectd);
				if(uInfo==null){
					//默认为 record
					if(dType.equalsIgnoreCase(DATA_TYPE_BIZ) || dType.equalsIgnoreCase(DATA_TYPE_COMMON)){	
						datasetPath.setText("record");
					}else{
						datasetPath.setText("record");
					}
					uInfo = new DatasetInfo();
					uInfo.setDatasetID(currentDatasetID);
					uInfo.setDatasetPath(datasetPath.getText());
					useDatasetMap.put(currentDatasetID, uInfo);
				}else{
					String p = uInfo.getDatasetPath();
					if(p!=null && !p.equals("")){
						datasetPath.setText(p);
					}else{
						if(dType.equalsIgnoreCase(DATA_TYPE_BIZ) || dType.equalsIgnoreCase(DATA_TYPE_COMMON)){				
							datasetPath.setText("record");
						}else{							
							datasetPath.setText("record");
						}
					}
				}
				
				if(dType.equalsIgnoreCase(DATA_TYPE_BIZ) || dType.equalsIgnoreCase(DATA_TYPE_COMMON)){				
					stackLayout.topControl = generalDataMappingConfigComposite;					
					((GeneralDataMappingConfigComposite)generalDataMappingConfigComposite).refreshViewer(currentDatasetID);
				}else if(dType.equalsIgnoreCase(DATA_TYPE_REPORT)){
					stackLayout.topControl = sqlDataMappingConfigComposite;
					DatasetInfo sInfo = sysDatasetMap.get(selectd);
					HashMap<String,String> sqlMap = sInfo.getParamMap();
					((SQLDataMappingConfigComposite)sqlDataMappingConfigComposite).refreshViewer(currentDatasetID ,sqlMap);
				}
				contentComp.layout();

			}

			public void widgetDefaultSelected(SelectionEvent e) {				
			}
		
		});
		
		datasetPath.addModifyListener(new ModifyListener(){
			public void modifyText(ModifyEvent e) {
				String p = ((Text)e.widget).getText();
				//将数据同步到用户MAP中
				if(useDatasetMap.containsKey(currentDatasetID)){
					DatasetInfo dInfo = useDatasetMap.get(currentDatasetID);
					dInfo.setDatasetPath(p);
				}else{
					DatasetInfo dInfo = new DatasetInfo();
					dInfo.setDatasetID(currentDatasetID);
					dInfo.setDatasetPath(p);				
					useDatasetMap.put(currentDatasetID, dInfo);					
					List<FieldInfo> fields = new ArrayList<FieldInfo>();
					useFieldMap.put(currentDatasetID, fields);
				}				
			}
		});
		
	}
	
	public Object getReturnValue() {
		
		Map<String, String> map = new HashMap<String, String>();
		XuiElement mapping = ((XuiElement)this.propertyItem.getOwerElement()).getChildByTagName("mapping");
		XuiDataModel model = mapping.getXuiDataModel();
		
		mapping.removeAllChildren();
		@SuppressWarnings("rawtypes")
		Iterator it = useDatasetMap.entrySet().iterator();
		while(it.hasNext()){
			@SuppressWarnings("unchecked")
			Map.Entry<String, DatasetInfo> entry = (Entry<String, DatasetInfo>) it.next();
			String did = entry.getKey();	
			DatasetInfo dInfo = entry.getValue();
			String dPath = dInfo.getDatasetPath();
			
			List<FieldInfo> fList = useFieldMap.get(did);
			if(fList != null && fList.size() > 0){				
				StringBuffer sbDataset = new StringBuffer();
				
				sbDataset.append("<data id=\"").append(did).append("\"");
				if(!dPath.equals("")){
					sbDataset.append(" path=\"").append(dPath).append("\"");
				}
				sbDataset.append(">");			
				for(FieldInfo f : fList){
					String fName = f.getName();
					String fPath = f.getPath();					
					sbDataset.append("<"+fName +" path=\"").append(fPath).append("\"");
					sbDataset.append("/>");					
				}
				sbDataset.append("</data>");
				
				model.addElement("data", mapping ,null,null, sbDataset.toString(),null); 
			}
		}
		return map;		
	}

	
	public void setPropertyItem(PropertyItem propertyItem) {
		this.propertyItem = propertyItem;
		this.initUserConfig();
		this.initSysConfig();
		this.registerComposite();
		rander();
	}
	
	
	@SuppressWarnings({ "unchecked"})
	private void rander(){
		
		@SuppressWarnings("rawtypes")
		Iterator it = sysDatasetMap.entrySet().iterator();
		while(it.hasNext()){
			Map.Entry<String, DatasetInfo> entry = (Entry<String, DatasetInfo>) it.next();
			String key = entry.getKey();			
			dataList.add(key);
		}
		
		if(dataList.getItemCount()>0){
			dataList.setSelection(0);
			String selectd = dataList.getItem(0);
			DatasetInfo dInfo = sysDatasetMap.get(selectd);
			currentDatasetID = selectd;
			String dType = dInfo.getDatasetType();
			
			DatasetInfo uInfo = useDatasetMap.get(selectd);
			if(uInfo==null){
				//默认为 record
				if(dType.equalsIgnoreCase(DATA_TYPE_BIZ) || dType.equalsIgnoreCase(DATA_TYPE_COMMON)){	
					datasetPath.setText("record");
				}else{
					datasetPath.setText("record");
				}
				uInfo = new DatasetInfo();
				uInfo.setDatasetID(currentDatasetID);
				uInfo.setDatasetPath(datasetPath.getText());
				useDatasetMap.put(currentDatasetID, uInfo);
			}else{
				String p = uInfo.getDatasetPath();
				if(p!=null && !p.equals("")){
					datasetPath.setText(p);
				}else{
					if(dType.equalsIgnoreCase(DATA_TYPE_BIZ) || dType.equalsIgnoreCase(DATA_TYPE_COMMON)){	
						datasetPath.setText("record");
					}else{
						datasetPath.setText("record");
					}
				}
			}
			
			if(dType.equalsIgnoreCase(DATA_TYPE_BIZ) || dType.equalsIgnoreCase(DATA_TYPE_COMMON)){
				stackLayout.topControl = generalDataMappingConfigComposite;					
				((GeneralDataMappingConfigComposite)generalDataMappingConfigComposite).refreshViewer(currentDatasetID);
			}else if(dType.equalsIgnoreCase(DATA_TYPE_REPORT)){
				stackLayout.topControl = sqlDataMappingConfigComposite;
				DatasetInfo sInfo = sysDatasetMap.get(selectd);
				HashMap<String,String> sqlMap = sInfo.getParamMap();
				((SQLDataMappingConfigComposite)sqlDataMappingConfigComposite).refreshViewer(currentDatasetID ,sqlMap);
			}
			contentComp.layout();
		}

	}
	
	
	
	/**
	 * 只支持 bizData commonData reportData
	 */
	private void initSysConfig(){
		XuiElement xuiWindowE = getWindowXuiElement((XuiElement)this.propertyItem.getOwerElement());
		List<XuiElement> dataXuiList = xuiWindowE.getAllChildrenByComponentType("data");
		for(int i=0; i<dataXuiList.size(); i++){
			XuiElement dataXuiE = dataXuiList.get(i);
			
			String component = dataXuiE.getProperyValue("component");
			
			if(component.indexOf(XBL_COMPONENT_REPORT_DATA)!=-1){
				
				DatasetInfo dInfo =new DatasetInfo(); 
				String dataId = dataXuiE.getProperyValue("id");
				String p = dataXuiE.getProperyValue("path");
				if(p!=null && !p.equals("")){
					dInfo.setDatasetID(dataId);
				}
				dInfo.setDatasetPath(p);
				dInfo.setDatasetType(DATA_TYPE_REPORT);				
				
				HashMap<String,String> paramMap = new HashMap<String,String>();
				
				XuiElement sqlXuiE = dataXuiE.getChildListByTagName("SQL").get(0);
				if(sqlXuiE != null){
					List<XuiElement>  cList = sqlXuiE.getChildren();
					for(XuiElement e : cList){
						String dbType = e.getOriginalTagName();						
						String sqlText = W3cDocumentHelper.getText(e.getOriginElement());
						if(sqlText == null){
							sqlText = "";
						}
						sqlText = formatSQLText(sqlText);					
						paramMap.put(dbType, sqlText);
					}
				}
				dInfo.setParamMap(paramMap);

				sysDatasetMap.put(dataId, dInfo);
				
				List<FieldInfo> fields = new ArrayList<FieldInfo>();				
				sysFieldMap.put(dataId, fields);

			}else if(component.indexOf(XBL_COMPONENT_BIZ_DATA)!=-1){	
				DatasetInfo dInfo =new DatasetInfo(); 
				String dataId = dataXuiE.getProperyValue("id");
				dInfo.setDatasetID(dataId);
				sysDatasetMap.put(dataId, dInfo);
				
				dInfo.setDatasetType(DATA_TYPE_BIZ);
				
				List<FieldInfo> fields = new ArrayList<FieldInfo>();
				sysFieldMap.put(dataId, fields);
				
				DataSet ds = XuiDataSourceManager.getDataRelationDataSet(dataXuiE);				
				List<DataRecord> rcList = ds.getData();
				for(DataRecord rc:rcList){
					String relation = (String) rc.getValue(ModelConstant.NAME);
					String label = (String) rc.getValue(ModelConstant.LABEL);
					FieldInfo fInfo = new FieldInfo();
					fInfo.setName(relation);
					fInfo.setPath(relation);
					fInfo.setLabel(label);
					fields.add(fInfo);
				}
				
			}else if(component.indexOf(XBL_COMPONENT_COMMON_DATA)!=-1){
				DatasetInfo dInfo =new DatasetInfo(); 
				String dataId = dataXuiE.getProperyValue("id");
				dInfo.setDatasetID(dataId);
				sysDatasetMap.put(dataId, dInfo);
				dInfo.setDatasetType(DATA_TYPE_COMMON);
				DataSet ds = XuiDataSourceManager.getDataRelationDataSet(dataXuiE);	
				List<FieldInfo> fields = new ArrayList<FieldInfo>();
				List<DataRecord> rcList = ds.getData();
				for(DataRecord rc:rcList){
					String relation = (String) rc.getValue(ModelConstant.NAME);
					String label = (String) rc.getValue(ModelConstant.LABEL);
					FieldInfo fInfo = new FieldInfo();
					fInfo.setName(relation);
					fInfo.setPath(relation);
					fInfo.setLabel(label);
					fields.add(fInfo);
				}
				sysFieldMap.put(dataId, fields);
			}
		}
		
	}
	
	/**
	 * 用户配置信息
	 */
	private void initUserConfig(){
		XuiElement mapping = ((XuiElement)this.propertyItem.getOwerElement()).getChildByTagName("mapping");
		List<XuiElement> xes = mapping.getChildListByTagName("data");
		if (!xes.isEmpty()){
			for (XuiElement xe: xes){
				String datasetId = xe.getProperyValue("id");
				String datasetPath = xe.getProperyValue("path");							
				DatasetInfo dInfo =new DatasetInfo(); 
				dInfo.setDatasetID(datasetId);
				dInfo.setDatasetPath(datasetPath);				
				useDatasetMap.put(datasetId, dInfo);				
				List<XuiElement> xefields =  xe.getChildren();
				if (!xefields.isEmpty()){
					List<FieldInfo> fields = new ArrayList<FieldInfo>();					
					for (XuiElement field: xefields){
						String fName = field.getOriginalTagName();
						String fPath = field.getProperyValue("path");
						FieldInfo fInfo = new FieldInfo();
						fInfo.setName(fName);
						fInfo.setPath(fPath);
						fields.add(fInfo);
					}					
					useFieldMap.put(datasetId, fields);
				}
			}
		}		
	}
	
	private void registerComposite(){
		generalDataMappingConfigComposite = new GeneralDataMappingConfigComposite(contentComp,SWT.NONE,sysFieldMap,useFieldMap);
		sqlDataMappingConfigComposite = new SQLDataMappingConfigComposite(contentComp,SWT.NONE,useFieldMap);
	}
	
	/**
	 * 验证
	 * @param propertyItem
	 * @return
	 */
	public static String beforeOpen(PropertyItem propertyItem){
		XuiElement xuiWindowE = getWindowXuiElement((XuiElement)propertyItem.getOwerElement());
		List<XuiElement> dataXuiList = xuiWindowE.getAllChildrenByComponentType("data");
		if (dataXuiList.size()==0){
			return "请先设置数据源！";
		}	
		return null;
	}
	
	private static XuiElement getWindowXuiElement(XuiElement xuiChildE){
		if(xuiChildE == null){
			return null;
		}
		String bindingComponent = xuiChildE.getBindingComponent();
		if(null!=bindingComponent && bindingComponent.equalsIgnoreCase("$UI/system/components/justep/window/window")){
			return xuiChildE;
		}else{
			return getWindowXuiElement(xuiChildE.getParentElement());
		}
	}
	
	private String formatSQLText(String srcT){
		String newS = "";
		int size = 70;
		int len = srcT.length();		
		int n = 0;
		while(true){			
			if(n >= len || n+size >= len){
				newS += srcT.substring(n,len);
				newS +="\n";
				break;
			}			
				
			newS += srcT.substring(n, n+size);
			newS +="\n";
			n+=size;
		
		}
		return newS;
	}
	
	public String isValid() {
		return null;
	}
	
	public void setReturnValueStrategy(IPropertyValueStrategy strategy) {		
	}
}
