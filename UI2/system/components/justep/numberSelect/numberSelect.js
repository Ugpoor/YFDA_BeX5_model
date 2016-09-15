/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	//var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	//var Bind = justep.Bind;
	var NumberList = require("./js/numberList");

	var url = require.normalizeName("./numberSelect");
	var ComponentConfig = require("./numberSelect.config");

	var NumberSelect = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.min = 0;
			this.max = 100;
			this.showItemSize = null;
			this.showCharSize = null;
			this.value = "";
			this.callParent(options);
		},
		dispose : function() {
			if(this.list){
				this.list.dispose();
				this.list = null;
			}
			this.callParent();
		},
		val : function(v) {
			if (arguments.length === 0)
				return this.value;
			this.set({
				value : v
			});
		},
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'form-control x-numberSelect';
			return "<input class='"
			+ config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
			+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + url + "' " + " ></input>";
		},
		doInit : function(value, bindingContext) {
			if (justep.Browser.isMobile) this.$domNode.prop('readonly',true);
			this._bindEvent();
		},
		_bindEvent : function() {
			var self = this;
			this.$domNode.on("click", function(event) {
				self.showList();
				self.domNode.select();
			}).on("keypress", function(event) {
				self.hideList();
				if (event.keyCode < 48 || event.keyCode > 57) {
					return false;
				}
			}).on("paste", function(event) {
				return false;
			}).on("change", function(event) {
				self.doChange();
			});
		},
		showList: function(){
			this.getList().show();
		},
		hideList: function(){
			this.getList().hide();
		},
		getList: function(){
			if(!this.list){
				//var model = this.getModel();
				this.list = new NumberList(null, null, this.domNode, this.min, this.max, this.showCharSize, this.showItemSize);
			}
			return this.list;	
		},
		render : function() {
			this.callParent();
			this.$domNode.val(this.value);
		},
		doChange : function(evt) {
			//console.log('changed:'+this.$domNode.val());
			var v = parseInt(this.$domNode.val());
			if (v < this.min)
				v = this.min;
			if (v > this.max)
				v = this.max;
			this.set({
				value : this.$domNode.val()
			});
		},
		propertyChangedHandler : function(key, oldVal, value) {
			switch (key) {
				case "min":
				case "max":
				case "showItemSize":
				case "showCharSize":
					if(this.list){
						this.list.setParam(this.min, this.max, this.showCharSize, this.showItemSize);
					}
					break;
				case "value":
					if (oldVal != value) {
						if (this._inited) {
							this.fireEvent('onChange', {
								source : this,
								originalValue : oldVal,
								value : value
							});
							this.val2ref();
						}
					}
					this.needRender = this._inited;
					break;
				default: this.callParent(key, oldVal, value);
			}
		}
	});

	justep.Component.register(url, NumberSelect);
	return NumberSelect;
});