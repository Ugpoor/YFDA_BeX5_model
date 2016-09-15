/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var Message = require("$UI/system/components/justep/common/common");
	
	var Model = function() {
		this.callParent();
		this.isVisible = Message.flag;
		
		var self = this;
		this.getItems = function($object){
			var itemData = self.comp('itemData'); 
			var ret = [];
			itemData.each(function(param){
				var row = param.row;
				if(row.val('type')==$object.val('fID'))
					ret.push(row);
			});
			return ret;
		};
	};

	Model.prototype.showJsSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/components/justep/select/demo/listselect.js"
		});
	};

	Model.prototype.showSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/select/demo/listselect.w&xid=list2"
		});
	};

	return Model;
});