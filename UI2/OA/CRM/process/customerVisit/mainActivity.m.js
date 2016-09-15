define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");
	require("css!$UI/OA/config/pub").load();
	require("$UI/system/lib/cordova/cordova");
	require("cordova!cordova-plugin-globalization");

	var Model = function() {
		this.callParent();
		this.openTaskStatus;

	};

	// 今天拜访过滤
	Model.prototype.today = function(row) {
		var rowdate = justep.Date.toString(row.val('fVisitTime'), justep.Date.STANDART_FORMAT_SHOT);
		var nowdate = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT_SHOT);
		return rowdate == nowdate;

	};

	// 昨天拜访过滤
	Model.prototype.yesterday = function(row) {
		var rowdate = justep.Date.toString(row.val('fVisitTime'), justep.Date.STANDART_FORMAT_SHOT);
		var yesdate = justep.Date.toString(justep.Date.decrease(new Date(), 1, "d"), justep.Date.STANDART_FORMAT_SHOT);
		return rowdate == yesdate;
	};

	// 显示每个list里面的记录数
	Model.prototype.modelLoad = function(event) {
		this.showlistCount();
	};

	// 将来放到每个list的refresh之后事件中显示本list中的记录数
	Model.prototype.showlistCount = function() {
		var todayNO = this.comp('todayList').getBindingObjects().length;
		var yesdayNO = this.comp('yestodayList').getBindingObjects().length;
		var beforedayNO = this.comp('agoList').getBindingObjects().length;
		var noData = this.comp('numData');
		if (this.comp('todayList') != null) {
			noData.setValue('todayNum', todayNO);
			noData.setValue('yesdayNum', yesdayNO);
			noData.setValue('beforedayNum', beforedayNO);
		}
	}

	// 显示昨天今天的拜访详情，
	Model.prototype.recentListClick = function(event) {
		this.openTaskStatus = "open";
		this.comp('detailDialog').open({
			data : this.comp('visitData').getValue('OA_CustomerVisit')
		});
	};

	// 显示以前拜访详情，
	Model.prototype.agoListClick = function(event) {
		this.openTaskStatus = "close";
		this.comp('detailDialog').open({
			data : this.comp('agoVisitData').getValue('OA_CustomerVisit')
		});
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};

	// 新建拜访记录
	Model.prototype.addBtnClick = function(event) {
		var me = this;
		var onSuccess = function(position) {
			me.comp('newDialog').open({
				data : {
					latitude: position.coords.latitude,
					longitude: position.coords.longitude
			}});
		};
		
		var onError = function(error) {
			alert('无法获取地理位置信息。不能新增拜访记录');
		}
		navigator.geolocation.getCurrentPosition(onSuccess, onError);
	};
	
	// 新增后，在visitData中增加返回的数据，刷新今天拜访的数量
	Model.prototype.newDialogReceive = function(event) {
		var options = {
			index : 0,
			defaultValues : [ {
				OA_CustomerVisit : event.data.val("OA_CustomerVisit"),
				fCustomer : event.data.val("fCustomer"),
				fVisitTime : justep.Date.toString(event.data.val("fVisitTime"), justep.Date.STANDART_FORMAT),
				fCreator : event.data.val("fCreator"),
				fCreatorID : event.data.val("fCreatorID"),
				fContent : event.data.val("fContent")
			} ]
		};
		this.comp("visitData").newData(options);
		var todayNO = this.comp('todayList').getBindingObjects().length;
		this.comp('numData').setValue('todayNum', todayNO);
	};

	//在地图上显示客户
	Model.prototype.mapBtnClick = function(event){
		var arrMapInfo = new Array();
		var me = this;

		this.comp("visitData").each(function(options) {
			if(options.row.val('flongitude') != null){
				arrMapInfo.push(OA.getMapInfo(options.row,me.getContext()));
			}
		});
		
		this.comp("agoVisitData").each(function(options) {
			if(options.row.val('flongitude') != null){
				arrMapInfo.push(OA.getMapInfo(options.row,me.getContext()));
			}
		});
		
		this.comp('mapDialog').open({
			data : arrMapInfo
		});
	};


	//转换时间显示方式
	Model.prototype.showTime = function(event){
		return OA.transformDateTime(event.val('fVisitTime'));
	};
	
	//过滤拜访信息
	Model.prototype.smartFilterFilter = function(event){
		var visitData = this.comp("visitData");
        visitData.setFilter("filter1", event.source.getFilterStr());
        visitData.refreshData();
		var data = this.comp("agoVisitData");
        data.setFilter("filter1", event.source.getFilterStr());
        data.refreshData();
	};
	
	return Model;
});
