/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var FilterUtils = require("./filterUtils");

	var Model = function() {
		this.callParent();
		this.openMode = justep.Bind.observable("editFilter");
		this.isPublicPattern = justep.Bind.observable(false);
	};

/*
	入参数据结构
	"data" : {
		"filterContext" : {
			"process" : 
			"activity : 
			"instance" :  
			"filterData" : 过滤数据对象（bizData）  
			"filterCols" : 过滤列
		}
		"openMode" : editFilter(编辑查询条件) | newPattern(新建查询模板) | editPattern(编辑查询模板)
		"filterJSON" : 无模板时传入过滤数据
		"patternID" : 编辑的模板ID
		"isPublicPattern" : 是否公共模板
	}
	返回数据结构
	{
		"openMode": 
		"filterJSON": 
		"patternID": 
	}
 */
	Model.prototype.receiverReceive = function(event) {
		var patternData = this.comp("patternData");
		patternData.clear();
	
		this.filterContext = event.data.filterContext;

		this.openMode.set(event.data.openMode);
		this.isPublicPattern.set(false);
		
		var filterJSON = null;
		if (this.openMode.get() == "newPattern") {
			var patternRow = patternData.newData({
				"defaultValues" : [{
					"sProcess" : this.filterContext.process,
					"sActivity" : this.filterContext.activity,
					"sInstance" : this.filterContext.instance,
					"sPerson" : this.getContext().getOperatorID(),
					"sName" : "新建查询模板"
				}]
			})[0];
			if (event.data.isPublicPattern) {
				patternRow.val("sPerson", null);
				this.isPublicPattern.set(true);
			} 
		} else if (this.openMode.get() == "editPattern") {
			patternData.setFilter("idFilter", "SA_FilterPattern = '" + event.data.patternID + "'");
			patternData.refreshData({"async": false, "confirm": false});
			var patternRow = patternData.getCurrentRow();
			if (!patternRow.val("sPerson")) {
				this.isPublicPattern.set(true);
			}
			filterJSON = patternData.val("sContent");
		} else {
			filterJSON = event.data.filterJSON;
		}
		this.refreshListData(filterJSON);
		this.comp("relationData").refreshData();
	};

	Model.prototype.refreshListData = function(filterJSON) {
		var listData = this.comp("listData"); 
		var listTable = FilterUtils.createFilterTable(filterJSON, this.filterContext.filterData);
		listData.loadData(listTable);
		listData.each(function(param) {
			var row = param.row;
			var type = row.val("type");
			row.val(type.toLowerCase() + "Value", row.val("value"));
		});
	};

	Model.prototype.relationDataCustomRefresh = function(event){
		var relationTable = FilterUtils.createRelationTable(this.filterContext.filterData, this.filterContext.filterCols);
		event.source.loadData(relationTable);	
	};
	
	Model.prototype.cancelBtnClick = function(event) {
		this.comp("receiver").windowCancel();
	};

	Model.prototype.bracketClick = function(event) {
		var row = event.bindingContext.$object;
		var xid = event.source.$domNode.attr("xid");
		row.val(xid, !row.val(xid));
	};

	Model.prototype.logic2label = function(logic) {
		switch (logic) {
		case "AND":
			return "并且";
		case "OR":
			return "或者";
		default:
			return logic;
		}
	};

	Model.prototype.logicBtnClick = function(event) {
		var row = event.bindingContext.$object;
		var logic = row.val("logic");
		row.val("logic", (logic == "AND") ? "OR" : "AND");
	};

	Model.prototype.addExprBtnClick = function(event) {
		var listData = this.comp("listData");
		listData.newData({
			defaultValues : [ {
				"id" : justep.UUID.createUUID(),
				"operator" : "等于",
				"logic" : "AND",
				"leftBracket" : false,
				"rightBracket" : false
			} ]
		});
	};

	Model.prototype.getFilterObject = function() {
		var result = [];
		var bracket = 0;
		var getValue = function(row,type) {
			type = type.toLowerCase();
			var ret = row.val(type + "Value");
			return type=='date'?justep.Date.toString(ret, justep.Date.STANDART_FORMAT_SHOT):(type=='time'?justep.Date.toString(ret, justep.Date.STANDART_TIME_FORMAT):(type=='datetime'?justep.Date.toString(ret, justep.Date.STANDART_FORMAT):ret));
		};
		var listData = this.comp("listData");
		listData.each(function(param) {
			var row = param.row;
			var index = param.index;
			row.val("value", (row.val("operator").indexOf("为空") != -1) ? "" : getValue(row,row.val("type")));
			if (row.val("col") == "") {
				throw new Error("请选择过滤字段，行数：" + (index + 1));
			}
			if (row.val("operator") == "") {
				throw new Error("请选择比较运算符，行数：" + (index + 1));
			}
			if (row.val("operator").indexOf("为空") == -1 && $.trim(row.val("value")) == "") {
				throw new Error("请输入（或者选择）数据，行数：" + (index + 1));
			}
			
			var exprObj = FilterUtils.createExpr({
				"col" : row.val("col"),
				"label" : row.val("label"),
				"type" : row.val("type"),
				"relation" : row.val("relation"),
				"operator" : row.val("operator"),
				"value" : row.val("value")
			});
			row.val("expr", exprObj.expr_ch);
			row.val("exprKSQL", exprObj.expr_ksql);
			
			bracket = bracket + (row.val("leftBracket") ? 1 : 0) - (row.val("rightBracket") ? 1 : 0);
			if (bracket < 0)
				throw new Error("左右括号个数不匹配");
			result.push({
				"col" : row.val("col"),
				"label" : row.val("label"),
				"type" : row.val("type"),
				"relation" : row.val("relation"),
				"operator" : row.val("operator"),
				"value" : row.val("value"),
				"expr" : row.val("expr"),
				"exprKSQL" : row.val("exprKSQL"),
				"logic" : (row != listData.getLastRow()) ? row.val("logic") : "",
				"leftBracket" : row.val("leftBracket"),
				"rightBracket" : row.val("rightBracket")
			});
		});
		if (bracket !== 0)
			throw new Error("左右括号个数不匹配");
		return result;
	};

	Model.prototype.okBtnClick = function(event) {
		var patternData = this.comp("patternData");
		
		var filterJSON = JSON.stringify(this.getFilterObject());
		var self = this;
		var doSuccess = function() {
			self.comp("receiver").windowEnsure({
				"openMode" : self.openMode,
				"filterJSON" : filterJSON,
				"patternID" : self.patternID
			});
		};
	
		if (this.openMode.get() != "editFilter") {
			patternData.setValue("sContent", filterJSON);
			patternData.setValue("sCreatorID", this.getContext().getOperatorID());
			patternData.setValue("sCreatorName", this.getContext().getOperatorName());
			patternData.setValue("sCreateTime", new Date());

			if (patternData.saveData()) {
				doSuccess();
			};
		} else {
			doSuccess();
		}
	};

	Model.prototype.delExprBtnClick = function(event) {
		var row = event.bindingContext.$object;
		row.data.deleteData([ row ],{async:true});
	};

	Model.prototype.loadPatternBtnClick = function(event) {
		this.comp("patternDialog").open({
			"data" : {
				"filterContext" : this.filterContext
			}
		});
	};

	Model.prototype.patternDialogReceive = function(event) {
		this.refreshListData(event.data.filterJSON);
	};
	
	Model.prototype.listDataValueChanged = function(event){
		var col = event.col;
		var row = event.row;
		var value = event.value;
		
		var relationData = this.comp("relationData"); 
		
		if (col == "col") {
			var relationRow = relationData.getRowByID(value);
			row.val("type", relationRow.val("type"));
			row.val("relation", relationRow.val("relation"));
			if (row.val("type") != "String" && row.val("operator").indexOf("包含") != -1) {
				row.val("operator", "等于");
			}
			row.val(row.val("type").toLowerCase() + "Value", "");
		}
	};
	
	Model.prototype.createOperatorData = function(type) {
		var operators = [
             {"operator":"等于"},{"operator":"不等于"},
             {"operator":"大于"},{"operator":"大于等于"},
             {"operator":"小于"},{"operator":"小于等于"},
             {"operator":"为空"},{"operator":"不为空"}
             ];
		if (type == "String") {
			operators.push({"operator":"包含"},{"operator":"不包含"});
		}
		return operators;
	};
	
	Model.prototype.valueIsDisabled = function(row) {
		return !row || !row.val("col") || !row.val("operator") || row.val("operator").indexOf("为空") != -1;
	};

	Model.prototype.btnSelectValueClick = function(event){
		var row = event.bindingContext.$object;
		row.data.to(row);
		this.comp("selectValueDialog").open({
			"data" : {
				"selectData" : this.filterContext.filterData,
				"selectCol" : row.val("col")
			}
		});
	};

	Model.prototype.selectValueDialogReceive = function(event){
		var listData = this.comp("listData");
		var type = listData.getValue("type");
		listData.setValueByID(type.toLowerCase() + "Value", event.data.value);
	};

	Model.prototype.btnSelectOrgClick = function(event){
		this.comp("orgDialog").open();
	};

	Model.prototype.orgDialogReceive = function(event){
		var orgRow = event.data[0];
		var patternData = this.comp("patternData");
		patternData.setValue("sOrgFID", orgRow.val("sFID") ? orgRow.val("sFID") : null);
		patternData.setValue("sOrgFName", orgRow.val("sFName") ? orgRow.val("sFName") : null);
	};

	return Model;
});