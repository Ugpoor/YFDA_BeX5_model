/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var RTWindowRunner = require("../windowRunner");
	require('css!./css/windowRunner').load();

	function create(comp, clz) {
		var $domNode = $(comp.domNode);
		comp.domNode.style.position = "absolute";
		if (!comp.domNode.style.top) {
			comp.domNode.style.top = "10px";
			comp.domNode.style.left = "10px";
		}
		$domNode.addClass(clz);
	}

	var runner = RTWindowRunner.extend({
		init : function(value, bindingContext) {
			create(this, 'x-window-runner');
			this.callParent(value, bindingContext);
		}
	});

	return {
		'$UI/system/components/justep/windowRunner/windowRunner' : runner
	};
});