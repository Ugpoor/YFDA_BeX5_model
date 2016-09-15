/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var RTEditor = require("../editor");
	require('css!../common/css/editorDesigner').load();

	var create = function (comp, clz) {
		var $domNode = $(comp.domNode);
		comp.domNode.style.position = "absolute";
		if (!comp.domNode.style.top) {
			comp.domNode.style.top = "10px";
			comp.domNode.style.left = "10px";
		}
		$domNode.addClass(clz);
	};

	var Editor = RTEditor.extend({
		init : function(value, bindingContext) {
			create(this, 'x-extend-type-designer');
			this.callParent(value, bindingContext);
		}
	});

	return {
		'$UI/system/components/justep/editor/editor' : Editor
	};
});