define(function(require){
	var $ = require("jquery");
	var Object = require("$UI/system/lib/base/object");
	require("css!./loadingBar").load();
	
	var LoadingBar = Object.extend({
		constructor: function(){
			var self = this;
			$("<div id='x-default-loadingbar' loadingnum = '0' class='waiting'><dt/><dd/></div>").appendTo('body');
			$("<div id='x-default-overlay' class='x-default-overlay'></div>").appendTo('body');
			this.$loadingBarNode = $("#x-default-loadingbar");
			this.$loadingOverlayNode = $("#x-default-overlay");
			this.$loadingOverlayNode.on('click',function(){
				setTimeout(function(){
					self.$loadingOverlayNode.removeClass('x-default-overlay-open');
				},100);
			});
			
		    $(document).ajaxStart(function() {
		    	self.start();
		    });
		    $(document).ajaxStop(function() {
		    	self.stop();
		    });
		    $(document).ajaxError(function() {
		    	self.stop();
		    });
		},
		start : function(isWithOverlay){
			var self = this;
			var oldNum = parseInt(self.$loadingBarNode.attr('loadingnum'));
    		self.$loadingBarNode.attr('loadingnum',oldNum + 1);
    		if(isWithOverlay){
    			self.$loadingOverlayNode.addClass('x-default-overlay-open');
    		}
			self.$loadingBarNode.fadeIn(100,function(){
				if(oldNum === 0){
	    			self.$loadingBarNode.width((40 + Math.random() * 30) + "%");
	    		}
	        });
		},
		stop : function(){
			var self = this;
			setTimeout(function(){
				var oldNum = parseInt(self.$loadingBarNode.attr('loadingnum'));
	    		self.$loadingBarNode.attr('loadingnum',oldNum - 1);
	    		if(oldNum <= 1){
	    			self.$loadingOverlayNode.removeClass('x-default-overlay-open');
	    			self.$loadingBarNode.width("101%").fadeOut(500, function() {
		    			self.$loadingBarNode.width("1%");
			        });
		    	}
			},100);
		}
	});
	return new LoadingBar();
});