define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.editClick = function(event){
		this.comp("editStatusData").setValue("edit", 1);
	};

	Model.prototype.sureClick = function(event){
		this.comp("editStatusData").setValue("edit", 0);
		this.comp("windowReceiver1").windowEnsure();
	};

	Model.prototype.cancelClick = function(event){
		this.comp("windowReceiver1").windowEnsure();
	};
	//js代码
	Model.prototype.jsClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/dictionary_maintenance.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/dictionary_maintenance.w&xid=window"
		},true);
	};

	return Model;
});