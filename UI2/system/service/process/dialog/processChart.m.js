/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	var $ = require("jquery");
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.okBtnClick = function() {
		this.comp("windowReceive").windowEnsure();
	};
	
	Model.prototype.windowReceiveReceive = function(event){
		var processChart = this.comp("processChart");
		var data = event.data || {};
		if (data.task){
			processChart.loadByTask(data.task);	
		}else{
			processChart.loadByData(data.process, data.data);
		}
	};

	return Model;
});
