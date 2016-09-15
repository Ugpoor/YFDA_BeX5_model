import java.util.HashMap;
import java.util.Map;

import org.eclipse.jface.window.Window;
import org.eclipse.swt.widgets.Shell;

import com.justep.studio.ui.editors.xui.IPropertyDialog;
import com.justep.studio.ui.editors.xui.IPropertyValueStrategy;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.editors.xui.designpanel.WindowDesignPanel;


public class ReportCellFormatPropertyDialog implements IPropertyDialog{
	
	private PropertyItem propertyItem;
	ReportCellFormatDialog dlg;
	Shell shell;
	String format;
	public ReportCellFormatPropertyDialog(Shell shell){
		this.shell = shell;
	}
	public Object getReturnValue() {
		return null;
	}

	public String isValid() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setPropertyItem(PropertyItem propertyItem) {
		this.propertyItem = propertyItem;
		 
	}

	public void setReturnValueStrategy(IPropertyValueStrategy strategy) {
		// TODO Auto-generated method stub
		
	}

	public void open() {
		dlg = new ReportCellFormatDialog(shell,this.propertyItem);
		if(Window.OK==dlg.open()){
			String format = dlg.getFormat();
			Map<String,String> map = new HashMap<String, String>();
			map.put("format", format);
			((XuiElement)propertyItem.getOwerElement()).getXuiDataModel().getDesigner().executeJSMethod(WindowDesignPanel.JSMETHOD_TYPE_SELECTED_COMPONENT, "setCellFormat", map);
		}
		
	}

}
