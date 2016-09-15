import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.ui.component.ComponentTemplate;


public class ProcessChart implements ComponentTemplate{
	public static final String XID = "xid";
	private static final Map<String, String> items = new LinkedHashMap<String, String>();
	private static final String TRACK = "track";
	private static final String PERT = "pert";
	static {
		items.put("已经过", "x-track-line x-track-finished-line");
		items.put("未经过", "x-track-line x-track-no-execute-line");
		items.put("回退", "x-track-line x-track-back-line");
		items.put("当前", "x-track-activity x-track-active-activity");
		items.put("完成", "x-track-activity x-track-finished-activity");
		items.put("终止", "x-track-activity x-track-abort-activity");
		items.put("暂停", "x-track-activity x-track-suspend-activity");
	}
	
	/*
	 */
	private static final String TABS = "" +
			"<ul component='$UI/system/components/bootstrap/navs/navs' class='nav nav-tabs'>" +
			"	<li class='active'>" +
			"		<a bind-click='$model.comp(\"%1$s\").showTrack.bind($model.comp(\"%1$s\"))'>轨迹图</a>" +
			"   </li>" +
			"   <li>" +
			"       <a bind-click='$model.comp(\"%1$s\").showPert.bind($model.comp(\"%1$s\"))' >波特图</a>" +
			"   </li>" +
			"</ul>";
	
	
	private void addTabs(Element bound){
		Element tabs = readTemplate(String.format(TABS, bound.attributeValue(XID)));
		bound.add(tabs);
	}

	private Element readTemplate(String template){
		SAXReader reader = new SAXReader();
		ByteArrayInputStream in = null;
		try {
			in = new ByteArrayInputStream(template.getBytes("UTF-8"));
			return reader.read(in).getRootElement();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage() + "", e);
		}finally{
			try {
				if (in!=null) in.close();
			} catch (IOException e) {
			}
		}
	}

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		String xid = bound.attributeValue(XID);
		if ((xid==null) || xid.equals("")){
			xid = UUID.randomUUID().toString().replaceAll("-", "");
			bound.addAttribute(XID, xid);
		}
		
		bound.clearContent();
		
		String contentsType = bound.attributeValue("contents");
		if (contentsType!=null) contentsType = contentsType.trim();
		if (!TRACK.equalsIgnoreCase(contentsType)
				&& !PERT.equalsIgnoreCase(contentsType)){
			addTabs(bound);
		}
		Element contents = bound.addElement("div");
		contents.addAttribute("component", "$UI/system/components/justep/contents/contents");
		contents.addAttribute("xid", xid + "_contents");
		contents.addAttribute("class", "x-contents x-full");
		contents.addAttribute("active", "0");
		contents.addAttribute("slidable", "false");
		contents.addAttribute("swipe", "false");
		if (!TRACK.equalsIgnoreCase(contentsType)
				&& !PERT.equalsIgnoreCase(contentsType)){
			contents.addAttribute("style", "top:40px");
		}
		
		if (!PERT.equalsIgnoreCase(contentsType)){
			Element trackContent = contents.addElement("div");
			trackContent.addAttribute("xid", xid + "_trackContent");
			//x-flex x-flex-column 
			trackContent.addAttribute("class", "x-contents-content active  x-scroll-h");
			
			addTrackNode(trackContent, xid);
		}
		
		if (!TRACK.equalsIgnoreCase(contentsType)){
			Element pertContent = contents.addElement("div");
			pertContent.addAttribute("xid", xid + "_pertContent");
			pertContent.addAttribute("class", "x-contents-content  x-scroll-h");
			addPertNode(pertContent, xid);
		}
	}
	
	private void addPertNode(Element parent, String xid){
		Element pertNode = parent.addElement("div").addElement("div");
		pertNode.addAttribute("class", "x-pert");
		pertNode.addAttribute("xid", xid + "_pert");
	}
	
	private void addTrackNode(Element parent, String xid){
		Element container = parent.addElement("div");
		// x-flex1
		container.addAttribute("class", "x-track-container");
		container.addAttribute("xid", xid + "_trackContainer");
		
		
		/*
		 <a component="$UI/system/components/justep/button/button" label="图例"
		           class="btn btn-link btn-icon-left pull-right" icon="glyphicon glyphicon-question-sign" 
		           onClick="{operation: 'processChart.toggleHelp'}"> 
		           <i class="glyphicon glyphicon-question-sign" />  
		           <span>图例</span> 
		         </a> 
		 */
		Element btn = parent.addElement("div").addElement("a");
		btn.addAttribute("component", "$UI/system/components/justep/button/button");
		btn.addAttribute("label", "图例");
		btn.addAttribute("class", "btn btn-link btn-icon-left");
		btn.addAttribute("icon", "glyphicon glyphicon-question-sign");
		btn.addAttribute("onClick", "{operation: '" + xid + ".toggleHelp'}");
		btn.addElement("i").addAttribute("class", "glyphicon glyphicon-question-sign");
		btn.addElement("span").addText("图例");
		Element helpNode = parent.addElement("div");
		helpNode.addAttribute("class", "x-track-help container-fluid");
		Object[] names = (Object[])items.keySet().toArray();
		Element row = helpNode.addElement("div");
		row.addAttribute("class", "row");
		for (int i=0; i<names.length; i++){
			Element value1 = row.addElement("div");
			value1.addAttribute("class", "col-xs-3 col-md-1");
			value1.addElement("div").addAttribute("class", items.get(names[i]));

			Element label1 = row.addElement("div");
			label1.addAttribute("class", "col-xs-3 col-md-1");
			label1.addElement("label").addText((String)names[i]);
		}
	}
}
