/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');

	var url = require.normalizeName("./radioPC");
	var ComponentConfig = require("./radioPC.config");

	var RadioPC = justep.BindComponent.extend({
		// 构造函数
		_defaultClass : "radio",
		_type : 'radio',

		getConfig : function() {
			return ComponentConfig;
		},

		constructor : function(options) {
			this.callParent(options);
			this.label = null;
			this.name = null;
			this.checkedValue = undefined;
			this.uncheckedValue = undefined;
			this.value = null;
			this.checked = false;
			this.on(justep.ViewComponent.DATA_CHANGED, function(event) {// 可以根据属性值变化事件更新value和label
				if ('ref' == event.name)
					return;
				var param = {};
				param[event.name] = event.value;
				this.set(param);
			}, this);
		},
		dispose : function() {
			this._getInput().off('change', this._clickHandle);
			this.callParent();
		},
		val : function() {
			if (arguments.length === 0)
				return this.value;
			this.value = arguments[0];
			this._getInput().prop('checked', this.checkedValue === undefined ? !!this.value : (this.checkedValue == this.value)).val(this.value);//lzg 这里没有使用===原因是有可能数据是int等类型
		},
		_buildInput : function(config) {
			var $ret = $("<input"
					+ (config['name'] ? (" name='" + config['name'] + "'") : "") 
					+ (config['checked'] ? " checked" : "") 
					+ " type='" + this._type + "'/>");
			if(undefined!==config['value']) $ret.attr("value", config['value']);
			return $ret;
		},
		_buildLabel : function(config) {
			var $ret = $("<label>"
					+ "</label>");
			$ret.append(this._buildInput(config));
			var $labelSpan = $("<span></span>");
			if(config['label']) $labelSpan.text(config['label']);
			$ret.append($labelSpan);
			return $ret;
		},
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			/*
			 * <div class="radio"><label><input id="toggle00" disabled="disabled"
			 * type="radio" name="toggle0-1" value="1"/><span>选择1</span></div>
			 */
			if (!config['class'])
				config['class'] = this._defaultClass;
			var $ret = $("<div"
					+ (config['class'] ? (" class='" + config['class'] + "'") : "") + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + url + "'>"
					+ "</div>");
			$ret.append(this._buildLabel(config));
			return $ret;
		},
		doInit : function(value, bindingContext) {
			var $input = this._getInput();
			this._clickHandle = this._doClick.bind(this);
			$input.on('change', this._clickHandle);

			var name = this.$domNode.attr('name');
			if(name) $input.attr('name',name);
			
			if (value && !value.hasOwnProperty('ref')) {
				var o = {};
				if(justep.Bind.isObservable(value.value))
					o.value = value.value.get();
				if(justep.Bind.isObservable(value.label))
					o.label = value.label.get();
				this.set(o);
			}
		},
		doUpdate : function(value, bindingContext) {
			if (value) {
				if (value.hasOwnProperty('ref')) {
					this.updateValue(value.ref);// 数据更新
					this.updateReadonly(value.ref);// 只读状态更新,当有ref时按ref感知，否则使用value
				} else
					this.updateReadonly(value.value);
			}
		},
		_doClick : function(evt) {
			var checked = this._getInput()[0].checked;
			this.value = this.checkedValue === undefined ? checked : (checked ? this.checkedValue : (this.uncheckedValue !== undefined?this.uncheckedValue:null));
			this.fireEvent('onChange', {
				source : this,
				checked : checked,
				value : this.value
			});
			this.val2ref();
		},
		_getInput : function() {
			return this.$domNode.find('label>input');
		},
		_getLabel : function() {
			return this.$domNode.find('label>span');
		},
		get: function(attr){
			if('checked'===attr) return this._getInput().prop('checked');
			return this.callParent(attr);
		},
		disabledRender: function(){
			if(this.$domNode) this._getInput().attr('disabled', this.isDisabled());
		},
		propertyChangedHandler : function(key, oldVal, value) {
			switch (key) {
			case "label":
				if (oldVal != value && this.$domNode)
					this._getLabel().text(value);
				break;
			case "value":
				if (oldVal != value && this.$domNode)
					this.val(value);
				break;
			case "checked":
				if (oldVal != value && this.$domNode)
					this._getInput().prop('checked', value);
				break;
			default:
				this.callParent(key, oldVal, value);
			}
		}
	});

	justep.Component.register(url, RadioPC);
	return RadioPC;
});