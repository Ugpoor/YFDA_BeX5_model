/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var url = require.normalizeName("./textarea");
	var ComponentConfig = require("./textarea.config");

	var Textarea = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.callParent(options);
			this.placeHolder = '';
			this.valueUpdateMode = null;
		},

		dispose : function() {
			this.removeHandlers();
			this.callParent();
		},

		// 动态创建组件
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'form-control';
			return "<textarea class='" + config['class'] + "' " + (config.style ? (" style='" + config.style + "'") : "")
					+ (config.xid ? (" xid='" + config.xid + "'") : "") + " component='" + url + "'" + " ></textarea>";
		},

		// 初始化
		doInit : function(value, bindingContext) {
			this.addHandlers();
		},
		set : function(value){
			this.callParent(value);
			if(value && value.hasOwnProperty("value")) this.val(value['value']);
		},
		get : function(name){
			if('value'==name) return this.val();
			else return this.callParent(name);	
		},
		val : function(val) {
			var originalValue = this.$domNode.val();
			if (arguments.length === 0)
				return originalValue;
			var v = val;
			if (v === undefined || v === null)
				v = '';
			if (v != originalValue) {
				var o = this.$domNode;
				if (this._inited)
					this.fireEvent('onChange', {
						'source' : this,
						'value' : val
					});
				o.val(v);
				var refVal = justep.Bind.isObservable(this.ref) ? this.ref.get() : (this.ref instanceof justep.BindComponent.NullValue?"":this.ref);
				if(v!==refVal && (v!=='' || (refVal!==undefined && refVal!==null))) this.val2ref();
			}
		},
		addHandlers : function() {
			var self = this;
			var valueUpdateHandle = $.proxy(this.doChange, this);
			this.$domNode.on('change', valueUpdateHandle);
			//增加值更新模式
			if(typeof(this.valueUpdateMode)=='string')
				this.valueUpdateMode = this.valueUpdateMode.split(",");
			if($.isArray(this.valueUpdateMode)){
				$.each(this.valueUpdateMode,function(i,name){
					if(name)self.$domNode.on(name, valueUpdateHandle);
				});
			}
		},

		removeHandlers : function() {
			this.$domNode.off('change');
		},

		doChange : function(e) {
			this.fireEvent('onChange', {
				'source' : this,
				'value' : this.$domNode.val()
			});
			this.val2ref();
		},

		clear : function() {
			this.val(null);
		}
	});

	justep.Component.register(url, Textarea);
	return Textarea;
});