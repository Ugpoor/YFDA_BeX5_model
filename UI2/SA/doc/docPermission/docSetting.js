define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var XML = require('$UI/system/lib/base/xml');
	var DocUtils = require('$UI/system/components/justep/docCommon/docUtil');
	require("$UI/system/components/justep/common/res");
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
	
	var Model = function(){
		this.callParent();
		
	};

	Model.prototype.selectRootPathClick = function(event){
		this.comp("selectRootDialog").open();
	};
	
	Model.prototype.button1Click = function(event){
		this.isNewTpl = true;
		this.comp("selectTmpDialog").open();
	};
	
	Model.prototype.selectTmpBtnClick = function(event) {
		this.isNewTpl = false;
		var tempData = this.comp("docTemplate");
		if(tempData.getCount()<1){
			this.isNewTpl = true;
		}
		if(!tempData.getCurrentRow()){
			justep.Util.hint("请选择需要配置模板的行数据！");
			return;
		}
		this.comp("selectTmpDialog").open();
	};
	
	Model.prototype.selectTmpDialogReceive = function(event){
		var data = event.data;
		var docTemplateData = this.comp("docTemplate");
		if(this.isNewTpl){
			docTemplateData.newData();
		}
		docTemplateData.setValue("sDocId", data.docId);
		docTemplateData.setValue("sDocName", data.docName);
		docTemplateData.setValue("sFileID", data.fileID);
		docTemplateData.setValue("sDocPath", data.docPath);
		docTemplateData.refreshData();
	};
	

	Model.prototype.windowDialogReceive = function(event){
		var data = event.data;
		this.linkProcess = data.linkProcess;
		this.linkActivity = data.linkActivity;
		this.settingOpt = data.settingOpt;
		if(this.settingOpt == 'keyAdd' && this.settingOpt == 'keyEidt'){
			$(this.getElementByXid("keyRow")).show();
		}
		if(data.keyId) this.keyId = data.keyId;
		var keyRowEle = this.getElementByXid("keyRow");
		if (data.settingOpt != "activityAdd") {
			$(keyRowEle).css('display','block');
			if (data.settingOpt == "keyAdd") {
				var docLDData = this.comp("docLinkDefine");
				docLDData.newData();
				docLDData.refreshData();
				return;
			}
		}
		var responseSettings = this.sendQueryAction().responseJSON.data.value;
		if (this.settingOpt == "keyEidt") {
			this.keyidInput.value = responseSettings.keyId;
		}
		this.loadData(responseSettings);
	};
	
	Model.prototype.loadData = function(responseSettings) {
		this.loadFormData(responseSettings.AccessSetting);
		this.loadGridData(responseSettings.TemplateSetting);
	};
	
	Model.prototype.loadFormData = function(jsonData) {
		var data = this.comp("docLinkDefine");
		data.loadData(jsonData);
		data.refreshData();
	};
	
	Model.prototype.loadGridData = function(jsonData) {	
		var templateData = this.comp("docTemplate");
		templateData.loadData(jsonData);
		//console.log("docTemplate:" + jsonData)
		templateData.refreshData();
	};
	
	
	Model.prototype.sendQueryAction = function(){
		var sendParam = new biz.Request.ActionParam();
		sendParam.setString('linkProcess', this.linkProcess);
		if(this.linkActivity){
			sendParam.setString('linkActivity', this.linkActivity);		
		}
	
		if (this.settingOpt == "keyEidt") {
			sendParam.setString('keyId', this.keyId);
		}
		
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var response = biz.Request.sendBizRequest({
			contentType: "application/json",
			dataType: "application/json",
			process : process,
			activity : activity,
			action: "querySettingAction2",
			parameters: sendParam,
			context:this.getContext()
		});
		return response;
	};

	Model.prototype.selectRootDialogReceive = function(event){
		var tmpDocLinkDefine = this.comp("docLinkDefine");
		tmpDocLinkDefine.setValue("sRootName", event.data.rootName);
		tmpDocLinkDefine.setValue("sRootPath", event.data.rootPath);
	};
	
	
	Model.prototype.windowEnsureClick = function(event){
		var _options = {};
		var sendParam = new biz.Request.ActionParam();
		sendParam.setString('linkProcess', this.linkProcess);
		if(this.linkActivity){
			sendParam.setString('linkActivity', this.linkActivity);		
		}
		this.saveXml = this.createActivityXml(this.settingOpt);
		sendParam.setXml('settingDoc', new biz.Request.XMLParam(this.saveXml));
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		
		_options.parameters = sendParam;
		_options.context = this.getContext();
		_options.process = process;
		_options.activity = activity;
		_options.dataType = "json";
		if (this.settingOpt == "activityAdd") {
			_options.action = "setDefineItemsAction";
		} else if (this.settingOpt == "keyAdd") {
			_options.action = "addKeyAction";
		} else if (this.settingOpt == "keyEidt") {
			_options.action = "editKeyNodeAction";
		} else {
			throw new Error("操作失败！");
		}
		var response = biz.Request.sendBizRequest(_options);
		if (!biz.Request.isBizSuccess(response.responseJSON)) {
			throw new Error("操作失败！");
		}
		this.comp('docSettingDialogReceiver').windowEnsure();
	};
	
	Model.prototype.createActivityXml = function(type) {
		if (this.settingOpt == "activityAdd") {
			var resultXml = XML.fromString("<defineRoot/>");
			var rootElm = XML.eval(resultXml, "/defineRoot")[0];
		} else {
			var resultXml = XML.fromString("<key/>");
			var rootElm = XML.eval(resultXml, "/key")[0];
			rootElm.setAttribute("keyId", this.keyidInput.value);
		}
		var LinkData = this.comp("docLinkDefine");
		rootElm.appendChild(this.createElement(resultXml, "rootName", LinkData
				.getValue("sRootName")));
		rootElm.appendChild(this.createElement(resultXml, "rootPath", LinkData
				.getValue("sRootPath")));
		rootElm.appendChild(this.createElement(resultXml, "subPath", LinkData
				.getValue("sSubPath")));
		rootElm.appendChild(this.createElement(resultXml, "access", LinkData
				.getValue("sAccess")));
		rootElm.appendChild(this.createElement(resultXml, "limitSize", LinkData
				.getValue("sLimitSize")));
	
		var tmpData = this.comp("docTemplate");
		var tmps = rootElm.appendChild(this.createElement(resultXml, "templates"));
		var self = this;
		
		tmpData.each(function() {
			var tmp = tmps.appendChild(self.createElement(resultXml, "template"));
			var docId = tmpData.getValue("sDocId", this);
			tmp.setAttribute("docId", docId);
			tmp.appendChild(self.createElement(resultXml, "fileID", tmpData
					.getValue("sFileID", this)));
			tmp.appendChild(self.createElement(resultXml, "docName", tmpData
					.getValue("sDocName", this)));
			tmp.appendChild(self.createElement(resultXml, "docPath", tmpData
					.getValue("sDocPath", this)));
		});
		
		
		/*for ( var i = 0; i < tmpData.getCount(); i++) {
			var v = tmpData.getRowId(i);
			var tmp = tmps.appendChild(this.createElement(resultXml, "template"));
			var docId = tmpData.getValue("sDocId", v);
			tmp.setAttribute("docId", docId);
	
			tmp.appendChild(this.createElement(resultXml, "fileID", tmpData
					.getValue("sFileID", v)));
			tmp.appendChild(this.createElement(resultXml, "docName", tmpData
					.getValue("sDocName", v)));
			tmp.appendChild(this.createElement(resultXml, "docPath", tmpData
					.getValue("sDocPath", v)));
		}*/
		return resultXml;
	};
	
	Model.prototype.createElement = function(element, name, value) {
		var element = element.createElement(name);
		if (value != null && value !== "") {
			XML.setNodeText(element, '.', value);
		}
		return element;
	};
	
	
	
	Model.prototype.modelModelConstructDone = function(event){
		this.keyidInput = this.getElementByXid("keyIdInput");
	};
	
	return Model;
});