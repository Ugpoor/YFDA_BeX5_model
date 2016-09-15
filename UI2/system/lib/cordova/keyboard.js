define(function(require){
	var $ = require('jquery');
	var Browser = require('$UI/system/lib/base/browser');
	var store = require('$UI/system/lib/base/store');
	
	if(Browser.isAndroid){
		var viewportHeight = $(window).height();
	    function isInViewport (el) {
	        var rect = el.getBoundingClientRect();
	        return (
	                rect.top >= 20 &&
	                rect.left >= 0 &&
	                rect.bottom <= $(window).height() -20 &&
	                rect.right <= $(window).width()
	        );
	    }
	    
	    $('<style type="text/css">.android_keyboard_cover_bug{z-index:10000 !important;position:fixed !important;width:100% !important;height:48px;left:0 !important;bottom:0 !important;margin:0 !important;}</style>').appendTo('body');
	    
	    $(window).on('resize',function(){
	        var newviewportHeight = $(window).height();
	        var newviewportWidth = $(window).width();
	        // only fix Portrait condition
	        if(viewportHeight - newviewportHeight > 150 && viewportHeight - newviewportWidth > 0){
	        	var keyboardHeight = viewportHeight - newviewportHeight;
	        	store.set('keyboardHeight',keyboardHeight);
	        	
	        	setTimeout(function(){
	        		store.set('keyboardDidShow',true);
	        		$(window).trigger( "keyboardshow",[keyboardHeight]);
	        	},0);
	            var activeElement = document.activeElement;
	            if(activeElement && /^(INPUT|TEXTAREA)$/.test(activeElement.nodeName)){
	                if(!isInViewport(activeElement)){
                		var activeElement = document.activeElement;
                		if(activeElement.scrollIntoView){
                			activeElement.scrollIntoView();
                			if(!isInViewport(activeElement)){
                				activeElement.scrollIntoView(false);
                			}
                		}else{
                			$(activeElement).addClass('android_keyboard_cover_bug');
                		}
	                }
	            }
	        }else if(Math.abs(viewportHeight - newviewportHeight) < 50){
	            $('.android_keyboard_cover_bug').removeClass('android_keyboard_cover_bug');
	            setTimeout(function(){
	            	store.set('keyboardDidShow',false);
	            	$(window).trigger("keyboardhide");
	        	},0);
	        }
	    });
	}else if(Browser.isIOS){
		var screenHeight = window.screen.height;
		/*320 x 480 pts	320 x 568 pts	375 x 667 pts	414 x 736 pts
		320 x 253 pts	320 x 253 pts	375 x 258 pts	414 x 271 pts*/
		if(screenHeight == 480){
			//iphone4 and less
			store.set('keyboardHeight',253);
		}else if(screenHeight == 568){
			//iphone5
			store.set('keyboardHeight',253);
		}else if(screenHeight == 667){
			//iphone6
			store.set('keyboardHeight',258);
		}else if(screenHeight == 736){
			//iphone6+
			store.set('keyboardHeight',271);
		}
		$(document).on('focus','input,select,textarea,[contenteditable]',function(){
			var activeEle = this;
			setTimeout(function(){
				if(document.activeElement == activeEle){
					var keyboardHeight = store.get('keyboardHeight');
					store.set('keyboardDidShow',true);
					$(window).trigger("keyboardshow",keyboardHeight);
				}
			},300);
		});
		
		$(document).on('blur','input,select,textarea,[contenteditable]',function(){
			setTimeout(function(){
				var keyboardHeight = $(window).scrollTop();
				if(keyboardHeight === 0){
					store.set('keyboardDidShow',false);
					$(window).trigger("keyboardhide");
				}
			},300);
		});
	}
	
	var isAndroid5 = (navigator.userAgent.indexOf("Crosswalk") >= 0) || (navigator.userAgent.indexOf("Android 5.") >= 0);
	if(isAndroid5){
		if(($(window).height() >= $('body').height()) && $('body').css('overflowY') === "visible"){
			$('body').css('overflowY','hidden');
		}
	}
	
	$(document).on('focusin',function(e) {
		var target = e.target;
		if (target.tagName && (target.tagName === 'TEXTAREA' || (target.tagName === 'INPUT' && (target.type === 'text' || target.type === 'search' || target.type === 'number'))) || (target.tagName === 'DIV' && $(e.target).attr('contenteditable') ==  "true")) {
			if (target.disabled || target.readOnly) {
				return;
			}
			$('html').addClass('x-focus-in');
		}
	});
	$(document).on('focusout',function(e) {
		$('html').removeClass('x-focus-in');
	});
	
	return true;
});