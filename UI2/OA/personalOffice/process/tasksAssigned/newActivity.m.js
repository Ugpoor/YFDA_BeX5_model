define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.windowReceiverReceive = function(event){
		this.comp("taskData").clear();
		this.comp("upToDateData").clear();

		this.comp("taskData").newData();
		this.comp("upToDateData").newData();
	};

	// 返回前询问是否取消操作
	Model.prototype.listBtnClick = function(event) {
		this.comp("closeMsgDlg").show();
	};
	
	// 不保存
	Model.prototype.closeMsgDlgClose = function(event) {
		if (event.button == 'yes') {
			this.comp('windowReceiver').windowCancel();
		}
	};
	
	// 保存成功后，返回
	Model.prototype.saveBtnClick = function(event) {
		if (this.comp('taskData').saveData())
			this.comp('windowReceiver').windowEnsure(this.comp('taskData').getCurrentRow());
	};
	
	// 获取负责人，组合任务标题
	Model.prototype.selectExecutorChange = function(event){
		var data = this.comp("taskData");
		data.setValue('fExecutorID', event.value[0].val("sPersonID"));
		data.setValue('fExecutor', event.value[0].val("sPersonName"));
		data.setValue('fName', data.getValue("fCreator") + "委托给" + data.getValue("fExecutor"));
	};
	
	return Model;
});
