/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	
	var justep = require("$UI/system/lib/justep");
	var chineseDistricts = require("./chineseDistricts");
	var placeholderName = '_placeholder_';

    var getList= function (data) {
        var list = [];

        if(data){
        	$.each(data, function (n, v) {
        		var html = '<option' +
        					' value="' + (placeholderName===n?'':(v || '')) + '"' +
        					'>' +
        					(v || '') +
        					'</option>';
        		if(placeholderName!==n) list.push(html);
        		else list.splice(0,0,html);
        	});
        }

        return list.join('');
      };
	
	var BaseSelect = justep.BindComponent.extend({
		constructor : function(options) {
			this.callParent(options);
			this.optionsCaption = "";
		},
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'form-control';
			return "<select class='"
					+ config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + this.url
					+ "' " + " ></select>";
		},
		optionRender : function(select, v){
			var data = this.getDistrict(v);
			$(select).children().remove();
			$(select).append(getList(data));
		},
		getDistrict : function(name){
			if(name===undefined) name = '中国';
			var ret = {};
			ret[placeholderName] = this.optionsCaption;
			return $.extend(ret,chineseDistricts[name]);
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
				this.val2ref();
			}
		},
		doInit : function(value, bindingContext) {
			this._bindEvent();
		},
		doUpdate : function(value, bindingContext, allBindings) {
			this.callParent(value, bindingContext, allBindings);
		},
		_bindEvent: function(){
			this.$domNode.on('change', $.proxy(this.doChange, this));
		},
		doChange : function(e) {
			this.fireEvent('onChange', {
				'source' : this,
				'value' : this.$domNode.val()
			});
			this.val2ref();
		}
	});

	return BaseSelect;
});