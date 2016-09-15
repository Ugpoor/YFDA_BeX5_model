/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
//	var $ = require("jquery");
	var OrgFilter = require("../orgFilter");
	
	var DOrgFilter = OrgFilter.extend({
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			this.$domNode.find("*").attr('d_selectable',false).attr("d_canAddChild", false).attr("d_canRemove",false);
		}
	});
	
	return {'$UI/system/components/justep/orgFilter/orgFilter': DOrgFilter};
});