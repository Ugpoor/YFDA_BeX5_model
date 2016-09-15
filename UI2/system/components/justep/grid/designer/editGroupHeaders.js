/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var XML = require("$UI/system/lib/base/xml");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");

	var GroupHeader = justep.Object.extend({
		constructor : function(cols) {
			this.cols = cols;
			this.items = justep.Bind.observableArray();
			this.displayItems = justep.Bind.computed(function() {
				var ret = this.cloneCols();
				var items = this.items.get();
				for(var i=0; i<items.length; i++){
					var idx = this.getColspan(items[i].get('startColumn'),ret);
					if(idx>-1){
						var o = ret[idx];
						var colCount = items[i].get('columnCount');
						o.colspan.set(colCount);
						o.name.set(items[i].get('titleText'));
						ret.splice(idx+1,colCount-1);
					}
				}
				return ret;
			}, this);
		},
		add : function(){
			var o = new GroupHeaderItem(this);
			this.items.push(o);
			return o;
		},
		remove: function(o){
			this.items.remove(o);
		},
		cloneCols: function(){
			var ret = [];
			for(var j=0;j<this.cols.length;j++){
				var it = $.extend(true,{colspan:0},this.cols[j]);
				it.colspan = justep.Bind.observable(it.colspan);
				it.name = justep.Bind.observable(it.name);
				ret.push(it);
			}
			return ret;
		},
		get: function(i){
			return this.items.get()[i];
		},
		getColspan: function(name,cols){
			for(var i=0; i<cols.length; i++){
				if(cols[i].field==name) return i; 
			}
			return -1;
		},
		toXML: function(){
			var ret = [];
			ret.push("<groupHeader>");
			var items = this.items.get();
			for(var i=0;i<items.length;i++){
				ret.push(items[i].toXML());
			}
			ret.push("</groupHeader>");
			return ret.join('');
		}
	});
	
	var GroupHeaderItem = justep.Object.extend({
		constructor : function(owner) {
			this.owner = owner;
			this.startColumn = justep.Bind.observable();
			this.columnCount = justep.Bind.observable();
			this.titleText = justep.Bind.observable();
		},
		remove: function(){
			this.owner.remove(this);
		},
		set: function(name,value){
			this[name].set(value);
		},
		get: function(name){
			return this[name].get();
		},
		toXML: function(){
			return '<item startColumn="'+this.get('startColumn')+'" columnCount="'+this.get('columnCount')+'" titleText="'+this.get('titleText')+'"/>';
		}
	});
	
	var Model = function() {
		this.groupHeaders = justep.Bind.observableArray();
		this.columns = justep.Bind.observableArray();
		// this.currentHeader = justep.Bind.observable();
		
		this.callParent();
	};
	
	Model.prototype.ref = function(name){
		var row = this.currentField.get();
		if(row){
			return row.ref(name);
		}
	};
	
	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function(){
		var ret = [];
		ret.push("<groupHeaders>");
		var ghs = this.groupHeaders.get();
		for(var i=0;i<ghs.length;i++){
			var gh = ghs[i];
			ret.push(gh.toXML());
		}
		ret.push("</groupHeaders>");
		return {groupHeaders:ret.join('')}; 
	};
	
/*
 * <groupHeaders> <groupHeader> <item startColumn="fString" columnCount="2"
 * titleText="AAA"/> <item startColumn="fDecimal" columnCount="4"
 * titleText="BBB"/> </groupHeader> <groupHeader> <item startColumn="fDecimal"
 * columnCount="2" titleText="CCC"/> <item startColumn="fDateTime"
 * columnCount="2" titleText="DDD"/> </groupHeader> </groupHeaders>
 */	
	Model.prototype.xml2data = function(xmlStr){
		if(xmlStr){
			var $grid = $(XML.fromString(xmlStr).documentElement);
			var self = this;
			$grid.find('column').each(function(){
				var $col = $(this);
				var o = {
						field : $col.attr('name'),
						name : $col.attr('label')||$col.attr('name') 
				};
				self.columns.push(o);
			});
			$grid.find('groupHeader').each(function(){
				var $gh = $(this);
				var gh = new GroupHeader(self.columns.get());
				$gh.children('item').each(function(i){
					var $ghi = $(this);
					var ghi = gh.add();
					ghi.set("startColumn",$ghi.attr('startColumn'));
					ghi.set("columnCount",$ghi.attr('columnCount'));
					ghi.set("titleText",$ghi.attr('titleText'));
				}); 
				self.groupHeaders.push(gh);
			});
		}
	};
	
	Model.prototype.modelLoad = function(event) {
		var self = this;
		// window.setTimeout(function(){
			// 创建grid的下拉选择
			var initData = xuiService.getPageParams();// 获取传入的参数
			self.xml2data(initData.xml);// 初始化属性值
		// }, 1000);
	};


	Model.prototype.button2Click = function(event){
		var context = justep.Bind.contextFor(event.target);
		this.groupHeaders.remove(context.$object);
	};


	Model.prototype.i1Click = function(event){
		var gh = new GroupHeader(this.columns.get());
		this.groupHeaders.push(gh);
	};


	Model.prototype.button3Click = function(event){
		var context = justep.Bind.contextFor(event.target);
		context.$object.add();
	};


	Model.prototype.button4Click = function(event){
		var context = justep.Bind.contextFor(event.target);
		context.$object.remove();
	};


	return Model;
});