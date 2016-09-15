/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	require('$UI/system/lib/jquery/transition');
	
	var Component = require("$UI/system/lib/base/component"),
		justep = require('$UI/system/lib/justep'),
		Str = require("$UI/system/lib/base/string"),
		ViewComponent = require("$UI/system/lib/base/viewComponent"),
		$ = require("jquery"),
		url = require.normalizeName("./carousel"),
		touch = require("./touch"),
		ComponentConfig = require("./carousel.config");
	
	require("$UI/system/components/justep/common/res");
	require("css!./css/carousel").load();

/* html

<div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel">
	<ol class="carousel-indicators">
		<li class="active"></li>
	</ol>
	<div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
		active="0" slidable="true" wrap="true" swipe="true"> 
        <div class="x-contents-content"></div>  
	</div>
	<!-- Controls -->
	<a class="left carousel-control" href="#" role="button">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#" role="button">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	</a>				
</div>	 

*/
	
	var baseCls = 'x-carousel';

	var carousel = ViewComponent.extend({
		getConfig : function(){
			return ComponentConfig;
		},

		dispose : function() {
			if(this._interval) clearInterval(this._interval);
			this.callParent();
		},
		
		constructor: function(options){
			this.auto = false;
			this.interval = 3;
			this.supportImagePinch = false;
			this.callParent(options);
		},
		buildTemplate: function(config){
			return "";
		},
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			var me = this;
			this.$el = $(this.domNode);
			this.$indicators = $(".carousel-indicators", this.$el);
			this.$left = $(">.left", this.$el).click(function(){
				me.prev();
			});
			this.$right = $(">.right", this.$el).click(function(){
				me.next();
			});
			this.activeIndex = 0;

			var m = this.getModel();
			var xid = $('>[role="listbox"]', this.$el).attr("xid");
			var p = m.componentPromise(xid);
			$.when(p).done(function(contents){
				me.contents = contents;
				me.contents.$domNode.on('touchstart',function(){
					me.isTouching = true;
				}).on('touchend',function(){
					me.isTouching = false;
				});
				if(me.supportImagePinch === true){
					touch.on(me.domNode,'touchstart',function(ev){
						if ("IMG" === ev.target.tagName.toUpperCase() && ev.targetTouches && ev.targetTouches.length == 2) {
							ev.hasStopedPropagation = true;
							ev.preventDefault();
						}
					});
					touch.on(me.domNode, 'pinch', function(event){
						if("IMG" === event.target.tagName.toUpperCase()){
							event.hasStopedPropagation = true;
							var currentScale = (event.scale - 1)/2;
							currentScale = (event.target.initialScale? event.target.initialScale:1) + currentScale;
							currentScale = currentScale < 1 ? 1 : currentScale;
							event.target.style.webkitTransform = 'scale(' + currentScale + ')';
							event.target.initialScale = currentScale;
						}
					});
					
					
					me.$el.on('click',function(event){
						if("IMG" === event.target.tagName.toUpperCase()){
							event.target.style.webkitTransform = 'scale(1)';
							event.target.initialScale = 1;
						}
					});
				}
				
				me.contents.on('onActiveChange', function(event){
					me.setActive(event.to);
				});
				me.length = contents.getLength();
				var html = '';
				for(var i=0; i < me.length; i++){
					html += '<li index="' + i + '"></li>';
				}
				me.$indicators.html(html);
				$(me.$indicators).on('click','>li',function(){
					var index = parseInt($(this).attr("index"));
					me.to(index);
				});
				$(">li",me.$indicators).eq(0).addClass('active');
			});
			if(this.auto){
				this._interval = setInterval(justep.Util.bindModelFn(this.getModel(),function(){
					if(!me.isTouching) me.next();
				}), this.interval * 1000);
			}
		},
		setActive: function(index){
			this.activeIndex = index;
			$('>li', this.$indicators).removeClass('active').eq(index).addClass('active');
		},
		to: function(index){
			this.contents.to(index);
		},
		prev: function(){
			this.contents.prev();
		},
		next: function(){
			this.contents.next();
		},
		add: function(html){
			this.$indicators.append('<li index="' + this.contents.getLength() + '"></li>');
			this.contents.add({
				body: html
			});
		},
		remove: function(index){
			this.$indicators.children('li[index='+index+']').remove();
			this.contents.remove(index);
		},
		removeAll: function(){
			this.$indicators.children('li').remove();
			this.contents.removeAll();
		},
		propertyChangedHandler: function(key, oldVal, value){
			/*
			switch(key){
			case 'slidable':
				if(typeof value == 'string')
					value = value == 'true';
				this.slidable = !!value; 
				break;
			}
			*/
		}
	});

	justep.Component.addOperations(carousel, {
		to : {
			label : "",
			argsDef: [{name:'xid',displayName:'切换的content xid'}],
			method : function(args) {
				return this.owner.to(args.xid);
			}
		},
		next : {
			label : "",
			argsDef: [],
			method : function() {
				return this.owner.next();
			}
		},
		prev : {
			label : "",
			argsDef: [],
			method : function() {
				return this.owner.prev();
			}
		}
	});
	
	Component.register(url, carousel);

	return carousel;

});