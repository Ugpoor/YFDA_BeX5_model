/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
//	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var FilterUtils = require("./filterUtils");

	var Model = function() {
		this.callParent();
		this.isManager = justep.Bind.observable(false);
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
	}
	返回数据结构
	{
		"filterJSON": 
	}
 */
	Model.prototype.receiverReceive = function(event) {
		// TODO
		this.isManager.set(false);
		this.filterContext = event.data.filterContext;
		this.refreshPatternData();
	};

	Model.prototype.refreshPatternData = function() {
		var patternData = this.comp("patternData");
		if (this.isManager.get() && justep.Browser.isPC) {
			patternData.setFilter("rangeFilter", "(SA_FilterPattern.sPerson = :operatorID()) OR (SA_FilterPattern.sPerson IS NULL)");
		} else {
			var pathMatchFilter = FilterUtils.createPathMatchFilter("SA_FilterPattern.sOrgFID", this.getContext().getAllPersonMemberFIDs());
			patternData.setFilter("rangeFilter", "(SA_FilterPattern.sPerson = :operatorID()) OR (SA_FilterPattern.sPerson IS NULL AND SA_FilterPattern.sOrgFID IS NULL) OR (" + pathMatchFilter + ")");
		}
		patternData.setFilter("instanceFilter", "SA_FilterPattern.sProcess = :process AND SA_FilterPattern.sActivity = :activity AND SA_FilterPattern.sInstance = :instance");
		patternData.filters.setStringVar("process", this.filterContext.process);
		patternData.filters.setStringVar("activity", this.filterContext.activity);
		patternData.filters.setStringVar("instance", this.filterContext.instance);
		patternData.refreshData({"async": false, "confirm": false});
		patternData.first();
		this.comp("patternList").refresh();
	};

	Model.prototype.okBtnClick = function(event) {
		var row = event.bindingContext.$object;
		row = (row instanceof Data.Row) ? row : this.comp("patternData").getCurrentRow();

		if (row) {
			this.comp("receiver").windowEnsure({
				"filterJSON" : row ? row.val("sContent") : null
			});
		}
	};

	Model.prototype.newBtnClick = function(event) {
		this.comp("filterDialog").open({
			data : {
				"filterContext" : this.filterContext,
				"openMode" : "newPattern"
			}
		});
	};

	Model.prototype.delPatternBtnClick = function(event) {
		var row = event.bindingContext.$object;
		row.data.deleteData([ row ],{async:true});
	};

	Model.prototype.editPatternBtnClick = function(event) {
		var row = event.bindingContext.$object;
		if (row) {
			this.comp("filterDialog").open({
				data : {
					"filterContext" : this.filterContext,
					"openMode" : "editPattern",
					"patternID" : row.getID()
				}
			});
		}
	};

	Model.prototype.filterDialogReceive = function(event) {
		this.refreshPatternData();
	};

	return Model;
});
