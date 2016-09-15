/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	//var $ = require("jquery");
	//var XML = require("$UI/system/lib/base/xml");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");

	var Model = function() {
		this.callParent();
		this.type = "";
	};
	
	Model.prototype.beforeOkAction = function(){
		var data = this.comp('data'), idColumn='';
		data.each(function(param){
			var name = data.getValue('name', param.row);
			if(data.getValue('isIDColumn', param.row)) idColumn = name;
		});
		if(!idColumn) return '必须设置ID列!';
	};
	
	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function(){ 
		var def = [];//, 
		var data = this.comp('data');
		var rows = data.find(["isIDColumn"], [true],true);
//		data.each(function(param){
//			var name = data.getValue('name', param.row),
//				type = data.getValue('type', param.row),
//				label = data.getValue('displayName', param.row),
//				xid = data.getValue('xid', param.row);
//				def.push('<column '+(xid?('xid="'+xid+'"'):'')+' name="'+name+'" type="'+type+'"'+((label===undefined || label===null)?'':(' label="'+label+'"'))+'/>');
//				if(data.getValue('isIDColumn', param.row)) idColumn = name;
//		});
//			    debugger;
		var idColumn = rows.length>0?rows[0].val("name"):"";//this.xmlModel.getValue("@idColumn");
	    def = this.xmlModel.childAsArray();	    
		return {def:def,idColumn:idColumn}; 
	};
	
//	Model.prototype.xml2data = function(xmlStr){
//		if(xmlStr){
//			var $data = $(XML.fromString(xmlStr).documentElement), data = this.comp('data'), idColumn=$data.attr('idColumn');
//			$data.children('column').each(function(){
//				var $col = $(this);
//				data.add({
//						xid : $col.attr('xid'),
//						name : $col.attr('name'),
//						type : $col.attr('type'),
//						displayName : $col.attr('label'),
//						isIDColumn: $col.attr('name')!==idColumn?false:true
//					});
//			});
//			data.first();
//		}
//	};
	
	Model.prototype.modelLoad = function(event) {
		//var self = this;
		//window.setTimeout(function(){
			//创建grid的下拉选择
			
		var initData = xuiService.getPageParams();// 获取传入的参数
		if(!initData){
			return;
		}
		this.initColum(initData);
		
			//// 初始化属性值
		//}, 1000);
	};
	Model.prototype.initColum = function(initData){
	//self.xml2data(initData.xml);
		var dataComp = this.comp("data");
		
		//data列与xml节点属性值的映射
		 var binding = {
		"name":"@name",
		"type":"@type",
		"displayName":"@label",
		"isCalculate":"@isCalculate"};
		this.type = initData.type; 
		var config = {xmlData:initData.xml,
		rowIdPath:"@xid",  //行id映射
		rowNodePath:"column", //行节点映射
		idField:"xid", //data
		data:dataComp,//data组件
		binding:binding};
		this.xmlModel = xuiService.createXmlModel(config);
		
		
		var idColumn = this.xmlModel.getValue("@idColumn");  
		if(idColumn){
			var rows = dataComp.find(["name"],[idColumn],true);
			if(rows.length>0){
			 dataComp.setValue("isIDColumn",true,rows[0]);
			}
		}
	};

	Model.prototype.removeRow = function(up){
		var data = this.comp('data'), row1 = data.getCurrentRow(true);
		var index = data.getRowIndex(row1);
		index += (up?-1:1);
		if(index<0 || index>=data.getCount()) return;
		var datas = data.datas.peek();
		var row2 = datas[index];
		data.exchangeRow(row1,row2);
	};

	
	Model.prototype.upClick = function(event){
		this.removeRow(true);
	};

	
	Model.prototype.downClick = function(event){
		this.removeRow(false);
	};

	
	Model.prototype.dataBeforeDelete = function(event){
		if(this.type=="baas"){
			if(!event.deleteRows[0].val('isCalculate')){
				event.cancel = true;
				alert('BaasData只能删除计算列');
				return;
			}
		}
	};

	
	Model.prototype.dataBeforeNew = function(event){
		if(!event.option || !event.option.defaultValues || event.option.defaultValues.length<=0){
			var data = event.source, col = 'col' + data.getCount();
			event.option.defaultValues = [{
				name : col,
				type : 'String'
			}]; 
			if(this.type=='baas') event.option.defaultValues[0].isCalculate = true;
		}
	};

	
	Model.prototype.modelParamsReceive = function(event){
		var params = event.params;  
		if(params){
			this.initColum(params);		
		}
	};

	return Model;
});