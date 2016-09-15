/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	var $ = require("jquery");
	var BizFilter = require("../bizFilter");
	var imgURL = require.toUrl("./img/bizFilter-show.gif");
	
	var DBizFilter = BizFilter.extend({
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			this.$domNode = $(this.domNode);   
			this.$domNode.append("<img src='" + imgURL + "'/>");
			this.domNode.style.position = "absolute";
			this.domNode.style["z-index"] = "1000";
			
			if(!this.domNode.style.top){
				this.domNode.style.top = "100px";
				this.domNode.style.left = "100px";
			}
		}
	});
	
	return {'$UI/system/components/justep/bizFilter/bizFilter': DBizFilter};
});