/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require('$UI/system/resources/system.res');
	require('css!../css/numberList').load();

	var $ = require("jquery"), justep = require("$UI/system/lib/justep");
	
	var NumberList = justep.Object.extend({
		constructor : function(parent, className, input, min, max, showCharSize, showItemSize, callback) {
			//var list = this;
			this.element = $(parent||"body").append("<div/>").children().last().addClass((className||"")+" list-group x-numberlist").get(0);
			this.move = 0;
			this.input = input;
			
			this.setParam(min, max, showCharSize, showItemSize, callback);
		},

		dispose: function(){
			$(this.element).remove();
		},
		
		setParam : function(min, max, showCharSize, showItemSize, callback) {
			$(this.element).empty();
			var list = this;
			this.min = min;
			this.max = max;
			showItemSize = showItemSize || 7;
			this.showItem = showItemSize;
			this.showCharSize = showCharSize||1;
			this.canShowAll = this.max - this.min + 1 <= showItemSize;
			if (!this.canShowAll) {
				this.createChild("-", "list-group-item list-group-item-info sub", function() {
					list.isFocus = true;
					list.start(-1,true);
					return false;
				}, function() {
					list.isFocus = false;
					list.stop();
					$(list.input).focus();
					return false;
				});
			}
			if (this.canShowAll)
				this.showItem = this.max - this.min + 1;
			var handler1 = function(evt) {
				list.isFocus = true;
				return false;
			};
			var handler2 = function(evt) {
				var value = $(evt.target).text();
				var $input = $(list.input).val(value);
				if (!list.input.readOnly)
					$input.focus();
				list.isFocus = false;
				list.hide();
				$(list.input).change();
				if (callback)
					callback(value);
				return false;
			};
			for ( var i = 0; i < this.showItem; i++) {
				this.createChild(" ", "list-group-item", handler1, handler2);
			}
			if (!this.canShowAll) {
				this.createChild("+", "list-group-item list-group-item-info add", function() {
					list.isFocus = true;
					list.start(1,true);
					return false;
				}, function() {
					list.isFocus = false;
					list.stop();
					$(list.input).focus();
					return false;
				});
			}
			this.hide();
		},

		doHideEvent : function(event) {
			var target = event.target || event.srcElement;
			if (this && target.parentElement != this.element)
				this.hide();
		},

		show : function() {
			var input = this.input;
			this.current = parseInt(input.value || this.min);
			this.refresh();
			var p = $(input);
			var e = $(this.element);
			e.css({
				top : -3000,
				left : -3000
			}).show();
			var pos = p.offset();
			var lup_top = pos.top - e.outerHeight(true);
			var lup = $(document).height() < pos.top + p.outerHeight(true) + e.outerHeight(true) && lup_top > 0;
			e.css({
				top : (lup ? (pos.top - e.outerHeight(true)) : (pos.top + p.outerHeight(true))),
				left : pos.left
			});
			this.bodyMDownFunc = this.doHideEvent.bind(this);
			$("body").on("mousedown touchstart", this.bodyMDownFunc);
		},

		hide : function() {
			$("body").off("mousedown touchstart", this.bodyMDownFunc);
			$(this.element).hide();
		},

		createChild : function(content, clz, handler, handler2) {
			var child = $(this.element).append("<a href='#' class='" + clz + "'/>").children().last().get(0);
			$(child).text(content);

			if (handler2) {
				$(child).bind("mousedown touchstart", handler);
				$(child).bind("mouseup touchend", handler2);
			} else {
				$(child).bind("click", handler);
			}
		},

		refresh : function() {
			var childs = $(this.element).children();
			var top, i, str;

			if (this.canShowAll) {
				top = this.min;
				var func1 = function(c,j) {
					this.element.scrollTop = c.outerHeight() * (j - 3);
				};				
				for (i = 0; i <= this.max - this.min; i++) {
					str = justep.String.zeros((top++) + "", this.showCharSize);
					$(childs.get(i)).text(str);
					if (top == this.current && i > 3) {
						var c = $(childs.get(i));
						var j = i;
						window.setTimeout(func1.bind(this,c,j), 10);
					}
				}
			} else {
				var half = parseInt(this.showItem / 2);
				var cur = this.current;
				if (cur >= this.max - half) {
					cur = this.max - half;
				} else if (cur <= this.min + half) {
					cur = this.min + half;
				}

				top = cur - half - 1;

				for (i = 1; i < this.showItem + 1; i++) {
					str = justep.String.zeros((top + i) + "", this.showCharSize);
					$(childs.get(i)).text(str);
				}
			}
		},

		start : function(value) {
			this.move = value;
			this.run();
		},

		stop : function() {
			this.move = 0;
		},

		run : function() {
			if ((this.move > 0 && this.current + 3 < this.max) || (this.move < 0 && this.current - 3 > this.min)) {
				this.current += this.move;
				this.refresh();
				setTimeout(this.run.bind(this), 60);
			}
		}
	});

	return NumberList;
});