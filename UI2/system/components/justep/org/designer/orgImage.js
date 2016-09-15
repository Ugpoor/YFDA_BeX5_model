/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var RTOrgImage = require("../orgImage");

	var OrgImage = RTOrgImage.extend({
		doInit : function() {// 去除运行时的事件处理
			this._getImg().attr('d_selectable', false);
		}
	});

	return {
		'$UI/system/components/justep/org/orgImage' : OrgImage
	};
});