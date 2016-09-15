/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var url = require.normalizeName("./window");
		

	var Window = justep.ViewComponent.extend({
		getConfig: function(){
			return {};
		},
		constructor : function(options) {
			this.callParent(options);
		}, 
		close: function(){
			this.getModel().owner.close(); //调用model上的owner的close方法
		}
	});

	justep.Component.addOperations(Window, {
		'close' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP230096),
			icon : 'icon-chevron-left',
			method : function(args) {
				this.owner.close();
			}
		}});
	
	justep.Component.register(url, Window);
	return Window;
});