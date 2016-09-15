/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	//引入默认样式
	require("css!./css/picker").load();
	
	var $ = require("jquery");

	var justep = require("$UI/system/lib/justep");

	var url = require.normalizeName("./picker");
	var ComponentConfig = require("./picker.config");
	var List = require("$UI/system/components/justep/list/list");
	var Data = require("$UI/system/components/justep/data/data");

	var startEventName = justep.Browser.hasTouch ? 'touchstart' : 'mousedown';
	var moveEventName = justep.Browser.hasTouch ? 'touchmove' : 'mousemove';
	var endEventName = justep.Browser.hasTouch ? 'touchend' : 'mouseup';

	var MAX_EXCEED = 30;
	var VISIBLE_RANGE = 90;
	var DEFAULT_ITEM_HEIGHT = 40;
	var BLUR_WIDTH = 10;

	var rad2deg = function(rad) {
		return rad / (Math.PI / 180);
	};

	/*
	var deg2rad = function(deg) {
		return deg * (Math.PI / 180);
	};
	*/

	var isIos = justep.Browser.isIOS;

	var Picker = List.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.callParent(options);
			this.options = {};
			this.disablePullToRefresh = true;
			this.disableInfiniteLoad = true;
		},
		dispose : function() {
			if(this._afterRenderHandle) clearTimeout(this._afterRenderHandle); 
			this.callParent();
		},
		buildTemplate : function(config) {
			config = config || {};
			/*
          <div class="x-picker-inner"> 
            <div class="x-pciker-rule x-pciker-rule-ft"/>  
	        <ul class="x-list-template x-pciker-list"> 
	          <li bind-text="val('fClass')"></li> 
	        </ul>  
            <div class="x-pciker-rule x-pciker-rule-bg"/> 
          </div> 
			 */
			var template = $(
					'<div class="x-picker-inner">'+ 
					'  <div class="x-pciker-rule x-pciker-rule-ft"/>'+  
					'  <ul class="x-list-template x-pciker-list">'+ 
					'  </ul>'+  
					'  <div class="x-pciker-rule x-pciker-rule-bg"/>'+ 
					'</div>' 
			);
			var li = $('<li></li>');
			if(config['bind-itemText']){
				li.attr('data-bind','text:'+config['bind-itemText']);
				delete config['bind-itemText'];
			}
			$('ul.x-list-template',template).append(li);
			config.template = template;
			if (!config['class'])
				config['class'] = 'x-picker';
			var ret = this.callParent(config);
			ret.attr('component',url);
			return ret;
		},
		doInit : function(value, bindingContext) {
			this.lastMoveTime = 0;
			this.lastMoveStart = 0;
			this.stopInertiaMove = false;
			this.list = $('ul',this.$domNode);
			this.findElementItems();
			this.visibleRange = VISIBLE_RANGE;
			this.beginAngle = 0;
			this.beginExceed = this.beginAngle - MAX_EXCEED;
			this.list.angle = this.beginAngle;
			this.callParent(value, bindingContext);
		},
		findElementItems : function() {
			this.elementItems = this.$domNode.find('li');
			return this.elementItems;
		},
		calcElementItemPostion : function() {
			this.height = this.$domNode.height();
			this.r = this.height / 2 - BLUR_WIDTH;
			this.d = this.r * 2;
			if (isIos) 
				this.list.css('webkitTransformOrigin', "center center " + this.r + "px");
			this.itemHeight = this.elementItems.length > 0 ? this.elementItems[0].offsetHeight : DEFAULT_ITEM_HEIGHT;
			if(0>=this.itemHeight) this.itemHeight = DEFAULT_ITEM_HEIGHT;
			this.itemAngle = parseInt(this.calcAngle(this.itemHeight * 0.8));
			this.hightlightRange = this.itemAngle / 2;
			
			var self = this;
			this.elementItems.each(function() {
				var item = this;
				var index = self.elementItems.index(item);
				self.endAngle = self.itemAngle * index;
				item.angle = self.endAngle;
				$(item).css('webkitTransformOrigin', "center center -" + self.r + "px");
				$(item).css('webkitTransform', "translateZ(" + self.r + "px) rotateX(" + (-self.endAngle) + "deg)");
			});
			this.endExceed = this.endAngle + MAX_EXCEED;
			this.calcElementItemVisibility(this.beginAngle);
		},
		calcAngle : function(c) {
			var a = parseFloat(this.r),b;
			b = a;
			//直径的整倍数部分直接乘以 180
			c = Math.abs(c); //只算角度不关心正否值
			var intDeg = parseInt(c / this.d) * 180;
			c = c % this.d;
			//余弦
			var cosC = (a * a + b * b - c * c) / (2 * a * b);
			var angleC = intDeg + rad2deg(Math.acos(cosC));
			return angleC;
		},
		calcElementItemVisibility : function(angle) {
			var self = this;
			if(this.elementItems){
				this.elementItems.each(function() {
					var item = this;
					var difference = Math.abs(item.angle - angle);
					if (difference < self.hightlightRange) {
						$(item).addClass('highlight');
					} else if (difference < self.visibleRange) {
						$(item).addClass('visible');
						$(item).removeClass('highlight');
					} else {
						$(item).removeClass('highlight');
						$(item).removeClass('visible');
					}
				});
			}
		},
		setAngle : function(angle) {
			this.list.angle = angle;
			this.list.css('webkitTransform', "perspective(1000px) rotateY(0deg) rotateX(" + angle + "deg)");
			this.calcElementItemVisibility(angle);
		},
		_bindEvent : function() {
			this.callParent();
			var lastAngle = 0;
			var startY = null;
			var self = this;
			this.on('onAfterRender',function(event){self.doAfterRender(event);});
			this.$domNode.on(startEventName, function(event) {
				event.preventDefault();
				self.list.css('webkitTransition','');
				startY = (event.originalEvent.changedTouches ? event.originalEvent.changedTouches[0] : event.originalEvent).pageY;
				lastAngle = self.list.angle;
				self.updateInertiaParams(event, true);
				self[startEventName] = true;
			});
			this.$domNode.on(endEventName, function(event) {
				self[startEventName] = false;
				event.preventDefault();
				self.startInertiaScroll(event);
			});
			this.$domNode.on('touchcancel', function(event) {
				self[startEventName] = false;
				event.preventDefault();
				self.startInertiaScroll(event);
			});
			this.$domNode.on(moveEventName, function(event) {
				if(self[startEventName]){
					event.preventDefault();
					var endY = (event.originalEvent.changedTouches ? event.originalEvent.changedTouches[0] : event.originalEvent).pageY;
					var dragRange = endY - startY;
					var dragAngle = self.calcAngle(dragRange);
					var newAngle = dragRange > 0 ? lastAngle - dragAngle : lastAngle + dragAngle;
					if (newAngle > self.endExceed) {
						newAngle = self.endExceed;
					}
					if (newAngle < self.beginExceed) {
						newAngle = self.beginExceed;
					}
					self.setAngle(newAngle);
					self.updateInertiaParams(event);
				}
			});
			
			this.list.on('click', function(event) {
				var elementItem = event.target;
				if (elementItem.tagName == 'LI') {
					self.setSelectedIndex(self.elementItems.index(elementItem), 200);
				}
			});
		},
		updateInertiaParams : function(event, isStart) {
			var self = this;
			var point = event.originalEvent.changedTouches ? event.originalEvent.changedTouches[0] : event.originalEvent;
			if (isStart) {
				self.lastMoveStart = point.pageY;
				self.lastMoveTime = event.timeStamp || Date.now();
				self.startAngle = self.list.angle;
			} else {
				var nowTime = event.timeStamp || Date.now();
				if (nowTime - self.lastMoveTime > 300) {
					self.lastMoveTime = nowTime;
					self.lastMoveStart = point.pageY;
				}
			}
			self.stopInertiaMove = true;
		},
		startInertiaScroll : function(event) {
			var self = this;
			var point = event.originalEvent.changedTouches ? event.originalEvent.changedTouches[0] : event.originalEvent;
			//缓动代码
			var nowTime = event.timeStamp || Date.now();
			var v = (point.pageY - self.lastMoveStart) / (nowTime - self.lastMoveTime); //最后一段时间手指划动速度  
			var dir = v > 0 ? -1 : 1; //加速度方向  
			var deceleration = dir * 0.0006 * -1;
			var duration = Math.abs(v / deceleration); // 速度消减至0所需时间  
			var dist = v * duration / 2; //最终移动多少 
			var startAngle = self.list.angle;
			var distAngle = self.calcAngle(dist) * dir;
			//----
			var srcDistAngle = distAngle;
			if (startAngle + distAngle < self.beginExceed) {
				distAngle = self.beginExceed - startAngle;
				duration = duration * (distAngle / srcDistAngle) * 0.6;
			}
			if (startAngle + distAngle > self.endExceed) {
				distAngle = self.endExceed - startAngle;
				duration = duration * (distAngle / srcDistAngle) * 0.6;
			}
			//----
			if (distAngle === 0) {
				self.endScroll();
				return;
			}
			self.scrollDistAngle(nowTime, startAngle, distAngle, duration);
		},
		scrollDistAngle : function(nowTime, startAngle, distAngle, duration) {
			var self = this;
			self.stopInertiaMove = false;
			(function(nowTime, startAngle, distAngle, duration) {
				var frameInterval = 13;
				var stepCount = duration / frameInterval;
				var stepIndex = 0;
				(function inertiaMove() {
					if (self.stopInertiaMove) return;
					var newAngle = self.quartEaseOut(stepIndex, startAngle, distAngle, stepCount);
					self.setAngle(newAngle);
					stepIndex++;
					if (stepIndex > stepCount - 1 || newAngle < self.beginExceed || newAngle > self.endExceed) {
						self.endScroll();
						return;
					}
					setTimeout(inertiaMove, frameInterval);
				})();
			})(nowTime, startAngle, distAngle, duration);
		},
		quartEaseOut : function(t, b, c, d) {
			return -c * ((t = t / d - 1) * t * t * t - 1) + b;
		},
		endScroll : function() {
			var self = this;
			if (self.list.angle < self.beginAngle) {
				self.list.css('webkitTransition', "150ms ease-out");
				self.setAngle(self.beginAngle);
			} else if (self.list.angle > self.endAngle) {
				self.list.css('webkitTransition', "150ms ease-out");
				self.setAngle(self.endAngle);
			} else {
				var index = parseInt((self.list.angle / self.itemAngle).toFixed(0));
				self.list.css('webkitTransition', "100ms ease-out");
				self.setAngle(self.itemAngle * index);
			}
			this.triggerChange();
		},
		correctAngle : function(angle) {
			var self = this;
			if (angle < self.beginAngle) {
				return self.beginAngle;
			} else if (angle > self.endAngle) {
				return self.endAngle;
			} else {
				return angle;
			}
		},
		doAfterRender : function(event) {
			this.items = this.getBindingObjects() || [];
			var self = this;
			if(this._afterRenderHandle) clearTimeout(this._afterRenderHandle); 
			this._afterRenderHandle = setTimeout(justep.Util.bindModelFn(self.getModel(),function(){
				self._afterRenderHandle = null;
				self.findElementItems();
				self.calcElementItemPostion();
				self.setAngle(self.correctAngle(self.list.angle));
				self.fireEvent('onRendered', {source:self});
				//console.log("doAfterRender");
			}), 0);
		},
		getSelectedIndex : function() {
			return parseInt((this.list.angle / this.itemAngle).toFixed(0));
		},
		setSelectedIndex : function(index, duration) {
			this.list.css('webkitTransition','');
			var angle = this.correctAngle(this.itemAngle * index);
			if (duration && duration > 0) {
				var distAngle = angle - this.list.angle;
				this.scrollDistAngle(Date.now(), this.list.angle, distAngle, duration);
			} else {
				this.setAngle(angle);
			}
			this.triggerChange();
		},
		triggerChange : function(force) {
			var self = this;
			setTimeout(justep.Util.bindModelFn(self.getModel(),function() {
				var index = self.getSelectedIndex();
				var item = self.items[index];
				//console.log("triggerChange1:"+(item&&item.name));
				if (item != self.lastItem || force) {
					var data = self.getData();
					if(data instanceof Data) data.to(item);
					var eventData = {source: self, index: index, item: item};
					self.fireEvent('onChange', eventData);
					//console.log("triggerChange2:"+(item&&item.name));
				}
				self.lastItem = item;
			}), 0);
		},
		getSelectedItem : function() {
			var self = this;
			return self.items[self.getSelectedIndex()];
		},
		setSelectedItem : function(value, duration) {
			var self = this;
			for (var index in self.items) {
				var item = self.items[index];
				if (item == value) {
					self.setSelectedIndex(index, duration);
					return;
				}
			}
		},
		propertyChangedHandler : function(key, oldVal, value) {
			this.callParent(key, oldVal, value);
		}
	});

	justep.Component.register(url, Picker);
	return Picker;
});