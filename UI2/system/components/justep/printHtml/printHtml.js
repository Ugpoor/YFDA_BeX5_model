/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	
	var router = require('$UI/system/lib/route/router');
	var justep = require('$UI/system/lib/justep');
	var url = require.normalizeName("./printHtml");
	var ComponentConfig = require("./printHtml.config");

	var clearHtmlEvent = function(node){
		if (node.onmouseover) {
			node.onmouseover = null;
		}
		if (node.onmouseout) {
			node.onmouseout = null;
		}

		if (node.onclick) {
			node.onclick = null;
		}
	};
	
    var Popup = function(settings)
    {
        var windowAttr = "location=yes,statusbar=no,directories=no,menubar=no,resizable=yes,scrollbars=yes,titlebar=no,toolbar=no,dependent=no";
        if(settings){
        	if(settings.width) windowAttr += ",width=" + settings.width;
        	if(settings.height) windowAttr += ",height=" + settings.height;
        	if(settings.screenX) windowAttr += ",screenX=" + settings.screenX;
        	if(settings.screenY) windowAttr += ",screenY=" + settings.screenY;
        }
        
        router.revertVls();
        var newWin = window.open( "", "_blank",  windowAttr );

        newWin.doc = newWin.document;

        return newWin;
    };
    
	var transHtml = function(node){
		$(node).find("div.x-richTextarea").each(function(){
			var $node = $(this).css({height:'auto'});
			$node.find('div.edui-toolbar').hide();
			$node.find('div.edui-body-container').css({height:'auto'});
		});
		
		$(node).find("table").each(function(){
			clearHtmlEvent(this);
		});
		
		$(node).find("div").each(function(){
			clearHtmlEvent(this);
		});

		$(node).find("span").each(function(){
			clearHtmlEvent(this);
		});
		
		$(node).find("div.x-grid").each(function(){
			transGrid(this);
		});
	};
	
	var transGrid = function(grid){
		$(grid.parentNode).css({height:'auto'});
		$('div.x-grid-bdiv',grid).css({height:'auto'}).children('div').css({height:'auto'});
	};
	
	/**
	 * 获取要打印区域的html内容.
	 */
	var getHtml = function(model, formXID) {
		if('string'===typeof(formXID)){
			formXID = [formXID];
		} 
		var html = "";

		$(model.getRootNode()).find("style").each(function(){
        	html += _getHtml(this);
        });
		
		for(var i = 0;i < formXID.length;i++){
			var ele = $(model.getElementByXid(formXID[i]));
			 
			//TODO xyh 
			//ie9下，通过input.value="xxx"赋值，.html()无法取出来。setAttribute方式赋值可以取出来，所以特殊处理
			//ie8,ie9,xforms-radio值无法取出，特殊处理
			var inputs = ele.find("input");
			for ( var j = 0; j < inputs.length; j++) { 
				var input = inputs[j];
				
				if(input.value!==null && input.value!==""){
					input.setAttribute("value",input.value);
				}
				if(input.type=="radio" || input.type=="checkbox"){
					if(input.checked){
						input.setAttribute("checked","true");
					}
				}
			}
         
			var textareas = ele.find("textarea");
			for ( j = 0; j < textareas.length; j++) { 
				var $textarea = $(textareas[j]);
				var val = $textarea.val();
				
				//??确定是否影响原组件
				if(val!==null && val!==""){
					$textarea.html(val);
				}
			}

			html += $("<div></div>").append(ele.clone()).html();
		}

		var tmp = document.createElement('div');
		$(tmp).html(html);
		transHtml(tmp);
		html = $(tmp).html();
		$(tmp).empty().remove();
		 
		return html;
	};
	
	var _getHtml = function(node){
		var $ret = $('<div></div>').append($(node).clone());
		return $ret.html();
	};
	
    var getHead = function(settings)
    {
        var head = "<head><title>" + settings.popTitle + "</title>";
        $(document).find("meta").each(function(){
        	head += _getHtml(this);
        });
        $(document).find("link")
            .filter(function(){
                    return $(this).attr("rel").toLowerCase() == "stylesheet";
                })
            .each(function(){
                    head += '<link type="text/css" rel="stylesheet" href="' + $(this).attr("href") + '" >';
                });
        head += "</head>";
        return head;
    };	

    var getHtmlClass = function(){
    	return $('html', document).attr('class');
    };
    
    var getActiveX = function(isPreview){
    	return (justep.Browser.IE&&isPreview)?"<OBJECT id=wb height=0 width=0 classid='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2' name=wb></OBJECT>":"";
    };
    
	/** 执行打印输出 * */
	var executePrintout = function(model, formXID, isPreview, options) {  
		if(!formXID){justep.System.showMessage((new justep.Message(justep.Message.JUSTEP231072, formXID)).getMessage());return;}
		/*
		 height    : 500,
	     width    : 400,
	     screenX     : 200,
	     screenY     : 200,
		 */
	    var defaults = { closeWin : true,
	                     popTitle : ''};
	    var settings = {};
		$.extend( settings, defaults, options );
		
        var writeDoc;
        var printWindow = new Popup(settings);
        writeDoc = printWindow.doc;
	    writeDoc.open();
	    writeDoc.write('<!DOCTYPE html> '+"<html class='"+getHtmlClass()+"'>" + getHead(settings) + "<body "+ ((justep.Browser.IE&&isPreview)?"onload='try{wb.execWB(7,1);}catch(e){alert(\"ActiveX未能正常加载\");}'":"") + ">" + getActiveX(isPreview) + getHtml(model, formXID) + (settings.appendHtml || '') + "</body>" + "</html>" );
	    writeDoc.close();
	    
	    window.setTimeout(function(){
	    	if(!(justep.Browser.IE&&isPreview)){
	    		printWindow.focus();
	    		printWindow.print();
	    	}
	    	if (settings.closeWin){
	    		window.setTimeout(function(){
	    			printWindow.close();
	    		},1);
	    	}
	    	router.ignoreVls();
	    }, 500); 
	};
    
    var PrintHtml = justep.ViewComponent.extend({
		constructor : function() {
			this.callParent();
			this.target = null;
		},
		getConfig : function() {
			return ComponentConfig;
		},
		buildTemplate : function(config) {
			return null;
		},
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
		},
		print: function(formXID, options){
			executePrintout(this.getModel(), formXID||this.target, false, options);
		},
		preview: function(formXID, options){
			executePrintout(this.getModel(), formXID||this.target, true, options);
		}
	});

	justep.Component.addOperations(PrintHtml, {
		'print' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231103),//打印
			icon : null,
			method : function(args) {
				return this.owner.print();
			}
		},
		'preview' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231104),//'预览'
			icon : null,
			method : function(args) {
				return this.owner.preview();
			}
		}
	});
	
	justep.Component.register(url, PrintHtml);
	return PrintHtml;
});