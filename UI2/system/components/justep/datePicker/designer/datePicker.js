/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var RTDatePicker = require("../datePicker");
	require('css!./css/datePicker').load();

	//var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	//var xuiDoc = xuiService.getXuiDoc(); 

	function create(comp, clz) {
		var $domNode = $(comp.domNode);
		comp.domNode.style.position = "absolute";
		if (!comp.domNode.style.top) {
			comp.domNode.style.top = "10px";
			comp.domNode.style.left = "10px";
		}
		$domNode.addClass(clz).children().hide();
		$('.x-popPicker-overlay',$domNode).attr("d_canRemove",false);
		$('.x-popPicker-content',$domNode).attr("d_canRemove",false);
		$('.x-poppicker-header',$domNode).attr("d_canRemove",false);
		$('.x-poppicker-title',$domNode).attr("d_canRemove",false);
	}
	
	var DatePicker = RTDatePicker.extend({
		init : function(value, bindingContext) {
			create(this, 'x-designer-datePicker');
			this.callParent(value, bindingContext);
		}
	});

	return {
		'$UI/system/components/justep/datePicker/datePicker' : DatePicker
	};
});