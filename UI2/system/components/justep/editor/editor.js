/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require('$UI/system/lib/justep');
	var Data = require("$UI/system/components/justep/data/data");
	var EditorCheckbox = require("./js/editorCheckbox");

	var url = require.normalizeName("./editor");
	var ComponentConfig = require("./editor.config");
	
	var Editor = justep.ViewComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.callParent(options);
		},
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			Data.registerEditor(this.getModel(),EditorCheckbox);
		},
		dispose : function() {
			Data.unregisterEditor(this.getModel(),EditorCheckbox);
			this.callParent();
		},
	});
	
	justep.Component.register(url, Editor);
	return Editor;
});	