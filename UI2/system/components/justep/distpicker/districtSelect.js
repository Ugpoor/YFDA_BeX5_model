/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	//var $ = require("jquery");
	
	var justep = require("$UI/system/lib/justep");
	var BaseSelect = require("./js/baseSelect");

	var url = require.normalizeName("./districtSelect");
	var ComponentConfig = require("./districtSelect.config");

	var DistrictSelect = BaseSelect.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.callParent(options);
			this.optionsCaption = "—— 区 ——";
			this.url = url;
		},
		dispose : function() {
			this.callParent();
		},
		doInit : function(value, bindingContext) {
			this.cityRef = value ? value.cityRef : null;
			if(this.cityRef){
				this._cityVal = justep.Bind.isObservable(this.cityRef) ? this.cityRef.get() : (this.cityRef instanceof justep.BindComponent.NullValue?"":this.cityRef);
				this.optionRender(this.domNode, this._cityVal);
			}
			this.callParent(value, bindingContext);
		},
		doUpdate : function(value, bindingContext, allBindings) {
			var cityRef = value ? value.cityRef : null;
			if(cityRef!=this.cityRef) this.cityRef = cityRef;
			var cityVal = '';
			if(this.cityRef){
				cityVal = justep.Bind.isObservable(this.cityRef) ? this.cityRef.get() : (this.cityRef instanceof justep.BindComponent.NullValue?"":this.cityRef);
			}
			if(cityVal!==this.cityVal){
				this.cityVal = cityVal;
				this.optionRender(this.domNode, this.cityVal);
			}
			this.callParent(value, bindingContext, allBindings);
		}
	});

	justep.Component.register(url, DistrictSelect);
	return DistrictSelect;
});