/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var bind = require("bind");
	var Component = require("$UI/system/lib/base/component");
	var RTReportData = require("../reportData");
	require('css!./css/reportData').load();

	var createData = function(data, clz) {
		var $domNode = $(data.domNode), xid = $domNode.attr("xid"), model = data.getModel();
		data.getModel().registerComponent(data.xid, data);
		$domNode.empty().css("height", "22px").css("display", "block").addClass(clz).append(
				"<img align='absmiddle' style='width:16px;height:18px;'/><span>" + $domNode.attr("xid") + "</span>");
		model.resolvedComponent(xid);
	};

	var set = function set(data, value) {
		if ('xid' in value) {
			var $domNode = $(data.domNode), oldxid = $domNode.attr("xid");
			data.getModel().unRegisterComponent(oldxid);
			data.getModel().registerComponent(value['xid'], data);
			$domNode.children('span').text(value['xid'] ? value['xid'] : '');
		}
	};

	var ReportData = RTReportData.extend({
		constructor : function(config) {
			if (config && config.templateNode) {
				this._bind(config.templateNode);
			}
			this.callParent(config);
		},
		_init : function() {
		},
		init : function(value, bindingContext) {
			createData(this, 'x-report-data');
		},
		_bind : function(element) {
			bind.utils.domData.set(element, Component.BIND_NAME, this);
			this.domNode = element;
			this.$domNode = $(this.domNode);
			bind.utils.domNodeDisposal.addDisposeCallback(element, this.dispose.bind(this));
		},
		set : function(v) {
			set(this, v);
		}
	});

	return {
		'$UI/system/components/justep/reportData/reportData' : ReportData
	};
});