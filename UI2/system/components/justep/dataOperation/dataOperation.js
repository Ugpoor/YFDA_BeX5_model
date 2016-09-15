/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var Data = require('$UI/system/components/justep/data/data');
	var url = require.normalizeName("./dataOperation");
	var ComponentConfig = require("./dataOperation.config");

	require('$UI/system/resources/system.res');

	var DataOperation = justep.ModelComponent.extend({
		constructor : function(model,xid) {
			this.callParent();
			this._init(model,xid);
		},
		_init : function(model,xid){
			this.setModel(model);
			model.registerComponent(xid, this);
			model.resolvedComponent(xid);
		},
		getConfig : function() {
			return ComponentConfig;
		},
		setValue: function(dataXid,col,value,row){
			var model = this.getModel();
			var data = typeof(dataXid)==='string'?model.comp(dataXid):dataXid;
			if(data instanceof Data){
				data.setValue(col,value,row);
			}else{
				var msg = new justep.Message(justep.Message.JUSTEP231002, dataXid);//data[{0}]不存在！
				throw justep.Error.create(msg);
			}
		},
		allSetValue: function(dataXid,col,value){
			var model = this.getModel();
			var data = typeof(dataXid)==='string'?model.comp(dataXid):dataXid;
			if(data instanceof Data){
				data.each(function(param){
					param.row.val(col,value);
				});
			}else{
				var msg = new justep.Message(justep.Message.JUSTEP231002, dataXid);//data[{0}]不存在！
				throw justep.Error.create(msg);
			}
		},
		refreshByGET: function(url,sync,event){
			var compData = event.source;
			if(compData instanceof Data){
				var deferred = $.Deferred();
				event.promise = deferred.promise();
				$.ajax({
					type: "GET",
					url: url,
					dataType: 'json',
					async: !sync,//使用同步方式，目前data组件有同步依赖
					success: function(data){
						compData.loadData(data);//将返回的数据加载到data组件
						deferred.resolve();
					},
					error: function(){
						deferred.reject();
						var msg = new justep.Message(justep.Message.JUSTEP231142, url);//"url["+url+"]加载数据失败"
						throw justep.Error.create(msg);
					}
				});
			}
		}
	});

	// 操作
	justep.Component.addOperations(DataOperation, {
		'setValue' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231134),//'data赋值'
			argsDef : [ {
				name : 'data',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231137),//'data组件'
				required : true
			},{
				name : 'col',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231139),//'列'
				required : true
			},{
				name : 'value',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231140),//'值'
				required : true
			},{
				name : 'row',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231138),//'行,缺省当前行'
			} ],
			method : function(args) {				
				return this.owner.setValue(args.data,args.col,args.value,args.row);
			}
		},
		'allSetValue' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231135),//'data所有行赋值'
			argsDef : [ {
				name : 'data',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231137),//'data组件'
				required : true
			},{
				name : 'col',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231139),//'列'
				required : true
			},{
				name : 'value',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231140),//'值'
				required : true
			} ],
			method : function(args) {
				return this.owner.allSetValue(args.data,args.col,args.value);
			}
		},
		'refreshByGET' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231136),//'get请求'
			argsDef : [ {
				name : 'url',
				displayName : 'url',
				required : true
			},{
				name : 'sync',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231141),//'同步请求，默认异步'
			}],
			method : function(args,ctx) {
				return this.owner.refreshByGET(args.url,args.sync,ctx.$event);
			}
		}
	});

	justep.Component.register(url, DataOperation);
	return DataOperation;
});