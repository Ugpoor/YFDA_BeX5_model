/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var Util = require("$UI/system/components/justep/common/designer/common");
	var RTSelect = require("../select");
	var RTRadioGroup = require("../radioGroup");
	var RTCheckboxGroup = require("../checkboxGroup");
	var RTRadio = require("$UI/system/components/justep/button/radio");
	var RTCheckbox = require("$UI/system/components/justep/button/checkbox");
	var RTRadioGroupPC = require("../radioGroupPC");
	var RTCheckboxGroupPC = require("../checkboxGroupPC");
	var RTRadioPC = require("$UI/system/components/justep/button/radioPC");
	var RTCheckboxPC = require("$UI/system/components/justep/button/checkboxPC");
	var _Select = RTSelect.extend({
		doInit : function(value, bindingContext, allBindings) {
		},
		doUpdate : function(value, bindingContext, allBindings) {
		}
	});

	function createGroup(group, clz) {
		// window.setTimeout(function() {debugger;
		group.$domNode = $(group.domNode);
		new clz({
			parentNode : group.domNode,
			label : 'item1'
		});
		new clz({
			parentNode : group.domNode,
			label : 'item2'
		});
		var cfg = Util.attr2js(group.$domNode, [ 'itemStyle', 'itemClass']);
		if (cfg)
			group.set(cfg);
		// },1000);
	}

	var _RadioGroup = RTRadioGroup.extend({
		init : function(value, bindingContext) {
			createGroup(this, RTRadio);
			this.callParent(value, bindingContext);
		}
	});

	var _CheckboxGroup = RTCheckboxGroup.extend({
		init : function(value, bindingContext) {
			createGroup(this, RTCheckbox);
			this.callParent(value, bindingContext);
		}
	});

	var _RadioGroupPC = RTRadioGroupPC.extend({
		init : function(value, bindingContext) {
			createGroup(this, RTRadioPC);
			this.callParent(value, bindingContext);
		}
	});

	var _CheckboxGroupPC = RTCheckboxGroupPC.extend({
		init : function(value, bindingContext) {
			createGroup(this, RTCheckboxPC);
			this.callParent(value, bindingContext);
		}
	});

	return {
		'$UI/system/components/justep/select/select' : _Select,
		"$UI/system/components/justep/select/radioGroup" : _RadioGroup,
		"$UI/system/components/justep/select/checkboxGroup" : _CheckboxGroup,
		"$UI/system/components/justep/select/radioGroupPC" : _RadioGroupPC,
		"$UI/system/components/justep/select/checkboxGroupPC" : _CheckboxGroupPC
	};
});