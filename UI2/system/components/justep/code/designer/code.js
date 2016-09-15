/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require('css!./css/code').load();
	
	//var justep = require("$UI/system/lib/justep");
	var RTCode = require("$UI/system/components/justep/code/code");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	

	var getParams = function(codeParams){
		if(codeParams){
			try{
				codeParams = eval('('+codeParams+')');
			}catch(e){
				//忽略json序列化错误}
				codeParams = [];
			}
		}
		return codeParams;
	};
	
	var Code = RTCode.extend({
		init : function(value, bindingContext) {
			var xid = this.$domNode.attr("xid");
			this.callParent();
			this.$domNode.addClass('x-code').empty().append("<img align='absmiddle'/><span>" + (xid?xid:'') + "</span>");
			var codeParams = xuiDoc.get(this, "params");
			this.params = getParams(codeParams);
		},
		getOperationDefs : function() {
			var operationDefs = this.callParent();
			operationDefs = $.extend({},operationDefs);
			if (operationDefs) {
				for ( var name in operationDefs) {
					var op = this.getOperation(name);
					if(op && $.isFunction(op.argsDef)){
						operationDefs[name].argsDef = op.argsDef();
					}
				}
			}
			return operationDefs;
		},
		set: function(param){
			//debugger;
		},
		get: function(name){
			if(name==='params' && typeof(this.params)==='string'){
				return getParams(this.params);
			}else return this.callParent(name);
		},
		codeParamEditor: function(config){
			var self = this;
			var codeParams = xuiDoc.get(self, "params");
			xuiService.openPage("$UI/system/components/justep/code/designer/codeParamEditor.w", {
				title : "code参数编辑",
				codeParams : codeParams
			}, function(result) {
				var params = result;
				self.params = params;
				if(params) params = JSON.stringify(params);
				xuiDoc.set(self, {params: params});
			});
		},
		codeEditor: function(config){
			var codeParams = this.get("params");
			var params = [],xid = xuiDoc.get(this, "xid");
			if($.isArray(codeParams)) $.each(codeParams,function(i,param){
				params.push(param.name);
			});
			xuiService.openPage("$UI/system/components/justep/code/designer/codeEditor.w", {
				title : "code编辑",
				name : xid
			}, function(result) {
				xuiDoc.saveJsMethod({oldName:xid,name:xid,params:params.join(","),content:result.code||""});
			});
		}
	});
	
	return {
		'$UI/system/components/justep/code/code' : Code
	};
});