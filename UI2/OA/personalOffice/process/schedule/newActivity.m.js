define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		this.comp("scheduleData").clear();
		if (event.data) {
			var detailData = this.comp('scheduleData');
			detailData.setFilter('filter1', "OA_Schedule = '" + event.data + "'");
			detailData.refreshData();
			this.comp("titleBar").setTitle("日程编辑");
		}else {
			this.comp("scheduleData").newData();
			this.comp("titleBar").setTitle("新建日程");
		}
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

	// 判断与会认是否修改了，保存成功后，返回
	Model.prototype.saveBtnClick = function(event) {
		var data = this.comp('scheduleData');
		var socialData = this.comp("selectCreator").getSocialDataComponent();
		if (socialData.isChanged()) {
			data.setValue('fLastModifyTime', justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
		}

		if (data.saveData())
			this.comp('windowReceiver').windowEnsure();
	};
	
	Model.prototype.iptfRepeatClick = function(event) {
		this.comp('contents1').to('repeat');
	};
	
	Model.prototype.iptStopTypeClick = function(event) {
		this.comp('contents1').to('stopType');
	};

	Model.prototype.iptfRateClick = function(event) {
		this.comp('contents1').to('rate');
	};

	Model.prototype.getRepeatType = function(event) {
		var repeat = event.getValue('fRepeat');
		var repeatText = "无";
		if (repeat) {
			if (repeat == 'none') {
				repeatText = "无";
			} else if (repeat == 'day') {
				repeatText = "每天";
			} else if (repeat == 'month') {
				repeatText = "每月";
			} else if (repeat == 'year') {
				repeatText = "每年";
			} else if (repeat == 'week') {
				repeatText = "每周";
			}
		}
		return repeatText;
	};
	
	Model.prototype.getRepeat = function(event) {
		var repeatFrequency = event.getValue('fRepeatFrequency');
		var repeatText = '无';
		if (repeatFrequency) {
			var repeat = event.getValue('fRepeat');
			if (repeat == 'day') {
				repeatText = "每" + repeatFrequency + "天";
			} else if (repeat == 'month') {
				repeatText = "每" + repeatFrequency + "月";
			} else if (repeat == 'year') {
				repeatText = "每" + repeatFrequency + "年";
			} else if (repeat == 'week') {
				var repeatWeek = '';
				var arrWeek = new Array("","日", "一", "二", "三", "四", "五", "六");
				if (event.getValue('fWeekRepeat')) {
					var weekRepeat = event.getValue('fWeekRepeat').split(' ');
					for ( var i = 0; i < weekRepeat.length; i++) {
						repeatWeek = repeatWeek + arrWeek[weekRepeat[i]] + " ";
					}
				}
				repeatText = "每" + repeatFrequency + "周 ：周" + repeatWeek;
			}
		}
		return repeatText;
	};
	
	Model.prototype.getStop = function(event) {
		var repeat = event.getValue('fRepeat');
		var repeatText = '无';
		if (repeat != 'none') {
			var date = event.getValue('fUpToDate');
			var count = event.getValue('fRepeatCount');
			if (count != undefined && count.value != "") {
				repeatText = "重复" + count + "次";
			} else if (date && date.value != "") {
				repeatText = justep.Date.toString(date, "yyyy-MM-dd");
			}
		}
		return repeatText;
	};
	
	//重复方式返回
	Model.prototype.repeatBacBtnClick = function(event){
		this.comp('contents1').to('new');
	};

	//重复频率返回
	Model.prototype.ratebacBtnClick = function(event){
		this.comp('contents1').to('new');
	};

	//结束重复返回
	Model.prototype.stopBacBtnClick = function(event){
		this.comp('contents1').to('new');
	};
	
	//必填验证
	//fRepeat不是none，fRepeatFrequency必填
//	fRepeat是每周，fWeekRepeat必填
	Model.prototype.scheduleDataBeforeSave = function(event){
		if(this.comp('scheduleData').getValue('fRepeat') != "none"){
			if(this.comp('scheduleData').getValue('fRepeatFrequency') == undefined
				|| this.comp('scheduleData').getValue('fRepeatFrequency').value == ""){
				event.cencel = true;
				throw new Error("请输入重复频率");
			};
			if(this.comp('scheduleData').getValue('fRepeat') == "week"){
				if(this.comp('scheduleData').getValue('fWeekRepeat') == undefined
					|| this.comp('scheduleData').getValue('fWeekRepeat') == ""){
					event.cencel = true;
					throw new Error("请选择在星期几重复");
				};
			};
		};
	};
	
	//选择重复方式为不重复
	Model.prototype.noneRowClick = function(event){
		this.comp('scheduleData').setValue('fRepeat', 'none');
	};

	//选择重复方式为日
	Model.prototype.dayRowClick = function(event){
		this.comp('scheduleData').setValue('fRepeat', 'day');
	};

	//选择重复方式为周
	Model.prototype.weekRowClick = function(event){
		this.comp('scheduleData').setValue('fRepeat', 'week');
	};

	//选择重复方式为月
	Model.prototype.monthRowClick = function(event){
		this.comp('scheduleData').setValue('fRepeat', 'month');
	};

	//选择重复方式为年
	Model.prototype.yearRowClick = function(event){
		this.comp('scheduleData').setValue('fRepeat', 'year');
	};

	return Model;
});


