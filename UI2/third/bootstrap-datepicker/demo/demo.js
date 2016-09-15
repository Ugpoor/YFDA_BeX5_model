/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");

	// 引入bootstrap
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");

	// https://github.com/eternicode/bootstrap-datepicker
	require("css!../css/datepicker3").load();
	require("../js/bootstrap-datepicker");
	// 引入语言，修改了代码采用模块化,其他语言使用时需要同样模块化处理，请参考../js/locales/bootstrap-datepicker.zh-CN.min修改
	require("../js/locales/bootstrap-datepicker.zh-CN.min");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		// 案例来自于
		// http://eternicode.github.io/bootstrap-datepicker/?markup=input&format=&weekStart=&startDate=&endDate=&startView=0&minViewMode=1&todayBtn=false&clearBtn=false&language=en&orientation=auto&multidate=&multidateSeparator=&keyboardNavigation=on&forceParse=on#sandbox
		this.initDatepicker();
	};

	Model.prototype.initDatepicker = function() {
		$('input', this.getRootNode()).datepicker({
			format: "yyyy-mm-dd",
			//minViewMode: 1,
			startView: 2,
			clearBtn : true,
			language : "zh-CN",
			autoclose : true,
			todayHighlight : true
		});
	};

	return Model;
});