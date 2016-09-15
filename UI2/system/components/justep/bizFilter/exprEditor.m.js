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
	};

/*
	入参数据结构
	{
		"filterData" : 过滤数据对象（bizData）  
		"filterCols" : 过滤列
		"exprID" : 表达式行id
		"exprObject" : {
			"col" : 选中关系的别名
			"operator" : 比较运算符
			"value" : 比较值
		}
	}
	返回数据结构
	{
		"exprID" : 
		"exprObject" : {
			"col"
			"label"
			"type"
			"relation"
			"operator"
			"value"
		}
	}
 */
	Model.prototype.receiverReceive = function(event) {
		if (this.filterData != event.data.filterData || this.filterCols != event.data.filterCols) {
			this.filterData = event.data.filterData;
			this.filterCols = event.data.filterCols;
			this.comp("relationList").refresh(true);
		}

		this.exprID = event.data.exprID;
		this.exprObject = event.data.exprObject;

		this.init();
	};

	Model.prototype.relationDataCustomRefresh = function(event){
		var relationTable = FilterUtils.createRelationTable(this.filterData, this.filterCols);
		event.source.loadData(relationTable);	
	};

	Model.prototype.init = function() {
		var relationData = this.comp("relationData");
		var operatorData = this.comp("operatorData");
		var tempData = this.comp("tempData");

		$.each([ "NOT", "=", ">", "<", "LIKE", "IS NULL" ], function(i, n) {
			operatorData.setValueByID("checked", false, n);
		});
		$.each([ "stringValue", "integerValue", "floatValue", "dateValue", "timeValue", "datetimeValue" ], function(i, n) {
			tempData.setValue(n, "");
		});

		var row;
		if (this.exprObject && (row = relationData.getRowByID(this.exprObject.col)) !== null) {
			relationData.to(row);

			// 转换为数组格式
			this.exprObject.operators = FilterUtils.operator_StringToArray(this.exprObject.operator);
			$.each(this.exprObject.operators, function(i, n) {
				operatorData.setValueByID("checked", true, n);
			});

			var type = row.val("type");
			tempData.setValue(type.toLowerCase() + "Value", this.exprObject.value);
		} else {
			relationData.first();
			operatorData.setValueByID("checked", true, "=");
		}
	};

	Model.prototype.operatorBtnMousedown = function(event) {
		var operatorData = this.comp("operatorData");
		var operator = event.currentTarget.name;
		var checked = operatorData.getValueByID("checked", operator);
		operatorData.setValueByID("checked", !checked, operator);
	};

	Model.prototype.operatorBtnIsDisabled = function($element) {
		var relationData = this.comp("relationData");
		var operatorData = this.comp("operatorData");
		var disabled = relationData.val("type") != "String" && $element.name == "LIKE";
		if (disabled && operatorData.getValueByID("checked", $element.name)) {
			operatorData.setValueByID("checked", false, $element.name);
		}
		return disabled;
	};

	Model.prototype.operatorDataValueChange = function(event) {
		if (this._operatorDataValueChanging) {
			return;
		}
		this._operatorDataValueChanging = true;
		try {
			if (event.col == "checked" && event.newValue) {
				// 互斥
				var exclusive = {
					"NOT" : [],
					">" : [ "<", "LIKE", "IS NULL" ],
					"<" : [ ">", "LIKE", "IS NULL" ],
					"=" : [ "LIKE", "IS NULL" ],
					"LIKE" : [ "=", ">", "<", "IS NULL" ],
					"IS NULL" : [ "=", ">", "<", "LIKE" ]
				}[event.row.val("operator")];

				$.each(exclusive, function(i, n) {
					event.source.setValueByID("checked", false, n);
				});
			}
		} finally {
			this._operatorDataValueChanging = false;
		}
	};

	Model.prototype.getSelectedRelationRow = function() {
		var relationRow = this.comp("relationData").getCurrentRow();
		if (!relationRow) {
			throw new Error("请选择过滤字段");
		}
		return relationRow;
	};

	Model.prototype.getSelectedOperators = function() {
		var operators = [];
		this.comp("operatorData").each(function(d) {
			if (d.row.val("checked")) {
				operators.push(d.row.val("operator"));
			}
		});
		if ((operators.length < 1) || (operators.length == 1 && operators[0] == "NOT")) {
			throw new Error("请选择有效的运算符");
		}
		return operators;
	};

	Model.prototype.getSelectedValue = function(relationRow, operators) {
		var tempData = this.comp("tempData");

		var type = relationRow.val("type");
		var value = "";
		if ($.inArray("IS NULL", operators) == -1) {
			value = tempData.getValue(type.toLowerCase() + "Value");
			if ($.trim(value) == "") {
				throw new Error("请输入（或者选择）数据");
			}
		}
		return value;
	};

	Model.prototype.getExprObject = function() {
		var relationRow = this.getSelectedRelationRow();
		var operators = this.getSelectedOperators();
		var operator = FilterUtils.operator_ArrayToString(operators);
		var value = this.getSelectedValue(relationRow, operators);
		return {
			"col" : relationRow.val("col"),
			"label" : relationRow.val("label"),
			"type" : relationRow.val("type"),
			"relation" : relationRow.val("relation"),
			"operator" : operator,
			"value" : value
		};
	};

	Model.prototype.valueIsDisabled = function() {
		return !this.comp("relationData").getCurrentRow() || this.comp("operatorData").getValueByID('checked', 'IS NULL');
	};

	Model.prototype.okBtnClick = function(event) {
		this.comp("receiver").windowEnsure({
			"exprID" : this.exprID,
			"exprObject" : this.getExprObject()
		});
	};

	Model.prototype.selectValueBtnClick = function(event) {
		var relationData = this.comp("relationData");
		this.comp("selectValueDialog").open({
			"data" : {
				"selectData" : this.filterData,
				"selectCol" : relationData.getValue("col")
			}
		});
	};

	Model.prototype.selectValueDialogReceive = function(event) {
		var type = this.comp("relationData").getValue("type");
		this.comp("tempData").setValueByID(type.toLowerCase() + "Value", event.data.value);
	};

	return Model;
});
