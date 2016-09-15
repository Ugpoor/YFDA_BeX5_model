define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.doActionBtnClick = function(event){
		var tempData = this.comp("tempData");
		var params = new biz.Request.ActionParam();
		params.setString("bookName", tempData.getValue("bookName"));
		params.setDate("startDate", tempData.getValue("startDate"));
		params.setDate("endDate", tempData.getValue("endDate"));
		params.setString("borrower", tempData.getValue("borrower"));
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "startBorrowBook", 
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("发起借书申请成功！");
				} 
			}
		});
	};

	Model.prototype.doTestWebServiceBtnClick = function(event){
		var tempData = this.comp("tempData");
		var params = new biz.Request.ActionParam();
		params.setInteger("a", tempData.getValue("a"));
		params.setInteger("b", tempData.getValue("b"));
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "invokeTestWebService", 
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					tempData.setValue("c", data.response);
				}
			}
		});
	};

	Model.prototype.openOtherBtnClick = function(event){
		var url = require.toUrl("$UI/demo/actions/process/integration/toOtherURL.j");
		justep.Shell.showPage({url:url,
			"title" : "百度", 
			"type" : "iframe"
		});
	};

	Model.prototype.closeSelfBtnClick = function(event){
		justep.Shell.closePage();
	};

	return Model;
});