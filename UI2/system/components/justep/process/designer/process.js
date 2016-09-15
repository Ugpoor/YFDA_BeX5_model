/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	var $ = require("jquery");
	var RTProcess = require("../process");
	var url = require.toUrl("./img/process.jpg");
	var Process = RTProcess.extend({
		init: function(value, bindingContext){
			this.$domNode = $(this.domNode);   
			this.$domNode.append("<img src='" + url + "'/>");
			this.domNode.style.position = "absolute";
			if(!this.domNode.style.top){
				this.domNode.style.top = "200px";
				this.domNode.style.left = "0px";
			}
			this.domNode.style.height = "24px";
			this.domNode.style.width = "24px";
			this.domNode.style["z-index"] = "1000";

		}
	});
	
	return {'$UI/system/components/justep/process/process':Process};
});

