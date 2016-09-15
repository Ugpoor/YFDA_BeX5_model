/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require('css!./css/excel').load();

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Uploader = require('../uploader/uploader');
	var WindowDialog = require('$UI/system/components/justep/windowDialog/windowDialog');
	var BizData = require('$UI/system/components/justep/data/bizData');
	var XML = require("$UI/system/lib/base/xml");

	require('$UI/system/resources/system.res');

	var url = require.normalizeName("./importExcel");
	var ComponentConfig = require("./importExcel.config");

	var importConfigURL = require.toUrl("./dialog/importConfig.w");
	var uploadURL = require.toUrl("./server/upload.j");
	var uploadImportExcelAction = "uploadImportExcel";

	var ToKind = {
			UI : 'UI',
			DB : 'DB'
		};

	var ImportExcel = justep.BindComponent.extend({
		// 构造函数
		constructor : function(options) {
			this.data = null;
			this.to = ToKind.DB;
			this.useDefault = true;
			this.mappings = null;
			this.action = "importExcel";
			this._cfg = {
					allSheet:true,
					sheetStart:1,
					sheetEnd:1,
					allRow:true,
					rowStart:1,
					rowEnd:1,
					mapping:''
				};
			this.callParent(options);
		},
		getConfig : function() {
			return ComponentConfig;
		},
		dispose : function() {
			this.callParent();
		},
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			var ele = $('<div class="x-import-excel" component="' + url + '">');
			if (config.xid)
				ele.attr('xid', config.xid);
			return ele;
		},
		doInit : function(value, bindingContext) {
			this.callParent(value, bindingContext);
		},
		render : function() {
			this.callParent();
		},
		getProcess: function(){
			var action = this.action;
			if(action==='importExcel')
				return "/SA/excel/system/systemProcess";
			else 
				return this.getModel().getContext().getProcess();
		},
		getActivity: function(){
			var action = this.action;
			if(action==='importExcel')
				return "mainActivity";
			else
				return this.getModel().getContext().getActivity();
		},
		getAction: function(){
			var action = this.action;
			var l = action.split("/");
			if(l.length>1) return l[l.length-1];
			else return action;
		},
		getData : function() {
			if (this.data)
				return this.getModel().comp(this.data);
		},
		getConfigDlg : function() {
			// 不存在就创建一个
			if (!this.configDlg) {
				this.configDlg = new WindowDialog({
					showTitle : true,
					title: justep.Message.getMessage(justep.Message.JUSTEP231101),
					status: 'normal',
					src : importConfigURL,
					parentNode : this.getModel().getRootNode()
				});
				this.configDlg.on("onReceive", function(event) {
					this.uploader.submit();
				}, this);
			}
			return this.configDlg;
		},
		_doUploadReady : function(evt) {
			var param = {
				process : this.getProcess(),
				activity : this.getActivity(),
				action : uploadImportExcelAction,
				mapping : this._cfg.mapping
			};
			var evtData = {source:this,param:param};
			this.fireEvent('onCreateImportParam',evtData);
			this.uploader.addData(param);
			this.fireEvent('onUploadStart', evt);
		},
		_doUploadOK : function(evt) {
			this.fireEvent('onUploadSuccess', evt);
			this._doImport(evt);
		},
		createConfigParam : function() {
			if (this.useDefault)
				return "";
			var sheet = '<sheet all="'	+ (this._cfg.allSheet? "true" : "false") + '" ' 
					+ 'start="'	+ this._cfg.sheetStart + '" '
					+ 'end="' + this._cfg.sheetEnd + '"/>';
			var row = '<row all="' + (this._cfg.allRow ? "true" : "false") + '" ' 
					+ 'start="'	+ this._cfg.rowStart + '" '
					+ 'end="' + this._cfg.rowEnd + '"/>';
			return sheet + row;
		},
		createDataParam : function() {
			var data = this.getData();
			if (!data){
				var msg = new justep.Message(justep.Message.JUSTEP231053);
				throw justep.Error.create(msg);
			}
			var conceptParam = '<concept name="' + data.idColumn + '">';
			var relationParam = '';
			var ids = data.getColumnIDs();
			if (ids) {
				ids = ids.split(data.delim);
				for ( var i = 0; i < ids.length; i++) {
					var colInfo = data.defCols[ids[i]];
					relationParam += '<relation name="' + ids[i] + '" type="'
							+ colInfo.type + '"/>';
				}
			}
			conceptParam += relationParam + '</concept>';
			return conceptParam;
		},
		getDataNewActionParam : function(data){
			var mapParam = new biz.Request.MapParam();
			if(!(data instanceof BizData)){
				var msg = new justep.Message(justep.Message.JUSTEP231054);
				throw justep.Error.create(msg);
			}
			data._createNewParam();
			mapParam.put("process", new biz.Request.SimpleParam(data.getProcess(),
					XML.Namespaces.XMLSCHEMA_STRING));
			mapParam.put("activity", new biz.Request.SimpleParam(data.getActivity(),
					XML.Namespaces.XMLSCHEMA_STRING));
			mapParam.put("action", new biz.Request.SimpleParam(data.getNewAction(),
					XML.Namespaces.XMLSCHEMA_STRING));
			var temp = new biz.Request.MapParam();
			var dataNewParam = data.newParam.param;
			for (var o in dataNewParam) temp.put(o, dataNewParam[o]);
			mapParam.put("parameters", temp);
			return mapParam;
		},

		getDataSaveActionParam : function(data){
			var mapParam = new biz.Request.MapParam();
			if(!(data instanceof BizData)){
				var msg = new justep.Message(justep.Message.JUSTEP231054);
				throw justep.Error.create(msg);
			}
			data._createSaveParam();
			mapParam.put("process", new biz.Request.SimpleParam(data.getProcess(),
					XML.Namespaces.XMLSCHEMA_STRING));
			mapParam.put("activity", new biz.Request.SimpleParam(data.getActivity(),
					XML.Namespaces.XMLSCHEMA_STRING));
			mapParam.put("action", new biz.Request.SimpleParam(data.getSaveAction(),
					XML.Namespaces.XMLSCHEMA_STRING));
			var temp = new biz.Request.MapParam();
			var dataSaveParam = data.saveParam.param;
			for (var o in dataSaveParam) temp.put(o, dataSaveParam[o]);
			mapParam.put("parameters", temp);
			return mapParam;
		},
		getActionParam : function(options) {
			var param = new biz.Request.ActionParam();
			var to = this.to;
			var configParam = '<config use-default="'
				+ (this.useDefault ? "true" : "false") + '" to="'
				+ to + '" excel-file="' + options.excel
				+ '" mapping-file="' + options.mapping + '">'
				+ this.createConfigParam() + "<data>" + this.createDataParam() + "</data>"
				+ "</config>";
			param.setXml('config', new biz.Request.XMLParam(configParam));
			param.setMap('createActionParam', this.getDataNewActionParam(this.getData()));
			if(to == ToKind.DB){
				param.setMap('saveActionParam', this.getDataSaveActionParam(this.getData()));
			}
			return param;
		},
		_doImport: function(evt){
			if(!biz.Request.isBizSuccess(evt.response)){
				var s = biz.Request.getServerError(evt.response,
						(new justep.Message(justep.Message.JUSTEP231058)).getMessage());
				this.fireEvent('onError',{
					'source' : this,
					'message' : s,
					'result' : evt.response
				});
				throw justep.Error.create(s);
			}
			var result = evt.response.data ? evt.response.data.value : evt.response;
			var context = this.getModel().getContext();
			var options = {};
			options.process = this.getProcess();
			options.activity = this.getActivity();
			options.action = this.getAction();
			options.parameters = this.getActionParam(result);
			options.context = context;
			var self = this;
			options.callback = function(response) {
				if (response.state) {
					self._loadDataToUI(response.response);

					self.fireEvent('onSuccess',{
						source : self,
						response : response.response
					});
				} else {
					var msg = biz.Request.getServerError(response.httpResponse,
							(new justep.Message(justep.Message.JUSTEP231057)).getMessage());
					self.fireEvent('onError',{
						'source' : self,
						'message' : msg,
						'result' : response
					});
					response.ignoreError = false;
				}
			};
			biz.Request.sendBizRequest(options);
		},
		_loadDataToUI : function(response){
			if (ToKind.UI == this.to) {
				var data = this.getData();
				var rows = data.loadData(response, true);
				//派发事件通过相关组件刷新
				var eventData = {
						'rows' : rows,
						'source' : data,
						'type' : 'new',
						'selfChanged' : true,
						'changedSource' : data
					};
				data.doDataChanged(eventData);
			}
		},
		_createUploader : function(domNode) {
			this.uploader = new Uploader(domNode, {
				actionUrl : uploadURL,
				autoUpload: false,
				requestHeader : {
					Accept : 'application/json'
				},
				name : 'excel'
			});
			this.uploader.on('onStart', this._doUploadReady, this);
			this.uploader.on('onSuccess', this._doUploadOK, this);
		},
		importExcel : function() {
			if (!this.mappings || !this.getData()) {
				var msg = new justep.Message(justep.Message.JUSTEP231052);
				throw justep.Error.create(msg);
			}
			var evtData = {source:this,cancel:false};
			this.fireEvent('onBeforeImport',evtData);
			if (evtData.cancel)
				return;
			this.showConfigDlg();
		},
		showConfigDlg : function() {
			var dlg = this.getConfigDlg();
			dlg.open({data:this});
		}
	});

	justep.Component.addOperations(ImportExcel, {
		'importExcel' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231100),
			icon : 'icon-ios7-cloud-upload-outline',
			method : function(args) {
				return this.owner.importExcel();
			}
		}
	});
	
	ImportExcel.ToKind = ToKind;
	
	justep.Component.register(url, ImportExcel);
	return ImportExcel;
});