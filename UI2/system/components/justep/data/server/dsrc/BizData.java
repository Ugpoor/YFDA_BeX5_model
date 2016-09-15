import java.util.List;

import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONArray;
import com.justep.design.model.kql.QRelation;
import com.justep.ui.system.SystemComponentException;
import com.justep.ui.system.UISystemMessages;
import com.justep.ui.xml.XMLConstants;
import com.justep.ui2.system.component.data.BaseDataUtils;
import com.justep.ui2.system.component.data.bizdata.BizDataDef;
import com.justep.ui2.system.component.data.bizdata.BizDataUtils;


public class BizData extends Data {
	protected static final QName COLUMN_QNAME = new QName("column", XMLConstants.XHTML_NAMESPACE);
	public static final String BIZ_DATA_URL = "$UI/system/components/justep/data/bizData";
	private BizDataDef bizDataDef;
	
	protected String getURl(){
		return BIZ_DATA_URL;
	}

	protected String getDataClassName() {
		return "__BizData__";
	}

	protected void createDataDef(){
		try {
			this.bizDataDef = new BizDataDef(eDataDef, context);
			this.dataDef = this.bizDataDef;
		} catch (Exception e) {
			throw SystemComponentException.create(e, UISystemMessages.XBL_DATA_DEFINE_ERROR, xid, e.getMessage());
		}
	}

	private Object getAggDef() {
		//		 *  defAggCols : "{'统计relation 别名':realtion}",
		JSONObject def = new JSONObject();
		List<QRelation> aggs = bizDataDef.getAction().getKql().getAggregateRelationList();
		for (QRelation agg : aggs) {
			def.put(agg.getAlias(),"EXPRESS");
		}
		return def;
	}

	
	/**
	 * 进行定义信息处理
	 * definition格式：
	 * {'queryAction' : "**QueryAction",
	 *  'newAction' : "**CreateAction",
	 *  saveAction  : "**SaveAction",
	 *  dataModel : "...",
	 *  concept : "{'sa_org概念名' : 'p 概念别名',...}",
	 *  idColumn : "'列名，也就是列别名'",
	 *  limit : 20,
	 *  directDelete : true,
	 *  confirmDelete : false,
	 *  confirmDeleteText : "",
	 *  confirmRefresh : false,
	 *  confirmRefreshText : "",
	 *  offset : 0,
	 *  updateMode : "whereVersion",
	 *  orderBys : "{'relation':0,'relation':1}",
	 *  filters : "{'filterID':filter,...}",
	 *  defaultValues : "{'relation别名' : '默认值',...}",
	 *  defCols : "{'relation 别名':{'type 类型':'String','relation 名':'p.sName','label':'','define':'ksql中的define'}}",
	 *  defAggCols : {}
	 *  master : "{'id':'data id','relation':'relation name'}"
	 *  treeOption : "{'isDelayLoad':true,'parentRelation':'父子关联的relation','virtualRootLabel':'','rootFilter':'','nodeKindRelation':'','nodeLevelRelation':''}"
	 * }
	 */
	protected JSONObject processDataConfig(){
		JSONObject cfg = new JSONObject();
		cfg.put("xid", this.xid);
		cfg.put("readonly", getReadonlyDef());
		cfg.put("defCols", getColDef());
		cfg.put("defAggCols", getAggDef());

		cfg.put("queryAction", bizDataDef.getReaderAction());
		cfg.put("newAction", bizDataDef.getCreatorAction());
		cfg.put("saveAction", bizDataDef.getWriterAction());
		cfg.put("dataModel", bizDataDef.getDataModel());
		cfg.put("idColumn", getIdColumn());
		cfg.put("limit", bizDataDef.getLimit());
		cfg.put("offset", bizDataDef.getOffset());
		cfg.put("updateMode", bizDataDef.getUpdateMode());

		cfg.put("directDelete", bizDataDef.isDirectDelete());
		cfg.put("confirmDelete", bizDataDef.isDeleteConfirm());
		cfg.put("confirmDeleteText", bizDataDef.getDeleteConfirmText());
		cfg.put("confirmRefresh", bizDataDef.isRefreshConfirm());
		cfg.put("confirmRefreshText", bizDataDef.getRefreshConfirmText());

		cfg.put("clientFilter", getClientFilter());
		cfg.put("orderBys", getOrderByDef());
		cfg.put("filters", getFiltersDef());
		cfg.put("master", getMasterDataDef());
		if (dataDef.isTree())
			cfg.put("treeOption", getTreeDef());
		cfg.put("defaultValues", getDefaultValueDef());
		cfg.put("autoLoad", dataDef.isAutoLoad());
		if(!bizDataDef.isAutoLoad())cfg.put("autoNew", bizDataDef.isAutoNew());
		cfg.put("events", bizDataDef.getEvents());
		
		return cfg;
	}
	
	protected String getIdColumn() {
		QRelation r = bizDataDef.getIdColumn();
		if (null != r) {
			return r.getAlias();
		} else
			return "";
	}
	
	protected String getRelationLabel(String relation, QRelation r){
		if(null!=relation&&!"".equals(relation)){
			@SuppressWarnings("unchecked")
			List<Element> colEs = bizDataDef.getDataDef().elements(COLUMN_QNAME);
			if(null!=colEs){
				for(Element colE : colEs){
					if(relation.equals(colE.attributeValue("name"))){
						String ret = null;
						ret = colE.attributeValue("label");
						if(null!=ret&&!"".equals(ret)) return ret;
					}
				}
			}
		}
		return r.getLabel();
	}
	
	protected JSONObject getColDef(){
		JSONObject def = new JSONObject();
		List<String> relations = bizDataDef.getRelationList();
		if(null!=relations && !relations.isEmpty()){
			for (String relation : relations) {
				QRelation r = bizDataDef.getRelationRef(relation);
				if (null == r)
					throw SystemComponentException.create(UISystemMessages.XBL_BIZDATA_RELATION_DEFINE_ERROR, xid, relation);
				String type = bizDataDef.getRelationDataType(r);
				String label = getRelationLabel(relation, r);
				
				String realRelationName = r.isRelation() ? BizDataUtils.getQRelationFullName(r) : "EXPRESS";
				String relationDefine = r.isRelation() ? BizDataUtils.getQRelationDefine(r) : "EXPRESS";
				if("blob".equalsIgnoreCase(type)){
					realRelationName = "EXPRESS";
					//relationDefine = "EXPRESS";
				}
				JSONObject relationDef = new JSONObject();
				relationDef.put("type", type);
				relationDef.put("relation", realRelationName);
				relationDef.put("define", relationDefine);
				relationDef.put("isBiz", true);
				relationDef.put("label", label);
				relationDef.put("name", relation);
				relationDef.put("extendType", getExtendTypeDef(relation));
				if("String".equals(type)){
					//字符串增加最大长度定义
					Integer size = bizDataDef.getRelationSize(r);
					if(null!=size)	relationDef.put("size", size);
				}
				relationDef.put("rules", getRuleDef(relation));
				def.put(relation, relationDef);
			}
		}

		//计算列处理
		List<Element> calculateDefs = bizDataDef.getCalculateRelationDefList();
		for (Element calculateItem : calculateDefs) {
			String relation = calculateItem.attributeValue("relation");
			String label = calculateItem.attributeValue("label");
			bizDataDef.getCalculateRelationList().add(relation);

			//js对象的定义生成
			//defCalcRelations : "{'计算relation 别名':{'type 类型':'string'}}",
			String type = "String";
			String s = calculateItem.attributeValue("type");
			if (!BaseDataUtils.isStringEmpty(s)) {
				if (s.split(":").length > 1)
					type = s.split(":")[1];
				else
					type = s;
			}

			JSONObject relationDef = new JSONObject();
			relationDef.put("type", type);
			relationDef.put("relation", "EXPRESS");
			relationDef.put("define", "EXPRESS");
			relationDef.put("label", label);
			relationDef.put("name", relation);
			if("String".equals(type)){
				//字符串增加最大长度定义
				String sSize = calculateItem.attributeValue("size");
				if(!BaseDataUtils.isStringEmpty(sSize)){
					Integer size = Integer.parseInt(sSize);
					if(null!=size)	relationDef.put("size", size);
				}
			}
			relationDef.put("extendType", getExtendTypeDef(relation));
			JSONObject ruleDef = (JSONObject)getRuleDef(relation);
			//if(null==ruleDef) ruleDef = new JSONObject();
			//ruleDef.put("readonly", "js:true");
			relationDef.put("rules", ruleDef);
			def.put(relation, relationDef);
		}

		//idCol处理
		QRelation r = bizDataDef.getIdColumn();
		if (null != r) {
			String name = r.getAlias();
			JSONObject relationDef = new JSONObject();
			relationDef.put("type", bizDataDef.getRelationDataType(r));
			relationDef.put("relation", BizDataUtils.getQRelationFullName(r));
			relationDef.put("define", BizDataUtils.getQRelationDefine(r));
			relationDef.put("label", r.getLabel());
			relationDef.put("name", name);
			relationDef.put("extendType", getExtendTypeDef(name));
			relationDef.put("rules", getRuleDef(name));
			def.put(name, relationDef);
		}

		return def;
	}
	
	

	protected Object getOrderByDef() {
		//*  orderBys : "[{'relation':'sName','type':1},...]",
		String orderBy = bizDataDef.getOrderByDef();
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
		List<Element> filterEs = bizDataDef.getFilterDefList();
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
