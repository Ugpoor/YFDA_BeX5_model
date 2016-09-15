import java.util.List;

import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.ui.xml.XMLConstants;
import com.justep.ui2.system.component.data.BaseDataUtils;



public class BaasData extends Data {
	public static final String BAAS_DATA_URL = "$UI/system/components/justep/data/baasData";
	protected static final String FILTER_ELEMENT = "filter";
	protected static final QName FILTER_QNAME = new QName(FILTER_ELEMENT, XMLConstants.XHTML_NAMESPACE);
	
	protected String getURl(){
		return BAAS_DATA_URL;
	}

	protected String getDataClassName() {
		return "__BaasData__";
	}

	protected JSONObject processDataConfig(){
		JSONObject cfg = super.processDataConfig();
		Element ele = dataDef.getDataDef();
		//增加tableName定义
		cfg.put("queryAction", ele.attributeValue("queryAction"));
		cfg.put("newAction", ele.attributeValue("createAction"));
		cfg.put("saveAction", ele.attributeValue("saveAction"));
		cfg.put("tableName", ele.attributeValue("tableName"));
		cfg.put("url", ele.attributeValue("url"));
		
		return cfg;
	}
	
	protected Object getOrderByDef() {
		//*  orderBys : "[{'relation':'sName','type':1},...]",
		String orderBy = dataDef.getDataDef().attributeValue("orderBy");
		if (!BaseDataUtils.isStringEmpty(orderBy)) {
			JSONArray def = new JSONArray();
			String[] orderBys = orderBy.split(",");
			for (int i = 0; i < orderBys.length; i++) {
				JSONObject o = new JSONObject();
				String s = orderBys[i];
				String[] s1 = s.split(":");
				if(s1.length<=1) s1 = s.split(" ");
				o.put("relation", s1[0]);
				o.put("type", (s1.length <= 1 ? 1 : "desc".equalsIgnoreCase(s1[1]) ? 0 : 1));
				def.add(o);
			}
			return def;
		}else return null;		
	}
	
	protected JSONObject getFiltersDef() {
		//		 *  filters : "{'filterID':filter,...}",
		@SuppressWarnings("unchecked")
		List<Element> filterEs = dataDef.getDataDef().elements(FILTER_QNAME);
		if(!filterEs.isEmpty()){
			JSONObject def = new JSONObject();
			
			for (Element filterE : filterEs) {
				String name = filterE.attributeValue("name");
				String text = filterE.getTextTrim();
				if (!BaseDataUtils.isStringEmpty(name)) {
					def.put(name, text);
				}
			}
			return def;
		}else return null;
	}	
}
