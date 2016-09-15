/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	require('css!./css/popPicker').load();
	
	var justep = require("$UI/system/lib/justep");
	var Component = require("$UI/system/lib/base/component");
	var PopOver = require("$UI/system/components/justep/popOver/popOver");
	var Picker = require("./picker");
	var url = require.normalizeName("./popPicker");
	var ComponentConfig = require("./popPicker.config");

	var PopPicker = PopOver.extend({
		baseCls: 'x-popPicker',
		overlayCls: 'x-popPicker-overlay',
		contentCls: 'x-popPicker-content',
		headerCls: 'x-poppicker-header',
		constructor: function(){
			this.callParent();
			this.position = 'bottom';
		},
		getConfig: function(){
			return ComponentConfig;
		},
		buildTemplate: function(config){
		    /*
    <div component="$UI/system/components/justep/picker/popPicker" class="x-popPicker"
      xid="popPicker" dismissible="true"> 
      <div class="x-popPicker-overlay" xid="div4"/>  
      <div class="x-popPicker-content"> 
        <div class="x-poppicker-header"> 
          <button class="btn btn-default x-btn-ok">确定 </button>
        </div>  
      </div> 
    </div>
			*/
			if(!config.xid) config.xid = justep.UUID.createUUID();
			var ret = $('<div component="'+url+'" class="'+(config['class']||this.baseCls)+'">'
			    	+'<div class="'+this.overlayCls+'"/>'
			    	+'<div class="'+this.contentCls+'">'
			    	+'<div class="'+this.headerCls+'">' 
			        +'  <button class="btn btn-default x-btn-ok">'+justep.Message.getMessage(justep.Message.JUSTEP231079)+' </button>'
			        +'</div>'  
			    	+'</div>'
					+'</div>');
			if(config.xid) ret.attr('xid', config.xid);
			if(config.style) ret.attr('style', config.style);
			return ret;
        },
		dispose : function() {
			this.callParent();
		},
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			var header$ = this.getHeader$();
			var self = this;
			if(header$.size()>0){
				header$.append('<div class="x-poppicker-clear"/>');
				header$.children('.x-btn-ok').on('click',function(evt){
					self.OKClick(evt);
				});
			}
		},
		addRouteItem : function(type){
			var $routeState = this.getModel().$routeState;
			var xid = this.$domNode.attr('xid');
			if(type == 'show'){
				$routeState.addState(xid,'','');
				$routeState.publishState(true);
			}else if(type == 'hide'){
				$routeState.removeState(xid,'','');
				$routeState.publishState(true);
			}
		},
		doRoute : function(name,param,routeState){
			if(name === ""){
				if(routeState == "enter"){
					this.show();
				}else if(routeState == "leave"){
					this.hide();
				}
			}
		},
		OKClick: function(evt){
			var evtData = {source:this,cancel:false};
			this.fireEvent('onOk', evtData);
			if(!evtData.cancel)	this.hide();
		},
		pos: function(){
			this.callParent();
			this.$content.css({
				bottom: '0'
			});
		},
		show: function(){
			this.callParent();
			this.addRouteItem("show");
			this.$domNode.addClass('x-active');
			var evtData = {source:this};
			this.fireEvent('onShow', evtData);
		},
		hide: function(){
			this.callParent();
			this.$domNode.removeClass('x-active');
			var evtData = {source:this};
			this.fireEvent('onHide', evtData);
			this.addRouteItem("hide");
		},
		getHeader$: function(){
			return this.$domNode.find('.'+this.headerCls+':first');
		},
		getContent$: function(){
			return this.$domNode.find('.'+this.contentCls+':first');
		},
		getInnerPickers: function(){
			var ret = [],model = this.getModel();
			this.$domNode.find('.x-picker').each(function(){
				ret.push(model.comp(this));
			});
			return ret;
		},
		addPicker: function(cfg){
			var comp;
			if(cfg instanceof Picker) comp = cfg;
			else comp = new Picker(cfg);
			Component.addComponent(this.getContent$()[0], comp);
			var $pickers = this.$domNode.find('.x-picker');
			$pickers.addClass('x-picker'+($pickers.length>1?('-'+$pickers.length):''));
			return comp;
		},
		propertyChangedHandler: function(key, oldVal, value){
			switch(key){
			default:
			}
			this.callParent(key, oldVal, value);
		}
    });
	
	Component.register(url, PopPicker);
	return PopPicker;
});