define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.btnRepairOrgClick = function(event){
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoActionParams",
		});
		justep.Util.hint("组织修复完成。");
	};

	return Model;
});