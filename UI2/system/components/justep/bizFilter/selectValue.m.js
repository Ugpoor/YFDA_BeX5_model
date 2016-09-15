/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Data = require("$UI/system/components/justep/data/data");
	var Filter = require("$UI/system/components/justep/data/js/filter");
	var SmartFilter = require("$UI/system/components/justep/smartFilter/smartFilter");
	var FilterUtils = require("./filterUtils");

	var Model = function() {
		this.callParent();
	};

/*
	参数数据结构
	{
		"selectData" : 选择数据对象（持bizData） 
		"selectCol" : 选择列
	};
	返回 
	{
		"value" :
	}
 */
	Model.prototype.receiverReceive = function(event) {
		this.selectData = event.data.selectData;
		this.selectCol = event.data.selectCol;

		var smartFilter = this.comp("smartFilter");
		smartFilter.setModel(this.selectData.getModel());
		smartFilter.set({
			"filterData": this.selectData.xid,
			"filterCols": this.selectCol
		});
		var oldText = smartFilter.searchText.get();
		smartFilter.clear();
		if (oldText === "") {
			smartFilter.refresh();
		}
	};

	Model.prototype.smartFilterFilter = function(event) {
		var valueData = this.comp("valueData");
		valueData.clear();
		valueData.refreshData({"async": false, "confirm": false});
	};

	Model.prototype.valueDataCustomRefresh = function(event) {
		if (!this.selectData) {
			return;
		}

		var valueData = event.source;
		var defCol = this.selectData.defCols[this.selectCol];

		var filters = new Filter();
		$.each(this.selectData.filters.filterList, function(name, filter) {
			if (name.indexOf(FilterUtils.BIZ_FILTER_PREFIX) == -1) {
				filters.setFilter("OLD_" + name, filter);
			}
		});
		filters.setFilter("removeNullFilter", justep.String.format("NOT {0} IS NULL", defCol.relation));
		filters.setFilter("searchFilter", this.comp("smartFilter").getFilterStr());

		var queryParam = new biz.Request.ActionParam();
		queryParam.setBoolean("distinct", true);
		queryParam.setString("idColumn", this.selectCol);
		queryParam.setString("columns", this.selectCol);
		queryParam.setInteger("offset", event.offset);
		queryParam.setInteger("limit", event.limit);
		queryParam.setString("orderBy", defCol.relation);
		queryParam.setString("filter", filters.toString());
		queryParam.setMap("variables", this.selectData.filters.variables);

		var translateParam = new biz.Request.TranslateParam();
		translateParam.rowOption.concept = this.selectCol;
		translateParam.rowOption.sequence = this.selectCol;
		translateParam.dataType = biz.Request.TranslateParam.DATATYPE_ROW_LIST;

		var self = this;
		biz.Request.sendBizRequest({
			"contentType" : valueData.dataType,
			"dataType" : valueData.dataType,
			"context" : this.selectData.getContext(),
			"process" : this.selectData.getProcess(),
			"activity" : this.selectData.getActivity(),
			"action" : this.selectData.getQueryAction(),
			"parameters" : queryParam,
			"translateParam" : translateParam,
			"directExecute" : true,
			"callback" : function(resultData) {
				if (resultData) {
					if (resultData.state) {
						var o = resultData.response;
						if (0 === event.offset) {
							var count = o.userdata["sys.count"];
							valueData.setTotal(count);
						}
						o.rows = self.transValueRows(o.rows);
						valueData.loadData(o, event.options.append);
					}
				}
			}
		});
	};

	Model.prototype.transValueRows = function(rows) {
		var result = [];
		var self = this;
		$.each(rows, function(i, row) {
			result.push({
				"value" : row[self.col],
				"userdata" : row.userdata
			});
		});
		return result;
	};

	Model.prototype.okBtnClick = function(event){
		var row = event.bindingContext.$object;
		row = (row instanceof Data.Row) ? row : this.comp("valueData").getCurrentRow();
		var value = row ? row.val("value") : null;
		
		if (typeof (value) === "undefined" || value === null || $.trim(value) === "") {
			justep.Util.hint("请选择数据", {"type" : "info"});
		} else {
			this.comp("receiver").windowEnsure({
				"value" : value
			});
		}
	};

	return Model;
});
