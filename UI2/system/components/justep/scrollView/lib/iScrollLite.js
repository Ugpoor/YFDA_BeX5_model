define(function(require, exports, module) {
	require('$UI/system/lib/jquery/transition');
	var $ = require("jquery");
	var iScroll = function(domNode, options) {
		this.domNode = domNode;
		this.$rootEle = $(domNode);
		this.$scrollEle = this.$rootEle.find('>.x-scroll');
		this.$scrollCEle = this.$scrollEle.find('>.x-scroll-content');
		this.$pdEle = this.$scrollEle.find('>.x-pull-down');
		this.$puEle = this.$scrollEle.find('>.x-pull-up');
		this.eventNamespace = new Date().getTime() + "";
		this.options = options || {topOffset:50};
		this.options = $.extend({
			onRefresh : null,
			onScrollMove : null,
			onScrollEnd : null
		},this.options);
		this.init();
		this.optimizePerformanceForKeyboard();
		
	};
	
	iScroll.prototype.init = function(){
		var self = this;
		this.pullDown();
		this.refresh().done(function(){
			if(self.maxScrollY === 0){
				if (self.options.onScrollEnd){
					self.refresh().done(function(){
						if(self.maxScrollY === 0){
							self.options.onScrollEnd("scroll");
						}
						self.bindScroll();
					});
				}
			}else{
				self.bindScroll();
			}
		});
		
	};
	
	
	iScroll.prototype.bindScroll = function(){
		var self = this;
		this.$scrollEle.on('scroll',function(e){
			self.y = self.$scrollEle.scrollTop() * -1;
			if (self.options.onScrollMove){
				self.options.onScrollMove.call(self, e);
			}
			debounce(self.onScrollEnd,200,self)("scroll");
		});
	};
	
	iScroll.prototype.onScrollEnd = function(type){
		var self = this;
		if(this.options.recycleSelector !== ""){
			this.calculateUnit();
		}
		this.refresh().done(function(){
			if (self.options.onScrollEnd){
				self.options.onScrollEnd.apply(self,[type]);
			}
		});
	};
	
	
	iScroll.prototype.optimizePerformanceForKeyboard = function(){
			var self = this;
			$(window).on('keyboardshow.' + this.eventNamespace,function(){
				$(self.unInViewEles).hide();
			}).on('keyboardhide.' + this.eventNamespace,function(){
				$(self.unInViewEles).show();
			});
	};
	iScroll.prototype.calculateUnit = function(){
		var self = this;
		this.inViewEles = [];
		this.unInViewEles = [];
		debounce(function(){
			self.$scrollCEle.find(self.options.recycleSelector).each(function(index,ele){
				if(isInViewport(ele)){
					self.inViewEles.push($(ele).children());
					//$(ele).children().show();
				}else{
					self.unInViewEles.push($(ele).children());
					//$(ele).children().hide();
				}
			});
		},1000,self)();
	};
	
	
	function debounce(fn, wait,scope) {
		return function() {
			var args = arguments,
				later = function() {
					fn.__timeout = undefined;
					fn.apply( scope, args );
				};
			if(fn.__timeout ) {
				clearTimeout(fn.__timeout);
			}
			fn.__timeout = setTimeout( later, wait );
		};
	};
	
	function isInViewport (el) {
        var rect = el.getBoundingClientRect();
        return (
                rect.top >= 0 &&
                rect.left >= 0 &&
                rect.bottom <= $(window).height() &&
                rect.right <= $(window).width()
        );
    };
	
	
	iScroll.prototype.refresh = function(){
		var dfd = $.Deferred();
		var self = this;
		if (this.options.onRefresh){
			this.options.onRefresh.call(self);
		}
		this.$scrollEle.transition(300);
		this.$scrollEle.transitionEnd(function(){
			self.$scrollEle.transition(0);
		});
		this.$scrollEle.transform('translate3d(0,0,0)');
		setTimeout(function(){
			self.maxScrollY = -1 * (self.$scrollEle.get(0).scrollHeight - self.$scrollEle.height());
			self.y = self.$scrollEle.scrollTop() * -1;
			dfd.resolve();
		},300);
		return dfd.promise();
		
	};
	
	
	iScroll.prototype.scrollTo = function(y){
		this.$scrollEle.scrollTop(y);
	};
	
	iScroll.prototype.scrollToElement = function(el){
		if(el.scrollIntoView){
			el.scrollIntoView();
		}
	};
	
	
	iScroll.prototype.supportContentTouchMove = function(){
		var isMoved = false,pullStarted,touchesStart = {},isScrolling,deltaX,deltaY,touchesDiff,touchStartTime,
			self=this,isFirstMove=true;
			
		this.$scrollEle.on('touchstart mousedown',function(e){
			if(e instanceof $.Event){
				e = e.originalEvent;
			}
			isMoved = false;
			isScrolling = true;
			isFirstMove = true;
			touchesStart.x = e.type === 'touchstart' ? e.targetTouches[0].pageX : e.pageX;
			touchesStart.y = e.type === 'touchstart' ? e.targetTouches[0].pageY : e.pageY;
			touchStartTime = (new Date()).getTime();
			self.$scrollEle.transition(0);
		});
			
		
		this.$scrollEle.on('touchmove mousemove',function(e){
			if(e instanceof $.Event){
				e = e.originalEvent;
			}
			if(e.hasStopedPropagation === true){
				return;
			}
			if(e.type === 'touchmove' && e.targetTouches.length > 1){
				return;
			}
			var pageX = e.type === 'touchmove' ? e.targetTouches[0].pageX : e.pageX;
			var pageY = e.type === 'touchmove' ? e.targetTouches[0].pageY : e.pageY;
			
			
			deltaX = Math.abs(pageX - touchesStart.x);
			deltaY = Math.abs(pageY - touchesStart.y);
			touchesDiff = pageY - touchesStart.y;
			
			
			//下拉情况
			if(isFirstMove && (deltaY > deltaX) && self.$scrollEle.scrollTop() === 0 && touchesDiff > 0){
				
				isScrolling = false;
				isMoved = true;
			}
			
			if (isScrolling === false && isMoved === true && touchesDiff > 0) {
				e.hasStopedPropagation = true;
				e.preventDefault();
				//摩擦系数为0.85感觉手感不错
				self.$scrollEle.transform('translate3d(0,' + Math.pow(touchesDiff, 0.85) + 'px,0)');
				self.y = Math.pow(touchesDiff, 0.85) - self.options.topOffset;
				if (self.options.onScrollMove){
					self.options.onScrollMove.call(self, e);
				}
			}
			//上滑情况
			if(isFirstMove && (deltaY > deltaX) && (self.$scrollEle.get(0).scrollHeight - self.$scrollEle.height() - self.$scrollEle.scrollTop()) === 0  && touchesDiff < 0){
				//符合上滑环境 判断是否允许上滑
				//自动上滑 但是首屏没有充满的时候 需要可以手动滑一下加载更多数据
				if((self.options.autoPullUp  == true && self.$scrollEle.get(0).scrollHeight - self.$scrollEle.height() == 0) ||
						(self.options.autoPullUp  == false)	||
						(self.options.autoPullUp  == true && self.noMoreElement === true)){
					isFirstMove = false;
					isScrolling = false;
					isMoved = true;
				}
			}
			if (isScrolling === false && isMoved === true && touchesDiff < 0) {
				e.hasStopedPropagation = true;
				e.preventDefault();
				//摩擦系数为0.85感觉手感不错
				self.$scrollEle.transform('translate3d(0,-' + Math.pow(touchesDiff*-1, 0.85) + 'px,0)');
				self.y = -Math.pow(touchesDiff*-1, 0.85) - (self.$scrollEle.get(0).scrollHeight - self.$scrollEle.height());
				if (self.options.onScrollMove){
					self.options.onScrollMove.call(self, e);
				}
			}
			isFirstMove = false;
		});
		
		this.$scrollEle.on('touchcancel touchend mouseup',function(e){
			if(e instanceof $.Event){
				e = e.originalEvent;
			}
			
			if (isScrolling === false && isMoved === true) {
				var direction = "pullDown";
				if(touchesDiff < 0){
					direction = "pullUp";
				}
				self.onScrollEnd(direction);
				if(!(self.$pdEle.hasClass('x-flip') || self.$pdEle.hasClass('x-restore'))){
					self.refresh();
				}
			}
			
			
			
			isScrolling = true;
			isMoved === false;
			isFirstMove = false;
		});
	};
	
	iScroll.prototype.pullDown = function() {
		if (this.$pdEle.length === 0) {
			return;
		}
		this.supportContentTouchMove();
	};
	
	
					  	
	iScroll.prototype.destroy = function() {
		$(window).off("."+this.eventNamespace);
	};
	return iScroll; 
});
