/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var Picker = require("../picker");
	var PopPicker = require("../popPicker");
	require('css!./css/popPicker').load();

	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc(); 
	var PickerDesigner = Picker.extend({
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
	        //var $domNode = this.$domNode;
		}
	});

	function create(comp, clz) {
		var $domNode = $(comp.domNode);
		comp.domNode.style.position = "absolute";
		if (!comp.domNode.style.top) {
			comp.domNode.style.top = "10px";
			comp.domNode.style.left = "10px";
		}
		$domNode.addClass(clz).children().hide();
		$('.x-popPicker-overlay',$domNode).attr("d_canRemove",false);
		$('.x-popPicker-content',$domNode).attr("d_canRemove",false);
		$('.x-poppicker-header',$domNode).attr("d_canRemove",false);
		$domNode.on("childChanged",function(event, data){
			if(data.type=='remove' && $(data.target).hasClass("x-picker")){
				setTimeout(function(){comp.updatePickerClass();},1);
			}
		});
	}
	
	var PopPickerDesigner = PopPicker.extend({
		init : function(value, bindingContext) {
			create(this, 'x-designer-popPicker');
			this.callParent(value, bindingContext);
		},
		updatePickerClass: function(){
	    	var self = this;
			var pickers = self.getInnerPickers();
	    	if($.isArray(pickers)){
	    		var size = pickers.length;
	    		$.each(pickers,function(i,picker){
	    			for(var j=1;j<=10;i++){
	    				picker.$domNode.removeClass('x-picker-'+j);
	    			}
	    			if(size>1){
	    				picker.$domNode.addClass('x-picker-'+size);
	    				xuiDoc.updateProperties(picker.$domNode,['class']);
	    			}
	    		});
	    	}
		},
		addPicker : function(){
		    var templateText = xuiDoc.getTemplate('$UI/system/components/justep/picker/picker');
		    var pId = $('.x-popPicker-content',this.$domNode).attr("d_id");
		    var paintComponent = true;
		    var self = this;
		    
		    xuiDoc.createComponent('$UI/system/components/justep/picker/picker',pId,{paintComponent:paintComponent,templateContent:templateText},function(node){
		    	self.updatePickerClass();
		    });
		}
	});

	return {
		'$UI/system/components/justep/picker/picker' : PickerDesigner,
		'$UI/system/components/justep/picker/popPicker' : PopPickerDesigner
	};
});