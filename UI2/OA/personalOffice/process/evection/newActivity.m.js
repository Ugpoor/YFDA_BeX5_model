define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.windowReceiverReceive = function(event){
		this.comp("evectionData").clear();
		this.comp("evePlaceData").clear();

		this.comp("evectionData").newData();
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
		if(this.comp("selectExecutor").getRows().length == 0){
			throw new Error("请选择审批人");
		}
		if (this.comp('evectionData').saveData())
			this.comp('windowReceiver').windowEnsure(this.comp('evectionData').getCurrentRow());
	};
	
	// 保存前组合审批信息，组合出差日期和地点
	Model.prototype.taskDataBeforeSave = function(event) {
		var data = this.comp('evectionData');
		data.setValue('fApprove','待 '+this.comp("selectExecutor").getRows()[0].val('sPersonName')+' 审批');
		var sStartMonthDay = justep.Date.toString(data.getValue("fStartDate"), "MM-dd");
		var sEndMonthDay = justep.Date.toString(data.getValue("fEndDate"), "MM-dd");
		data.setValue("fName", data.getValue("fPlace") + "，" + sStartMonthDay + "至" + sEndMonthDay);
	};
	
	//新增出差地点
	Model.prototype.newPlaceClick = function(event){
		this.comp("evePlaceData").newData();
	};
	
	//删除出差地点
	Model.prototype.delPlaceClick = function(event){
		var sID = event.bindingContext.$rawData.val("OA_EvectionPlace");
		var rows = [];
		rows.push(this.comp("evePlaceData").getRowByID(sID));
		if (rows.length > 0){
			this.comp("evePlaceData").deleteData(rows);
		}
	};
	
	return Model;
});

