import java.util.HashMap;
import java.util.Map;

import org.eclipse.jface.preference.IPreferenceStore;

import com.justep.designer.service.XuiService;
import com.justep.jetty.embedded.JettyServer;
import com.justep.studio.StudioPlugin2;
import com.justep.studio.preference.X5PreferencePage;
import com.justep.studio.ui.editors.property.dialog.SelectFileTreeDialog;
import com.justep.studio.ui.editors.xui.BaseComponent;
import com.justep.studio.ui.editors.xui.XuiDataModel;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.views.ConsoleView;
import com.justep.studio.util.StudioConfig;
import com.justep.studio.util.XPathUtil;

/**
 * 
 * @author xiangyaohua
 *
 */
public class Resource extends BaseComponent {
	String elementName = "$/UI2/system/components/justep/resource#require";

	/**
	 * 判断url是否存在.
	 * @param currentE 当前节点
	 * @param url require中的url属性
	 * @return
	 */
	public boolean isExsit(XuiElement currentE,String url){
		XuiElement root = currentE.getXuiDataModel().getRootElement();
		ConsoleView.println(url+"--->"+XPathUtil.selectSingleNode(root.getOriginElement(), "//*[@url='"+url+"']"));
		if(XPathUtil.selectSingleNode(root.getOriginElement(), "//*[@url='"+url+"']") == null){
			return false;
		}
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public void addRequire(XuiElement currentE,String filtStr,String prefix){
 
		XuiDataModel model = currentE.getXuiDataModel();
		XuiElement newE = model.addElement(elementName, currentE, null);
		SelectFileTreeDialog dlg = new SelectFileTreeDialog(StudioPlugin2.getShell());
		newE.getPropertyItem("url").setEditorParameter("."+filtStr+"#true#false");
		dlg.setPropertyItem(newE.getPropertyItem("url"));
		dlg.open();
		String href = ((Map<String,String>)dlg.getReturnValue()).get("url");
		if(href!=null){
			if(href.toLowerCase().endsWith("."+filtStr)){
				href = href.substring(0,href.length()-filtStr.length()-1);
			}
			if(!isExsit(currentE,prefix+href)){
				newE.setPropertyValue("url", prefix+href);				
			}else{
				model.deleteElement(newE);
			}
		}else{
			model.deleteElement(newE);
		}
		model.getDesigner().repaintComponent(newE.getParentElement());
		model.getDesigner().getEditorPart().getTreeViewer().refresh();
	}
	
	@SuppressWarnings({ "rawtypes" })
	public Map addJS(XuiElement currentE) {
		addRequire(currentE,"js","");
		return null;
	}
	
	@SuppressWarnings({ "rawtypes"  })
	public Map addCSS(XuiElement currentE) {
		addRequire(currentE,"css","css!");
		return null;
	}
	@SuppressWarnings({"rawtypes" })
	public Map addDir(XuiElement currentE) {
		addRequire(currentE,"dir","res!");
		return null;
	}
	/**
	 * 添加w文件引用.
	 * @param currentE
	 * @return
	 */
	@SuppressWarnings({ "rawtypes"})
	public Map addWFileRef(XuiElement currentE) {
		addRequire(currentE,"w","w!");
		return null;
	}
	
	/**
	 * 添加cordova插件引用
	 * @param currentE
	 * @return
	 */
	@SuppressWarnings({ "rawtypes"})
	public Map addCordovaPlugin(XuiElement currentE) {
		
		XuiDataModel model = currentE.getXuiDataModel();
 
		IPreferenceStore pref = StudioPlugin2.getDefault().getPreferenceStore();
		boolean isDebug = pref.getBoolean(X5PreferencePage.KEY_PROP_EDITOR_TEMPLATE_DEV_DEBUG);

		String uiServerPort = isDebug?StudioConfig.getTomcatPort():(JettyServer.getUIServerPort()+""); 
		Map<String,Object> initParams = new HashMap<String,Object>();
		initParams.put("title","cordova插件选择");
		initParams.put("width","800");
		initParams.put("height","600");
		
		Map<String,Object> context = new HashMap<String,Object>();
		context.put("url", "$UI/system/components/justep/resource/designer/selectCordovaPlugins.w?"+ "UIServerPort="+uiServerPort+"&port=" + JettyServer.getPort() + "&targetPath=" + currentE.getXuiDataModel().getFilePath());
		context.put("currentXuiElement", currentE);
		context.put("pageParams", initParams);
		
		XuiService.openPage(context);
		
		String value = (String)context.get("returnValue");
		if(value != null && !value.equals("")){
			String[] valueItems = value.split(",");
			for(int i = 0;i<valueItems.length;i+=1){
				if(!isExsit(currentE,"cordova!"+valueItems[i])){
					XuiElement newE = model.addElement(elementName, currentE, null);
					newE.setPropertyValue("url", "cordova!"+valueItems[i]);
				}
			}
		}
		model.getDesigner().repaintComponent(currentE);
		model.getDesigner().getEditorPart().getTreeViewer().refresh();
		return null;
	}
}
