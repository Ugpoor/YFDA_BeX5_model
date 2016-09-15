/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	require('$UI/system/lib/jquery/transition');
	require("$UI/system/components/justep/common/res");
	
	var Component = require("$UI/system/lib/base/component"),
		justep = require('$UI/system/lib/justep'),
		ViewComponent = require("$UI/system/lib/base/viewComponent"),
		$ = require("jquery"),
		url = require.normalizeName("./widgets"),
		ComponentConfig = require("./widgets.config"),
		Widget = require("./widget");

	require("./js/jquery.dragsort-0.5.2");
	
	require('css!./css/widgets').load();
	
	var Widgets = ViewComponent.extend({
		constructor: function(options){
			//设置默认属性
			this.baseCls = 'x-widgets';
			this.columns = 3;
			this.draggable = true;
			
			this.callParent(options);
		},
		getConfig: function(){
			return ComponentConfig;
		},
		buildTemplate: function(config){
			//TODO:
			return "<div></div>";
		},
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			return;
		},
		load: function(config){
			var xid, $column;
			for(var i=1;i<=6;i++){
				xid = 'column' + i;
				$column = $('>[xid=' + xid + ']', this.domNode);
				if(config && config[xid]){
					var cc = config[xid];
					$column.attr('class', cc.cls).attr('classData', cc.cls);
					if(cc.widgets){
						//create widget;
						for(var j=0; j<cc.widgets.length; j++){
							var wcfg = cc.widgets[j];
							wcfg.owner = this;
							wcfg.parentNode = $column.get(0);
							new Widget(wcfg);
						}
					}
				}else{
					$column.attr('class', 'x-column hidden');//hidden column
					$column.attr('classData', 'x-column hidden');
				}
			}
			this._draggable();
		},
		getWidgetConfig: function(){
			var cfg = {};
			$('>.x-column', this.$domNode).each(function(index){
				var xid = $(this).attr('xid');
				var widgets = [];
				$('>.x-widget', this).each(function(){
					var wid = $(this).attr('widgetID');
					if(wid) widgets.push(wid);
				});
				cfg[xid] = {
					cls: $(this).attr('classData'),
					widgets: widgets  
				};
			});
			return cfg;
		},
		propertyChangedHandler: function(key, oldVal, value){
			switch(key){
			default:
				this.callParent(key, oldVal, value);
			}
		},
		activeAll: function(){
			//var me = this;
			$("[component='$model/UI2/system/components/justep/windowContainer/windowContainer']", this.domNode).each(function(){
				var c = justep.Component.getComponent(this);
				c && c.getInnerModel().fireEvent('onActive');
			});
		},
		openWidget: function(wcfg){
			var $column = $('>[xid="column1"]', this.domNode);
			wcfg.owner = this;
			wcfg.parentNode = $column.get(0);
			new Widget(wcfg);
			this.fireEvent('change', {source: this});
		},
		removeWidget: function(widget){
			if(typeof widget == 'string'){
				var node = $('.x-widget[widgetid="' + widget + '"]', this.domNode).get(0);
				if(node){
					Component.removeNode(node);
					this.fireEvent('change', {source: this});
				} 
			}else{
				Component.removeComponent(widget);
				this.fireEvent('change', {source: this});
			}
		},
		hasWidget: function(id){
			return $('.x-widget[widgetid="' + id + '"]', this.domNode).length > 0;
		},
		setLayout: function(config){
			var $column, $preColumn;
			for(var i=1; i<=6; i++){
				var xid = 'column' + i;
				$column = $('>[xid=' + xid + ']', this.domNode);
				if(config && config[xid]){
					var cc = config[xid];
					$column.attr('class', cc.cls).attr('classData', cc.cls);
					if($column && $column.length > 0)
						$preColumn = $column; 
				}else{
					$column.attr('class', 'x-column hidden');//hidden column
					$column.attr('classData', 'x-column hidden');
					if($preColumn)
						$('>.x-widget', $column).appendTo($preColumn);
				}
			}	
		},
		dispose : function() {
			if(this._inited && this.$domNode)
				this.$domNode.children(".x-column").dragsort('destroy');
			this.callParent();
		},
		_draggable: function(){
			if(this.draggable){
				var me = this;
				if(me._inited) this.$domNode.children(".x-column").dragsort('destroy');
				me._inited = true;
				this.$domNode.children(".x-column").dragsort({  
					itemSelector: '.ibox',
					dragSelector: '.ibox-title',
					dragBetween: true,
					dragEnd:function () {  
						me.fireEvent('change', {source: me});
					},//执行之后的回调函数
					placeHolderTemplate: "<div class='ibox widget-placeholder'></div>",//拖动列表的HTML部分
					scrollSpeed: 15//拖动速度
				});
			}
		}
	});	

	
	justep.Component.addOperations(Widgets, {
		//add operations
	});
	
	Component.register(url, Widgets);

	return Widgets;
});