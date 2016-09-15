/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");

	// 引入bootstrap
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");

	// https://github.com/sydcanem/bootstrap-contextmenu
	require("../js/bootstrap-contextmenu");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.init();
	};

	Model.prototype.init = function() {
	  var root = this.getRootNode();
      $('.main',root).contextmenu({
        target: '.context-menu2',
        before: function (e) {
          // This function is optional.
          // Here we use it to stop the event if the user clicks a span
        	if(e){
        		e.preventDefault();
        		if (e.target.tagName == 'SPAN') {
        			e.preventDefault();
        			this.closemenu();
        			return false;
        		}
        		this.getMenu().find("li").eq(2).find('a').html("This was dynamically changed");
        	}
          return true;
        }
      });
	};

	return Model;
});