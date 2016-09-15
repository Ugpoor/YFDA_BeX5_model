define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");
	require("css!$UI/OA/config/pub").load();
	var biz = require('$UI/system/lib/biz');

	var Model = function() {
		this.callParent();
	};
	
	//弹出回退等菜单
	Model.prototype.moreBtnClick = function(event) {
		this.comp("processMenu").show();
	};
	
	//新增记录
	Model.prototype.windowReceiverReceive = function(event){
		var detailData = this.comp('leaveApplyData');
		detailData.clear();
		detailData.newData();
	};
	
	//关闭功能
	Model.prototype.closeBtnClick = function(event){
		if(this.comp("leaveApplyData").getRowState(this.comp("leaveApplyData").getCurrentRow()) != 'none')
			this.comp("closeMsgDlg").show();
		else
			this.comp("windowReceiver").windowEnsure();
	};
	
	Model.prototype.closeMsgDlgClose = function(event){
		if (event.button == 'yes') {
			this.comp("windowReceiver").windowEnsure();
		}
	};


	//根据输入的开始时间和结束时间计算请假天数、小树数、请假时长
	Model.prototype.leaveApplyDataValueChange = function(event){
		var data = this.comp('leaveApplyData');
		if(event.col == "fStartTime" && event.newValue != ""){
			if(data.getValue('fEndTime')){
				var newDate = justep.Date.fromString(event.newValue, justep.Date.STANDART_FORMAT);
				if(newDate > data.getValue('fEndTime')){
					event.newValue = event.oldValue;
					this.comp("messageDialog").show();
				}else{
					this.calcDays(justep.Date.toString(newDate,"yyyy-MM-dd hh:mm:ss"),
						justep.Date.toString(data.getValue('fEndTime'),"yyyy-MM-dd hh:mm:ss"));
				}
			}
		}else if(event.col == "fEndTime" && event.newValue != ""){
			if(data.getValue('fStartTime')){
				var newDate = justep.Date.fromString(event.newValue, justep.Date.STANDART_FORMAT);
				if(newDate < data.getValue('fStartTime')){
					event.newValue = event.oldValue;
					this.comp("messageDialog").show();
				}else{
					this.calcDays(justep.Date.toString(data.getValue('fStartTime'),"yyyy-MM-dd hh:mm:ss"),
						justep.Date.toString(newDate,"yyyy-MM-dd hh:mm:ss"));
				}
			}
		}
	};
	
	//调用action计算请假天数、小树数、请假时长
	Model.prototype.calcDays = function(sStartTime,sEndTime){
		var params = new biz.Request.ActionParam();
		params.setString("startTime", sStartTime);
		params.setString("endTime", sEndTime);
		
		var me = this;
		biz.Request.sendBizRequest({
			"context": this.getContext(),
			"action": "calcLeaveDaysAction",
			"parameters": params,
			"callback": function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					var map = callbackData.response;
					var data = me.comp('leaveApplyData');
					data.setValue('fLeaveDays',map.days);
					data.setValue('fLeaveHours',map.hours);
					data.setValue('fLeaveTime',map.time);
					data.setValue('fLeaveDayHour', OA.calcLeaveDayHour(map.days,map.hours));
				}
			}
		});	
	};
	
	//弹出请假类型选择菜单
	Model.prototype.LeaveTypeOutputClick = function(event){
		this.comp("leaveTypeMenu").show();
	};

	Model.prototype.leaveBtnClick = function(event){
		var data = this.comp('leaveApplyData');
		data.setValue('fLeaveType','事假');
	};

	Model.prototype.sickLeaveClick = function(event){
		var data = this.comp('leaveApplyData');
		data.setValue('fLeaveType','病假');
	};

	Model.prototype.annualLeaveClick = function(event){
		var data = this.comp('leaveApplyData');
		data.setValue('fLeaveType','年假');
	};

	//流转后，返回列表
	Model.prototype.processAdvanceCommit = function(event){
		this.comp("windowReceiver").windowEnsure();
	};

	return Model;
});