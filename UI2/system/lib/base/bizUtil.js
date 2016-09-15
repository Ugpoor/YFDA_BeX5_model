/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var _Date = require("./date");
	var sysDateTimeUrl = require.toUrl("$UI/system/service/common/getSystemDatetime.j");
	var actionPermission = require("./actionPermission");
	
	var Util = {
		getSystemDatetime: function(){
			var result = $.ajax({
			    type: "GET",
			    url: sysDateTimeUrl,
			    dataType: 'json',
			    async: false,
			    cache:false
			});
			var txt = result.responseText;
			return txt?_Date.fromString(txt, _Date.STANDART_FORMAT) : null;
		},
		
		isDisabledAction : function(model, action) {
			return actionPermission.isDisabledAction(model, action);
		},
	};
	
	return Util;
});

