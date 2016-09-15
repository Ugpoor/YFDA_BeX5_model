/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var Data = require("$UI/system/components/justep/data/data");

	var url = require.normalizeName("./commonExtendTypes");
	var ComponentConfig = require("./commonExtendTypes.config");
	var RegConfig = require("./commonExtendTypes.reg");
	
	var CommonExtendTypes = justep.ViewComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		getRegConfig : function() {
			return RegConfig;
		},
		constructor : function(options) {
			this.callParent(options);
		},
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			var model = this.getModel();
			var regConfig = this.getRegConfig();
			if(regConfig && $.isArray(regConfig))
				$.each(regConfig,function(i,v){
					Data.registerExtendType(model, v);
				});
		},
		dispose : function() {
			var model = this.getModel();
			var regConfig = this.getRegConfig();
			if(regConfig && $.isArray(regConfig))
				$.each(regConfig,function(i,v){
					Data.unregisterExtendType(model,v.name);
				});
			this.callParent();
		},
	});
	
	justep.Component.register(url, CommonExtendTypes);
	return CommonExtendTypes;
});	