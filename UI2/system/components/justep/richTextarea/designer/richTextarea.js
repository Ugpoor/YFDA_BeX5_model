/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var RTRichTextarea = require("../richTextarea");

	var RichTextarea = RTRichTextarea.extend({
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			this.on('onInited',function(evt){
				var editor = evt.source;
				editor.disabledRender();
				//延迟计算宽度
				window.setTimeout(function(){
					editor._resize();
				},100);
			});
		},
		isDisabled: function(){
			return true;
		}
	});

	return {
		'$UI/system/components/justep/richTextarea/richTextarea' : RichTextarea
	};
});