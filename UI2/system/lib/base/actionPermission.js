define(function(require) {
	var $ = require("jquery");
	var Request = require("$UI/system/lib/base/request");
	var URL = require("$UI/system/lib/base/url");

	var ActionPermission = function() {
		this._disabledActions = {};
		this._bSessionID = null;
	};
	
	ActionPermission.prototype._getDisabledActions = function(process) {
		if (this._bSessionID != URL.getBSessionID()) {
			this._bSessionID = URL.getBSessionID();
			this._disabledActions = {};
		}
		if (this._disabledActions[process]) {
			return this._disabledActions[process];
		} 
		var self = this;
		var params = new Request.ActionParam();
		params.setString("process", process);
		params.setString("activity", "*");
		Request.sendBizRequest({
			"process" : "/SA/OPM/system/systemProcess",
			"activity" : "mainActivity",
			"action" : "getDisabledActions",
			"parameters" : params,
			"callback" : function(res) {
				res.ignoreError = true;
				if (res.state) {
					self._disabledActions[process] = res.response;
				}
			}
		});
		
		return this._disabledActions[process];
	};
	
	ActionPermission.prototype.isDisabledAction = function(model, action) {
		if ($.isPlainObject(model)) {
			var process = model.process;
			var activity = model.activity;
			action = model.action;
		} else {
			var context = model.getContext();
			var process = context.getProcess();
			var activity = context.getActivity();
		}
		
		var disabledActions = this._getDisabledActions(process);
		var actionFullName = process + "/" + activity + "/" + action;
		return ($.inArray(actionFullName, disabledActions) >= 0);
	};
	
	return new ActionPermission();
});
