define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
		
	var Model = function(){
		this.callParent();
	};

/*
	event.data = {
		"process" :
		"activity" :
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		this._params = event.data;
		this.comp("paramData").refreshData();
	};

	Model.prototype.paramDataCustomRefresh = function(event){
		var paramData = event.source;
		var params = new biz.Request.ActionParam();
		params.setString("process", this._params.process);
		params.setString("activity", this._params.activity);
		var translateParam = new biz.Request.TranslateParam();
		translateParam.dataType = biz.Request.TranslateParam.DATATYPE_ROW_LIST;
		translateParam.rowOption.sequence = paramData.getColumnIDs();
		
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getPermissionParamsOfActivityAction",
			"parameters" : params,
			"translateParam" : translateParam, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					$.each(data.response.rows, function(i, row) {
						row.id.value = i;
					});
					paramData.loadData(data.response);
				}
			}
		});
	};

	Model.prototype.okBtnClick = function(event){
		this.comp("windowReceiver").windowEnsure(this.comp("paramData").getCurrentRow());
	};

	return Model;
});