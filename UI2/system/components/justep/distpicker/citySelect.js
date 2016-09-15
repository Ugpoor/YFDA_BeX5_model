/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	//var $ = require("jquery");
	
	var justep = require("$UI/system/lib/justep");
	var BaseSelect = require("./js/baseSelect");

	var url = require.normalizeName("./citySelect");
	var ComponentConfig = require("./citySelect.config");

	var CitySelect = BaseSelect.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.callParent(options);
			this.optionsCaption = "—— 市 ——";
			this.url = url;
		},
		dispose : function() {
			this.callParent();
		},
		doInit : function(value, bindingContext) {
			this.provinceRef = value ? value.provinceRef : null;
			if(this.provinceRef){
				this._provinceVal = justep.Bind.isObservable(this.provinceRef) ? this.provinceRef.get() : (this.provinceRef instanceof justep.BindComponent.NullValue?"":this.provinceRef);
				this.optionRender(this.domNode, this._provinceVal);
			}
			this.callParent(value, bindingContext);
		},
		doUpdate : function(value, bindingContext, allBindings) {
			var provinceRef = value ? value.provinceRef : null;
			if(provinceRef!=this.provinceRef) this.provinceRef = provinceRef;
			var provinceVal = '';
			if(this.provinceRef){
				provinceVal = justep.Bind.isObservable(this.provinceRef) ? this.provinceRef.get() : (this.provinceRef instanceof justep.BindComponent.NullValue?"":this.provinceRef);
			}
			if(provinceVal!==this.provinceVal){
				this.provinceVal = provinceVal;
				this.optionRender(this.domNode, this.provinceVal);
			}
			this.callParent(value, bindingContext, allBindings);
		}
	});

	justep.Component.register(url, CitySelect);
	return CitySelect;
});