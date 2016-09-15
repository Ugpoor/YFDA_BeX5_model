/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var List = require("../list");
	require('css!./css/list').load();
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc(); 
	var ListDesigner = List.extend({
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
	        var $domNode = this.$domNode;
			this.$domNode.attr("d_canAddChild", "true").children('div.x-list-head').addClass('x-min-height').attr("d_canAddChild", "true");
			this.$domNode.children('.x-list-content').attr('d_selectable', false);
			this.$domNode.find('.x-list-template').addClass('x-min-height').attr("d_canAddChild", "true").attr(
					'd_selectable', false).children().addClass('x-min-height');
		    
			this.$domNode.on("childChanged",function(event,data){
				if(event.target != $domNode[0]){
					return;
				}
				if(data && data.type == 'styleChanged' && data.attrName =='class'){
					var value = data.value;
					if(value){
						var values = value.split(" ");
						var $template;
						for(var i = 0;i<values.length;i+=1){
							if(values[i] == 'x-cards'){//同步给模板节点加上list-group样式
								$template = $(">.x-list-template",$domNode);
								if($template.length>0){
									if(!$template.hasClass("list-group")){
										$template.addClass("list-group");
										$(">*",$template).addClass("list-group-item");
										xuiDoc.updateNodes($template,null,function(){
											xuiDoc.updateNodes($(">*",$template));											
										});
									}
								}
								return;
							}
						}
						if($domNode.hasClass('x-cards')){
							return;
						}
						$template = $(">.x-list-template",$domNode);
						if($template.length>0){ //同步去掉list-group样式
							$template.removeClass("list-group");
							$(">*",$template).removeClass("list-group-item");
							xuiDoc.updateNodes($template,null,function(){
								xuiDoc.updateNodes($(">*",$template));								
							});
						}
					}
				}	
			});
		},
		addDivTemplate: function(){
			xuiDoc.createComponent("$UI/system/components/justep/list/list#listTemplateDiv", this, {
				paintComponent : true
			});
		},
		addULTemplate: function(){
			xuiDoc.createComponent("$UI/system/components/justep/list/list#listTemplateUl", this, {
				paintComponent : true
			});
		},
		addTableTemplate: function(){
			xuiDoc.createComponent("$UI/system/components/justep/list/list#listTemplateTable", this, {
				paintComponent : true
			});
		}
	});

	return {
		'$UI/system/components/justep/list/list' : ListDesigner
	};
});