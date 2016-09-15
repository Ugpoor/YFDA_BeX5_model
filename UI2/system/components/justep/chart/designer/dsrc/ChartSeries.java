import com.justep.studio.ui.editors.xui.BaseComponent;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ChartSeries extends BaseComponent {

	/**
	 * 删除
	 */
	public void remove(XuiElement currentElement) {
		XuiElement parentElement = currentElement.getParentElement();
		super.remove(currentElement);
		render(parentElement);
	}

	public void repaint(){
		render(this.getXuiElement().getParentElement());
	}

	/**
	 * 前台渲染
	 * @param currentElement
	 */
	private void render(XuiElement currentElement){
		
		//图表-资源文件更新
		XuiElement cE = currentElement.getParentElement().getParentElement();
		cE.getComponent().repaint();
	}
	
}
