/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var Radio = require("./radioPC");

	var url = require.normalizeName("./checkboxPC");
	var ComponentConfig = require("./checkboxPC.config");

	var Checkbox = Radio.extend({
		_defaultClass : "checkbox",
		_type : 'checkbox',

		getConfig : function() {
			return ComponentConfig;
		},

		getDisplayHtml : function(context){
			return Checkbox.getDisplayHtml(context);
		}
	});

	justep.Component.register(url, Checkbox);
	return Checkbox;
});