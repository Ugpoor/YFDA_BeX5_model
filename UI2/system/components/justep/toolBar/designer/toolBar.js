/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function (require) {
	var $ = require("jquery");
	var Bar = require("../toolBar");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	require('css!./toolBar').load();
	
	var cls = Bar.extend({
		init:function(value, bindingContext){
			this.callParent(value, bindingContext);
		},
		selectOperation:function(config){
			var did = config.d_id;
			xuiService.openPage("$UI/system/components/designerCommon/propEdtorPages/operationSelector/operationSelector.w", {
				title : "选择操作",
				multiselect: true,
				xml : config.nodeXml
			}, function(result) {
				result = eval("("+result+")");
				//批量创建btn
				var btns = [];
				$.each(result,function(i,v){
					var $div = $("<div/>");
			        $div.append(" <a component=\"$UI/system/components/justep/button/button\" class=\"btn btn-link btn-icon-left\" > "+
	                  "         <i/>  "+
	                  "         <span></span> "+
	                  "       </a>  ");
			        $div.children("a").css("onClick",JSON.stringify(v));
			        var template = $div.html().replace("onclick","onClick");
			        $div.remove();
					btns.push({
						componentName : "$UI/system/components/justep/button/button",
						parentElementId : did,
						templateContent : template
					});
				});
				if(btns.length>0)
					xuiDoc.batchCreateComponent(btns, function() {
						//xuiDoc.repaintComponent(did);
					});
			});
		}
	});

	return {'$UI/system/components/justep/toolBar/toolBar': cls};
});