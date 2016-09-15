/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");

	// 引入bootstrap
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");

	// https://github.com/bootstrap-tagsinput/bootstrap-tagsinput
	require("css!../css/bootstrap-tagsinput").load();

	require("../js/bootstrap-tagsinput");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.init();
	};

	Model.prototype.init = function() {
	};

	return Model;
});