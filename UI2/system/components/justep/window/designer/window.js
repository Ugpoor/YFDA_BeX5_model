/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function (require) {
    var $ = require("jquery");
    var RTWindow = require("../window");
    var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	
    var Window = RTWindow.extend({
    	
		init : function(value, bindingContext) {
			this.$domNode.css("width","100%").css("height","100%").attr("d_canAddChild","true").attr("d_canRemove","false");
			this.callParent(value, bindingContext);
		},
		
		addResource : function(event){
		    xuiDoc.createComponent("$/UI2/system/components/justep/resource",this,{paintComponent:true});
		}
    });
	
    return {'$UI/system/components/justep/window/window':Window};
});