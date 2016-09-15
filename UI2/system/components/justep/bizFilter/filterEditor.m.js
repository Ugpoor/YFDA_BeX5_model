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
		
		var filterJSON = null;
		if (this.openMode.get() == "newPattern") {
			patternData.newData({
				"defaultValues" : [{
					"sProcess" : this.filterContext.process,
					"sActivity" : this.filterContext.activity,
					"sInstance" : this.filterContext.instance,
					"sPerson" : this.getContext().getOperatorID(),
					"sName" : "新建查询模板"
				}]
			});
		} else if (this.openMode.get() == "editPattern") {
			patternData.setFilter("idFilter", "SA_FilterPattern = '" + event.data.patternID + "'");
			patternData.refreshData({"async": false, "confirm": false});
			filterJSON = patternData.val("sContent");
		} else {
			filterJSON = event.data.filterJSON;
		}
		this.refreshListData(filterJSON);
	};

	Model.prototype.refreshListData = function(filterJSON) {
		var listTable = FilterUtils.createFilterTable(filterJSON, this.filterContext.filterData);
		this.comp("listData").loadData(listTable);
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
		this.comp("exprDialog").open({
			"data" : {
				"filterData" : this.filterContext.filterData,
				"filterCols" : this.filterContext.filterCols
			}
		});
	};

	Model.prototype.editExprBtnClick = function(event) {
		var row = event.bindingContext.$object;
		this.comp("exprDialog").open({
			"data" : {
				"filterData" : this.filterContext.filterData,
				"filterCols" : this.filterContext.filterCols,
				"exprID" : row.val("id"),
				"exprObject" : {
					"col" : row.val("col"),
					"operator" : row.val("operator"),
					"value" : row.val("value")
				}
			}
		});
	};

	Model.prototype.exprDialogReceive = function(event) {
		var listData = this.comp("listData");
		var exprID = event.data.exprID;
		var exprObject = event.data.exprObject;

		var col = exprObject.col;
		var label = exprObject.label;
		var type = exprObject.type;
		var relation = exprObject.relation;
		var operator = exprObject.operator;
		var value = exprObject.value;
		
		var exprObj = FilterUtils.createExpr(exprObject);
		
		var expr = exprObj.expr_ch;
		var exprKSQL = exprObj.expr_ksql;

		var listRow = null;
		if (exprID) {
			listRow = listData.getRowByID(exprID);
			listRow.val("col", col);
			listRow.val("label", label);
			listRow.val("type", type);
			listRow.val("relation", relation);
			listRow.val("operator", operator);
			listRow.val("value", value);
			listRow.val("expr", expr);
			listRow.val("exprKSQL", exprKSQL);
		} else {
			listData.newData({
				defaultValues : [ {
					"id" : justep.UUID.createUUID(),
					"col" : col,
					"label" : label,
					"type" : type,
					"relation" : relation,
					"operator" : operator,
					"value" : value,
					"expr" : expr,
					"exprKSQL" : exprKSQL,
					"logic" : "AND",
					"leftBracket" : false,
					"rightBracket" : false
				} ]
			});
		}
	};

	Model.prototype.getFilterObject = function() {
		var result = [];
		var bracket = 0;
		var getValue = function(row,type) {
			type = type.toLowerCase();
			var ret = row.val("value");
			return type=='date'?justep.Date.toString(ret, justep.Date.STANDART_FORMAT_SHOT):(type=='time'?justep.Date.toString(ret, justep.Date.STANDART_TIME_FORMAT):(type=='datetime'?justep.Date.toString(ret, justep.Date.STANDART_FORMAT):ret));
		};
		var listData = this.comp("listData");
		listData.each(function(data) {
			var row = data.row;
			bracket = bracket + (row.val("leftBracket") ? 1 : 0) - (row.val("rightBracket") ? 1 : 0);
			if (bracket < 0)
				throw new Error("左右括号个数不匹配");
			result.push({
				"col" : row.val("col"),
				"label" : row.val("label"),
				"type" : row.val("type"),
				"relation" : row.val("relation"),
				"operator" : row.val("operator"),
				"value" : getValue(row,row.val("type")),
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
	
	return Model;
});