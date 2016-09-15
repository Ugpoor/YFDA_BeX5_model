define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var XML = require("$UI/system/lib/base/xml");
	var OrgDialog = require("$UI/system/components/justep/org/orgDialogPC");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.editBtnClick = function(event) {
		var id = this.comp("mainData").getCurrentRowID();
		var data = {
			"id" : id
		};
		this.comp("templateDialog").open({
			data : data
		});
	};

	Model.prototype.disEnabledBtnClick = function(event) {
		var self = this;
		justep.Util.confirm("确定要禁用当前模板？", function() {
			self.changeStatus("disabledTemplateAction");
		});
	};

	Model.prototype.enabledBtnClick = function(event) {
		var self = this;
		justep.Util.confirm("确定要启用当前模板？", function() {
			self.changeStatus("enabledTemplateAction");
		});
	};

	Model.prototype.changeStatus = function(action) {
		var mainData = this.comp("mainData");
		var ids = {};
		var processes = {};
		var id = mainData.getCurrentRowID();
		var version = mainData.getValue("version");
		ids[id] = version;

		var process = mainData.getValue("sProcess");
		processes[process] = "";

		var params = new biz.Request.ActionParam();
		params.setParam("ids", ids);
		params.setParam("processes", processes);

		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : action,
			parameters : params
		};
		biz.Request.sendBizRequest(options);
		mainData.refreshData();
	};

	Model.prototype.templateTablesCellRender = function(event) {
		if (event.colName === "sValidState") {
			event.html = ((event.colVal === 1) ? "可用" : "不可用");
		}
	};

	Model.prototype.addOrgBtnClick = function(event) {
		var dialog = this.getOrgDialog();
		dialog.open({
			data : {
				selected : {
					kind : 'sName',
					value : []
				}
			}
		});
	};

	Model.prototype.deleteOrgBtnClick = function(event) {
		var hasSelected = false;
		var selected = {};
		var tables = this.comp("orgTables");
		var rows = tables.getCheckeds();
		for (var i=0; i<rows.length; i++){
			hasSelected = true;
			var id = rows[i].getID();
			var version = rows[i].val("version");
			selected[id] = version;
		}
		
		if (hasSelected){
			var self = this;
			justep.Util.confirm("确定要取消当前选中的组织关联！", function(){
				var param = new biz.Request.ActionParam();
				param.setParam("ids", selected);
				var options = {};
				var ctx = self.getContext();
				options.context = ctx;
				options.contentType = 'json';
				options.process = ctx.getCurrentProcess();
				options.activity = ctx.getCurrentActivity();
				options.dataType = "json";
				options.action = "deleteTemplatePermissionAction";
				options.parameters = param;
				options.directExecute = true;
				options.callback = function(data) {
					if (data.state) {
						justep.Util.hint("取消组织关联成功！");
						self.comp("resourceControl").refreshData();
					} else {
						data.ignoreError = false;
					}
				};
				biz.Request.sendBizRequest(options);
			});
		}else{
			justep.Util.hint("请选择需要取消的组织关联！");
		}
	};

	Model.prototype.getOrgDialog = function() {
		if (!this.orgDialog) {
			var config = {
				parentNode : this.getElementByXid("window"),
				title : new justep.Message(justep.Message.JUSTEP230107).getMessage(),
				multiSelection : true,
				status : "",
				showTitle : true
			};
			var self = this;
			this.orgDialog = new OrgDialog(config);
			this.orgDialog.on("onReceive", function(evt) {
				var ids = [];
				var names = [];
				var fids = [];
				var fnames = [];
				var datas = evt.data || [];
				for (var i=0; i<datas.length; i++){
					ids[ids.length] = datas[i].val("SA_OPOrg");
					names[names.length] = datas[i].val("sName") || "";
					fids[fids.length] = datas[i].val("sFID");
					fnames[fnames.length] = datas[i].val("sFName") || "";
				}

				var param = new biz.Request.ActionParam();
				param.setParam("orgIDs", ids);
				param.setParam("orgNames", names);
				param.setParam("orgFIDs", fids);
				param.setParam("orgFNames", fnames);

				var mainData = self.comp("mainData");
				param.setString("template", mainData.getCurrentRowID());
				param.setString("process", mainData.getValue("sProcess"));
				param.setString("processName", mainData.getValue("sProcessName"));

				var options = {};
				var ctx = self.getContext();
				options.context = ctx;
				options.contentType = 'json';
				options.process = ctx.getCurrentProcess();
				options.activity = ctx.getCurrentActivity();
				options.dataType = "json";
				options.action = "assignTemplatePermissionAction";
				options.parameters = param;
				options.directExecute = true;
				options.callback = function(data) {
					if (data.state) {
						justep.Util.hint("分配模板成功！");
						self.comp("resourceControl").refreshData();
					} else {
						data.ignoreError = false;
					}
				};
				biz.Request.sendBizRequest(options);
			});
		}
		return this.orgDialog;
	};

	Model.prototype.newBtnClick = function(event) {
		this.comp("processDialog").open({
			data : {type: "flow"}
		});
	};

	Model.prototype.processDialogReceive = function(event) {
		var data = {
			sProcess : event.data.val("process"),
			sProcessName : event.data.val("label")
		};
		this.comp("templateDialog").open({
			data : data
		});
	};

	Model.prototype.templateDialogReceive = function(event) {
		this.comp("mainData").refreshData();
	};

	Model.prototype.hasTemplate = function() {
		return this.comp("mainData").getCount() > 0;
	};

	Model.prototype.isEnabled = function() {
		if (this.hasTemplate()) {
			return this.comp("mainData").getValue("sValidState") === 1;
		}
	};

	Model.prototype.isDisEnabled = function() {
		if (this.hasTemplate()) {
			return this.comp("mainData").getValue("sValidState") !== 1;
		}
	};
	
	Model.prototype.hasOrg = function(){
		return this.comp("resourceControl").getCount() > 0;
	};

	return Model;
});