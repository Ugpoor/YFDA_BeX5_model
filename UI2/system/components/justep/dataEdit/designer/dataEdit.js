/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var RTDataEdit = require("../dataEdit");

	var _DataEdit = RTDataEdit.extend({
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
		}
	});

	return {
		'$UI/system/components/justep/dataEdit/dataEdit' : _DataEdit
	};
});