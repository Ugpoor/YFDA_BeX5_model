define(function(require){
	var $ = require("jquery");
	var OA = require("$UI/OA/common/js/pub");
	require("css!$UI/OA/config/pub").load();
	
	var Model = function(){
		this.callParent();
		this.leaveID;
	};

	Model.prototype.closeBtnClick = function(event){
		this.comp('windowReceiver').windowCancel();
	};
	
	Model.prototype.windowReceiverReceive = function(event){
		this.leaveID = event.data.data;
		var detailData = this.comp('leaveApplyData');
		detailData.setFilter('filter1', "OA_LeaveApply = '" + event.data.data + "'");
		detailData.refreshData();
		detailData.setValue('fShowTime', OA.transformDateTime(detailData.getValue('fCreatorTime')));
		//显示请假天数
		OA.setLeaveDayHour(detailData);
	};

	//显示流程图
	Model.prototype.chartBtnClick = function(event){
		this.comp("process").showChart(this.getContext().getProcess(),this.leaveID);
	};

	return Model;
});
