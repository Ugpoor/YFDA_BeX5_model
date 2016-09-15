package com.justep.chart.validate;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;


public class ValidateHelper extends Validate{

	private String validateLevel = ValidateConstant.CHART_VALIDATE_LEVEL_ERROR;
	private ArrayList<ValidateResult> validateList = new ArrayList<ValidateResult>();
	private String chartString;
	private Document chartDoc;
	
	public ValidateHelper(String chartString, String validateLevel) {
		this.chartString = chartString;
		this.validateLevel = validateLevel;
		if (this.chartString != null) {
			try {
				chartDoc = DocumentHelper.parseText(this.chartString);
			} catch (DocumentException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ValidateHelper(Document chartDoc, String validateLevel) {
		this.chartDoc = chartDoc;
		this.validateLevel = validateLevel;
	}

	public void executeValidate() {
		executeBaseRuleValidate();
		executeRuleValidate(this.chartDoc.getRootElement(), "" , "" ,"base");
	}
	
	/**
	 * 基础框架级别验证
	 */
	public void executeBaseRuleValidate(){
		Document baseFrameRuleDoc = ValidateRuleManager.generateRuleDoc("base-frame");
		Element rootE = baseFrameRuleDoc.getRootElement();
		executeBaseFrameRuleValidate(rootE,this.chartDoc.getRootElement(),"",false);
	}
	
	
	/**
	 * 非空验证-验证必要的节点或属性是否存在 
	 * @param ruleNode
	 * @param realNode
	 * @param flag
	 */
	@SuppressWarnings("unchecked")
	private void executeBaseFrameRuleValidate(Element ruleNode ,Element realNode , String path ,boolean isRepeat){
		String nodeName = ruleNode.getName();
		if(!isRepeat){
			path += "/"+nodeName;
		}

		if(nodeName.equals("div")){
			String id = realNode.attributeValue("xid");
			path += "[@xid='"+id+"']";
		}
		
		String nodeAllowRepeat = ruleNode.attributeValue("allow-repeat");
		if(nodeAllowRepeat != null && nodeAllowRepeat.equals("true")){
			Element ruleNodeCloneE = (Element)ruleNode.clone();
			ruleNodeCloneE.addAttribute("allow-repeat", "false");
			List<Element> eList = realNode.selectNodes(path);
			for(int i=0; i<eList.size(); i++){
				String repeatPath = path + "["+(i+1)+"]";
				executeBaseFrameRuleValidate(ruleNodeCloneE,realNode,repeatPath,true);
			}
		}else{
			//当前节点分析	
			Element e = (Element) realNode.selectSingleNode(path);
			if(e == null){
				String level = ruleNode.attributeValue("level");
				String errInfo = ruleNode.attributeValue("error-info");
				ValidateResult vr = new ValidateResult();
				vr.setName(nodeName);
				vr.setLevel(level);
				vr.setPath(path);
				vr.setInfo(errInfo);
				this.validateList.add(vr);
			}			
			
			//当前节点属性分析 
			List<Element> attList = ruleNode.elements("attribute");
			for(Element att :attList){
				String attName = att.attributeValue("name");
				String currentAttPath =  path+"/@"+attName;
				Attribute a = (Attribute) realNode.selectSingleNode(currentAttPath);
				if(a == null){
					String level = att.attributeValue("level");
					String errInfo = att.attributeValue("error-info");
					ValidateResult vr = new ValidateResult();
					vr.setName(nodeName);
					vr.setLevel(level);
					vr.setPath(currentAttPath);
					vr.setInfo(errInfo);
					this.validateList.add(vr);
				}
			}		
			
			//当前节点子节点分析 
			List<Element> nodeList = ruleNode.elements();
			for(Element ee : nodeList){
				String name = ee.getName();
				if(!name.equals("attribute")){
					executeBaseFrameRuleValidate(ee ,realNode ,path ,false);
				}
			}
		}
	}
	
	/**
	 * 规则验证 -逐个遍历节点和属性
	 * @param e
	 * @param path
	 * @param rulePath
	 * @param ruleType
	 */
	@SuppressWarnings("unchecked")
	public void executeRuleValidate(Element e , String path , String rulePath , String ruleType){
		String eName = e.getName();
		path += "/" + eName; 
		
		if(eName.equals("div")){
			String id = e.attributeValue("xid");
			path += "[@xid='"+id+"']";
		}
		
		rulePath += "/" + eName; 
		if(eName.equals("series")){
			String chartType = e.attributeValue("chart-type");
			path +="[@chart-type='"+chartType+"']";
			
			//验证图表类型是否正确
			Attribute att = e.attribute("chart-type");
			String attName = att.getName();
			String attPath = path+"/@"+attName;
			String attRulePath = rulePath +"/@"+attName;
			boolean b = executeAttRuleValidate(att , attPath , attRulePath ,ruleType);
			if(!b){
				return;
			}
			
			ruleType = chartType;
		}
		executeNodeRuleValidate(e , path ,rulePath, ruleType);
		Iterator<?> it = e.attributeIterator();
		while(it.hasNext()){
			Attribute att = (Attribute)it.next();
			String attName = att.getName();
			String attPath = path+"/@"+attName;
			String attRulePath = rulePath +"/@"+attName;
			executeAttRuleValidate(att , attPath , attRulePath ,ruleType);
		}
		List<Element> eList = e.elements();
		for(Element ee : eList){
			executeRuleValidate(ee,path,rulePath,ruleType);
		}		
	}
	
	/**
	 * 节点规则验证
	 * @param e
	 * @param path
	 * @param rulePath
	 * @param ruleType
	 */
	@SuppressWarnings("unchecked")
	public void executeNodeRuleValidate(Element e , String path , String rulePath , String ruleType){
		//System.out.println(rulePath);
		Document ruleDoc = ValidateRuleManager.generateRuleDoc(ruleType);   
		Element ruleE = (Element) ruleDoc.selectSingleNode("//rule[@path='"+rulePath+"']");
		if(ruleE != null){
			String eText = e.getTextTrim();			
			String allowEmpty = ruleE.attributeValue("allow-empty");
			if(allowEmpty != null && !allowEmpty.equals("") && allowEmpty.equals("true") && eText.equals("")){
			}else{				
				List<Element> validateList = ruleE.elements("validate");
				for(Element validate : validateList){
					String rule = validate.attributeValue("rule");
					String scope = validate.attributeValue("scope");
					boolean b = super.validate(eText, rule, scope);
					if(!b){
						ValidateResult vr = new ValidateResult();
						vr.setName(e.getName());
						vr.setLevel(validate.attributeValue("level"));
						vr.setPath(path);
						vr.setInfo(validate.attributeValue("error-info"));
						vr.setSource(eText);
						vr.setRule(rule);
						vr.setScope(scope);
						this.validateList.add(vr);
					}
				}
			}
			
		}
	}
	
	/**
	 * 属性规则验证
	 * @param att
	 * @param attPath
	 * @param rulePath
	 * @param ruleType
	 */
	@SuppressWarnings("unchecked")
	public boolean executeAttRuleValidate(Attribute att ,String attPath , String rulePath , String ruleType){
		boolean b_flag = true;
		Document ruleDoc = ValidateRuleManager.generateRuleDoc(ruleType);
		Element ruleE = (Element) ruleDoc.selectSingleNode("//rule[@path='"+rulePath+"']");
		if(ruleE != null){
			String attValue = att.getValue();
			String allowEmpty = ruleE.attributeValue("allow-empty");
			if(allowEmpty != null && !allowEmpty.equals("") && allowEmpty.equals("true") && attValue.equals("")){
			}else{						
				List<Element> validateList = ruleE.elements("validate");
				for(Element validate : validateList){
					String rule = validate.attributeValue("rule");
					String scope = validate.attributeValue("scope");
					//System.out.println(attValue + "  " + rule  + "  " + scope);
					boolean b = super.validate(attValue, rule, scope);
					if(!b){
						ValidateResult vr = new ValidateResult();
						vr.setName(att.getName());
						vr.setLevel(validate.attributeValue("level"));
						vr.setPath(attPath);
						vr.setInfo(validate.attributeValue("error-info"));
						vr.setSource(attValue);
						vr.setRule(rule);
						vr.setScope(scope);
						this.validateList.add(vr);
						b_flag= false;
					}
				}
			}
		}
		return b_flag;
	}

	public ArrayList<ValidateResult> getValidateList() {
		return validateList;
	}

	public void setValidateList(ArrayList<ValidateResult> validateList) {
		this.validateList = validateList;
	}

	public String getValidateLevel() {
		return validateLevel;
	}

	public void setValidateLevel(String validateLevel) {
		this.validateLevel = validateLevel;
	}

	public Document getChartDoc() {
		return chartDoc;
	}

	public void setChartDoc(Document chartDoc) {
		this.chartDoc = chartDoc;
	}

	public String getChartString() {
		return chartString;
	}

	public void setChartString(String chartString) {
		this.chartString = chartString;
	}
	
}
