/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var Data = require("$UI/system/components/justep/data/data");

	var ExtendTypeEmail = Data.ExtendType.extend({
		constructor : function(data, col, def) {
			this.callParent(data, col, def);

			// 增加组件的email约束
			data.addRule(col, {
				rule : 'email',
				message : '不是email格式'
			});
		}
	});

	return ExtendTypeEmail;
});
