/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var WindowContainer = require("$UI/system/components/justep/windowContainer/windowContainer");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.callParent();
		this.isVisible = util.flag;
	};

	Model.prototype.updateSrc = function() {
		var windowContainer = this.comp("windowContainer");
		var src = require.toUrl("$UI/system/components/justep/windowContainer/demo/inner3.w");
		windowContainer.setSrc(src);
		windowContainer.load();
	};

	Model.prototype.createWindowContainer = function() {
		var container = this.getElementByXid("container");
		for ( var i = container.childNodes.length - 1; i >= 0; i--) {
			justep.Bind.removeNode(container.childNodes[i]);
		}
		var src = require.toUrl("$UI/system/components/justep/windowContainer/demo/inner3.w");
		new WindowContainer({
			parentNode : container,
			src : src,
			onLoadError : function(err) {
				for ( var i = container.childNodes.length - 1; i >= 0; i--) {
					justep.Bind.removeNode(container.childNodes[i]);
				}
				err.cancel = false;
			}
		});
	};

	Model.prototype.closeWin = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.showWinConSource = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "system/components/justep/windowContainer/demo/main.w&xid=windowContainer"
		});
	};

	Model.prototype.showJsSource = function(event) {
		util.showSource({
			self : this,
			data : "system/components/justep/windowContainer/demo/main.js"
		});
	};

	Model.prototype.button2Click = function(event) {
		this.comp("windowContainer").getInnerModel().inner1()
	};

	return Model;
});
