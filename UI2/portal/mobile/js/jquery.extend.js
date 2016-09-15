/**
 *  jQuery 扩展
 *  TODO: 可以被$.animate(params,[speed],[easing],[fn])替代吗？
 *  jquery 因为一些原因没有采用requestAnimationFrame
 *  同时animate只能动画数字 不能动画字符串 比如 background:red
 *  参考jquery.requestAnimationFrame.js等实现
 *
 */
define(function(require){
	var $ = require('jquery');
	$.fn.transform = function (transform) {
	    for (var i = 0; i < this.length; i++) {
	        var elStyle = this[i].style;
	        elStyle.webkitTransform = elStyle.MsTransform = elStyle.msTransform = elStyle.MozTransform = elStyle.OTransform = elStyle.transform = transform;
	    }
	    return this;
	};

	$.fn.transition = function (duration) {
	    for (var i = 0; i < this.length; i++) {
	        var elStyle = this[i].style;
	        elStyle.webkitTransitionDuration = elStyle.MsTransitionDuration = elStyle.msTransitionDuration = elStyle.MozTransitionDuration = elStyle.OTransitionDuration = elStyle.transitionDuration = duration + 'ms';
	    }
	    return this;
	};

	$.fn.transitionEnd = function (callback) {
	    var events = ['webkitTransitionEnd', 'transitionend', 'oTransitionEnd', 'MSTransitionEnd', 'msTransitionEnd'],
	        i, j, dom = this;
	    function fireCallBack(e) {
	        /*jshint validthis:true */
	        callback.call(this, e);
	        for (i = 0; i < events.length; i++) {
	            dom.off(events[i], fireCallBack);
	        }
	    }
	    if (callback) {
	        for (i = 0; i < events.length; i++) {
	            dom.on(events[i], fireCallBack);
	        }
	    }
	    return this;
	};

	$.fn.animationEnd = function (callback) {
	    var events = ['webkitAnimationEnd', 'OAnimationEnd', 'MSAnimationEnd', 'animationend'],
	        i, j, dom = this;
	    function fireCallBack(e) {
	        callback(e);
	        for (i = 0; i < events.length; i++) {
	            dom.off(events[i], fireCallBack);
	        }
	    }
	    if (callback) {
	        for (i = 0; i < events.length; i++) {
	            dom.on(events[i], fireCallBack);
	        }
	    }
	    return this;
	};


	/**
	 * 一般调用tap
	 * 使用$(document).tap('div',function(){})
	 * 这种写法 类似与以前的live函数，能够让动态添加的函数也绑定上这个时间
	 *
	 * @param targetSelector
	 * @param listener
	 */
	$.fn.tap = function (targetSelector, listener) {
	    var dom = this;
	    /*var isTouched, isMoved, touchesStart = {}, touchStartTime, deltaX, deltaY;
	    if (arguments.length === 1) {
	        listener = arguments[0];
	        targetSelector = false;
	    }
	    if ($.supportTouch) {
	        dom.on('touchstart', targetSelector, function (e) {
	            isTouched = true;
	            isMoved = false;
	        });
	        dom.on('touchmove', targetSelector, function (e) {
	            if (!isTouched || isMoved) return;
	            isMoved = true;
	        });
	        dom.on('touchend', targetSelector, function (e) {
	            e.preventDefault(); // - to prevent Safari's Ghost click
	            if (isTouched && !isMoved) {
	                listener.call(this, e);
	            }
	            isTouched = isMoved = false;
	        });
	    }
	    else {
	        
	    }*/
	    
	    dom.on('click', targetSelector, listener);
	};

	$.fn.is = function (selector) {
	    var compareWith;
	    if (typeof selector === 'string') compareWith = document.querySelectorAll(selector);
	    else if (selector.nodeType) compareWith = [selector];
	    else compareWith = selector;
	    for (var i = 0; i < compareWith.length; i++) {
	        if (compareWith[i] === this[0]) return true;
	    }
	    return false;
	};

	$.fn.indexOf = function (el) {
	    for (var i = 0; i < this.length; i++) {
	        if (this[i] === el) return i;
	    }
	};

	$.supportTouch = (function () {
	    return !!(('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch);
	})();

	$.parseUrlQuery = function (url) {
	    var query = {}, i, params, param;
	    params = url.split(/[?#&]/);
	    for (i = 0; i < params.length; i++) {
	        if(params[i].indexOf("=")!=-1){
	            param = params[i].split('=');
	            query[param[0]] = param[1];
	        }
	    }
	    return query;
	};


	$.touchEvents = {
	    start: $.supportTouch ? 'touchstart' : 'mousedown',
	    move: $.supportTouch ? 'touchmove' : 'mousemove',
	    end: $.supportTouch ? 'touchend' : 'mouseup'
	};

	$.animationFrame = function (callback) {
	    if (window.requestAnimationFrame) return window.requestAnimationFrame(callback);
	    else if (window.webkitRequestAnimationFrame) return window.webkitRequestAnimationFrame(callback);
	    else if (window.mozRequestAnimationFrame) return window.mozRequestAnimationFrame(callback);
	    else {
	        return window.setTimeout(callback, 1000 / 60);
	    }
	};
	return {};
});