/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var bind = require("bind");
	var Component = require("$UI/system/lib/base/component");
	var XML = require("$UI/system/lib/base/xml");
	var RTData = require("../data");
	var RTBizData = require("../bizData");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	require('css!./css/data').load();

	var createData = function(data, clz) {
		var $domNode = $(data.domNode), xid = $domNode.attr("xid"), model = data.getModel();
		data.xid = xid;
		initDefinition(data);
		RTData.registerData(model, xid, data);
		$domNode.empty().css("height", "22px").css("display", "block").addClass(clz).append(
				"<img align='absmiddle' style='width:16px;height:18px;'/><span>" + (xid?xid:'') + "</span>");
		model.resolvedComponent(xid);
	};

	var initDefinition = function(data){
		var xuiNode = xuiDoc.getNodeByDId(data.$domNode.attr('d_id'));
		if(xuiNode){
			var $data = $(XML.fromString(xuiNode).documentElement);
			if('true'==$data.attr('isTree')){
				var $defTreeOption = $data.children("treeOption");
				data.defTreeOption.isTree = true;
				data.defTreeOption.option = {
						isDelayLoad:'true'==$defTreeOption.attr('delayLoad'),
						parentRelation:$defTreeOption.attr('parentRelation'),
						childrenRelation:$defTreeOption.attr('childrenRelation'),
						rootFilter:$defTreeOption.attr('rootFilter'),
						nodeKindRelation:$defTreeOption.attr('nodeKindRelation'),
						nodeLevelRelation:$defTreeOption.attr('nodeLevelRelation')
				};
			}else data.defTreeOption.isTree = false;
		}
	};

	var set = function set(data, value) {
		if ('xid' in value) {
			var $domNode = $(data.domNode), oldxid = $domNode.attr("xid");
			RTData.unRegisterData(data.getModel(), oldxid);
			RTData.registerData(data.getModel(), value['xid'], data);
			$domNode.children('span').text(value['xid'] ? value['xid'] : '');
		}else if('isTree' in value || 'parentRelation' in value) initDefinition(data);
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

	var filterNO = 0;
	var aggregateNO = 0;
	var calculateNO = 0;

	var BizData = RTBizData.extend({
		constructor : function(config) {
			if (config && config.templateNode) {
				this._bind(config.templateNode);
			}
			this.callParent(config);
		},
		_bind : function(element) {
			bind.utils.domData.set(element, Component.BIND_NAME, this);
			this.domNode = element;
			this.$domNode = $(this.domNode);
			bind.utils.domNodeDisposal.addDisposeCallback(element, this.dispose.bind(this));
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
		init : function(value, bindingContext) {
			createData(this, 'x-biz-data');
		},
		set : function(v) {
			set(this, v);
		},
		editRule : function(config) {
			editRule(this, config);
		},

		editExtendType : function(config){
			editExtendType(this, config);
		},
		
		newFilter : function(config) {
			xuiDoc.createComponent("$UI/system/components/justep/data/bizData#filter", this, {
				defaultProperties : {
					name : "filter" + (filterNO++)
				}
			});
		},

		newCalculate : function() {
			xuiDoc.createComponent("$UI/system/components/justep/data/bizData#calculateRelation", this, {
				defaultProperties : {
					relation : "relation" + (calculateNO++)
				}
			});
		},

		newAggregate : function() {
			xuiDoc.createComponent("$UI/system/components/justep/data/bizData#aggregateRelation", this, {
				defaultProperties : {
					relation : "aggregate" + (aggregateNO++)
				}
			});
		}
	});

	return {
		'$UI/system/components/justep/data/bizData' : BizData
	};
});