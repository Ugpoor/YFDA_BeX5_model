/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var bind = require("bind");
	var Component = require("$UI/system/lib/base/component");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	var RTChart = require("../chart");

	var createChart = function(data, clz) {
		var $domNode = $(data.domNode), xid = $domNode.attr("xid"), model = data.getModel();
		data.getModel().registerComponent(data.xid, data);
		var imagePath = require.toUrl('./img/runtime_default_chart.gif');
		$domNode.empty().css("display", "block").addClass(clz).append(
				"<img src='" + imagePath + "'  style='' border='0'/>");
		model.resolvedComponent(xid);
	};

	var set = function set(comp, value) {
		if ('xid' in value) {
			var $domNode = $(comp.domNode), oldxid = $domNode.attr("xid");
			comp.getModel().unRegisterComponent(oldxid);
			comp.getModel().registerComponent(value['xid'], comp);
			$domNode.children('span').text(value['xid'] ? value['xid'] : '');
		}
	};

	var Chart = RTChart.extend({
		constructor : function(config) {
			if (config && config.templateNode) {
				this._bind(config.templateNode);
			}
			this.callParent(config);
		},
		init : function(value, bindingContext) {
			var $domNode = $(this.domNode);
			createChart(this, 'x-chart');
			window.setTimeout(function(){
				xuiDoc.repaintComponent($domNode.attr('d_id'));
			}, 1000);
		},
		getChartBound : function(params) {
			var $domNode = $(this.domNode);
			params['bound'] = {x:0,y:0,w:$domNode.innerWidth(),h:$domNode.innerHeight()};
		},
		_repaintChart : function(params) {
			var $domNode = $(this.domNode);
			$domNode.children('img').attr('src', params.image);
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
		'$UI/system/components/justep/chart/chart' : Chart 
	};
});

