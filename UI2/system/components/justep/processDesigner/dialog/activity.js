define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var convter = require("$UI/system/components/justep/processDesigner/js/convter");
	var OrgDialog = require("$UI/system/components/justep/org/orgDialogPC");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");

	var Model = function() {
		this.callParent();
		// 记录执行规则名字的递增
		this.temp = 0;
		// 记录转发规则名字的递增
		this.transferTemp = 0;
		// 记录通知规则名字的递增
		this.noticeTemp = 0;
		// 记录流转规则名字的递增
		this.advanceTemp = 0;
		// 记录回退规则名字的递增
		this.backTemp = 0;
		// 默认的任务标题
		this.lable;
		// 是否为首环节
		this.isOrNotFirstLink;

		// 组织OrgDialog
		this.orgDialog;
		// 指定环节windowDialog
		this.designatedLinkDialog;
		// 处理页面windowDialog
		this.disposePageDialog;
		// 类型windowDialog
		this.kindDialog;

		this.process;
		this.processType;

		this.id = 1;
	};

	Model.prototype.windowReceiver1Receive = function(event) {

		var process = event.data[2];
		this.process = process.substr(0, process.lastIndexOf('/') + 1);
		var processName = event.data[3];
		this.processType = ":"+processName;

		this.comp('executeRulesData').clear();
		this.comp('transferRulesData').clear();
		this.comp('noticeRulesData').clear();
		this.comp('advanceRulesData').clear();
		this.comp('backRulesData').clear();
		this.comp('labelData').clear();
		this.comp('sEURLData').clear();
		this.comp('designatedLinkData').clear();

		this.temp = 0;
		this.transferTemp = 0;
		this.noticeTemp = 0;
		this.advanceTemp = 0;
		this.backTemp = 0;

		var executeRuleArr = [];
		var transferRuleArr = [];
		var noticeRuleArr = [];
		var advanceRuleArr = [];
		var backRuleArr = [];
		var designatedArr = [];
		// 环节名称
		this.lable = event.data[0].LABEL;
		this.comp('activityName').val(this.lable);

		// 所有环节
		var labelDataArr = convter.findAllLink(event.data[1]);
		this.comp('labelData').loadData({
			"@type" : "table",
			"rows" : labelDataArr
		});
		this.comp('labelData').first();

		var xmlNode = event.data[0].xmlNode;
		var nodes = xmlNode.childNodes;

		for (var i = 0; i < nodes.length; i++) {
			if (nodes[i].tagName == 'input') {
				this.isOrNotFirstLink = nodes[i].getAttribute("unit");
			}

			if (nodes[i].tagName == 'execute-rule') {

				var node = nodes[i];
				this.temp++;
				var name = "执行规则" + this.temp;
				// 解析执行规则XML
				executeRuleArr.push(convter.toJsonExecuteRule(node, name));

			}
			if (nodes[i].tagName == 'transfer-rule') {
				var node = nodes[i];
				this.transferTemp++;
				name = "转发规则" + this.transferTemp;
				// 解析执行规则XML
				transferRuleArr.push(convter.toJsonTransferRule(node, name));
			}
			if (nodes[i].tagName == 'notice-rule') {
				var node = nodes[i];
				this.noticeTemp++;
				name = "通知规则" + this.noticeTemp;
				// 解析执行规则XML
				noticeRuleArr.push(convter.toJsonNoticeRule(node, name));
			}
			if (nodes[i].tagName == 'advance-rule') {
				var node = nodes[i];
				this.advanceTemp++;
				name = "流转规则" + this.advanceTemp;
				// 解析流转规则XML
				advanceRuleArr.push(convter.toJsonAdvanceRule(node, name));
			}
			if (nodes[i].tagName == 'back-rule') {
				var node = nodes[i];
				this.backTemp++;
				name = "回退规则" + this.backTemp;
				var id = this.id;
				var array = convter.toJsonBackRule(node, name, id, event.data[1]);
				if (array[0].length != 0) {
					designatedArr = designatedArr.concat(array[0]);
				}
				// 解析回退规则XML
				backRuleArr.push(array[1]);
				this.id++;
			}

		}
		
		this.comp('executeRulesData').loadData({
			"@type" : "table",
			"rows" : executeRuleArr
		})
		this.comp('executeRulesData').first();
		this.comp('dataTables1').reload();

		this.comp('transferRulesData').loadData({
			"@type" : "table",
			"rows" : transferRuleArr
		})
		this.comp('transferRulesData').first();
		this.comp('dataTables2').reload();

		this.comp('noticeRulesData').loadData({
			"@type" : "table",
			"rows" : noticeRuleArr
		})
		this.comp('noticeRulesData').first();
		this.comp('dataTables3').reload();

		this.comp('advanceRulesData').loadData({
			"@type" : "table",
			"rows" : advanceRuleArr
		})
		this.comp('advanceRulesData').first();
		this.comp('dataTables4').reload();

		this.comp('backRulesData').loadData({
			"@type" : "table",
			"rows" : backRuleArr
		})
		this.comp('backRulesData').first();
		this.comp('dataTables5').reload();

		if (designatedArr.length != 0) {
			this.comp('designatedLinkData').loadData({
				"@type" : "table",
				"rows" : designatedArr
			})
			this.comp('designatedLinkData').first();
			this.comp('dataTables8').reload();
		}
	};

	// 新增执行规则
	Model.prototype.addClick = function(event) {

		//var me = this;
		this.temp++;
		var name = "执行规则" + this.temp;

		if (this.isOrNotFirstLink != 'start1') {
			this.comp("executeRulesData").newData({
				defaultValues : [ {
					name : name,
					condition : "true",
					taskAssignMode : "together",
					rangeExpr : "findOrgUnitsHasCActivity('', false)",
					defaultExpr : "",
					defaultExprValue : "",
					rangeExprValue : "findOrgUnitsHasCActivity('', false)",
					sExecuteMode : "'temPreempt'",
					sPreemptMode : "'tpmOpen'",
					kind : "psm",
					kindName : "人员",
					sName : "'" + this.lable + this.processType + "'"
				} ]
			})
		} else {
			this.comp("executeRulesData").newData({
				defaultValues : [ {
					name : name,
					condition : "isStartingProcess()",
					taskAssignMode : "together",
					rangeExpr : "currentPersonMember2()",
					defaultExpr : "currentPersonMember2()",
					defaultExprValue : "currentPersonMember2()",
					rangeExprValue : "currentPersonMember2()",
					sExecuteMode : "'temPreempt'",
					sPreemptMode : "'tpmOpen'",
					kind : "psm",
					kindName : "人员",
					sName : "'" + this.lable + this.processType + "'"
				} ]
			})
		}
	};
	// 删除执行规则
	Model.prototype.deleteClick = function(event) {
		var row = this.comp('executeRulesData').getCurrentRow();
		this.comp('executeRulesData').deleteData(row);
	};

	// 新增转发规则
	Model.prototype.addTransferRuleClick = function(event) {
		
		this.transferTemp++;
		var name = "转发规则" + this.transferTemp;

		if (this.isOrNotFirstLink != 'start1') {
			this.comp("transferRulesData").newData({
				defaultValues : [ {
					name : name,
					condition : "true",
					taskAssignMode : "together",
					rangeExpr : "findOrgUnitsHasCActivity('', false)",
					defaultExprValue : "",
					rangeExprValue : "findOrgUnitsHasCActivity('', false)",
					sExecuteMode : "'temPreempt'",
					sPreemptMode : "'tpmOpen'",
					kind : "psm",
					kindName : "人员",
					sName : "'" + "转发:" + this.lable + "'",
					dialogEnabled : "dialogEnabled",
					saveEnabled : "saveEnabled"
				} ]
			})
		} else {
			this.comp("transferRulesData").newData({
				defaultValues : [ {
					name : name,
					condition : "true",
					taskAssignMode : "together",
					rangeExpr : "currentPersonMember2()",
					defaultExpr : "currentPersonMember2()",
					defaultExprValue : "currentPersonMember2()",
					rangeExprValue : "currentPersonMember2()",
					sExecuteMode : "'temPreempt'",
					sPreemptMode : "'tpmOpen'",
					kind : "psm",
					kindName : "人员",
					dialogEnabled : "dialogEnabled",
					saveEnabled : "saveEnabled",
					sName : "'" + "转发:" + this.lable + "'"
				} ]
			})

		}
	};
	// 删除转发规则
	Model.prototype.deleteTransferRuleClick = function(event) {
		var row = this.comp('transferRulesData').getCurrentRow();
		this.comp('transferRulesData').deleteData(row);
	};
	// 新增通知规则
	Model.prototype.addNoticeRuleClick = function(event) {
		
		this.noticeTemp++;
		var name = "通知规则" + this.noticeTemp;

		this.comp("noticeRulesData").newData({
			defaultValues : [ {
				name : name,
				condition : "true",
				sExecuteMode2 : "'finishWhenOpen'",
				advanceProcess : "advanceProcess",
				kind : "psm",
				kindName : "人员",
				sName : "'" + "通知:" + this.lable + "'",
				dialogEnabled : "dialogEnabled",
				saveEnabled : "saveEnabled",
				defaultExpr : "",
				rangeExpr : "",
				whenToUnit : "",
				defaultExprValue : "",
				rangeExprValue : "",
			} ]
		})
	}
	// 删除通知规则
	Model.prototype.deleteNoticeRuleClick = function(event) {
		var row = this.comp('noticeRulesData').getCurrentRow();
		this.comp('noticeRulesData').deleteData(row);
	};
	// 新增流转规则
	Model.prototype.addAdvanceRuleClick = function(event) {
		
		this.advanceTemp++;
		var name = "流转规则" + this.advanceTemp;

		this.comp("advanceRulesData").newData({
			defaultValues : [ {
				name : name,
				condition : "true",
				dialogEnabled : "dialogEnabled",
				saveEnabled : "saveEnabled",
				forkActivity : "",
				ignoreExecuteMode : "",
				forkActivity :""
			} ]
		})
	};

	// 删除流转规则
	Model.prototype.deleteAdvanceRuleClick = function(event) {
		var row = this.comp('advanceRulesData').getCurrentRow();
		this.comp('advanceRulesData').deleteData(row);
	};
	// 新增回退规则
	Model.prototype.addBackRuleClick = function(event) {
		this.id++;
		
		this.backTemp++;
		var name = "回退规则" + this.backTemp;

		this.comp("backRulesData").newData({
			defaultValues : [ {
				name : name,
				condition : "true",
				dialogEnabled : "dialogEnabled",
				saveEnabled : "saveEnabled",
				backRange : "prev-activity",
				ignoreExecuteMode : "ignoreExecuteMode",
				thenFlowMode : "flowToAgain",
				id : this.id
			} ]
		})
	};

	// 删除回退规则
	Model.prototype.deleteBackRuleClick = function(event) {
		var row = this.comp('backRulesData').getCurrentRow();
		this.comp('backRulesData').deleteData(row);
	};

	// 点击确定按钮
	Model.prototype.span1Click = function(event) {
		var arr = [];
		var executeRulesData = this.comp('executeRulesData');
		var transferRulesData = this.comp('transferRulesData');
		var noticeRulesData = this.comp('noticeRulesData');
		var advanceRulesData = this.comp('advanceRulesData');
		var backRulesData = this.comp('backRulesData');
		var designatedLinkData = this.comp('designatedLinkData');
		var activityName = this.comp('activityName').val();
		arr.push(executeRulesData);
		arr.push(transferRulesData);
		arr.push(noticeRulesData);
		arr.push(advanceRulesData);
		arr.push(backRulesData);
		arr.push(designatedLinkData);
		arr.push(activityName);
		this.comp('windowReceiver').windowEnsure(arr);
	};
	// 点击取消按钮
	Model.prototype.cancelClick = function(event) {
		this.comp('windowReceiver').windowCancel();

	};

	// 打开orgDialog并回显选中值
	Model.prototype.editOrgDialog = function(data,col) {
		if (this.orgDialog == null) {
			var self = this;
			this.orgDialog = new OrgDialog({
				title : new justep.Message(justep.Message.JUSTEP230055).getMessage(),
				showTitle : true,
				multiSelection : true,
				parentNode : this.getRootNode()
			});

			this.orgDialog.on("onReceive", function(evt) {
				var nowData = self.orgDialog._data;
				var nowCol = self.orgDialog._col;
			
				var rows = evt.data || [];
				var str = "";
				var expr = "";
				for (var i = 0; i < rows.length; i++) {
					var fid = rows[i].val("sFID");
					var sName = rows[i].val('sName')
					if (fid) {
						if (expr) {
							expr += ",";
						}
						expr += "'" + fid + "'";
					}
					if (sName) {
						if (str) {
							str += ",";
						}
						str += sName;
					}
				}
				if (expr != "") {
					expr = "findOrgUnitsByFID(list(" + expr + "))";
				}
				
				nowData.setValue(nowCol[1],str);
				nowData.setValue(nowCol[0],expr);
			}, this);

		}
		return this.orgDialog;

	};

	// 新增指定环节

	Model.prototype.button3Click = function(event) {

		var dialog = this.getWindowDialog();
		var labelData = this.comp('labelData');
		dialog.open({
			data : labelData
		});

	};
	// 删除指定环节
	Model.prototype.button4Click = function(event) {
		var row = this.comp('designatedLinkData').getCurrentRow();
		this.comp('designatedLinkData').deleteData(row);
	};

	// 选择处理页面
	Model.prototype.selectClick = function(event) {

		var dialog = this.getDisposePageDialog();
		var arr = [];
		var labelData = this.comp('labelData');
		arr.push(this.process);
		arr.push(labelData);

		dialog.open({
			data : arr
		});

	};
	
/*
	//执行规则选择类型
	Model.prototype.kindSelectClick = function(event){
		var executeRulesData = this.comp('executeRulesData');
		var dialog = this.getKindWindowDialog(executeRulesData);
		dialog._data = executeRulesData;
	
		dialog.open();
	};
	//转发规则选择类型
	Model.prototype.transferKindSelectClick = function(event){
		var transferRulesData = this.comp('transferRulesData');
		var dialog = this.getKindWindowDialog(transferRulesData);
		dialog._data = transferRulesData;
	
		dialog.open();
	};

	//通知规则选择类型
	Model.prototype.noticeKindSelectClick = function(event){
		var noticeRulesData = this.comp('noticeRulesData');
		var dialog = this.getKindWindowDialog(noticeRulesData);
		dialog._data = noticeRulesData;
	
		dialog.open();
	};
*/

	// 转发规则表达式
	Model.prototype.transferSelectClick = function(event) {
		var transferRulesData = this.comp('transferRulesData');
		var col = [];
		col.push("defaultExpr");
		col.push("defaultExprValue");
		var dialog = this.editOrgDialog(transferRulesData,col);
		dialog._data = transferRulesData;
		dialog._col = col;
		dialog.open({
			"data" : {
				selected : {
					kind : "",
					value: ""
				}
			}
		});
	};
	// 转发规则范围表达式
	Model.prototype.transferSelectRangeClick = function(event) {
		var transferRulesData = this.comp('transferRulesData');
		var col = [];
		col.push("rangeExpr");
		col.push("rangeExprValue");
		var dialog = this.editOrgDialog(transferRulesData,col);
		dialog._data = transferRulesData;
		dialog._col = col;
		dialog.open({
			"data" : {
				selected : {
					kind : "",
					value: ""
				}
			}
		});

	};

	// 执行规则表达式
	Model.prototype.executeSelectClick = function(event) {
		var executeRulesData = this.comp('executeRulesData');
		var col = [];
		col.push("defaultExpr");
		col.push("defaultExprValue");
		var dialog = this.editOrgDialog(executeRulesData,col);
		dialog._data = executeRulesData;
		dialog._col = col;
		dialog.open({
			"data" : {
				selected : {
					kind : "",
					value: ""
				}
			}
		});
	};

	// 执行规则范围表达式
	Model.prototype.executeSelectRangeClick = function(event) {
		var executeRulesData = this.comp('executeRulesData');
		var col = [];
		col.push("rangeExpr");
		col.push("rangeExprValue");
		var dialog = this.editOrgDialog(executeRulesData,col);
		dialog._data = executeRulesData;
		dialog._col = col;
		dialog.open({
			"data" : {
				selected : {
					kind : "",
					value: ""
				}
			}
		});
	};

	// 通知规则表达式
	Model.prototype.noticeSelectClick = function(event) {
		var noticeRulesData = this.comp('noticeRulesData');
		var col = [];
		col.push("defaultExpr");
		col.push("defaultExprValue");
		var dialog = this.editOrgDialog(noticeRulesData,col);
		dialog._data = noticeRulesData;
		dialog._col = col;
		dialog.open({
			"data" : {
				selected : {
					kind : "",
					value: ""
				}
			}
		});
	};

	// 通知规则范围表达式
	Model.prototype.noticeSelectRangeClick = function(event) {
		var noticeRulesData = this.comp('noticeRulesData');
		var col = [];
		col.push("rangeExpr");
		col.push("rangeExprValue");
		var dialog = this.editOrgDialog(noticeRulesData,col);
		dialog._data = noticeRulesData;
		dialog._col = col;
		dialog.open({
			"data" : {
				selected : {
					kind : "",
					value: ""
				}
			}
		});
	};

	// 刷新指定环节dataTables
	Model.prototype.backRulesDataIndexChanged = function(event) {
		if (this.comp('dataTables8'))
			this.comp('dataTables8').reload();

	};
	// 新建指定环节windowDialog
	Model.prototype.getWindowDialog = function() {
		if(this.designatedLinkDialog == null){
			
			var self = this;
			var cfg = {
					title : "选择指定环节",
					showTitle : true,
					src : require.toUrl("./designatedLink.w"),
					status : 'normal',
					forceRefreshOnOpen : true,
					routable : false,
					height : 400,
					width : 500,
					parentNode : this.getRootNode()
			}
			this.designatedLinkDialog = new WindowDialog(cfg);
			
			this.designatedLinkDialog.on("onReceive", function(evt) {
				var id = self.comp('backRulesData').getCurrentRow().val("id");
				var arr = evt.data;
				var designatedLinkData = self.comp('designatedLinkData');
				
				for (var i = 0; i < arr.length; i++) {
					var linkNameArr = [];
					
					designatedLinkData.each(function(option){
						if(option.row.val("id") == id){
							linkNameArr.push(option.row.val("linkName"));
						}
					})
					var a = linkNameArr.indexOf(arr[i].val("linkName"));
					if(a == -1){
							designatedLinkData.newData({
								defaultValues : [ {
									linkName : arr[i].val("linkName"),
									id : id
								} ]
							})
						}
					
					
				}
			})
		}
		return this.designatedLinkDialog;

	}
	// 新建处理页面windowDialog
	Model.prototype.getDisposePageDialog = function() {
		if(this.disposePageDialog == null){
			var self = this;
			var cfg = {
					title : "选择处理页面",
					showTitle : true,
					src : require.toUrl("./disposePage.w"),
					status : 'normal',
					forceRefreshOnOpen : true,
					routable : false,
					height : 400,
					width : 500,
					parentNode : this.getRootNode()
			}
			this.disposePageDialog = new WindowDialog(cfg);
			
			this.disposePageDialog.on("onReceive", function(evt) {
				self.comp('disposePage').val(evt.data);
				
			})
		}
		return this.disposePageDialog;
	}
	
	
	// 新建类型windowDialog
	Model.prototype.getKindWindowDialog = function(data) {
		if(this.kindDialog == null){
			
			var self = this;
			var cfg = {
					title : "类型",
					showTitle : true,
					src : require.toUrl("./kind.w"),
					status : 'normal',
					forceRefreshOnOpen : true,
					routable : false,
					height : 400,
					width : 500,
					parentNode : this.getRootNode()
			}
			this.kindDialog = new WindowDialog(cfg);
			
			this.kindDialog.on("onReceive", function(evt) {
				
				var nowData = self.kindDialog._data;
				
				var arr = evt.data;
				
				nowData.setValue("kind",arr[0]);
				nowData.setValue("kindName",arr[1]);
			});
		}
		return this.kindDialog;

	};
	

	Model.prototype.modelLoad = function(event) {

		$(document.getElementsByName("executeRangeExpr")).hide();
		$(document.getElementsByName("executeDefaultExpr")).hide();
		$(document.getElementsByName("transferDefaultExprValue")).hide();
		$(document.getElementsByName("transferRangeExprValue")).hide();
		$(document.getElementsByName("noticeRangeExprValue")).hide();
		$(document.getElementsByName("noticeDefaultExprValue")).hide();
	};

	

	

	

	return Model;
});