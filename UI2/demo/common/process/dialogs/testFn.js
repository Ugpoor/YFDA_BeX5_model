define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	 this._inputData  = null;
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiver1Receive = function(event){
	    debugger;
		this._inputData = event.data;
		var textFn = this.getElementByXid("textFn");
	
		textFn.value =  event.data.fn;
		this.btnExecuteClick();
	};

	Model.prototype.btnCloseClick = function(event){
		this.comp("windowReceiver1").windowCancel();
	};

	Model.prototype.btnExecuteClick = function(event){
	   debugger;
	   var textFn = this.getElementByXid("textFn");
	   resultFn = this.getElementByXid("resultFn");
		
		var params = new biz.Request.ActionParam();
		params.setString("fnModel", this._inputData.fnModel);
		params.setString("fn", textFn.value);
		if(this._inputData.type == "process"){
			var action="testProcessFnAction";
			params.setString("task", this._inputData.task);
		} else {
			var action="testFnAction";
		}
	// 调用动作
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"dataType": "application/json",
			"contentType": "application/json",
			"action": action,
			"parameters": params,
			"callback": function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
				    resultFn.value = JSON.stringify(callbackData.response);
					//$("#resultFn").val(JSON.stringify(callbackData.response));
				} 
			}
		});
	};

	return Model;
});