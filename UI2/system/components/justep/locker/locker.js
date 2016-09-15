/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	//引入默认样式
	require("css!./css/locker").load();
	
	var $ = require("jquery");

	var justep = require("$UI/system/lib/justep");

	var url = require.normalizeName("./locker");
	var ComponentConfig = require("./locker.config");

	var startEventName = justep.Browser.hasTouch ? 'touchstart' : 'mousedown';
	var moveEventName = justep.Browser.hasTouch ? 'touchmove' : 'mousemove';
	var endEventName = justep.Browser.hasTouch ? 'touchend' : 'mouseup';
	var modes = {normal:0,check:1,setPassword:2};

	var Locker = justep.ViewComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.callParent(options);
			this.mode = modes.normal;
			this.OffsetX = 30;
			this.OffsetY = 30;
			this.R = 26;
			this.times = 4;
			this.ringColor = "#888"; // 圆圈边框颜色
			this.fillColor = "#f3f3f3"; // 圆圈填充颜色
			this.lineColor = "rgb(0,136,204)"; // 连结线颜色
			this.pointColor = "rgb(0,136,204)"; // 圆圈中心点颜色
			this.SuccessLineColor = "rgb(20,255,20)"; // 成功连结线颜色
			this.SuccessPointColor = "rgb(20,255,20)"; // 成功圆圈中心点颜色
			this.ErrorLineColor = "rgb(255,20,20)"; // 出错连结线颜色
			this.ErrorPointColor = "rgb(255,20,20)"; // 出错圆圈中心点颜色
			this.pointLocations = [];
			this.password = [];
		},
		dispose : function() {
			this.callParent();
		},
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'x-locker';
			return "<canvas class='"
					+ config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + url
					+ "' " + " ></canvas>";
		},
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);

			this.ctx = this.domNode.getContext('2d');
			this.CW = this.$domNode.innerWidth();
			this.CH = this.$domNode.innerHeight();
			// 处理 times 倍
			this.R *= this.times;
			this.CW *= this.times;
			this.CH *= this.times;
			this.OffsetX *= this.times;
			this.OffsetY *= this.times;
			this.domNode.width = this.CW;
			this.domNode.height = this.CH;
			// 两个圆之间的外距离
			var X = (this.CW - 2 * this.OffsetX - this.R * 2 * 3) / 2;
			var Y = (this.CH - 2 * this.OffsetY - this.R * 2 * 3) / 2;
			this.pointLocations = this.getPointLocations(X, Y);

			// 初始绘制
			this.draw();
			// 绑定事件
			this._bindEvent();
			
			this.__locker_inited = true;
		},
		getPointLocations : function(diffX, diffY) {
			var Re = [];
			for (var row = 0; row < 3; row++) {
				for (var col = 0; col < 3; col++) {
					var Point = {
						X : (this.OffsetX + col * diffX + (col * 2 + 1) * this.R),
						Y : (this.OffsetY + row * diffY + (row * 2 + 1) * this.R)
					};
					Re.push(Point);
				}
			}
			return Re;
		},
		draw : function(points, touchPoint) {
			points = points || [];
			var ctx = this.ctx;
			var pointLocations = this.pointLocations;
			var R = this.R,i;
			if (points.length > 0) {
				ctx.beginPath();
				for (i = 0; i < points.length; i++) {
					var index = points[i];
					ctx.lineTo(pointLocations[index].X, pointLocations[index].Y);
				}
				ctx.lineWidth = 2 * this.times;
				ctx.strokeStyle = this.lineColor; // 连结线颜色
				ctx.stroke();
				ctx.closePath();
				if (touchPoint) {
					var lastIndex = points[points.length - 1];
					var lastPoint = pointLocations[lastIndex];
					ctx.beginPath();
					ctx.moveTo(lastPoint.X, lastPoint.Y);
					ctx.lineTo(touchPoint.X, touchPoint.Y);
					ctx.stroke();
					ctx.closePath();
				}
			}
			for (i = 0; i < pointLocations.length; i++) {
				var point = pointLocations[i];
				ctx.fillStyle = this.ringColor;
				ctx.beginPath();
				ctx.arc(point.X, point.Y, R, 0, Math.PI * this.times, true);
				ctx.closePath();
				ctx.fill();
				ctx.fillStyle = this.fillColor;
				ctx.beginPath();
				ctx.arc(point.X, point.Y, R - (2 * this.times), 0, Math.PI * this.times, true);
				ctx.closePath();
				ctx.fill();
				if (points.indexOf(i) >= 0) {
					ctx.fillStyle = this.pointColor;
					ctx.beginPath();
					ctx.arc(point.X, point.Y, R - (16 * this.times), 0, Math.PI * this.times, true);
					ctx.closePath();
					ctx.fill();
				}
			}
		},
		isPointSelect : function(touches, points) {
			for (var i = 0; i < this.pointLocations.length; i++) {
				var currentPoint = this.pointLocations[i];
				var xdiff = Math.abs(currentPoint.X - touches.elementX);
				var ydiff = Math.abs(currentPoint.Y - touches.elementY);
				var dir = Math.pow((xdiff * xdiff + ydiff * ydiff), 0.5);
				if (dir < this.R) {
					if (points.indexOf(i) < 0) {
						points.push(i);
					}
					break;
				}
			}
		},
		_bindEvent : function() {
			var ctx = this.ctx;
			var self = this;
			var points = [];
			var isStart = false; // 针对鼠标事件
			// start
			this._startHandler = function(e) {
				e.stopPropagation();
				var offset = self.$domNode.offset();
				e.point = event.changedTouches ? event.changedTouches[0] : event;
				e.point.elementX = (e.point.pageX - offset.left) * self.times;
				e.point.elementY = (e.point.pageY - offset.top) * self.times;
				self.isPointSelect(e.point, points);
				isStart = true;
			};
			this.$domNode.on(startEventName, self._startHandler);
			// move
			this._moveHanlder = function(e) {
				if (!isStart)
					return;
				e.stopPropagation();
				e.preventDefault();
				var offset = self.$domNode.offset();
				e.point = event.changedTouches ? event.changedTouches[0] : event;
				e.point.elementX = (e.point.pageX - offset.left) * self.times;
				e.point.elementY = (e.point.pageY - offset.top) * self.times;
				var touches = e.point;
				self.isPointSelect(touches, points);
				ctx.clearRect(0, 0, self.CW, self.CH);
				self.draw(points, {
					X : touches.elementX,
					Y : touches.elementY
				});
			};
			this.$domNode.on(moveEventName, self._moveHanlder);
			// end
			this._endHandler = function(e) {
				e.stopPropagation();
				var offset = self.$domNode.offset();
				e.point = event.changedTouches ? event.changedTouches[0] : event;
				e.point.elementX = (e.point.pageX - offset.left) * self.times;
				e.point.elementY = (e.point.pageY - offset.top) * self.times;
				ctx.clearRect(0, 0, self.CW, self.CH);
				
				var eventData,ok;
				if(self.mode === modes.normal){
					//普通模式
					self.draw(points);
					eventData = {
							source : self,
							values : points,
							clear: true
					};					
					self.fireEvent('onInput', eventData);
					if(eventData.clear) self.clear();
				}else if(self.mode === modes.check){
					//校验密码模式
					ok = self._compPassword(points, self.password);
					self._draw(points,ok);
					if(ok){
						eventData = {
								source : self,
								values : points,
								preventDefault: false,
								clear: false
						};					
						self.fireEvent('onCheckSuccess', eventData);
						if(!eventData.preventDefault)
							justep.Util.hint(justep.Message.getMessage(justep.Message.JUSTEP231108));//"密码匹配成功"
					}else{
						eventData = {
								source : self,
								values : points,
								preventDefault: false,
								clear: false
						};					
						self.fireEvent('onCheckError', eventData);
						if(!eventData.preventDefault)
							justep.Util.hint(justep.Message.getMessage(justep.Message.JUSTEP231109));//"密码错误"
					}
					if(eventData.clear) self.clear();
				}else if(self.mode === modes.setPassword){
					//设置密码模式
					if(self._newPassword && self._newPassword.length>0){
						ok = self._compPassword(self._newPassword, points);
						self._draw(points, ok);
						if(ok){
							eventData = {
									source : self,
									values : points,
									preventDefault: false,
									clear: false
							};					
							self.fireEvent('onPasswordSuccess', eventData);
							if(eventData.clear) self.clear();
							if(!eventData.preventDefault)
								justep.Util.hint(justep.Message.getMessage(justep.Message.JUSTEP231110));//"设置密码成功"
						}else{
							eventData = {
									source : self,
									values : points,
									preventDefault: false,
									clear: false
							};					
							self.fireEvent('onPasswordError', eventData);
							if(eventData.clear) self.clear();
							if(!eventData.preventDefault)
								justep.Util.hint(justep.Message.getMessage(justep.Message.JUSTEP231106));//"输入密码不一致，请重新设置"
						}
						delete self._newPassword;
					}else{
						eventData = {
							source : self,
							values : points,
							preventDefault: false,
							clear: true
						};					
						self.fireEvent('onPasswordFirstSuccess', eventData);
						if(eventData.clear) self.clear();
						if(!eventData.preventDefault){
							self._newPassword = points;
							justep.Util.hint(justep.Message.getMessage(justep.Message.JUSTEP231107));//"请再次输入密码"
						}
					}
				}
				points = [];
				isStart = false;
			};
			this.$domNode.on(endEventName, self._endHandler);
		},
		_draw : function(points,ok){
			var lineColor = this.lineColor,	pointColor = this.pointColor;
			try{
				if(ok){
					this.lineColor = this.SuccessLineColor;
					this.pointColor = this.SuccessPointColor;
				}else{
					this.lineColor = this.ErrorLineColor;
					this.pointColor = this.ErrorPointColor;
				}
				this.draw(points);
			}finally{
				this.lineColor = lineColor;
				this.pointColor = pointColor;
			}
		},
		_compPassword : function(p1, p2){
			if(!$.isArray(p1)&&!$.isArray(p2)) return false;
			var ok = p1.length===p2.length;
			if(ok){//比较数据项
				for(var i=0;i<p1.length;i++){
					if(p1[i]!=p2[i]){
						ok = false;
						break;
					}
				}
			}
			return ok;
		},
		clear : function() {
			if (this.ctx) {
				this.ctx.clearRect(0, 0, this.CW, this.CH);
				this.draw();
			}
		},
		propertyChangedHandler : function(key, oldVal, value) {
			this.callParent(key, oldVal, value);
			if(this.__locker_inited){
				if ('R' == key) {
					this.R *= this.times;
				}
			}
		}
	});

	Locker.Modes = modes;
	justep.Component.register(url, Locker);
	return Locker;
});