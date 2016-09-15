/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var GridSelectDesigner = require("$UI/system/components/justep/gridSelect/designer/gridSelect")['$UI/system/components/justep/gridSelect/gridSelect'];
	

	var OrgSelect = justep.BindComponent.extend({
		doInit : function() {// 去除运行时的事件处理
			this.$domNode.children().attr('d_selectable', false);
		}
	});

	var OrgSelectPC = GridSelectDesigner.extend({
		doInit : function() {
			this.callParent();
			var cssText = this.$domNode[0].style.cssText;
			if(!cssText ||  cssText.indexOf("absolute") == -1){
				this.$domNode.css({
					position : 'relative'
				});				
			}

			this.$domNode.find("div[component='$UI/system/components/justep/data/bizData']").css({
				position : 'absolute',
				left : 10,
				top : 10
			}).attr({d_selectable: true,d_canMove:false});
		}
	});
	
	return {
		'$UI/system/components/justep/org/orgSelect' : OrgSelect,
		'$UI/system/components/justep/org/orgSelectPC' : OrgSelectPC
	};
});