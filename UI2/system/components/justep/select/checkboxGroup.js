/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var Checkbox = require("../button/checkbox");
	var RadioGroup = require("./radioGroup");

	var url = require.normalizeName("./checkboxGroup");
	var ComponentConfig = require("./checkboxGroup.config");

	var CheckboxGroup = RadioGroup.extend({
		getConfig : function() {
			return ComponentConfig;
		},

		val : function(val) {
			if (arguments.length === 0) {
				var ret = [];
				this.$domNode.find("input:checked").each(function() {
					ret.push($(this).val());
				});
				return ret.join(' ');
			}
			if (null === val || undefined === val)
				val = '';
			var vs = ('' + val).split(' ');
			this.$domNode.find('input').each(function() {
				var o = $(this);
				o.prop('checked', -1 < $.inArray(o.val(), vs));
			});
		},
		_buildForeachTemplate : function(cfg) {
			var cb = new Checkbox();
			return cb.buildTemplate({
				name : cfg.name,
				'bind-value' : cfg['bind-itemsetValue'],
				'bind-label' : cfg['bind-itemsetLabel']
			});
		},
		buildTemplate : function(config) {
			if (!config['class'])
				config['class'] = 'x-checkbox-group';
			return this.callParent(config);
		}
	});

	justep.Component.register(url, CheckboxGroup);
	return CheckboxGroup;
});