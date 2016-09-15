/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var RadioPC = require("../button/radioPC");
	var RadioGroup = require("./radioGroup");

	var url = require.normalizeName("./radioGroupPC");
	var ComponentConfig = require("./radioGroupPC.config");

	var RadioGroupPC = RadioGroup.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.callParent(options);
			this._itemTargetName = "div";
		},
		dispose : function() {
			this.callParent();
		},
		_buildForeachTemplate : function(cfg) {
			var rb = new RadioPC();
			return rb.buildTemplate({
				name : cfg.name,
				'bind-value' : cfg['bind-itemsetValue'],
				'bind-label' : cfg['bind-itemsetLabel']
			});
		},
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = '';
			var $ret = $("<div class='" + config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "")
					+ " component='" + url + "' >"
					+ "</div>");
			
			if(config['bind-itemset']){
				$ret.attr("data-bind","foreach:{data:" + config['bind-itemset'] + ",afterRender:$model.comp($element)['_doUpdate'].bind($model.comp($element))}");
			} 
			var $t = this._buildForeachTemplate(config);
			var dataBind = 'component:{name:\''+$t.attr('component')+'\'';
			if(config['bind-itemsetValue']){
				dataBind += ",value:" + config['bind-itemsetValue'];
			}
			if(config['bind-itemsetLabel']){
				dataBind += ",label:" + config['bind-itemsetLabel'];
			}
			dataBind += '}';
			$t.attr('data-bind',dataBind);
			var name = config.name || justep.UUID.createUUID();
			$t.attr('name', name);
			$ret.append($t); 
			return $ret;
		}
	});

	justep.Component.register(url, RadioGroupPC);
	return RadioGroupPC;
});