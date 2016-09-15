define(function(require){
	require("cordova!cordova-plugin-device");
	require("cordova!cn.jpush.phonegap.JPushPlugin");
	var $ = require("jquery");
	var utils = require("$UI/demo/plugin/utils");
	var Baas = justep.Baas;
	var Model = function(){
		this.callParent();
	};
Model.prototype.ReceiveMessageClick = function(event){
	var registrationID="";
	var JPushInstance = function() {
		if (window.plugins && window.plugins.jPushPlugin) {
			document.addEventListener("deviceready", this.onDeviceReady.bind(this), false);
			document.addEventListener("jpush.openNotification", this.onOpenNotification.bind(this), false);
			document.addEventListener("jpush.receiveNotification", this.onReceiveNotification.bind(this), false);
			document.addEventListener("jpush.receiveMessage", this.onReceiveMessage.bind(this), false);
		}
	};
	
	//初始化获取注册id可能会失败，主动调用获取注册id
	JPushInstance.prototype.getRegistrationID = function(){
		 var dtd = $.Deferred();
		 if (this.registrationID){
			 dtd.resolve(this.registrationID);
		 }else{
			 if (window.plugins && window.plugins.jPushPlugin){
				 window.plugins.jPushPlugin.getRegistrationID(function(registrationID) {
					 self.registrationID = registrationID;
					 if (self.registrationID){
						 dtd.resolve(self.registrationID);	 
					 }else{
						 dtd.reject();
					 }
				 });
			 }else{
				 dtd.reject();
			 }
		 }
		 return dtd.promise();
	};
	
	//设备准备好的时候获取注册id
	JPushInstance.prototype.onDeviceReady = function() {
		var self = this;
		window.plugins.jPushPlugin.init();
		window.plugins.jPushPlugin.getRegistrationID(function(registrationID) {
			self.registrationID = registrationID;
		});
		if (device.platform == "Android") {
			window.plugins.jPushPlugin.setDebugMode(false);
			window.plugins.jPushPlugin.setApplicationIconBadgeNumber(0);
		} else {
			window.plugins.jPushPlugin.setDebugMode(false);
			window.plugins.jPushPlugin.setApplicationIconBadgeNumber(0);
		}
	};
	//打开通知的处理
	JPushInstance.prototype.onOpenNotification = function(event) {
		var alertContent;
		if (device.platform == "Android") {
			alertContent = window.plugins.jPushPlugin.openNotification.alert;
		} else {
			alertContent = event.aps.alert;
		}
		window.plugins.jPushPlugin.setApplicationIconBadgeNumber(0);
		justep.Util.hint(alertContent);
	};
	//接收通知的处理
	JPushInstance.prototype.onReceiveNotification = function(event) {
		var alertContent;
        if(device.platform == "Android"){
        	alertContent = window.plugins.jPushPlugin.receiveNotification.alert;
        }else{
        	alertContent   = event.aps.alert;
        }
        window.plugins.jPushPlugin.setApplicationIconBadgeNumber(0);
		justep.Util.hint(alertContent);
	};
	//接收信息的处理
	JPushInstance.prototype.onReceiveMessage = function() {
		var message;
        if(device.platform == "Android"){
       		 message = window.plugins.jPushPlugin.receiveMessage.message;
        }else{
              message   = event.content;
        }
        window.plugins.jPushPlugin.setApplicationIconBadgeNumber(0);
		justep.Util.hint(message);
	};

	

	var jpushInstance =new JPushInstance();
	//获取注册id成功后，调用Baas服务的pushNow方法，发送推送消息，本例的Bass服务延迟10秒后发送推送
	jpushInstance.getRegistrationID().done(function(id) {
		Baas.sendRequest({
			"method" : "post",
			"url" : "/justep/jpush",
			"action" : "push",
			"params" : {
				registrationId : id
			}
		});
	});
		
};
	Model.prototype.modelModelConstructDone = function(event){
		utils.showCode(this, "ReceiveMessageClick");
		utils.prettyPrint();
	};
	return Model;
});