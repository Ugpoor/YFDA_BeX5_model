import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;

import com.justep.studio.model.ModelManager;
import com.justep.studio.ui.editors.xui.XuiDataModel;

import com.justep.studio.ui.commonpanel.kql.KSQLMainComposite;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiElement;

public class KSQLDataSourceComposite extends Composite{
	
	private PropertyItem propertyItem;
	private KSQLMainComposite ksqlComposite;
	
	public KSQLDataSourceComposite(Composite parent, int style ,PropertyItem propertyItem,String dataModel,String fnModel,String ksqlText) {
		super(parent, style);
		this.propertyItem = propertyItem;
		setLayout(new FillLayout());
		
/*		String ksqText = "";		
		XuiElement sourceE = ((XuiElement)this.propertyItem.getOwerElement()).getChildByTagName("source");
		if(sourceE != null){
			XuiElement ksqlE = sourceE.getChildByTagName("KSQL");
			if(ksqlE != null){
				ksqText = W3cDocumentHelper.getText(ksqlE.getOriginElement());
			}			
		}
*/		
		String filePath = ((XuiDataModel)this.propertyItem.getOwerElement().getDataModel()).getFilePath();
		boolean extSpace = ModelManager.isInExtSpace(filePath, true);
		
		ksqlComposite = new KSQLMainComposite(this,dataModel,fnModel,ksqlText,extSpace);
	}

	public void saveSelfConfig(XuiElement ksqlE){
		String ksql = (((KSQLMainComposite)ksqlComposite).getKSQL()).toString();
		ksqlE.setText(ksql);
	}

	public PropertyItem getPropertyItem() {
		return propertyItem;
	}

	public void setPropertyItem(PropertyItem propertyItem) {
		this.propertyItem = propertyItem;
	}

	public KSQLMainComposite getKsqlComposite() {
		return ksqlComposite;
	}

	public void setKsqlComposite(KSQLMainComposite ksqlComposite) {
		this.ksqlComposite = ksqlComposite;
	}
	
	
}
