/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	//var justep = require('$UI/system/lib/justep');
	//var XML = require("$UI/system/lib/base/xml");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	


	var Model = function() {
		this.callParent();
	};

	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function() {
		return {
			def : this.xmlModel.asXml()//this.def2xml()
		};
	};

	Model.prototype.init = function() {
		var self = this;
		var initData = xuiService.getPageParams();// 获取传入的参数
		var cols = initData.cols;
		this.extendTypes = initData.extendTypes;
		self.cols2data(cols);
		
		var binding = {
		"extendType":"@type",
		"param":"param"};//data列与节点之间的映射
		
		var config = {xmlData:initData.xml, //xml字符串
				rootPath:"extendType", //根节点路径
				rowIdPath:"@name", //行id路径 
				rowNodePath:"col", //行节点路径
				data:this.comp("data"), //data对象
				binding:binding};
		this.xmlModel = xuiService.createXmlModel(config);//创建xml模型 
	};

	Model.prototype.cols2data = function(cols, ruleDef) {
		if ($.isArray(cols)) {
			var defaultValues = [];
			for ( var i = 0; i < cols.length; i++) {
				var o = {
					name : cols[i]['alias'],
					type : cols[i]['data-type'],
					displayName : cols[i]['label']
				};
				defaultValues.push(o);
			}

			var data = this.comp('data');
			data.newData({
				defaultValues : defaultValues
			});
			data.first();
		}
	};

	Model.prototype.modelLoad = function(event) {
		this.init();
	};
	
	Model.prototype.dataTables1CellRender = function(event){
		if(event.colName==='extendType'){
			event.html = this.createExtendTypeHtml(event.colVal,event.row.val('type')||'String');
		}
	};

	Model.prototype.selectChange = function(event){
		var target = event.target||event.srcElement;
		var row = this.comp('dataTables1').getDataRow(target);
		if(row)row.val('extendType',$(target).val());
	};

	Model.prototype.createExtendTypeHtml = function(value,dataType){
		var onjs = "justep.callModelFn({domNode:event.target||event.srcElement,fn:\'selectChange\'},event)";
		var ret = '<select class="form-control extend-type-select" onchange="'+onjs+'">';
		ret += '<option value="">无</option>';
		$.each(this.extendTypes,function(i,v){
			if(!v.dataType || $.inArray(dataType,(v.dataType||"").split(","))>-1){
				var selected = v.name===value;
				ret += '<option value="'+v.name+'" '+(selected?('selected="true"'):'')+'>'+v.name+'</option>';
			}
		});
		ret += '</select>';
		
		return ret;
	};
	
	return Model;
});