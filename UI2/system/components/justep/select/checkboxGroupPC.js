/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require('$UI/system/lib/justep');
	var CheckboxPC = require("../button/checkboxPC");
	var CheckboxGroup = require("./checkboxGroup");

	var url = require.normalizeName("./checkboxGroupPC");
	var ComponentConfig = require("./checkboxGroupPC.config");

	var CheckboxGroupPC = CheckboxGroup.extend({
		getConfig : function() {
			return ComponentConfig;
		},

		// 构造函数
		constructor : function(options) {
			this.callParent(options);
			this._itemTargetName = "div";
		},
		_buildForeachTemplate : function(cfg) {
			var cb = new CheckboxPC();
			return cb.buildTemplate({
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
			var ret = "<div class='" + config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " data-bind='foreach:" + config.itemset + "' " + " component='" + url
					+ "' >" + this._buildForeach(config) + "</div>";
			delete config['bind-itemset'];
			delete config['bind-itemsetValue'];
			delete config['bind-itemsetLabel'];
			return ret;
		}
	});

	justep.Component.register(url, CheckboxGroupPC);
	return CheckboxGroupPC;
});