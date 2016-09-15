import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Table;

import com.justep.studio.data.DSUtil;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.ui.editors.xui.IPropertyDialogPage;
import com.justep.studio.ui.editors.xui.IPropertyValueStrategy;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.exjface.DataSetTableViewer;


public class ReportDataListConfigDialog extends Composite implements IPropertyDialogPage {
	
	private DataSet dataSet;
	private DataSetTableViewer tableViewer;
	private PropertyItem propertyItem;
	private Group group;
	
	public static final String DATA_BIZ_TYPE="data.xbl.xml#bizData";
	public static final String DATA_COMMON_TYPE="data.xbl.xml#data";
	public static final String DATA_REPORT_TYPE="reportData.xbl.xml#data";
	
	public ReportDataListConfigDialog(Composite parent, int style) {
		super(parent, style);
		final FillLayout fillLayout_1 = new FillLayout();
		fillLayout_1.spacing = 2;
		fillLayout_1.marginWidth = 2;
		fillLayout_1.marginHeight = 2;
		setLayout(fillLayout_1);

		group = new Group(this, SWT.NONE);
		final FillLayout fillLayout = new FillLayout();
		fillLayout.marginHeight = 2;
		fillLayout.marginWidth = 2;
		fillLayout.spacing = 2;
		group.setLayout(fillLayout);
		group.setText("数据源选择");

		this.dataSet = createDataSet();
		tableViewer = new DataSetTableViewer(group, SWT.BORDER | SWT.FULL_SELECTION);
		tableViewer.setDataSet(this.dataSet);
		Table table = tableViewer.getTable();
		table.setLinesVisible(true);
		table.setHeaderVisible(true);
		if (tableViewer.getTable().getItemCount() > 0) {
		}
		tableViewer.getTable().setFocus();
		tableViewer.getTable().select(0);
		tableViewer.updateSelectionData();
		this.setSize(400, 270);

	}

	
	private DataSet createDataSet() {
		DataSet ds = new DataSet();
		DSUtil.createSelectedColumn(ds);
		DSUtil.createColumn(ds, "did", "名称", "string", false, true, 180);
		DSUtil.createColumn(ds, "dtype", "类型", "string", false, true, 100);
		return ds;
	}
	
	public Object getReturnValue() {
		//XuiElement dataListE = ((XuiElement)this.propertyItem.getOwerElement());
		//dataListE.getOriginElement().setAttribute("data-list", "");		
		String dids = "";
		List<DataRecord> drList = this.dataSet.getDataRecords();
		for(DataRecord dr : drList){
			if(dr.getBoolean(DSUtil.SELECTED)){				
				String did = dr.getString("did");
				dids += did;
				dids += ",";
			}
		}		
		if(dids != ""){
			dids = dids.substring(0, dids.length()-1);
		}		
		//dataListE.getOriginElement().setAttribute("data-list", dids);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("dataList", dids);
		return map;
	}

	public String isValid() {
		return null;
	}

	public void setPropertyItem(PropertyItem propertyItem) {
		this.propertyItem = propertyItem;
		this.dataSet.getDataRecords().clear();
		
		XuiElement dataListE = ((XuiElement)this.propertyItem.getOwerElement());
		String dataliststr = dataListE.getOriginElement().getAttribute("dataList");		
		String [] dids = dataliststr.split(",");
		
		XuiElement xuiWindowE = getWindowXuiElement(dataListE);
		List<XuiElement> dataXuiList = xuiWindowE.getAllChildrenByComponentType("data");
		for(int i=0; i<dataXuiList.size(); i++){
			XuiElement dataXuiE = dataXuiList.get(i);
			String dataId = dataXuiE.getProperyValue("xid");
			String component = dataXuiE.getProperyValue("component");
			String dataType = "reportData";
			if(component.endsWith(DATA_BIZ_TYPE)){
				dataType = "bizData";
			}else if(component.endsWith(DATA_COMMON_TYPE)){
				dataType = "commData";
			}else if(component.endsWith(DATA_REPORT_TYPE)){
				dataType = "reportData";
			}
			
			boolean b = false;
			for(String did :dids){
				if(did.equals(dataId)){
					b = true;
					break;
				}
			}
			Object[] values = new Object[] {b,dataId,dataType};
			dataSet.addRecord(values);
		}
		
		tableViewer.setDataSet(this.dataSet);
		tableViewer.refresh();
		
		
		
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
	
	public void setReturnValueStrategy(IPropertyValueStrategy arg0) {
		
	}

}
