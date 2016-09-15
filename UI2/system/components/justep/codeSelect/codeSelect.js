/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");
	require("res!./img");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var Select = require("../select/select");

	var url = require.normalizeName("./codeSelect");
	var ComponentConfig = require("./codeSelect.config");

	var CodeSelect = Select.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.codeType = "";
			this.callParent(options);
		},
		dispose : function() {
			this.callParent();
		},
		// 动态创建组件
		buildTemplate : function(config) {
			return this.callParent(config);
		},
		doInit : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			this._getOptionData().on(Data.EVENT_REFRESHDATA_BEFORE, this._doRefreshOptionDataBefore, this);
		},
		_getOptionData : function() {
			var dataXid = this.$domNode.attr("_data_");
			return this.getModel().comp(dataXid);
		},
		_doRefreshOptionDataBefore: function(evt){
			evt.source.setFilter('_TypeFilter_', this._getTypeFilter());
		},
		doUpdate : function(value, bindingContext, allBindings) {
			this.callParent(value, bindingContext, allBindings);
		},
		_getTypeFilter : function() {
			if (justep.String.trim(this.codeType) == "") {
				throw new Error("CodeType is required!");
			}
			return "SA_Code.sType = '" + this.codeType.replace(/'/g, "''") + "'";
		}
	});

	justep.Component.register(url, CodeSelect);
	return CodeSelect;
});