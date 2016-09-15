/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var bind = require("bind");
	var Component = require("$UI/system/lib/base/component");
	var RTData = require("../data");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
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
		}
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
		xuiService.openPage("$UI/system/components/justep/data/designer/editColumn.w", {
			title : "data列编辑",
			xml : config.nodeXml
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

	var editData = function(data, config) {
		xuiService.openPage("$UI/system/components/justep/data/designer/editData.w", {
			title : "data数据编辑",
			width: 784,
			height: 600,
			xml : config.nodeXml
		}, function(result) {
			xuiDoc.replaceChild(data, '<data '+(result.xid?('xid="'+result.xid+'"'):'')+'><![CDATA[' + JSON.stringify(result.data) + ']]></data>', {
				paintComponent : false,
				xpathCondition : "*[local-name()='data']",
				jqCondition : "data"
			});
		});
	};

	var Data = RTData.extend({
		constructor : function(config) {
			if (config && config.templateNode) {
				this._bind(config.templateNode);
			}
			this.callParent(config);
		},
		init : function(value, bindingContext) {
			createData(this, 'x-data');
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
		set : function(v) {
			set(this, v);
		},
		editRule : function(config) {
			editRule(this, config);
		},
		editColumn : function(config) {
			editColumn(this, config);
		},
		setCalculate : function(config) {
			editColumn(this, config);
		},
		editData : function(config) {
			editData(this, config);
		},
		editExtendType : function(config){
			editExtendType(this, config);
		}
	});

	return {
		'$UI/system/components/justep/data/data' : Data
	};
});