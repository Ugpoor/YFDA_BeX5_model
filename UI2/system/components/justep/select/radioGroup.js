/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var Radio = require("../button/radio");
	var Data = require("../data/data");

	var url = require.normalizeName("./radioGroup");
	var ComponentConfig = require("./radioGroup.config");

	var RadioGroup = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.itemStyle = "";
			this.itemClass = "";
			this._oldItemClass = "";
			this._itemTargetName = "span";
			this.callParent(options);
		},
		dispose : function() {
			this.$domNode.off('click');
			this.callParent();
		},
		val : function(val) {
			if (arguments.length === 0)
				return this.$domNode.find("input:checked").val();
			this.$domNode.find('input').each(function() {
				var o = $(this);
				o.prop('checked', val == o.val());
			});
		},
		_buildForeachTemplate : function(cfg) {
			var rb = new Radio();
			return rb.buildTemplate({
				name : cfg.name,
				'bind-value' : cfg['bind-itemsetValue'],
				'bind-label' : cfg['bind-itemsetLabel']
			});
		},
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'x-radio-group';
			var $ret = $("<span class='" + config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "")
					+ " component='" + url + "' >"
					+ "</span>");
			
			if(config['bind-itemset']){
				var itemset = config['bind-itemset'];
				itemset = "$model.comp($element)['_getForeachData'].bind($model.comp($element),"+itemset+")()";
				$ret.attr("data-bind","foreach:{data:" + itemset + ",afterRender:$model.comp($element)['_doUpdate'].bind($model.comp($element))}");
			} 
			var $t = this._buildForeachTemplate(config);
			var dataBind = 'component:{name:\''+$t.attr('component')+'\'';
			if(config['bind-itemsetValue']){
				dataBind += ",value:" + config['bind-itemsetValue'];
			}
			if(config['bind-itemsetLabel']){
				dataBind += ",label:" + config['bind-itemsetLabel'];
			}
			dataBind += '}';
			$t.attr('data-bind',dataBind);
			var name = config.name || justep.UUID.createUUID();
			$t.attr('name', name);
			$ret.append($t); 
			return $ret;
		},
		doInit : function(value, bindingContext) {
			this.$domNode.on('click', $.proxy(this._doClick, this));
			var name = this.$domNode.attr('name');
			if(!name) name = justep.UUID.createUUID();
			this.$domNode.children(this._itemTargetName+"[component*='/system/components/justep/button/']").attr('name',name);
		},
		_getForeachData: function(itemset){
			if(itemset instanceof Data) return itemset['datas'];
			else return itemset;
		},
		_doUpdate : function(){
			this.updateValue(this.ref);// 数据更新,放着if外面是为了在ref没有时也进行
			if (this.ref) {
				this.updateReadonly(this.ref);// 只读状态更新
				this.updateValidation(this.ref);// 约束状态更新
			}
			this._doUpdateCss();
		},
		_doUpdateCss : function(){
			var itemStyle = this.itemStyle;
			var itemClass = this.itemClass;
			var oldItemClass = this._oldItemClass;
			this.$domNode.children().each(function() {
				var o = $(this);
				o.attr({style:itemStyle}).removeClass(oldItemClass).addClass(itemClass);				
			});
		},
		set : function(value){
			this.callParent(value);
			if(value){
				if(value.hasOwnProperty("value")) this.val(value['value']);
			}
		},
		get : function(name){
			if('value'==name) return this.val();
			else return this.callParent(name);	
		},
		disabledRender: function(){
			if(this.$domNode){
				var disabled = this.isDisabled();
				this.$domNode.children("span").each(function(){
					var comp = justep.Component.getComponent(this);
					if(comp) comp.set({disabled:disabled});
				});
			}
			this.callParent();
		},
		propertyChangedHandler : function(key, oldVal, value) {
			if('itemClass'===key || 'itemStyle'===key){
				this._doUpdateCss();
				if('itemClass'===key){
					this._oldItemClass = oldVal;
				}
			}
			this.callParent(key, oldVal, value);
		},
		_doClick : function(evt) {
			if (evt.target.nodeName.toLowerCase() == 'input') {
				this.fireEvent('onChange', {
					source : this,
					value : this.val()
				});
				this.val2ref();
			}
		}
	});

	justep.Component.register(url, RadioGroup);
	return RadioGroup;
});