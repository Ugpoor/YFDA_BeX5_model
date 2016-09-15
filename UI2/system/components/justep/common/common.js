/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");
	require('css!./css/common').load();
	var util = {};
	util.message = function(containerID, message) {
		$("#" + containerID).addClass("aler-message");
		$("#" + containerID).html(message.toString());
		$("#" + containerID).slideDown('fast', "linear", function() {
			setTimeout(function() {
				$("#" + containerID + ":visible").fadeOut();
			}, 2000);
		});
	};
	util.openPage = function(params) {
		var dialog;
		if (!dialog) {
			dialog = new WindowDialog({
				title : 'testPage',
				showTitle : false,
				status : 'maximize',
				src : params.url,
				parentNode : params.parent
			});
		}
		dialog.open({data : params.value});
	};
	/**
	 * params.url:页面文件,默认$UI/system/components/justep/common/demo/dialog.w
	 * params.self:this
	 * params.data:显示源码的资源
	 * params.type：显示源码类型，true为显示w中指定节点源码，false：显示js源码，默认false
	 * flag : 是否以baas方式显示源码，true/false
	 * */
	util.showSource = function(params,flag) {
		var src = (flag === true) ? '$UI/system/components/justep/common/dialog.w' : '$UI/system/components/justep/common/demo/dialog.w';
		var url = params.url ? params.url : src;
		var isPC = justep.Browser.isPC;
		var status = isPC ? 'normal' : 'maximize';
		var data = params.data;
		data = params.type ? ('/baas/justep/getContent/getWindowContent?window='+'/UI2/'+data) : '$UI/'+data;
		var options = {
				title : '源码查看',
				showTitle : true,
				src : require.toUrl(url),
				parentNode : params.self.getRootNode(),
				status : status
		};
		var windowDialog = new WindowDialog(options);
		windowDialog.open({data:data});
	};
	util.flag = true;
	return util;
});