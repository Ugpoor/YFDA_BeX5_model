/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var bind = require("bind");
	var Component = require("$UI/system/lib/base/component");
	var RTData = require("../data");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");
	var xuiDoc = xuiService.getXuiDoc();
	require('css!./css/data').load();

	var createData = function(data, clz) {
		var $domNode = $(data.domNode), xid = $domNode.attr("xid"), model = data.getModel();
		RTData.registerData(model, xid, data);
		$domNode.empty().css("height", "22px").css("display", "block").addClass(clz).append(
				"<img align='absmiddle' style='width:16px;height:18px;'/><span>" + (xid?xid:'') + "</span>");
		model.resolvedComponent(xid);
	};

	var set = function set(data, value) {
		if ('xid' in value) {
			var $domNode = $(data.domNode), oldxid = $domNode.attr("xid");
			RTData.unRegisterData(data.getModel(), oldxid);
			RTData.registerData(data.getModel(), value['xid'], data);
			$domNode.children('span').text(value['xid'] ? value['xid'] : '');
		}else if('tableName' in value || 'queryAction' in value){
			var service = xuiDoc.get(data,"url");
			var queryAction = xuiDoc.get(data,"queryAction");
			var services = BAASModel.getServices();
			if(services){
				var action = getAction(services[service], queryAction);
				if(action){
					var table = action.privateParams && action.privateParams['tableName'] ? action.privateParams['tableName'] : "";
					var db = action.privateParams && action.privateParams['db'] ? action.privateParams['db'] : "";
					var fields = BAASModel.getFields(db.value,table.value);
					if(fields){
						/*
						name: "fID"
						pk: "true"
						remarks: "主键"
						required: "true"
						size: 50
						sqlType: 12
						type: "VARCHAR"
						 */
						var cols = [];
						$.each(fields,function(i,field){
							if(field.pk) xuiDoc.set(data,{"idColumn":field.name});
							//<column label="fID" name="fID" type="String"/>
							cols.push(justep.String.format('<column label="{0}" name="{1}" type="{2}"/>',field.remarks||field.name,field.name,field.dataType));
						});
						xuiDoc.replaceChild(data, cols.join(""), {
							paintComponent : false,
							xpathCondition : "*[local-name()='column' and not(@isCalculate='true')]",
							jqCondition : "column[isCalculate!='true']"
						});
					}
				}else alert('queryAction['+queryAction+']不存在');
			}else alert('BAAS模型没有加载');
		}
	};
	
	var getAction = function(service,actionName){
		var actions = service.actions, ret;
		if (actions) {
			$.each(actions, function(i, action) {
				if(actionName==action.name){
					ret = action;
					return false;
				}
			});
		}
		return ret;
	};

	var getCols = function(xml){
		var cols = [];
		$(xml).children("column").each(function(){
			var $col = $(this);
			cols.push({'alias':$col.attr('name'),
				'data-type':$col.attr('type'),
				'label':$col.attr('label')});
		});
		return cols;
	};
	
	var editRule = function(data, config) {
		var cols = xuiDoc.getEditorDataSource("RuleRelationDatasource.getDatasource",null,config.d_id)||getCols(config.nodeXml);// 获取列信息
		xuiService.openPage("$UI/system/components/justep/data/designer/editRule.w", {
			title : "data规则编辑",
			xml : config.nodeXml,
			cols : cols
		}, function(result) {
			xuiDoc.replaceChild(data, result.def, {
				xpathCondition : "*[local-name()='rule']",
				jqCondition : "rule",
				paintComponent : false
			});
		});
	};

	var editExtendType = function(data, config) {
		var model = data.getModel();
		var extendTypes = {}, l = model.getExtendTypes?model.getExtendTypes():[];
		$.each(l, function(n,v){
			extendTypes[n] = {
				"name" : v.name,
				"dataType" : v.dataType,
				"editor" : v.editor
			};
		});
		var cols = xuiDoc.getEditorDataSource("RuleRelationDatasource.getDatasource",null,config.d_id)||getCols(config.nodeXml);// 获取列信息
		xuiService.openPage("$UI/system/components/justep/data/designer/editExtendType.w", {
			title : "data扩展类型设置",
			xml : config.nodeXml,
			extendTypes: extendTypes, 
			cols : cols
		}, function(result) {
			xuiDoc.replaceChild(data, result.def, {
				xpathCondition : "*[local-name()='extendType']",
				jqCondition : "extendType",
				paintComponent : false
			});
		});
	};

	var editColumn = function(data, config) {
		var table, db;
		var service = xuiDoc.get(data,"url");
		if(!service){
			alert('请先设置url属性');
			return;
		}
		var queryAction = xuiDoc.get(data,"queryAction");
		var services = BAASModel.getServices();
		if(services){
			var action = getAction(services[service], queryAction);
			if(action){
				table = action.privateParams && action.privateParams['tableName'] ? action.privateParams['tableName'].value : "";
				db = action.privateParams && action.privateParams['db'] ? action.privateParams['db'].value : "";
			}
		}
		
		xuiService.openPage("$UI/system/components/justep/data/designer/editBaasDataColumn.w", {
			title : "bassData列编辑",
			xml : config.nodeXml,
			db: db,
			table: table,
			type : "baas"
		}, function(result) {
			xuiDoc.replaceChild(data, result.def.join(""), {
				paintComponent : false,
				jqCondition : "column"
				//xpathCondition : "*[local-name()='column']"
			});
			xuiDoc.set(data, {
				idColumn : result.idColumn
			});
		});
	};

	var filterNO = 0;
	
	var Data = RTData.extend({
		constructor : function(config) {
			if (config && config.templateNode) {
				this._bind(config.templateNode);
			}
			this.callParent(config);
		},
		init : function(value, bindingContext) {
			createData(this, 'x-baas-data');
		},
		isTree: function(){
			return 'true'==this.$domNode.attr('isTree');
		},
		getTreeOption: function(){
			return {
				parentRelation:	xuiDoc.get(this,"parentRelation"),
				nodeKindRelation: xuiDoc.get(this,"nodeKindRelation"),
				delayLoad: 'true'==xuiDoc.get(this,"delayLoad"),
				rootFilter: xuiDoc.get(this,"rootFilter")
			};
		},
		_bind : function(element) {
			bind.utils.domData.set(element, Component.BIND_NAME, this);
			this.domNode = element;
			this.$domNode = $(this.domNode);
			bind.utils.domNodeDisposal.addDisposeCallback(element, this.dispose.bind(this));
		},
		set : function(v) {
			set(this, v);
		},
		editRule : function(config) {
			editRule(this, config);
		},
		editColumn : function(config) {   
			editColumn(this, config);
		},
		newFilter : function(config) {
			xuiDoc.createComponent("$UI/system/components/justep/data/baasData#filter", this, {
				defaultProperties : {
					name : "filter" + (filterNO++)
				}
			});
		},
		setCalculate : function(config) {
			editColumn(this, config);
		},
		editExtendType : function(config){
			editExtendType(this, config);
		}
	});

	return {
		'$UI/system/components/justep/data/baasData' : Data
	};
});