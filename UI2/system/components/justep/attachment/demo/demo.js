/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	var docUtil = require('$UI/system/components/justep/docCommon/docUtil');
	var justep = require("$UI/system/lib/justep");
	var Message = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
		this.isVisible = Message.flag;
	};
	
	Model.prototype.backMain = function(event){
		justep.Shell.closePage();
	};
	
	Model.prototype.showAttachSource = function(event){
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/attachment/demo/demo.w&xid=demoAttachment"
		});	
	};
	
	Model.prototype.save = function(event){
		this.comp('mainData').saveData();
	};
	
	Model.prototype.attachmentPC1Browse = function(event){
		debugger;console.log("browse:" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1FileSelect = function(event){
		debugger;console.log("file select :" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1Start = function(event){
		debugger;console.log("file start:" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1Progress = function(event){
		debugger;console.log("file progress:" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1Success = function(event){
		debugger;console.log("file success:" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1Error = function(event){
		debugger;console.log("error:" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1NewFromTemplate = function(event){
		debugger;console.log("new from template:" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1OfficeLoaded = function(event){
		debugger;console.log("office loaded:" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1Download = function(event){
		debugger;console.log("download" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1OpenOfficeEditor = function(event){
		debugger;console.log("office editor" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1CreateVersion = function(event){
		debugger;console.log("create version" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1ShowHistory = function(event){
		debugger;console.log("show history" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1Delete = function(event){
		debugger;console.log("delete" + this.printEvent(event));
	};
	
	Model.prototype.attachmentPC1Edit = function(event){
		debugger;console.log("edit" + this.printEvent(event));
	};
	
	
	Model.prototype.printEvent = function(event){
		for ( var param in event) {
			console.log("     " + param + ":" + event[param]);
		}
	};
	
	return Model;
});
