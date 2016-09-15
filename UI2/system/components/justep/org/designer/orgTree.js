/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var TreeDesigner = require("$UI/system/components/justep/tree/designer/tree")['$UI/system/components/justep/tree/tree'];

	var OrgTreeDesigner = TreeDesigner.extend({
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			this.$domNode.css({
				position : 'relative'
			});
			this.$domNode.find("div[component='$UI/system/components/justep/data/bizData']").css({
				position : 'absolute',
				left : 80
			});
			this.$domNode.find('.x-tree-template').children('li').attr("d_canAddChild", "true").attr("d_canRemove", false)
					.attr('d_selectable', false);
		}
	});

	return {
		'$UI/system/components/justep/org/orgTree' : OrgTreeDesigner
	};
});