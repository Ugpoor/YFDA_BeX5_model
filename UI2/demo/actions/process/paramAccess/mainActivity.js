define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.btnOrderByDescClick = function(event){
		var data = this.comp("dOrders");
		
		data.setOrderBy("fRequiredDate", 0);
		data.refreshData();
	};

	Model.prototype.btnOrderByAscClick = function(event){
		var data = this.comp("dOrders");
		data.setOrderBy("fRequiredDate", 1);
		data.refreshData();
	};

	Model.prototype.btnCreateDataPermissionClick = function(event){
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"dataType": "application/json",
			"action": "paramAccessCreateDataPermission",
			"callback": function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					justep.Util.hint("创建数据角色成功！");
				}
			}
		});
	};

	Model.prototype.btnAuthorizeClick = function(event){
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"dataType": "application/json",
			"action": "paramAccessAuthorize",
			"callback": function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					justep.Util.hint("给当前人授权成功，请重新登录！");
			
				}
			}
		});
	};

	return Model;
});