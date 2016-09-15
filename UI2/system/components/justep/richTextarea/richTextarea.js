/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("css!./umeditor/themes/default/css/umeditor").load();
	require("css!./css/richTextarea").load();

	//var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var UM = require("./umeditor/umeditor");
	require("res!./umeditor");

	var url = require.normalizeName("./richTextarea");
	var ComponentConfig = require("./richTextarea.config");

	var richTextarea = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.callParent(options);
			this._eventHandles = {};
		},

		dispose : function() {
			var model = this.getModel();
			if(this._eventHandles['resize']){
				$(window).off('resize',this._eventHandles['resize']);
				model.off("onActive", this._eventHandles['resize'], this);
			}
			if(this._eventHandles['model_resize']) model.off("onResize", this._eventHandles['model_resize'], this);
			//删除创建的textarea
			var id = model.getIDByXID(this.$domNode.attr('xid'))+'_editor';
			var textarea = $('#'+id)[0];
			this.callParent();
			if(this._UM){
				this._UM.destroy();
				this._UM = null;
			}
			if(textarea) model.removeElement(textarea);
		},

		// 动态创建组件
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'x-richTextarea';
			return "<div class='" + config['class'] + "' " + (config.style ? (" style='" + config.style + "'") : "")
					+ (config.xid ? (" xid='" + config.xid + "'") : "") + " component='" + url + "'" + " ></div>";
		},
		// 初始化
		doInit : function(value, bindingContext) {
			this._createUM();
			this.callParent(value, bindingContext);
		},
		_createUM : function(){
			var self = this;
			var id = this.getModel().getIDByXID(this.$domNode.attr('xid'))+'_editor';
			this.$domNode.append('<textarea id="'+id+'"/>');
			var evtData = {option:{},source:this};
			this.fireEvent('onInit', evtData);
			var _um = UM.getEditor(id,evtData.option);
			_um.ready(function(){
				self._UM = this;
				self._resize();
				this.addListener('contentChange',function(){
					self.doChange();
				});
				this.addListener("focus", function(){
					self.fireEvent('onFocus', {source:self});
				});
				this.addListener("afterfullscreenchange", function(type, state){
					if(!state) self._resize();
				});
				self._eventHandles['resize'] = function(evt){
					self._resize();
				};
				self._eventHandles['model_resize'] = function(evt){
					if (self._isParentComp(evt?evt.source:undefined))
						self._resize();
				};
				$(window).on('resize', self._eventHandles['resize']);
				//接受模型的onResize事件进行大小变化
				self.getModel().on("onResize", self._eventHandles['model_resize'], self);
				self.getModel().on("onActive", self._eventHandles['resize'], self);

				self.fireEvent('onInited', {source:self});
				self.updateValue(self.ref);// 数据更新
				self.updateReadonly(self.ref);// 只读状态更新
				self.updateValidation(self.ref);// 约束状态更新
			});
		},
		disabledRender: function(){
			var editor = this.getEditor();
			if(editor){
				var oldEnabled = editor.isEnabled();
				var isEnabled = !this.isDisabled();
				if(oldEnabled!=isEnabled)
					isEnabled?editor.setEnabled():editor.setDisabled();
			}
		},
		_isParentComp: function(comp){
			if(!comp) return true;
			if(comp instanceof justep.ViewComponent){
				var domNode = comp.domNode,ret=false;
				this.$domNode.parents().each(function(){
					if(domNode===this){
						ret = true;
						return false;
					}
				});
				return ret;
			}
		},
		_resize : function() {
			var editor = this.getEditor();
			if(editor){
				editor.hide();
				var $e = this.$domNode;
				var w = $e.innerWidth();
				if(w>20){
					$e.children("div.edui-container").width(w-2);//去除边
					$e.find("div.edui-body-container").width(w-20);//去除padding
				}
				var h = $e.innerHeight();
				editor.show();
				var barH = $e.find("div.edui-toolbar").height();
				h = h-barH;
				if(h>0)editor.setHeight(h);
			}
		},
		resize : function(){
			this._resize();
		},
		getEditor: function(){
			return this._UM;
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
			var editor = this.getEditor();
			if(editor){
				var originalValue = editor.getContent();
				if (arguments.length === 0)
					return originalValue;
				if (val != originalValue) {
					if (this._inited)
						this.fireEvent('onChange', {
							'source' : this,
							'value' : val
						});
					if (val === undefined || val === null)
						val = '';
					editor.setContent(val);
				}
			}
		},
		doChange : function() {
			var editor = this.getEditor();
			if(editor){
				//解决editor的getContent方法自动追加<p>问题
				var val = editor.getContentTxt();
				var refVal = justep.Bind.isObservable(this.ref) ? this.ref.get() : (this.ref instanceof justep.BindComponent.NullValue?"":this.ref);
				if(val!=refVal && (val!=='' || (refVal!==undefined && refVal!==null))){
					this.fireEvent('onChange', {
						'source' : this,
						'value' : editor.getContent()
					});
					this.val2ref();
				}
			}
		},
		clear : function() {
			this.val(null);
		}
	});
	
	justep.Component.register(url, richTextarea);
	return richTextarea;
});	