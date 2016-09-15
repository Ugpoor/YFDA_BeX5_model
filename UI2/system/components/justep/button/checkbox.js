/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var Radio = require("./radio");

	var url = require.normalizeName("./checkbox");
	var ComponentConfig = require("./checkbox.config");

	var Checkbox = Radio.extend({
		_defaultClass : "x-checkbox",
		_type : 'checkbox',

		getConfig : function() {
			return ComponentConfig;
		},

		getDisplayHtml : function(context){
			return Checkbox.getDisplayHtml(context);
		}
	});

	
	var getCheckValueParam = function(context){
		var checkValue = context.getParam('checkedValue');
		if(checkValue===undefined) checkValue = 1;
		return checkValue;
	};
	
	var _createCheckFN = function(context){
		var comp = context.comp;
		return function(event){
			var target = event.target||event.srcElement;
			var row = comp.getDataRow(target);
			var checkValue = getCheckValueParam(context);
			if(row)row.val(context.colDef.name,$(target).prop('checked')?checkValue:null);
		};
	};
	
	//获取展现html
	//context : {comp,type,colDef,extendType,row}
	Checkbox.getDisplayHtml = function(context){
		if(!context) return;
		var onjs = '',data=context.row&&context.row.data;
		var readonly = context.readonly||(data?data.getReadonly(context.colDef.name, context.row):false);
		if((context.type=='grid'||context.type=='dataTables')&&!context.readonly){
			var fnName = '__checkbox_fn__'+context.colDef.name;
			if(!context.comp[fnName]){
				var model = context.comp.getModel(),fn = '_'+justep.UUID.createUUID();
				context.comp[fnName] = fn;
				model[fn] = _createCheckFN(context);
			}
			onjs = "justep.callModelFn({domNode:event.target||event.srcElement,fn:\'"+context.comp[fnName]+"\'},event)";
		}
		var checkValue = getCheckValueParam(context);
		var checked = context.row.val(context.colDef.name)==checkValue;
		var id = 'c'+justep.UUID.createUUID();
		var xml = '<span class="x-checkbox"><input id="'+id+'" type="checkbox" '+ (readonly?'disabled':'') +(onjs?(' onchange="'+onjs+'"'):'')+(checked?' checked':'')+'/><label for="'+id+'"/></span>';
		return xml;
	};
	
	justep.Component.register(url, Checkbox);
	return Checkbox;
});