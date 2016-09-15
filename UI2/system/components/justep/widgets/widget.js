/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	var justep = require('$UI/system/lib/justep');
	var Component = require("$UI/system/lib/base/component"),
		Str = require("$UI/system/lib/base/string"),
		ViewComponent = require("$UI/system/lib/base/viewComponent"),
		url = require.normalizeName("./widget");
	var ComponentConfig = require("./widget.config");
	var WindowContainer = require("$UI/system/components/justep/windowContainer/windowContainer");
	var re = /^(http|https):/;
	
    var Widget = ViewComponent.extend({
		constructor: function(config){
			this.title = '';
			this.url = '';
			this.process = '';
			this.activity = '';
			this.callParent(config);
		},
    	buildTemplate: function(config){
    		config.xid = config.xid || '';
    		config.title = config.title || '';
    		
		    var html = Str.format('<div component="$model/UI2/system/components/justep/widgets/widget" class="x-widget ibox"' + 
		    	'url="{1}" style="{2}">' + 
		        '<div class="ibox-title">' +
		        	'<h5>{0}</h5>' + 
		          '<div class="ibox-tools">' + 
		            '<a component="$UI/system/components/justep/button/button" class="btn btn-link x-widget-more" ' +
		              'label="更多">'  +
		              '<i xid="i4"/>' +  
		              '<span xid="span1">更多</span>'  +
		              '</a>'   +
		            '<a component="$UI/system/components/justep/button/button" class="btn btn-link x-widget-toggle" ' +
		              'label="" icon="icon-chevron-up">'  +
		              '<i xid="i1" class="icon-chevron-up"/>' +  
		              '<span xid="span1"/>'  +
		            '</a>'   +
		            '<a component="$UI/system/components/justep/button/button" class="btn btn-link x-widget-refresh" ' +
		              'label="" icon="icon-refresh">'  +
		              '<i xid="i2" class="icon-refresh"/>' +  
		              '<span xid="span1"/>'  +
		            '</a>'   +
		            '<a component="$UI/system/components/justep/button/button" class="btn btn-link x-widget-close" ' +
		              'label="" icon="icon-close">'  +
		              '<i xid="i3" class="icon-close"/>' +  
		              '<span xid="span1"/>'  +
		            '</a>'  +
		          '</div>'  +
		        '</div>'   +
		        '<div class="ibox-content"/>' + 
		      '</div>', config.title, config.url, config.illegal && "display: none;");
    		
    		this.url = config.url;
    		this.process = config.process;
    		this.activity = config.activity;
    		this.owner = config.owner;
    		this.xid = config.xid;
    		this.widgetID = config.id;
    		this.height = config.height;
    		if(config.refreshable)
    			this.refreshable = (config.refreshable === true || config.refreshable.toLowerCase() === 'true');
    		else if(config.refreshable === undefined)
    			this.refreshable = true;
    		else
    			this.refreshable = false;
    		this.more = config.more;
    		return html;
    	},
		init: function(value, bindingContext){
			this.$el = $(this.domNode);
			if(this.widgetID)
				this.$el.attr({'widgetID': this.widgetID});
			this.$title = $('>.ibox-title>h5', this.domNode);
			this.$content = $('>.ibox-content', this.domNode);
			this.$toggle = $('>.ibox-title .x-widget-toggle', this.domNode);
			this.$refresh = $('>.ibox-title .x-widget-refresh', this.domNode);
			this.$close = $('>.ibox-title .x-widget-close', this.domNode);
			this.$more = $('>.ibox-title .x-widget-more', this.domNode);
			this.callParent(value, bindingContext);
			var me = this;
			if(this.height)
				this.$content.height(this.height);
			justep.Bind.utils.domNodeReady.addReadyCallback(this.domNode, function(){
				function bind(el, event, fn){
					var node = el.get(0);
					if(node){
						var obj = me.getModel().comp(node);
						obj && obj.on(event, fn);
					}
				}
				bind(me.$toggle, 'onClick', function(){

				});
			});
			this.$close.on('click', function(){
				me.owner.removeWidget(me);
			});
			this.$toggle.on('click', function(){
				me.toggle();
			});
			if(this.url){
				this.load();
				if(!this.refreshable)
					this.$refresh.hide();
				else
					this.$refresh.on('click', function(){
						if(me.refreshable)
							me.refresh();
					});
			}
			if(this.more && this.more.url){
				this.$more.on('click', function(){
					var params = me.more.params;
					var oUrl = new justep.URL(me.more.url);
					if(params) oUrl.setParam(params);
					var url = require.toUrl(oUrl.toString());
					var option = $.extend({},me.more);
					option.url = url;
					justep.Shell.showPage(option);
				});
			}else{
				this.$more.hide();
			}
			
			this.getModel().on('onActive',this.doActive, this);
		},
		doActive: function(event){
			this.fireEvent('onActive', $.extend({},event,{source:this}));
		},
		getConfig: function(){
			return ComponentConfig;
		},
		setTitle: function(value){
			this.$title.html(value);
		},
		
		propertyChangedHandler: function(key, oldValue, value){
			switch(key){
			case 'title':
				this.setTitle(value);
				break;
			default:
				this.callParent(key, oldValue, value);
			}
		},
		load: function(fn){
			if(re.test(this.url)){
				//外部url
				this.$content.addClass('frame');
				this.$content.html('<iframe src="' + this.url +'"/>');
				this.$frame = $('>iframe', this.$content);
			}else{
				var compose = this.compose = new WindowContainer({
					parentNode: this.$content.get(0), 
					src: require.toUrl(this.url),
					process: this.process,
					activity: this.activity,
					onLoad: function(){
						fn && fn();
					},
					onLoadError: function(err){
						fn && fn(err);
					}
				});
				this.on("onActive", function(event){
					if(compose.getInnerModel())
						compose.getInnerModel().fireEvent('onActive',event);
				});				
			}
		},
		refresh: function(){
			if(this.compose){
				this.compose.refresh();
			}else if(this.$frame){
				//this.$frame
			}
		},
		toggle: function(){
			var i = $('>i', this.$toggle);
			if(i.hasClass('icon-chevron-up')){
				i.removeClass('icon-chevron-up').addClass('icon-chevron-down');
			}else{
				i.removeClass('icon-chevron-down').addClass('icon-chevron-up');
			}
			this.$content.toggle();
		},
		dispose: function(){
			//TODO
			//this.owner.remove(this);
			this.getModel().off('onActive',this.doActive, this);
			this.owner = null;
		}
	});

    Component.register(url, Widget);

    return Widget;
});