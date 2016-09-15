define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");

	var Model = function() {
		this.callParent();
	};

	// 显示日程详情
	Model.prototype.windowReceiverReceive = function(event) {
		var detailData = this.comp('detailData');
		detailData.setFilter('filter1', "OA_Schedule = '" + event.data.scheID + "'");
		detailData.refreshData();
		detailData.setValue('fShowTime', OA.transformDateTime(detailData.getValue('fStartTime')));

		//如果没有人，就不显示组件
		if(this.comp("cancelOrg").getRows().length == 0){
			$("#" + this.getIDByXID("cancelOrg")).hide();
		}
		if(this.comp("noAffirmOrg").getRows().length == 0){
			$("#" + this.getIDByXID("noAffirmOrg")).hide();
		}
		if(this.comp("affirmOrg").getRows().length == 0){
			$("#" + this.getIDByXID("affirmOrg")).hide();
		}
		//同事的日程不能编辑，与会人不能编辑
		this.comp("editBtn").set({disabled : !(event.data.canEdit && this.comp('detailData').getValue('fCreatorID') == this.getContext().getCurrentPersonID())});
	};

	// 返回列表 
	Model.prototype.listBtnClick = function(event) {
		this.comp('windowReceiver').windowEnsure();
	};
	//计算显示时间
	Model.prototype.getTime = function(event) {
		if (event.getValue('fStartTime')) {
			var startTime = justep.Date.toString(event.getValue('fStartTime'), "yyyy-MM-dd hh:mm");
			var endTime = justep.Date.toString(event.getValue('fEndTime'), "yyyy-MM-dd hh:mm");
			if(startTime.substr(0,10) == endTime.substr(0,10)) 
				return startTime + ' - ' + endTime.substr(11,5);
			else
				return startTime + ' - ' + endTime;
		}
	};
	//计算显示重复
	Model.prototype.getRepeat= function(event){
		var repeat = event.getValue('fRepeat');
		var repeatFrequency = event.getValue('fRepeatFrequency');
		var repeatText = '';
		var repeatWeek = '';
		if (repeat == 'none') {
			repeatText = "不重复";
		}else if (repeat == 'day') {
			repeatText = "每" + repeatFrequency + "天";
		}else if (repeat == 'month') {
			repeatText = "每" + repeatFrequency + "月";
		}else if (repeat == 'year') {
			repeatText = "每" + repeatFrequency + "年";
		}else if (repeat == 'week') {
			var arrWeek = new Array("","日","一","二","三","四","五","六");
			var weekRepeat = event.getValue('fWeekRepeat').split(' ');
			for(var i = 0;i<weekRepeat.length;i++){
				repeatWeek = repeatWeek + arrWeek[weekRepeat[i]]+" ";
			}
			repeatText = "每" + repeatFrequency + "周 ：周" + repeatWeek ;
		}
		return repeatText;
	}

	//进入编辑页面
	Model.prototype.editBtnClick = function(event) {
		this.comp('editDialog').open({data : this.comp('detailData').getValue('OA_Schedule')});
	};
	
	//从编辑页面返回
	Model.prototype.editDialogReceive = function(event){
		this.comp("detailData").refreshData();
		if(this.comp("noAffirmOrg").getRows().length == 0){
			$("#" + this.getIDByXID("noAffirmOrg")).hide();
		}else
			$("#" + this.getIDByXID("noAffirmOrg")).show();
	};

	return Model;
});

