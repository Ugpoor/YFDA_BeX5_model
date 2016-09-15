/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");
	
	var $ = require("jquery");
	var Data = require("$UI/system/components/justep/data/data");

	var EditorCheckbox = Data.Editor.extend({
		constructor : function(data,col,def) {
			this.callParent(data,col,def);
			this._bindGrid = {};
		},
		//实现new展现组件逻辑
		createEditor : function(refExpr){
			//后代类实现
		},
		//获取展现文本
		getDisplayText : function(row,context){
			return row.val(this.col);
		},
		getCheckValueParam: function(){
			var checkValue = this.getParam('checkValue');
			if(checkValue===undefined) checkValue = 1;
			return checkValue;
		},
		_createCheckFN : function(context){
			var comp = context.comp;
			var self = this;
			return function(event){
				var target = event.target||event.srcElement;
				var row = comp.getDataRow(target);
				var checkValue = self.getCheckValueParam();
				if(row)row.val(self.col,$(target).prop('checked')?checkValue:null);
			};
		},
		//获取展现html
		getDisplayHtml : function(row,context){
			var onjs = '';
			if(context.type=='grid'||context.type=='dataTables'){
				var xid = context.comp.$domNode.attr('xid');
				if(!this._bindGrid[xid]){
					var model = context.comp.getModel(),fn = '_'+Data.UUID();
					this._bindGrid[xid] = {comp:context.comp,fn:fn};
					model[fn] = this._createCheckFN(context);
				}
				onjs = "justep.callModelFn(event,\'"+this._bindGrid[xid].fn+"\')";
			}
			var checkValue = this.getCheckValueParam();
			var checked = row.val(this.col)==checkValue;
			var id = 'c'+Data.UUID();
			var xml = '<span class="x-checkbox"><input id="'+id+'" type="checkbox" '+(onjs?(' onchange="'+onjs+'"'):'')+(checked?' checked':'')+'/><label for="'+id+'"/></span>';
			return xml;
		}
	});
	
	EditorCheckbox.regName = 'sys.checkbox';

	return EditorCheckbox;
});	