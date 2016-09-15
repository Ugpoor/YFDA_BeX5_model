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
	
	// https://github.com/nostalgiaz/bootstrap-switch
	// 引入bootstrap-switch
	require("css!../css/bootstrap-switch").load();
	require("../js/bootstrap-switch");

	var justep = require("$UI/system/lib/justep");
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.initSwitch = function() {
		//初始化bootstrap-switch组件
		//代码和演示案例来自于原组件examples.html
		//修改部分id--->xid
		var root = this.getRootNode();
		var m = this;
		$("input[type=\"checkbox\"], input[type=\"radio\"]", root).not("[data-switch-no-init]").bootstrapSwitch();
		$("[data-switch-get]", root).on("click", function() {
			var type;
			type = $(this).data("switch-get");
			return alert($(m.getElementByXid("switch-" + type)).bootstrapSwitch(type));
		});
		$("[data-switch-set]").on("click", function() {
			var type;
			type = $(this).data("switch-set");
			return $(m.getElementByXid("switch-" + type)).bootstrapSwitch(type, $(this).data("switch-value"));
		});
		$("[data-switch-toggle]",root).on("click", function() {
			var type;
			type = $(this).data("switch-toggle");
			return $(m.getElementByXid("switch-" + type)).bootstrapSwitch("toggle" + type.charAt(0).toUpperCase() + type.slice(1));
		});
		$("[data-switch-set-value]",root).on("input", function(event) {
			var type, value;
			event.preventDefault();
			type = $(this).data("switch-set-value");
			value = $.trim($(this).val());
			if ($(this).data("value") === value) {
				return;
			}
			return $(m.getElementByXid("switch-" + type)).bootstrapSwitch(type, value);
		});
		$("[data-switch-create-destroy]",root).on("click", function() {
			var isSwitch;
			var $createDestroy = $(m.getElementByXid("switch-create-destroy"));
			isSwitch = $createDestroy.data("bootstrap-switch");
			$createDestroy.bootstrapSwitch((isSwitch ? "destroy" : null));
		});
	};
	
	Model.prototype.modelLoad = function(event) {
		//延迟创建组件，依赖css的加载后初始化
		var self = this;
		window.setTimeout(justep.Util.bindModelFn(this,function(){
			self.initSwitch();
		}), 500);
	};

	return Model;
});