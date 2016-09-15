define(function(require){
	var $ = require("jquery");
	require("cordova!cordova-plugin-sim");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
Model.prototype.IOSClick = function(event){
	document.addEventListener("deviceready", iOSOnDeviceReady, false);
	function iOSOnDeviceReady() {
		window.plugins.sim.getSimInfo(iOSSuccessCallback, errorCallback);
	}
	function iOSSuccessCallback(result) {
		alert(
			//运营商的名字
			"carrierName:"+ result.carrierName+
			//国家编号
			"\n countryCode:"+ result.countryCode+
			//移动国家代码
			"\n mcc:"+ result.mcc+
			//移动网络代码
			"\n mnc:"+ result.mnc+
			//是否允许voip(网络电话)
			"\n allowsVOIP:"+ result.allowsVOIP
		);
	}		
	function errorCallback(error) {
		alert(error);
	}
};
Model.prototype.AndroidClick = function(event){
	document.addEventListener("deviceready", androidOnDeviceReady, false);
	function androidOnDeviceReady() {
		window.plugins.sim.getSimInfo(androidSuccessCallback, errorCallback);
	}
	function androidSuccessCallback(result) {
		alert(  
			//运营商的名字
			"carrierName:"+result.carrierName+   
			//国家编号
			"\n countryCode:"+result.countryCode+
			//移动国家代码
			"\n mcc:"+result.mcc+
			//移动网络代码
			"\n mnc:"+result.mnc+
			//手机号
			"\n phoneNumber:"+result.phoneNumber+
			//IMEI号
			"\n deviceId:"+result.deviceId+
			//sim卡序列号
			"\n simSerialNumber:"+result.simSerialNumber+
			//国际移动用户识别码
			"\n subscriberId:"+result.subscriberId+
			//呼叫状态
			"\n callState:"+result.callState+
			//获取数据活动状态
			"\n dataActivity:"+result.dataActivity+
			//当前使用的网络类型
			"\n networkType:"+result.networkType+
			//手机类型
			"\n phoneType:"+result.phoneType+
			//SIM的状态信息
			"\n simState:"+result.simState+
			//是否漫游
			"\n isNetworkRoaming:"+result.isNetworkRoaming		
		);
}
function errorCallback(error) {
	alert(error);
}

};
Model.prototype.modelModelConstructDone = function(event) {
	utils.showCode(this,"AndroidClick").showCode("IOSClick").prettyPrint();
};
return Model;
});