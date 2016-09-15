/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	//var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	var url = require.normalizeName("./shellImpl");
	var ComponentConfig = require("./shellImpl.config");

	require('$UI/system/resources/system.res');
	
	var Impl = justep.ViewComponent.extend({
		buildTemplate : function(config) {
			var msg = new justep.Message(justep.Message.JUSTEP230073, url);
			throw justep.Error.create(msg);
		},
		constructor : function(options) {
			this.callParent(options);
			this.contentsXid = 'contents';
		},
		getConfig : function() {
			return ComponentConfig;
		},
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			this.shellImpl = this.createShellImpl();
		},
		addPageMappings: function(pageMappings){
			this.shellImpl.addPageMappings(pageMappings);
		},
		loadPageMapping: function(){
			var comp = this;
			var mapping = comp['__mapping_def__'];
			if(!mapping){
				var $C = comp.$domNode;
				mapping = {};
				
				$C.find('mapping').each(function(){
					var $m = $(this),name = $m.attr('name'),url = $m.attr('url');
					if(name && url){
						mapping[name] = {url:url};
						var title = $m.attr('title');
						if(title) mapping[name].title = title;
					}
				});
				
				comp['__mapping_def__'] = mapping;
			}
			return mapping;
		},
		createShellImpl: function(){
			this.loadPageMapping();
			if(justep.Shell.impl){
				this.addPageMappings(this['__mapping_def__']);
				return justep.Shell.impl;
			}else{
				return new ShellImpl(this.getModel(), {
					contentsXid : this.contentsXid,
					pageMappings: this['__mapping_def__']
				});
			}
		},
		getShellImpl: function(){
			return this.shellImpl;
		}
	});

	justep.Component.register(url, Impl);
	return Impl;
});