/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var RTNumberSelect = require("../numberSelect");
	var Util = require("$UI/system/components/justep/common/designer/common");

	function createInput(input) {
		input.$domNode = $(input.domNode);
		var cfg = Util.attr2js(input.$domNode, [ 'placeHolder', 'disabled' ]);
		if (cfg)
			input.set(cfg);
	}

	var _NumberSelect = RTNumberSelect.extend({
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			createInput(this);
		},
		_bindEvent:function(){
			//设计时去除相关逻辑
		}
	});

	return {
		'$UI/system/components/justep/numberSelect/numberSelect' : _NumberSelect
	};
});