/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");

	//引入bootstrap
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
	
	// https://github.com/goodybag/bootstrap-notify
	require("css!../css/bootstrap-notify").load();
	require("css!../css/styles/alert-bangtidy").load();
	require("css!../css/styles/alert-blackgloss").load();
	
	require("../js/bootstrap-notify");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.init();
	};

	Model.prototype.init = function() {
		var root = this.getRootNode();
	      // Random Messages
	      var messages = [
	        [ 'bottom-right', 'info',     'Gah this is awesome.'],
	        [ 'top-right',    'success',  'I love Nijiko, he is my creator.' ],
	        [ 'bottom-left',  'warning',  'Soda is bad.' ],
	        [ 'top-right',  'danger',   "I'm sorry dave, I'm afraid I can't let you do that." ],
	        [ 'bottom-right', 'info',     "There are only three rules." ],
	        [ 'top-right',    'inverse',  'Do you hear me now?' ],
	        [ 'bottom-left',  'blackgloss',     'You should fork this!' ]
	      ];

	      // Pretty print
	      window.prettyPrint && prettyPrint()

	      // Basic Features, style isn't even required.
	      $('.show-notification',root).click(function (e) {
	        var message = messages[Math.floor(Math.random() * messages.length)];
	        
	        $('.' + message[0],root).notify({
	          message: { text: message[2] },
	          type: message[1],
	          fadeOut: {
	            delay: Math.floor(Math.random() * 500) + 2500
	          }
	        }).show();
	      });
	      
	      /* Custom Styles */
	      var custom = [
	        'bangTidy',
	        'blackgloss'
	      ];
	      
	      for(var i = 0; i < custom.length; i++) {
	        var type = custom[i];
	        
	        (function(type) {
	          $('.show-' + type,root).click(function (e) {
	            var message = messages[Math.floor(Math.random() * messages.length)];
	            $('.' + message[0],root).notify({ message: { text: message[2] }, type: type }).show();
	          });
	        })(type);
	      }
	};
	
	return Model;
});