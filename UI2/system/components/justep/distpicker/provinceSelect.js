/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	//var $ = require("jquery");
	
	var justep = require("$UI/system/lib/justep");
	var BaseSelect = require("./js/baseSelect");

	var url = require.normalizeName("./provinceSelect");
	var ComponentConfig = require("./provinceSelect.config");

	var ProvinceSelect = BaseSelect.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.callParent(options);
			this.optionsCaption = "—— 省 ——";
			this.url = url;
		},
		dispose : function() {
			this.callParent();
		},
		doInit : function(value, bindingContext) {
			this.optionRender(this.domNode);
			this.callParent(value, bindingContext);
		},
		doUpdate : function(value, bindingContext, allBindings) {
			this.callParent(value, bindingContext, allBindings);
		}
	});

	justep.Component.register(url, ProvinceSelect);
	return ProvinceSelect;
});