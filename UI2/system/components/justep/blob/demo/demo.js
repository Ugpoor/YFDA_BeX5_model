/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	//var $ = require("jquery"),
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.closeWin = function(event){
		justep.Shell.closePage();
	};
	
	Model.prototype.showBlobSource = function(event){
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/blob/demo/demo.w&xid=blobImageDemo"
		});
	};
	Model.prototype.model1Load = function(event){
		var isPC = justep.Browser.isPC;
		if (isPC) {
			this.comp("windowDialog").set({'status':'normal'});
		}
	};
	return Model;
});
