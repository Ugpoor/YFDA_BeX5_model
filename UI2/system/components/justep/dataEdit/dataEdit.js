/*! 
 * X5 v3 (htttp://www.justep.com) 
 * Copyright 2014 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	require("$UI/system/components/justep/common/res");

	//var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var Input = require("$UI/system/components/justep/input/input");
	
	var url = require.normalizeName("./dataEdit");
	var ComponentConfig = require("./dataEdit.config");

	var DataEdit = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this._createEditorOK = false;
			this.bindRef = null;
			this.innerComp = null;
			this.callParent(options);
		},
		dispose : function() {
			this.callParent();
		},
		getInnerComp: function(){
			return this.innerComp;
		},
		// 动态创建组件
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'form-control';
			return "<div class='"
					+ config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + url + "' " + " ></div>";
		},
		createEditor: function(ref){
			if(justep.Bind.isObservable(ref)&&ref['define']){
				var model = this.getModel(),comp,context;
				var extendTypeObj = Data.getExtendTypeObject(model, ref);
				var colDef = Data.getColDef(ref);
				if(extendTypeObj){ 
					var editorUrl = extendTypeObj.getEditor();
					var Editor = model.getEditorClass(editorUrl);
					if(Editor){
						context = new justep.ViewComponent.CreateEditorContext({comp:this,colDef:colDef,extendType:extendTypeObj,bindRef:this.bindRef});
						var fn = Editor.createEditor;
						comp = $.isFunction(fn)?fn.call(Editor,context):justep.ViewComponent.defaultCreateEditor(Editor,context);
						this.createEditorAfter(comp);
					}
				}else{//没有指定扩展类型默认显示input
					context = new justep.ViewComponent.CreateEditorContext({comp:this,colDef:colDef,bindRef:this.bindRef});
					comp = justep.ViewComponent.defaultCreateEditor(Input,context);
					this.createEditorAfter(comp);
				}
			}
		},
		createEditorAfter: function(comp){
			if(comp){
				this.$domNode.removeClass('form-control');//去除默认占位的样式
				justep.Component.addComponent(this.domNode, comp);
				this.innerComp = comp;
				this._createEditorOK = true;
				this.fireInnerCompCreateEvent(comp);
			}
		},
		fireInnerCompCreateEvent: function(comp){
			var eData = {
					source : this,
					innerComp : comp
			};
			this.fireEvent('onInnerCompCreate', eData);
		},
		// 初始化
		doInit : function(value, bindingContext) {
			this.callParent(value, bindingContext);
		},
		doUpdate : function(value, bindingContext, allBindings) {
			this.callParent(value, bindingContext, allBindings);
			if(!this._createEditorOK) this.createEditor(this.ref);
		},
		propertyChangedHandler : function(key, oldVal, value) {
			switch (key) {
			case "format":
				break;
			default:
				this.callParent(key, oldVal, value);
			}
		}
	});
	
	justep.Component.register(url, DataEdit);
	return DataEdit;
});