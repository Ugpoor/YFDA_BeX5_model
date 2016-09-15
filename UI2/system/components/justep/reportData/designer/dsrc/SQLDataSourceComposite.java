import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import org.dom4j.Element;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.ExtendedModifyEvent;
import org.eclipse.swt.custom.ExtendedModifyListener;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.List;

import com.justep.db.util.ConnectionUtil;
import com.justep.design.model.Model;
import com.justep.design.model.ModelParser;
import com.justep.studio.model.ModelManager;
import com.justep.studio.preference.config.DatasourceModel;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiDataModel;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.util.StudioConfig;
import com.swtdesigner.SWTResourceManager;

public class SQLDataSourceComposite  extends Composite{

	private List list;
	//private KSQLEditComposite text;
	private SQLTextArea text;
	private PropertyItem propertyItem;
	private HashMap<String, String> hm = new HashMap<String, String>();  
	private String dataName; 
	
	public SQLDataSourceComposite(Composite parent, int style ,PropertyItem propertyItem) {
		super(parent, style);
		this.propertyItem = propertyItem;
		initLayout();
		initEvent();
		initDefaultValue();
	}
	
	public void saveSelfConfig(XuiElement sqlE){
		String[] indexs = list.getSelection();
		if(indexs.length>0){
			dataName = indexs[0]; 
		}
		if(dataName!=null && !dataName.equals("")){
			hm.remove(dataName);
			String t = text.getText();
			t = t.replaceAll("\\s+", " ");
			hm.put(dataName, t);
		}
		
		XuiDataModel model = sqlE.getXuiDataModel();
		sqlE.removeAllChildren();
		for (String s : hm.keySet()) {
			String sql = hm.get(s);
			if(!"".equals(sql)) model.addElement(s, sqlE, null, null, "<" + s + "><![CDATA[" + sql + "]]></" + s + ">", null);
		}
	}

	private void initDefaultValue(){
		XuiElement sourceE = ((XuiElement)this.propertyItem.getOwerElement()).getChildByTagName("source");
		if(sourceE != null){
			XuiElement sqlEle = sourceE.getChildByTagName("SQL");
			if(sqlEle != null){
				java.util.List<XuiElement> elelist = sqlEle.getChildren();
				for (XuiElement e : elelist) {
					hm.put(e.getOriginElement().getTagName(), W3cDocumentHelper.getText(e.getOriginElement()));
				}
				
				String[] indexs = list.getSelection();
				if(indexs.length>0){
					dataName = indexs[0]; 
				}
				String sql = hm.get(dataName);
				if(sql==null){
					sql="";
				}
				text.setText(sql);			
			}
		}
	}
	
	private void initLayout(){
		this.setSize(600, 400);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.marginWidth = 1;
		gridLayout.marginTop = 3;
		gridLayout.marginRight = 1;
		gridLayout.marginLeft = 5;
		gridLayout.marginHeight = 1;
		gridLayout.marginBottom = 1;
		gridLayout.numColumns = 2;
		setLayout(gridLayout);
		setData("DEFAULT", "DEFAULT");
		setData("MSSQL", "MSSQL");
		setData("ORACLE", "ORACLE");
		setData("SYBASE", "SYBASE");
		setData("DB2", "DB2");

		final Label label = new Label(this, SWT.NONE);
		label.setText("数据库类型：");
		label.setLayoutData(new GridData(SWT.LEFT, SWT.FILL, false, false));

		final Label label_1 = new Label(this, SWT.NONE);
		label_1.setLayoutData(new GridData(SWT.LEFT, SWT.FILL, true, false));
		label_1.setText("SQL语句：");

 
		list = new List(this, SWT.BORDER);
		final GridData gd_list = new GridData(SWT.FILL, SWT.FILL, false, true);
		gd_list.widthHint = 139;
		list.setLayoutData(gd_list);
		 
		list.setCapture(true);
		list.add("DEFAULT");
		list.add("MSSQL");
		list.add("ORACLE");
		list.add("SYBASE");
		list.add("DB2");
		list.select(0);
		
		text = new SQLTextArea(this, SWT.BORDER);
		text.setFont(SWTResourceManager.getFont("Arial", 10, SWT.NONE));
		text.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true));
		/*
		text = new SQLTextArea(this,SWT.NONE);
		final GridData gd_text = new GridData(SWT.FILL, SWT.FILL, true, true);
		gd_text.heightHint = 237;
		gd_text.widthHint = 472;
		text.setLayoutData(gd_text);
		
		text.setFont(SWTResourceManager.getFont("", 10, SWT.NONE));
		*/
		
	}

	private void initEvent(){
		list.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {				
				if(dataName!=null && !dataName.equals("")){
					hm.remove(dataName);
					String t = text.getText();
					t = t.replaceAll("\\s+", " ");
					hm.put(dataName, t);
				}				
				String[] indexs = list.getSelection();
				if(indexs.length>0){
					dataName = indexs[0]; 
				}
				String sql = hm.get(dataName);
				if(sql==null){
					sql="";
				}
				text.setText(sql);				
			}
		});
		
		text.addExtendedModifyListener(new ExtendedModifyListener() {
			public void modifyText(ExtendedModifyEvent event) {
				SQLUtils.highLight(text, 0, 0);
				dataName = list.getItem(list.getSelectionIndex());
				hm.remove(dataName);
				String t = text.getText();
				t = t.replaceAll("\\s+", " ");
				hm.put(dataName, t);
			}
		});
		
	}
	
	public String isValid(String dataModel){
		String defaultModelName = ((XuiElement)this.propertyItem.getOwerElement()).getXuiDataModel().getModuleName();
		if(dataModel ==null || dataModel.equals("")){
			dataModel = defaultModelName;
		}						
		String basePath = StudioConfig.getBIZPath();
		String filePath = ((XuiDataModel)this.propertyItem.getOwerElement().getDataModel()).getFilePath();
		boolean extSpace = ModelManager.isInExtSpace(filePath, true);
		Model model = ModelParser.parseModel(basePath, dataModel, new HashMap<String, Model>(), true, true,true,null,extSpace);
		if(model.getDataSource() == null){
			return "数据源或数据模型配置错误，当前模块为：" + dataModel;
		}
		DatasourceModel dsModel = new DatasourceModel();							
		String dsName = model.getDataSource().getText();
		dsName = dsName.substring(14, dsName.length());	
		String dsType = dsModel.getDsTypeByDsName(dsName);
		Element dsE = dsModel.getDatasourceTemplateByDsType(dsType);
		if(dsE == null){
			return "SQL语句验证过程中引用的数据源["+dsName+"]配置错误!";
		}else{
			Connection conn = null;
			try {
				conn = ConnectionUtil.getConnectionByDsName(dsName);
				//System.out.println("===="+conn.getMetaData().getDatabaseProductName());
			}catch(Exception e){
				//e.printStackTrace();
				return "SQL语句验证过程中引用的数据源["+dsName+"]配置错误!";
			}finally{
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		String templateREF = dsE.attributeValue(DatasourceModel.TEMPLATE_REF);
		String sqlText = hm.get(templateREF);
		if(sqlText == null || sqlText.equals("")){
		}else{			
			String newSql = "SELECT * FROM (" + sqlText + ") a WHERE 1=0 ";	
			//System.out.println(templateREF + "   " + newSql);
			Connection conn = null;
			try {
				conn = ConnectionUtil.getConnectionByDsName(dsName);
				Statement smt = conn.createStatement();
				smt.executeQuery(newSql);
				conn.close();
			} catch (Exception e) {
				//e.printStackTrace();
				return "SQL语句验证语法错误(数据源["+dsName+"],数据库类型["+templateREF+"])!";
			}finally{
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		
		return null;
	}
}
