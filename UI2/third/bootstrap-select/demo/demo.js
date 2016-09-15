/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");

	//引入bootstrap
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
	
	// https://github.com/silviomoreto/bootstrap-select
	// 引入bootstrap-select
	require("css!../css/bootstrap-select").load();
	require("../js/bootstrap-select");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.initSelects();
	};

	Model.prototype.initSelects = function() {
		//初始化bootstrap-select组件
		//代码和演示案例来自于原组件test.html
		var root = this.getRootNode();
	    var mySelect = $('#first-disabled2',root);
	
	    $('#special',root).on('click', function () {
	      mySelect.find('option:selected').prop('disabled', true);
	      mySelect.selectpicker('refresh');
	    });
	
	    $('#special2',root).on('click', function () {
	      mySelect.find('option:disabled').prop('disabled', false);
	      mySelect.selectpicker('refresh');
	    });
	
	    $('#basic2',root).selectpicker({
	      liveSearch: true,
	      maxOptions: 1
	    });
	    
	    $('.selectpicker', root).selectpicker();
	};
	
	return Model;
});