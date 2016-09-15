/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	// var $ = require("jquery");
	var Dialog = require("$UI/system/components/justep/dialog/dialog");
	var justep = require("$UI/system/lib/justep");
	require('$UI/system/lib/jquery/transition');
	require("css!./animate.css").load();
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.open = function(event) {
		if (!this.dialog) {
			this.dialog = new Dialog({
				title : '这是一个功能',
				showTitle : true,
				parentNode : this.getElementByXid("dialog")
			});
			this.dialog.on('onClose', function(event) {
				this.comp('output').set({
					'value' : '关闭'
				});
			}, this);
			this.dialog.on('onOpen', function(event) {
				var $dialog = this.dialog.$domNode.find('.x-dialog');
				$dialog.addClass('animated fast slideInUp');
				$dialog.animationEnd(function(){
					$dialog.removeClass('animated fast slideInUp');
				});
				alert("打开");
			}, this);
			
			
			this.dialog.on('onClose', function(event) {
				var $dialog = this.dialog.$domNode.find('.x-dialog');
				$dialog.css('display','block');
				$dialog.css("opacity",1);
				$dialog.addClass('animated fast slideOutDown');
				$dialog.animationEnd(function(){
					$dialog.css({"opacity":"initial",'display':"none"});
					$dialog.removeClass('animated fast slideOutDown');
				});
			}, this);
		}
		this.dialog.open();
	};

	Model.prototype.dialogOpen = function(event) {
		alert('打开dialog');
	};

	Model.prototype.closeWin = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.showMessageDialogSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/dialog/demo/demo.w&xid=dialog"
		});
	};

	Model.prototype.showJsDialogSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/components/justep/dialog/demo/demo.js"
		});
	};

	return Model;
});
