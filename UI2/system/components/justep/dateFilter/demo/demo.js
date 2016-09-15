/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var SmartFilter = require("$UI/system/components/justep/smartFilter/smartFilter");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtn = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.button1Click = function(event){
		this.comp("dateFilter1").filter("lastWeek");
	};

	return Model;
});