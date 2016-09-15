/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/  
define(function(require) {
	require('css!./css/excel').load();
	var $ = require("jquery");
	//var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var ExportExcelRT = require("../exportExcel");

	function create(comp, clz) {
		var $domNode = $(comp.domNode);
		comp.domNode.style.position = "absolute";
		if (!comp.domNode.style.top) {
			comp.domNode.style.top = "10px";
			comp.domNode.style.left = "10px";
		}
		$domNode.addClass(clz);
	}

	var ExportExcel = ExportExcelRT.extend({
		init : function(value, bindingContext) {
			create(this, 'x-export-excel-designer');
			this.callParent(value, bindingContext);
		}
	});
	
	
	return {
		'$UI/system/components/justep/excel/exportExcel' : ExportExcel 
	};
});
