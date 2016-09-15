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

	var Model = function() {
		this.grouping = justep.Bind.observable(false);
		this.useGroupBar = justep.Bind.observable(false);
		this.groupCollapse = justep.Bind.observable(false);
		this.groupFields = justep.Bind.observableArray();
		this.currentField = justep.Bind.observable();
		this.nullText = justep.Bind.observable();
		
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
		var groupFields = this.groupFields.get();
		var retGroupFields = [];
		for(var i = 0; i<groupFields.length; i++){
			var row = groupFields[i];
			retGroupFields.push({
				field: row.val('field'),  
				text: row.val('text'),  
				order: row.val('order'),  
				summary: row.val('summary'),  
				summaryType: row.val('summaryType'),  
				summaryTpl: row.val('summaryTpl'),
				groupColumnShow: row.val('groupColumnShow')
			});
		}
		return {nullText:this.nullText.get(),grouping:this.grouping.get(),useGroupbar:this.useGroupBar.get(),groupCollapse:this.groupCollapse.get(),groupFields:retGroupFields}; 
	};
	
	var getGroupField = function(field, $groupingView){
		if($groupingView.length>0){
			var $fields = $groupingView.children('groupField');
			var $orders = $groupingView.children('groupOrder');
			var $texts = $groupingView.children('groupText');
			var $summarys = $groupingView.children('groupSummary');
			var $groupColumnShows = $groupingView.children('groupColumnShow');
			var ret = null,i = 0;
			$fields.children('item').each(function(){
				var $field = $(this);
				if(field==$field.text()){
					ret = {
							text: $texts.children('item:eq('+i+')').text(),
							order: $orders.children('item:eq('+i+')').text()||"asc",
							summary: $summarys.children('item:eq('+i+')').text()=='true',
							groupColumnShow: $groupColumnShows.children('item:eq('+i+')').text()=='true',
							field: field
					};
					return false;
				}
				i++;
			});
			return ret;
		}
	};
	
	Model.prototype.initGroupFields = function($groupingView){
		if($groupingView.length>0){
			var $fields = $groupingView.children('groupField');
			var data = this.comp('data');
			var defs = [];
			$fields.children('item').each(function(){
				var def = data.getRowByID($(this).text());
				if(def) defs.push(def);
			});
			this.groupFields.push.apply(this.groupFields, defs);
		}
	};
	
	Model.prototype.selectField = function(evt){
		var ele = evt.target || evt.srcElement;
		var bindContext = justep.Bind.contextFor(ele), $object = bindContext.$object;
		this.currentField.set($object);
	};
	
	Model.prototype.xml2data = function(xmlStr){
		if(xmlStr){
			var $grid = $(XML.fromString(xmlStr).documentElement);
			var data = this.comp('data');
			this.grouping.set('true'==$grid.attr('grouping'));
			this.useGroupBar.set('true'==$grid.attr('useGroupbar'));
			this.groupCollapse.set('true'==$grid.children('groupingView').attr('groupCollapse'));
			this.nullText.set($grid.children('groupingView').attr('nullText'));
			var defaultValues = [];
			$grid.find('column').each(function(){
				var $col = $(this);
				var o = {
						field : $col.attr('name'),
						name : $col.attr('label')||$col.attr('name'), 
						isGrouping : false,
						text: '',
						order: 'asc',
						groupColumnShow: false,
						summary: false,
						summaryType: $col.attr('summaryType'),
						summaryTpl: $col.attr('summaryTpl')
				};
				var groupDef = getGroupField(o.field, $grid.children('groupingView'));
				if(groupDef){
					o.isGrouping = true;
					o.text = groupDef.text;
					o.order = groupDef.order;
					o.summary = groupDef.summary;
					o.groupColumnShow = groupDef.groupColumnShow;
				}
				defaultValues.push(o);
			});
			data.newData({
				defaultValues : defaultValues
			});
			this.initGroupFields($grid.children('groupingView'));
			if(this.groupFields.get().length>0){
				var o = this.groupFields.get()[0];
				this.currentField.set(o);
			}
		}
	};
	
	Model.prototype.modelLoad = function(event) {
		var self = this;
		//window.setTimeout(function(){
			//创建grid的下拉选择
			var initData = xuiService.getPageParams();// 获取传入的参数
			self.xml2data(initData.xml);// 初始化属性值
		//}, 1000);
	};


	Model.prototype.dataValueChanged = function(event){
		//这里进行分组字段控制
		if(event.col=='isGrouping'){
			event.value?this.groupFields.push(event.row):this.groupFields.remove(event.row);
			if(!event.value&&event.row===this.currentField.get())this.currentField.set();
			if(!this.currentField.get()&&this.groupFields.get().length>0){
				var o = this.groupFields.get()[0];
				this.currentField.set(o);
			}
		}
	};


	return Model;
});