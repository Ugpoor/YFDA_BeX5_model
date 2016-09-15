/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	/* jshint unused: false */
	/* jshint debug: true */
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var SmartFilter = require("$UI/system/components/justep/smartFilter/smartFilter");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtn = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.dynamicCreate = function(event) {
		var parent = this.getElementByXid("div1");
		var cfg = {
			filterData : "bizData1",
			filterCols : "sName,sCode",
			autoRefresh : false,
			autoRefreshMode : "change",
			parentNode : parent
		};
		new SmartFilter(cfg);
	};

	Model.prototype.showSFSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/smartFilter/demo/demo.w&xid=smartFilter"
		});
	};

	Model.prototype.showJsSource = function(event){
		this.comp("windowDialog").open({
			data : "system/components/justep/smartFilter/demo/demo.js"
		});
	};

	Model.prototype.modelLoad = function(event){
		var isPC = justep.Browser.isPC;
		if (isPC) {
			this.comp("windowDialog").set({'status':'normal'});
		}
	};

	return Model;
});