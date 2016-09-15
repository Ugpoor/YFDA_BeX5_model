/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require('css!./css/excel').load();
	
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var WindowDialog = require('$UI/system/components/justep/windowDialog/windowDialog');
	var BizData = require('$UI/system/components/justep/data/bizData');
	var fileApi = require("$UI/system/components/justep/docCommon/fileApi");
	var XML = require("$UI/system/lib/base/xml");

	require('$UI/system/resources/system.res');

	var url = require.normalizeName("./exportExcel");
	var ComponentConfig = require("./exportExcel.config");
	
	var exportConfigURL = require.toUrl("./dialog/exportConfig.w");
	var downloadURL = require.toUrl("./server/download.j");

	var FromKind = {
		UI : 'UI',
		DB : 'DB'
	};

	var ExportExcel = justep.BindComponent.extend({
		// 构造函数
		constructor : function(options) {
			this.data = null;
			this.from = FromKind.DB;
			this.action = "exportExcel";
			this.downloadFilename = "download.xls";
			this.relations = "";
			this.labelRelations = "";
			this.exportKey = false;
			this.exportCalculate = false;
			this.useConfigDlg = true;
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
			var ele = $('<div class="x-export-excel" component="' + url + '">');
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
			if(action==='exportExcel')
				return "/SA/excel/system/systemProcess";
			else 
				return this.getModel().getContext().getProcess();
		},
		getActivity: function(){
			var action = this.action;
			if(action==='exportExcel')
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
		isExportCalculate : function() {
			return this.exportCalculate
					&& (FromKind.UI == this.from);
		},
		_getExportConfigURL : function(){
			return exportConfigURL;
		},
		getConfigDlg : function() {
			// 不存在就创建一个
			if (!this.configDlg) {
				this.configDlg = new WindowDialog({
					showTitle : true,
					title: justep.Message.getMessage(justep.Message.JUSTEP231048),
					status: 'normal',
					src : this._getExportConfigURL(),
					parentNode : this.getModel().getRootNode()
				});
				this.configDlg.on("onReceive", function(event) {
					var resultData = event.data;
					var exportConfigData = this.createExportConfigParam(resultData,
							true);
					this._doExport(exportConfigData);
				}, this);
			}
			return this.configDlg;
		},
		showConfigDlg : function() {
			var dlg = this.getConfigDlg();
			dlg.open({data:this});
		},
		getRelationWidths : function(){
			if(!this._relationWidths){
				this._relationWidths = {};
				var r = this.relations;
				var rlabel = this.labelRelations;
				var labelList = rlabel?rlabel.split(','):[];
				if(r){
					var list = r.split(',');
					for(var i=0;i<list.length;i++){
						var s = list[i];
						if(s){
							var ls = s.split(':');
							if(ls.length==1) this._relationWidths[ls[0]]={w:"", l:(i<labelList.length?labelList[i]:'')};
							else if(ls.length==2) this._relationWidths[ls[0]]={w:ls[1], l:(i<labelList.length?labelList[i]:'')};
						}
					}
				}
			}
			return this._relationWidths;
		},
		getRelationWidth : function(relation){
			var o = (this.getRelationWidths())[relation];
			return o?o.w:'';
		},
		getRelationLabel : function(relation){
			var o = (this.getRelationWidths())[relation];
			return o?o.l:'';
		},
		getRelations : function(){
			var ls = this.getRelationWidths();
			var rs = [];
			for(var i in ls){
				rs.push(i);
			}
			return rs;
		},
		createExportConfigParam : function(data, isConfigDlgResult) {
			/*
			 * <config><show-label>true</show-label><start-row>1</start-row></config>
			 * <concept excelCellNo="1"> <relation metaName="name" metaLabel="名称"
			 * metaCellNo="1" type="http://www.w3.org/2001/XMLSchema#String"
			 * excelCellNo="2" /> <relation metaName="birthdate" metaLabel="生日"
			 * metaCellNo="2" type="http://www.w3.org/2001/XMLSchema#Time"
			 * excelCellNo="4"/> <relation metaName="age" metaLabel="年龄"
			 * metaCellNo="3" type="http://www.w3.org/2001/XMLSchema#Integer"
			 * excelCellNo="3"/> </concept>
			 */
			var result,i,s;
			if (!isConfigDlgResult) {
				result = "<config><show-label>true</show-label><start-row>1</start-row></config>"
						+ (this.exportKey ? '<concept excelCellNo="1">'
								: '<concept>');
				var ids = this.getRelations();
				if(ids.length<=0){
					ids = data.getColumnIDs();
					if(ids) ids = ids.split(data.delim);
				}
				var cellNO = this.exportKey ? 2 : 1;
				for (i = 0; i < ids.length; i++) {
					if(ids[i]==data.idColumn) continue;
					var colInfo = data.defCols[ids[i]];
					if (data.versionRelation != ids[i]
					&& (this.isExportCalculate() || !data.isUICalculateCol(ids[i]))) {
						var l = this.getRelationLabel(ids[i]);
						s = '<relation metaName="' + ids[i]
						+ '" width="' + this.getRelationWidth(ids[i])
						+ '" metaLabel="' + (l?l:colInfo.label)
						+ '" metaCellNo="' + (i + 1) + '" type="'
						+ colInfo.type + '" excelCellNo="' + cellNO
						+ '"/>';
						result += s;
						cellNO++;
					}
				}
				return '<root>' + result + '</concept></root>';
			} else {
				result = "<config><show-label>true</show-label><start-row>1</start-row></config>";
				var conceptStr = "";
				var relationStr = "";
				var excelCellNO = 1;
				data.each(function(p){
					var row = p.row;
					if ('1' == row.val('ch')) {
						if (this.exportKey
								&& 'key' == row.val('type')
								&& '0' == row.val('NO')) {
							conceptStr = '<concept excelCellNo="' + excelCellNO
									+ '">';
							excelCellNO++;
						} else {
							s = '<relation metaName="'
									+ row.val('id') + '" metaLabel="'
									+ row.val('label')
									+ '" width="' + row.val('width')
									+ '" metaCellNo="' + row.val('NO')
									+ '" type="' + row.val('type')
									+ '" excelCellNo="' + excelCellNO + '"/>';
							relationStr += s;
							excelCellNO++;
						}
					}
				},this);
				if (conceptStr === '')
					conceptStr = '<concept>';
				return '<root>' + result + conceptStr + relationStr
						+ '</concept></root>';
			}
		},

		getDataQueryActionParam : function(data){
			var mapParam = new biz.Request.MapParam();
			if(!(data instanceof BizData)){
				var msg = new justep.Message(justep.Message.JUSTEP231049);
				throw justep.Error.create(msg);
			}
			data._setTreeFilter("");
			data._createRefreshParam(0, -1);
			mapParam.put("process", new biz.Request.SimpleParam(data.getProcess(),
					XML.Namespaces.XMLSCHEMA_STRING));
			mapParam.put("activity", new biz.Request.SimpleParam(data.getActivity(),
					XML.Namespaces.XMLSCHEMA_STRING));
			mapParam.put("action", new biz.Request.SimpleParam(data.getQueryAction(),
					XML.Namespaces.XMLSCHEMA_STRING));
			var temp = new biz.Request.MapParam();
			var dataQueryParam = data.queryParam.param;
			for (var o in dataQueryParam) temp.put(o, dataQueryParam[o]);
			mapParam.put("parameters", temp);
			return mapParam;
		},
		
		_getDataTable : function(){
			return this.getData().toJson(false,!this.exportCalculate);
		},
		
		getActionParam : function(exportConfigData) {
			var from = this.from;
			var data = this.getData();
			var param = new biz.Request.ActionParam();
			param.setString('from', from);
			param.setXml('config', new biz.Request.XMLParam(exportConfigData));
			if (from == FromKind.UI) {
				param.setTable('data', new biz.Request.TableParam(this._getDataTable()));
			}else if(from == FromKind.DB){
				param.setMap('queryActionParam', this.getDataQueryActionParam(data));
			}
			var evtData = {source:this,param:param};
			this.fireEvent('onCreateExportParam',evtData);
			return param;
		},

		exportExcel : function() {
			var evtData = {source:this,cancel:false};
			this.fireEvent('onBeforeExport',evtData);
			if (evtData.cancel)
				return;
			var useConfigDlg = this.useConfigDlg;
			if (!useConfigDlg) {
				var exportConfigData = this.createExportConfigParam(this.getData());
				this._doExport(exportConfigData);
			} else
				this.showConfigDlg();
		},

		_doExport : function(exportConfigData) {
			var context = this.getModel().getContext();
			var options = {};
			options.process = this.getProcess();
			options.activity = this.getActivity();
			options.action = this.getAction();
			options.parameters = this.getActionParam(exportConfigData);
			options.context = context;
			var self = this;
			options.callback = function(data) {
				if (data.state) {
					var fileName = data.response;
					var url = downloadURL+"?action=downloadExportExcel&fileName=" + encodeURI(fileName)
							+ (self.downloadFilename ? ('&$downloadFilename=' + encodeURI(self.downloadFilename)) : '');
					url = biz.Request.setBizParams(url,context.getBSessionID(),options.process,options.activity);
					fileApi.download(url, self.downloadFilename);
					self.fireEvent('onSuccess',{
						'source' : self
					});
				} else {
					var msg = biz.Request.getServerError(data.httpResponse,
							(new justep.Message(justep.Message.JUSTEP231050)).getMessage());
					self.fireEvent('onError',{
						'source' : self,
						'message' : msg,
						'result' : data
					});
					data.ignoreError = false;
				}
			};
			biz.Request.sendBizRequest(options);
		}
	});

	ExportExcel.FromKind = FromKind;

	justep.Component.addOperations(ExportExcel, {
		'exportExcel' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231099),
			icon : 'icon-android-download',
			method : function(args) {
				return this.owner.exportExcel();
			}
		}
	});
	
	justep.Component.register(url, ExportExcel);
	return ExportExcel;
});