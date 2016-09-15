define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	require("css!$UI/demo/native/common/pub").load();
	require("cordova!cordova-plugin-geolocation");
	var bmap = require('$UI/system/components/justep/bmap/bmap');

	var Model = function() {
		this.callParent();
		this.watchID = null;
	};

	Model.prototype.modelLoad = function(event){
		var me = this;
		document.addEventListener("deviceready", onDeviceReady, false);
		
		function onDeviceReady() {
			me.comp("getGeoBtn").set({disabled: false});
			me.comp("listenBtn").set({disabled: false});
			me.comp("stopBtn").set({disabled: false});
		}
	};
	
	Model.prototype.modelUnLoad = function(event) {
		if (this.watchID) {
			navigator.geolocation.clearWatch(this.watchID);
	}};

	// 关闭功能
	Model.prototype.backBtnClick = function(event) {
		if(this.watchID)
			navigator.geolocation.clearWatch(this.watchID);
		justep.Shell.closePage();
	};

	//获取设备位置信息
	Model.prototype.getGeoBtnClick = function(event) {
		var me = this;
		me.comp("contentData").setValue("title",'获取设备位置信息');
	    me.comp("contentData").setValue("x", '经度: ');
	    me.comp("contentData").setValue("y", '维度: ');

		function onSuccess(position) {
		    me.comp("contentData").setValue("x", '经度: ' +position.coords.longitude);
		    me.comp("contentData").setValue("y", '维度: ' +position.coords.latitude);
		}

		function onError() {
		    me.comp("contentData").setValue("x", "失败");
			me.comp("contentData").setValue("y", '');
		}
		navigator.geolocation.getCurrentPosition(onSuccess, onError);
	};

	//监听设备位置信息
	Model.prototype.listenBtnClick = function(event) {
		var me = this;
		me.comp("contentData").setValue("title",'监听设备位置信息');
	    me.comp("contentData").setValue("x", '经度: ');
	    me.comp("contentData").setValue("y", '维度: ');
		var options = {
			timeout : 1000
		};
		function onSuccess(position) {
		    me.comp("contentData").setValue("x", '经度: ' +position.coords.longitude);
		    me.comp("contentData").setValue("y", '维度: ' +position.coords.latitude);
		}
		function onError() {
		    me.comp("contentData").setValue("x", "失败");
			me.comp("contentData").setValue("y", '');
		}
		this.watchID = navigator.geolocation.watchPosition(onSuccess, onError, options);
	};

	//停止监听
	Model.prototype.stopBtnClick = function(event) {
		if (this.watchID) {
			navigator.geolocation.clearWatch(this.watchID);
			this.comp("contentData").setValue("title",'停止监听');
			this.comp("contentData").setValue("x", '');
			this.comp("contentData").setValue("y", '');
			this.watchID = null;
		}
	};
	
	//显示地图
	Model.prototype.mapBtnClick = function(event) {
		bmap.marker({
			location:"40.047669,116.313082",
			title:"百度大厦",
			content:"百度奎科大厦",
			src:"justep"
		});
	};
			
	
	return Model;
});
