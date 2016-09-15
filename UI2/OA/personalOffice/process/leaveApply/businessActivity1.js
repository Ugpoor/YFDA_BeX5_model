define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");
	require("css!$UI/OA/config/pub").load();
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.closeBtnClick = function(event){
		justep.Shell.closePage();
	};

	Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
	};

	Model.prototype.leaveApplyDataAfterRefresh = function(event){
		//显示请假天数
		var detailData = this.comp('leaveApplyData');
		OA.setLeaveDayHour(detailData);
		detailData.setValue('fShowTime', OA.transformDateTime(detailData.getValue('fCreatorTime')));
	};

	return Model;
});
