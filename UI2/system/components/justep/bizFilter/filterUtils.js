/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var FilterUtils = function() {
	};
	
	FilterUtils.BIZ_FILTER_PREFIX = "_BIZ_FILTER_";

	FilterUtils.getFilterStrByObject = function(filterObject) {
		var filter = "";
		$.each(filterObject, function(i, o) {
			// 格式兼容
			if (o.exprJSON) {
				o.exprKSQL = JSON.parse(o.exprJSON).exprKSQL;
			} 
			
			filter += o.leftBracket ? " ( " : " ";
			filter += o.exprKSQL;
			filter += o.rightBracket ? " ) " : " ";
			filter += o.logic;
		});
		return filter;
	};
	
	FilterUtils.getFilterStrByJSON = function(filterJSON) {
		var filterObject = JSON.parse(filterJSON);
		return FilterUtils.getFilterStrByObject(filterObject);
	};
	
	FilterUtils.createPathMatchFilter = function(field, paths) {
		var filters = [];
		var path;
		for ( var i = 0, len = paths.length; i < len; i++) {
			path = paths[i];
			while (path.indexOf("/") != -1) {
				filters.push(justep.String.format("{0} = '{1}'", field, path.replace(/'/g, "''")));
				path = path.substring(0, path.lastIndexOf("/"));
			}
		}
		return filters.join(" OR ");
	};
	
	FilterUtils.createRelationTable = function(filterData, filterCols) {
		var filterCols = filterCols ? filterCols : filterData.getColumnIDs();
		filterCols = filterCols.split(",");
		
		var rows = [];
		for (var i in filterCols) {
			var col = filterCols[i];
			var defCol = filterData.defCols[col];
			if (!defCol || ($.inArray(defCol.type, [ "String", "Integer", "Float", "Date", "Time", "DateTime", "Decimal", "Text" ]) == -1)
					|| (defCol.relation == "EXPRESS" || defCol.relation.substring(defCol.relation.length - 8) == ".version")) {
				continue;
			}
			var type = FilterUtils.valueType(defCol.type);
			rows.push({
				"col" : col,
				"relation" : defCol.relation,
				"label" : defCol.label ? defCol.label : col,
				"type" : type,
				"typeLabel" : FilterUtils.type2label(type)
			});
		}
		return {
			"rows" : rows,
			"@type" : "table"
		};	
	};

	FilterUtils.valueType = function(type) {
		if (type == "Decimal") { 
			type = "Float"; 
		} else if (type == "Text") {
			type = "String";
		} 
		return type;
	};
	
	FilterUtils.type2label = function(type) {
		return {
			"String" : "字符串",
			"Integer" : "整型",
			"Float" : "数值",
			"Boolean" : "布尔",
			"Date" : "日期",
			"Time" : "时间",
			"DateTime" : "日期时间"
		}[type];
	};
	
	FilterUtils.createFilterTable = function(filterJSON, filterData) {
		var filterObject = filterJSON ? JSON.parse(filterJSON) : [];
		var rows = [];
		$.each(filterObject, function(i, o) {
			// 格式兼容
			if (o.exprJSON) {
				var exprObject = JSON.parse(o.exprJSON);
				o.col = exprObject.col;
				
				o.operator = FilterUtils.operator_ArrayToString(exprObject.operators); 
				o.value = exprObject.value;
				
				o.expr = exprObject.expr;
				o.exprKSQL = exprObject.exprKSQL;

				var defCol = filterData.defCols[o.col];
				o.label = defCol.label ? defCol.label : o.col;
				o.type = FilterUtils.valueType(defCol.type);
				o.relation = defCol.relation;
			}
			rows.push({
				"id" : justep.UUID.createUUID(),
				"col" : o.col,
				"label" : o.label,
				"type" : o.type,
				"relation" : o.relation,
				
				"operator" : o.operator,
				"value" : o.value,
				
				"expr" : o.expr,
				"exprKSQL" : o.exprKSQL,
				
				"logic" : o.logic ? o.logic : "AND",
				"leftBracket" : o.leftBracket,
				"rightBracket" : o.rightBracket
			});
		});
		return {
			"rows" : rows,
			"@type" : "table"
		};
	};
	
	FilterUtils.operator_ArrayToString = function(operators) {
		return {
			"=" : "等于",
			"NOT,=" : "不等于",
			
			">" : "大于",
			"=,>" : "大于等于",
			"NOT,>" : "小于等于",
			"NOT,=,>" : "小于",

			"<" : "小于",
			"=,<" : "小于等于",
			"NOT,<" : "大于等于",
			"NOT,=,<" : "大于",
			
			"LIKE" : "包含",
			"NOT,LIKE" : "不包含",
			
			"IS NULL" : "为空",
			"NOT,IS NULL" : "不为空"
		}[operators.join(",")];
	};
	
	FilterUtils.operator_StringToArray = function(operator) {
		return {
			"等于" : ["="],
			"不等于" : ["NOT", "="],
			"大于" : [">"],
			"大于等于" : ["=", ">"],
			"小于" : ["<"],
			"小于等于" : ["=", "<"],
			"包含" : ["LIKE"],
			"不包含" : ["NOT", "LIKE"],
			"为空" : ["IS NULL"],
			"不为空" : ["NOT", "IS NULL"]
		}[operator];
	};
	
	FilterUtils.operator_toKSQL = function(operator) {
		return {
			"等于" : "=",
			"不等于" : "<>",
			"大于" : ">",
			"大于等于" : ">=",
			"小于" : "<",
			"小于等于" : "<=",
			"包含" : "LIKE",
			"不包含" : "NOT LIKE",
			"为空" : "IS NULL",
			"不为空" : "IS NOT NULL"
		}[operator];
	};
	
	FilterUtils.createExpr = function(exprObject) {
		var valueObj = FilterUtils.transValue(exprObject);
		var expr_ch = exprObject.label + " " + exprObject.operator + " " + valueObj.value_ch;
		var expr_ksql = "(" + exprObject.relation + " " + FilterUtils.operator_toKSQL(exprObject.operator) + " " + valueObj.value_ksql + ")";
		if (exprObject.operator == "不包含") {
			expr_ksql = "(NOT (" + exprObject.relation + " LIKE " + valueObj.value_ksql + "))";
		}
		return {
			"expr_ch" : expr_ch,
			"expr_ksql" : expr_ksql
		};
	};
	
	FilterUtils.transValue = function(exprObject) {
		var type = exprObject.type;
		var operator = exprObject.operator;
		var value = exprObject.value;
		value = (typeof (value) == "undefined" || value === null) ? "" : value;
		
		var value_ch = value;
		var value_ksql = value;
		if (operator.indexOf("为空") == -1) {
			if (type == "String") {
				if ((operator.indexOf("包含") != -1) && (value_ksql.indexOf("%") == -1)) {
					value_ksql = "%" + value_ksql + "%";
				}
				value_ksql = "'" + value_ksql.replace(/'/g, "''") + "'";
			} else if ("DateTime".indexOf(type) != -1) {
				if (typeof(value) == "string") {
					value = FilterUtils.str2datetime(value, type, "standard");
				}
				
				value_ch = FilterUtils.datetime2str(value, type, "chinese");
				value_ksql = "StringTo" + type + "('" + FilterUtils.datetime2str(value, type, "sql") + "')";
			} 
		}
		return {
			"value_ch" : value_ch,
			"value_ksql" : value_ksql
		};
	};

	FilterUtils._getDateTimeFormat = function(format, type) {
		return {
			"chinese" : {
				"DateTime" : "yyyy年MM月dd日 hh时mm分ss秒",
				"Date" : "yyyy年MM月dd日",
				"Time" : "hh时mm分ss秒"
			},
			"sql" : {
				"DateTime" : "yyyy-MM-dd hh:mm:ss",
				"Date" : "yyyy-MM-dd",
				"Time" : "hh:mm:ss"
			},
			"standard" : {
				"DateTime" : "yyyy-MM-ddThh:mm:ss.fffZ",
				"Date" : "yyyy-MM-dd",
				"Time" : "hh:mm:ss.fff"
			}
		}[format][type];
	};

	FilterUtils.datetime2str = function(datetime, type, format) {
		return justep.Date.toString(datetime, this._getDateTimeFormat(format, type));
	};

	FilterUtils.str2datetime = function(str, type, format) {
		return justep.Date.fromString(str, this._getDateTimeFormat(format, type));
	};

	return FilterUtils;
});