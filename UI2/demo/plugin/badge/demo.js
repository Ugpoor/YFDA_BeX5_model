define(function(require){
	var $ = require("jquery");
	require("cordova!de.appplant.cordova.plugin.badge");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
	var myapp = {};  
	
	myapp.callback = function(result) {  
	    alert(result);
	};  
    
    function callback(message) {
	    setTimeout(function() {
	        alert(message);          
	    });
    };
      
	Model.prototype.hasPermissionClick = function(event){
		cordova.plugins.notification.badge.hasPermission(myapp.callback,myapp);
	};

	Model.prototype.registerPermissionClick = function(event){
		cordova.plugins.notification.badge.registerPermission(myapp.callback,myapp);
	};

	Model.prototype.setBadgeClick = function(event){
	    cordova.plugins.notification.badge.set(10,myapp.callback,myapp);
	};

	Model.prototype.getBadgeClick = function(event){
		cordova.plugins.notification.badge.get(myapp.callback,myapp);
	};

	Model.prototype.clearBadgeClick = function(event){
		cordova.plugins.notification.badge.clear(myapp.callback,myapp);
	};

	Model.prototype.chageTitleClick = function(event){
	    var title = "新消息";
	    cordova.plugins.notification.badge.configure({
	      title: title
	    });
	    callback('设置标题为 \n"' + title + '"');
	};
	Model.prototype.modelModelConstructDone = function(event) {
		utils.showCode(this,"hasPermissionClick").showCode("registerPermissionClick").showCode("setBadgeClick").showCode("getBadgeClick").showCode("clearBadgeClick").showCode("chageTitleClick").prettyPrint();
	};
	return Model;
});