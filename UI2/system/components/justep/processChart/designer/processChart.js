/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
//	require("css!../css/processChart").load();
	var $ = require("jquery");
//	var RTProcessChart = require("../processChart");
	var justep = require("$UI/system/lib/justep");
	var url = require.toUrl("./img/processChart.jpg");
	var ViewComponent = require("$UI/system/lib/base/viewComponent");
	
	var ProcessChart = ViewComponent.extend({
		init : function(value, bindingContext) { 
			this.$domNode = $(this.domNode);  
 
			this.$domNode.append("<img src='" + url + "'/>");
		}
	});
 
	
	return {'$UI/system/components/justep/processChart/processChart':ProcessChart};
});

