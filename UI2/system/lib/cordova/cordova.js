define(['require',(function() {
	var deviceTypes = new Array("Android", "iPhone", "iPad", "iPod", "Windows Phone", "Generic");
	var userAgentInfo = navigator.userAgent;
	
	function currentDevice() {
		for ( var v = 0; v < deviceTypes.length; v++) {
			var i = userAgentInfo.indexOf(deviceTypes[v]);
			if (i > 0) {
				return v;
			}
		}
		return deviceTypes.length - 1;
	}

	var isX5App = (userAgentInfo.indexOf("x5app") >= 0) || (userAgentInfo.indexOf("Crosswalk") >= 0);
	var isWeChat = navigator.userAgent.indexOf("MicroMessenger") >= 0;
	
	var deviceTypeID = currentDevice();
	
	if (!window.isInDesigner && isX5App) {
		//cordova 逻辑需要
		window.handleOpenURL = function(url) {
			$(window).trigger('handleOpenURL',url);
		};
		if ((deviceTypes[deviceTypeID] == "iPhone") || (deviceTypes[deviceTypeID] == "iPad") || (deviceTypes[deviceTypeID] == "iPod")) {
			return "/cordova.js";
		} else if (deviceTypes[deviceTypeID] == "Android") {
			return "/cordova.js";
		} 
	}else if(isWeChat){
		return "./weixin/wxApi";
	}
})(),'./keyboard','../debug/livereload'], function(require,cordova) {
	//fastclick
	/*	require('res!./keyboard.js');
		require('res!./weixin');
		require('res!../debug/livereload.js');
		require('res!$UI/system/components/justep/lib/fastclick.js');
		
	*/
	require(['$UI/system/components/justep/lib/fastclick'],  function (FastClick) { 
		FastClick.attach(document.body);
	});
	
	var x5AppAgents = /x5app\/([0-9.]*)/.exec(navigator.userAgent);
	var x5Version = "notInApp";
	if(x5AppAgents && x5AppAgents.length > 1){
		x5Version = x5AppAgents[1];
	}
	$(document).on("pause",function(){
		if(window.plugins && plugins.appPreferences){
			plugins.appPreferences.fetch("indexPage_" + x5Version).then(function(indexPage){
				if(indexPage && window.__justep.__ResourceEngine.url != indexPage && indexPage.length > 5){
					location.href = indexPage;
				}
			});
		}
	});
	
	return cordova;
});
