import java.util.Map;

import com.justep.studio.ui.editors.xui.XuiDataModel;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.editors.xui.OperationComponent;

public class BizData extends OperationComponent {
//	static int filterNO = 0;
//	static int aggregateNO = 0;
//	static int calculateNO = 0;
//
//	public Map<?, ?> editRule(XuiElement currentElement) {
//		return Data.doEditRule(currentElement);
//	}
//
//	public Map<?,?> newFilter(XuiElement currentE) {
//		String elementName = "filter";
//		XuiDataModel model = currentE.getXuiDataModel();
//		XuiElement newE = model.addElement(elementName, currentE, null);
//		newE.setPropertyValue("name", "filter" + (filterNO++));
//		this.getDesigner().getEditorPart().getTreeViewer().refresh();
//		return null;
//	}
//
//	public Map<?,?> newCalculate(XuiElement currentE) {
//		String elementName = "calculate-relation";
//		XuiDataModel model = currentE.getXuiDataModel();
//		XuiElement newE = model.addElement(elementName, currentE, null);
//		newE.setPropertyValue("relation", "calculate" + (calculateNO++));
//		this.getDesigner().getEditorPart().getTreeViewer().refresh();
//		return null;
//	}
//
//	public Map<?,?> newAggregate(XuiElement currentE) {
//		String elementName = "aggregate-relation";
//		XuiDataModel model = currentE.getXuiDataModel();
//		XuiElement newE = model.addElement(elementName, currentE, null);
//		newE.setPropertyValue("relation", "aggregate" + (aggregateNO++));
//		this.getDesigner().getEditorPart().getTreeViewer().refresh();
//		return null;
//	}

	public boolean validate(XuiElement xuiElement) {
		boolean result = true;
		return result;
	}

}
