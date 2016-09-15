define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.action1BtnClick = function(event){
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoHasAction1",
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("动作1调用成功！");
				}
			}
		});
	};

	Model.prototype.action2BtnClick = function(event){
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoHasAction2",
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("动作2调用成功！");
				}
			}
		});
	};

	Model.prototype.action3BtnClick = function(event){
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoHasAction3",
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("动作3调用成功！");
				}
			}
		});
	};

	Model.prototype.action4BtnClick = function(event){
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoHasAction4",
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("动作4调用成功！");
				}
			}
		});
	};

	return Model;
});