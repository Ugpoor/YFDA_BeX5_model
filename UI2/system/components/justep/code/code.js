/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var url = require.normalizeName("./code");
	var ComponentConfig = require("./code.config");

	require('$UI/system/resources/system.res');

	var Code = justep.ViewComponent.extend({
		buildTemplate : function(config) {
			var msg = new justep.Message(justep.Message.JUSTEP230073, url);
			throw justep.Error.create(msg);
		},
		constructor : function(options) {
			this.callParent(options);
			this.params = [];// {name,displayName,defaultValue}
		},
		getConfig : function() {
			return ComponentConfig;
		},
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
		},
		getXID: function(){
			return this.$domNode.attr('xid');
		},
		param2Array : function(param) {
			var ret = [];
			param = param||{};
			$.each(this.params, function(i, v) {
				ret.push(param.hasOwnProperty(v.name) ? param[v.name] : v.defaultValue);
			});
			return ret;
		},
		exec : function() {
			var model = this.getModel(),xid = this.getXID();
			return model && $.isFunction(model[xid]) ? model[xid].apply(model, arguments) : undefined;
		}
	});

	// 操作
	justep.Component.addOperations(Code, {
		'exec' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231131),//'执行',
			argsDef: function(){
				return this.owner.get('params');
			},
			method : function(args) {
				return this.owner.exec.apply(this.owner, this.owner.param2Array(args));
			}
		}
	});

	justep.Component.register(url, Code);
	return Code;
});