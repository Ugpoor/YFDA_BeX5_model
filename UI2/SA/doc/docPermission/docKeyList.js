define(function(require){
	var $ = require("jquery");
	var biz = require('$UI/system/lib/biz');
	var justep = require('$UI/system/lib/justep');
	
	var Model = function(){
		this.callParent();
	};
	Model.prototype.windowReceiver1Receive = function(event){
		var data = event.data;
		this.linkProcess=data.linkProcess;
		this.linkActivity=data.linkActivity;
		this.windowRefreshData();
		
	};
	
	Model.prototype.windowRefreshData = function(){
		var sendParam = new biz.Request.ActionParam();
		sendParam.setString('linkProcess', this.linkProcess);
		if(this.linkActivity){
			sendParam.setString('linkActivity', this.linkActivity);
		}
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var response = biz.Request.sendBizRequest({
			contentType: "application/json",
			dataType: "application/json",
			process : process,
			activity : activity,
			action: "queryKeyListAction",
			parameters: sendParam,
			context:this.getContext()
		});
		var keyData = this.comp("docLinkKeys");
		keyData.loadData(response.responseJSON.data.value);
		keyData.refreshData();
	};
	
	Model.prototype.createKeyClick = function(event){
		this.comp("docSettingDlg").open({
			data:{
				linkProcess:this.linkProcess,
				linkActivity:this.linkActivity,
				settingOpt:"keyAdd"}
		});
		this.comp("docSettingDlg").set({title:"新建key"});
	};
	
	Model.prototype.deleteKeyClick = function(event){
		var data = this.comp("docLinkKeys");
		var curRow = data.getCurrentRow();
		if(!curRow){
			justep.Util.hint("请选择key。");
			return;
		} 
	    if(!confirm('确定删除吗?')){
	    	return;
	    }
		var sendParam = new biz.Request.ActionParam();
		sendParam.setString('linkProcess', this.linkProcess);
		if(this.linkActivity){
			sendParam.setString('linkActivity',  this.linkActivity);
		}
		sendParam.setString('keyId', data.getValue("sKeyId"));
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var response = biz.Request.sendBizRequest({
			contentType: "application/json",
			dataType: "application/json",
			process : process,
			activity : activity,
			action: "deleteKeyByIdAction",
			parameters: sendParam,
			context:this.getContext()
		});
		if(!biz.Request.isBizSuccess(response.responseJSON)){
			throw new Error("删除失败！");
		}
		this.windowRefreshData();
	};
	
	Model.prototype.changeKeyClick = function(event){
		if(!this.comp("docLinkKeys").getCurrentRow()){
			justep.Util.hint("请选择key");
			return;
		}
		this.comp("docSettingDlg").open({
			data:{
				linkProcess:this.linkProcess,
				linkActivity:this.linkActivity,
				settingOpt:"keyEidt",
				keyId:this.comp("docLinkKeys").getValue("sKeyId")}
			});
		this.comp("docSettingDlg").set({title:"修改key"});
	};
	
	Model.prototype.docSettingDlgReceive = function(event){
		this.windowRefreshData();
	};
	
	return Model;
});
