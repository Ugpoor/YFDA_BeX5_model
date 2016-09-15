/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var justep = require('$UI/system/lib/justep');

	var url = require.normalizeName("./select");
	var ComponentConfig = require("./select.config");

	var touch = ('ontouchstart' in window);
	var START_EVENT = touch ? 'touchstart' : 'mousedown';
	var Select = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.callParent(options);
			// this.data = null;
			// this.relation = null;
			this.disabled = false;
			this.options = null;
			this.optionsAutoLoad = true;
			this.optionsCaption = "";
			this.optionsText = "";
			this.optionsValue = "";
		},

		dispose : function() {
			this.$domNode.off('optionChange');
			this.$domNode.off('change');
			this.$domNode.off(START_EVENT);
			this.callParent();
		},
		val : function(val) {
			var originalValue = this.$domNode.val();
			if (arguments.length === 0)
				return originalValue;
			this.$domNode.val(arguments[0]);
		},
		buildTemplate : function(config) {
			this._createOptionsRender();
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'form-control';
			if (config['bind-optionsLabel']) {
				config['bind-optionsText'] = "'" + config['bind-optionsLabel'] + "'";
				delete config['bind-optionsLabel'];
			}
			var binds = [ 'bind-optionsCaption', 'bind-optionsValue' ];
			for ( var i=0;i<binds.length;i++) {
				if (config[binds[i]])
					config[binds[i]] = "'" + config[binds[i]] + "'";
			}
			if(config['bind-options']){
				config["bind-optionsBeforeRender"] = '$model.__justep__.selectOptionsBeforeRender.bind($model,$element)';
				config["bind-optionsAfterRender2"] = '$model.__justep__.selectOptionsAfterRender.bind($model,$element)';
			}
			return "<select class='"
					+ config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + url
					+ "' " + " ></select>";
		},
		doInit : function(value, bindingContext, allBindings) {
			this.$domNode.on('optionChange', $.proxy(this._doOptionChange, this));
			this.$domNode.on('change', $.proxy(this._doChange, this));
			this.$domNode.on(START_EVENT, $.proxy(this._loadData, this));
			this.labelRef = value ? value.labelRef : null;
		},
		doUpdate : function(value, bindingContext, allBindings) {
			this.labelRef = value ? value.labelRef : null;
			if (allBindings['has']('options')) {
				this.options = allBindings.get('options');
			}
			this._addDefaultOption();
			this.callParent(value, bindingContext);
		},
		_createOptionsRender : function() {
			var model = this.getModel();
			if (!model['__justep__'])
				model['__justep__'] = {};
			if (!model['__justep__'].selectOptionsAfterRender)
				model['__justep__'].selectOptionsAfterRender = function($element) {
					var comp = justep.Component.getComponent($element);
					if(comp) comp._addDefaultOption();
				};
			if (!model['__justep__'].selectOptionsBeforeRender)
				model['__justep__'].selectOptionsBeforeRender = function($element) {
					var comp = justep.Component.getComponent($element);
					if(comp) comp._optionsBeforeRender();
				};
		},
		_loadData : function() {
			if(this._load) return;
			if(!this.options) return;
			var optionData;
			if (this.optionsAutoLoad) {
				optionData = this.options.owner;
				if (optionData && !optionData.autoLoad && !optionData.isLoaded()) {
					this._load = optionData.refreshData();
				}
			}
			if(this.ref) this.updateValue(this.ref);
		},
		_optionsBeforeRender : function(){
			this.$domNode.children("[_default_option_='true']").remove();// 删除为了显示增加的option
		},
		_addDefaultOption : function() {
			if(!this.options) return;
			var optionData = this.options.owner,val,label;
			if (optionData) {
				if (this.ref && this.labelRef) {
					val = this.ref.get();
					label = this.labelRef.get();
					if(label!==undefined && label!==null && label!=='')
						this._addOption(val, label);
				} else if (this.ref) {
					val = this.ref.get();
					if(val!==undefined && val!==null && val!=='')
						this._addOption(val,val);
				}
			}
		},
		_addOption : function(value, label) {
			if (!this._optionExistValue(value)) {
				var o = document.createElement('option');
				$(o).attr('_default_option_', 'true');
				o.value = value;
				o.text = (null !== label && undefined !== label) ? label : '';
				this.domNode.add(o, null); // standards compliant
			}
		},
		_optionExistValue : function(v) {
			v = v===undefined||v===null?'':v;
			var a = this.domNode.options;
			for ( var i = a.length - 1; i >= 0; i--) {
				if (v == a[i].value || (v+'') == a[i].value)
					return true;
			}
		},
		_getLabel : function() {
			var i = this.$domNode.prop('selectedIndex');
			if (i > -1)
				return this.$domNode.prop('options')[i].text;
			else
				return undefined;
		},
		set : function(value){
			this.callParent(value);
			if(value && value.hasOwnProperty("value")) this.val(value['value']);
		},
		get : function(name){
			if('value'==name) return this.val();
			else return this.callParent(name);	
		},
		_doChange : function(evt) {
			this.val2ref();
			this._val2ref(this.labelRef, this._getLabel());
			this.fireEvent('onChange', {
				source : this,
				value : this.val()
			});
		},
		_doOptionChange : function(evt) {
			this.updateValue(this.ref);
		}
	});

	Select.createEditor = function(context){
		if(!context) return;
		var param = {};
		$.extend(param,context.getParam());
		if(context.bindRef){
			param['bind-ref'] = context.bindRef;
			//param['bind-labelRef'] = ;
		}
		var binds = ['optionsLabel', 'optionsCaption', 'optionsValue'];
		for ( var i=0;i<binds.length;i++) {
			if (param[binds[i]])
				param['bind-'+binds[i]] = param[binds[i]];
		}
		if(param['options']){
			param['bind-options'] = '$model.' + param['options'];
		}
		return new Select(param);
	};
	
	justep.Component.register(url, Select);
	return Select;
});