define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");
	var biz = require('$UI/system/lib/biz');
	var XML = require('$UI/system/lib/base/xml');
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.docDefineDataRefreshCreateParam = function(event) {
		if (this.isRefreshClick) {
			this.isRefreshClick = false;
			event.param.setString("linkProcess", "");
			event.param.setString("linkActivity", "");
			return;
		}
		var treeData = this.comp("docDefineData");
		if (event.options.parent) {
			var parRow = event.options.parent;
			var linkProcess = treeData.getValue("sProcess", parRow);
			var linkActivity = treeData.getValue("sActivity", parRow);
			if($.trim(linkActivity) == ""){
				event.param.setString("filter", "SA_DocLinkDefine.sProcess = '" + linkProcess + "' and not(SA_DocLinkDefine ='"+ parRow.getID() + "')");
			}
		}
	};
	
	Model.prototype.isBtnEnable = function(btnName){
		var linkProcess = this.docDefineData.val("sProcess");
		var linkActivity = this.docDefineData.val("sActivity");
		if ($.trim(linkActivity) != "") {
			if(btnName == "newdef"){
				return false;
			}else{
				return true;
			}
		}
		if ($.trim(linkProcess) == "") {
			if(btnName == "newdef"){
				return true;
			}else{
				return false;
			}
		}
		return true;
	};

	Model.prototype.newLinkClick = function(event) {
		this.comp("wdSelectFunTree").open();
		return;
	};
	

	Model.prototype.docDefineDataAfterDelete = function(event) {
		this.docDefineData.saveData();
	};

	Model.prototype.setDocLinkDefineClick = function(event) {
		var self = this;
		var treeData = this.comp("docDefineData");
		var curRow = treeData.getCurrentRow();
		var linkProcess = treeData.getValue("sProcess", curRow);
		var linkActivity = treeData.getValue("sActivity", curRow);
		if (!this.settingDialog) {
			this.settingDialog = new WindowDialog({
						title : "关联设置",
						showTitle : true,
						status: 'normal',
						forceRefreshOnOpen:true,
						src : "$UI/SA/doc/docPermission/docSetting.w",
						process : "/SA/doc/docPermission/docPermissionProcess",
						activity : "mainActivity",
						parentNode : this.getRootNode()
				});
		}
		var data =  {
			linkProcess : linkProcess,
			linkActivity : linkActivity,
			settingOpt : "activityAdd"
		};
		this.settingDialog.open({data:data});
	};
	Model.prototype.delDocLinkDefineClick = function(event) {
		if (!confirm('确定删除吗?')) {
			return;
		}
		this.saveXml = XML.fromString("<defineRoot/>");
		var linkProcess = this.docDefineData.val("sProcess");
		var linkActivity = this.docDefineData.val("sActivity");
		var sendParam = new biz.Request.ActionParam();
		sendParam.setString('linkProcess', linkProcess);
		sendParam.setString('linkActivity', linkActivity?linkActivity:"");
		sendParam.setXml('settingDoc', new biz.Request.XMLParam(this.saveXml));
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		
		var _options = {};
		_options.process = process;
		_options.activity = activity;
		_options.action = "delDefineItemsAction";
		_options.dataType = "json";
		_options.parameters = sendParam;
		_options.context = this.getContext(); 
		_options.directExecute = true;
		var response = biz.Request.sendBizRequest(_options);
		var result = biz.Request.responseParseJSON(response);
		if (!biz.Request.isBizSuccess(result)) {
			throw new Error("操作失败！");
		}
	};

	Model.prototype.selectProcedure = function(event) {
		this.comp("wdSelectFunTree").open();
	};
	
	Model.prototype.setParentID = function($row,$data) {
		var sProcess = $row.val('sProcess');
		var sActivity = $row.val('sActivity');
		if(sProcess && sActivity){
			var sRow = $data.find(['sProcess','sActivity'],[sProcess,undefined],true);
			if(sRow.length > 0){
				var sParentID = sRow[0].val('SA_DocLinkDefine');
				return sParentID;
			}else{
				return '';
			}
		}
		return '';
	};

	Model.prototype.addFromRoot = function(resArr, df) {
		var parentRow = df.getCurrentRow();
		var sameLink = new Array();
		for ( var i = 0; i < resArr.length; i++) {
			var it = resArr[i];
			var linkProcess = it.process;
			var linkActivity = it.activity ? it.activity : "";
			var linkName = it.activityFName;
			var temp = df.find(['sProcess','sActivity'],[linkProcess, linkActivity == ''? undefined:linkActivity], true);
			if (temp.length > 0) {
				sameLink.push(linkName + "的process(" + linkProcess + "),activity(" + linkActivity + ")和" + df.getValue('sDisplayName', temp[0]) + "相同");
				continue;
			}
			
			df.newData({defaultValues:[], parent:parentRow});
			this.setDocDefineData(df, linkName, linkProcess, linkActivity);
		}
		df.saveData();
		df.refreshData();
		df.first();
		if (sameLink.length > 0) {
			justep.Util.hint(sameLink.join("\n"));
		}

	};

	Model.prototype.addFromSubRoot = function(resArr, df) {
		var parentRow = df.getCurrentRow();
		var sameLink = new Array();
		for ( var i = 0; i < resArr.length; i++) {
			var it = resArr[i];
			var linkProcess = it.process;
			var linkActivity = it.activity ? it.activity : "";
			var linkName = it.activityFName;
			var temp = df.find([ 'sProcess','sActivity'],[linkProcess, linkActivity ==''?undefined:linkActivity],true);
			if (temp.length > 0) {
				sameLink.push(linkName + "的process(" + linkProcess + "),activity(" + linkActivity + ")和" + df.getValue('sDisplayName', temp[0]) + "相同");
				continue;
			}
			isSave = true;
			
			df.newData({defaultValues:[], parent:parentRow});
			this.setDocDefineData(df, linkName, linkProcess, linkActivity);
		}
		df.saveData();
		if (sameLink.length > 0) {
			justep.Util.hint(sameLink.join("\n"));
		}
	};

	Model.prototype.isExistDefine = function(event) {
		var activityRootArr = {};
		var procArr = {};
		var receDefine = XML.fromString("<data/>");
		
		for ( var i = 0; i < event.data.length; i++) {
			/* 第一层 */
			var p = event.data[i].val('process');
			if (!procArr[p]) {
				procArr[p] = p;
				var item = this.createElement(receDefine, "item");
				item.setAttribute("isRoot", "true");
				item.appendChild(this.createElement(receDefine, "process", p));
				item.appendChild(this.createElement(receDefine, "activity", ''));
				item.appendChild(this.createElement(receDefine, "activityFName", p));
				$(receDefine).children().first().append(item);
			}

			var item = this.createElement(receDefine, "item");
			item.setAttribute("isRoot", "false");
			item.appendChild(this.createElement(receDefine, "process", p));
			item.appendChild(this.createElement(receDefine, "activity", event.data[i].val('activity')));
			item.appendChild(this.createElement(receDefine, "activityFName", event.data[i].val('path')));
			$(receDefine).children().first().append(item);
		}
		
		
		var sendParam = new biz.Request.ActionParam();
		sendParam.setXml('param', new biz.Request.XMLParam(XML.toString(receDefine)));
		
		var response = biz.Request.sendBizRequest({
			contentType: "application/json",
			dataType: "application/json",
			process : "/SA/doc/system/systemProcess",
			activity : "mainActivity",
			action: "queryExistDefineAction",
			parameters: sendParam,
			context:this.getContext()
		});
		var responseXML = XML.fromString(response.responseJSON.data.value.xml);
		var resItem = XML.eval(responseXML, "//item[@isExist='true' and @isRoot='false']");
		var alertInfo = "";
		for ( var i = 0; i < resItem.length; i++) {
			alertInfo += XML.getNodeText(XML.eval(resItem[i], "activityFName", "single")) + "\n";
		}

		if (alertInfo && !confirm("以下关联：\n" + alertInfo + "已存在，不能添加。是否继续添加剩余项？")) {
			return false;
		}
		;

		var all = new Array();
		resItem = XML.eval(responseXML, "//item[@isExist='false']");
		for ( var i = 0; i < resItem.length; i++) {
			var it = resItem[i];
			all[i] = {
				process : XML.getNodeText(XML.eval(it, "process", "single")),
				activity : XML.getNodeText(XML.eval(it, "activity", "single")),
				activityFName : XML.getNodeText(XML.eval(it, "activityFName", "single"))
			};
		}
		;
		return all;
	};

	Model.prototype.createElement = function(receDefine, name, value) {
		var element = receDefine.createElement(name);
		if (value != null && value !== "") {
			XML.setNodeText(element, '.', value);
		}
		return element;
	},

	Model.prototype.wdSelectFunTreeReceive = function(event) {
		var resArr = this.isExistDefine(event);
		if (!resArr) {
			return;
		}
		var df = this.comp("docDefineData");
		var linkProcess = df.getValue("sProcess");
		/* 树根节点添加 */
		if ($.trim(linkProcess) == "") {
			this.addFromRoot(resArr, df);
			return;
		}
		/* 树子节点添加 */
		for ( var i = 0; i < event.data.length && i < 1; i++) {
			var process = event.data[i].val("process");
			if (linkProcess !== process) {
				justep.Util.hint("请选择‘" + linkProcess + "’下的activity。");
				return;
			}
		}
		this.addFromSubRoot(resArr, df);
	};

	Model.prototype.setDocDefineData = function(docDefineData, linkName, linkProcess, linkActivity) {
		docDefineData.setValue("sDisplayName", linkName);
		docDefineData.setValue("sProcess", linkProcess);
		docDefineData.setValue("sActivity", linkActivity == ''?undefined:linkActivity);
	};


	Model.prototype.btnDeleteClick = function(event) {
		if (!confirm("提示：“删除”操作会同时删除当前选中项的子项。\n\r\n\r确实要删除吗？"))
			return;
		var df = justep.xbl("docDefineData");
		var linkProcess = df.getValue("sProcess");
		var linkActivity = df.getValue("sActivity");
		var sendParam = new biz.Request.ActionParam();
		sendParam.setString('linkProcess', linkProcess);
		sendParam.setString('linkActivity', linkActivity);
		var process = justep.Context.getCurrentProcess();
		var activity = justep.Context.getCurrentActivity();
		var response = biz.Request.sendBizRequest(process, activity, "deleteLinkDefineAction", sendParam, null, function() {
			df.getStore().deleteRow(df.getCurrentRowId());
		});
		if (!biz.Request.isBizSuccess(response)) {
			throw new Error("操作失败！");
		}
	};

	Model.prototype.refreshDocDefineClick = function(event) {
		this.isRefreshClick = true;
		this.comp("docDefineData").refreshData();
	};
	
	Model.prototype.button2Click = function(event){
		if (!confirm("提示：“删除”操作会同时删除当前选中项的子项。\n\r\n\r确实要删除吗？")){
			return;
		}
		var df = this.comp("docDefineData");
		var linkProcess = df.getValue("sProcess");
		var linkActivity = df.getValue("sActivity");
		var sendParam = new biz.Request.ActionParam();
		sendParam.setString('linkProcess', linkProcess);
		if(linkActivity){
			sendParam.setString('linkActivity', linkActivity);
		}
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var response = biz.Request.sendBizRequest({
			contentType: "application/json",
			dataType: "application/json",
			process : process,
			activity : activity,
			action: "deleteLinkDefineAction",
			parameters: sendParam,
			context:this.getContext()
		});		
		if (!biz.Request.isBizSuccess(response.responseJSON)){
			throw new Error("操作失败！");
		}
		df.refreshData();
	};
	
	
	Model.prototype.button1Click = function(event){
		this.comp("wdSelectFunTree").open({
			data:{
				roots : "UI2",
				files : ".function.xml,.function.m.xml",
				identity : true
			}
		});
	};
	
	Model.prototype.button6Click = function(event){
		var treeData = this.comp("docDefineData");
		var linkProcess = treeData.getValue("sProcess");
		var linkActivity = treeData.getValue("sActivity");
		this.comp('keyDialog').open({
			data:{
				linkProcess : linkProcess,
				linkActivity : linkActivity
			}
		});
	};
	
	return Model;
});