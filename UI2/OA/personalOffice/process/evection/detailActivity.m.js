define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");
	var biz = require('$UI/system/lib/biz');

	var Model = function() {
		this.callParent();
	};

	// 显示出差详情，根据传入的打开类型，设置相关人是否可编辑，是否可审批
	Model.prototype.windowReceiverReceive = function(event) {
		//清空消息数 clearMessageNumberAction
		var params = new biz.Request.ActionParam();
		params.setString("data", event.data.data);
		var options = {};
		options.context = this.getContext();
		options.action = "clearMessageNumberAction";
		options.parameters = params;
		biz.Request.sendBizRequest(options);

		this.comp('contents1').to('detail');
		var detailData = this.comp('detailData');
		detailData.setFilter('filter1', "OA_Evection = '" + event.data.data + "'");
		detailData.refreshData();
		detailData.setValue('fShowTime', OA.transformDateTime(detailData.getValue('fCreatorTime')));
		//刷新审批信息
		var socialData = this.comp('socialData');
		socialData.setFilter('filter1', "SA_Social.sData1 = '" + event.data.data + "'");
		socialData.refreshData();
		this.comp('Approvelist').refresh();

		this.comp('commonData').setValue('groupID',event.data.groupID);
	};

	// 返回列表，如果发起人修改了相关人，需要保存
	Model.prototype.listBtnClick = function(event) {
		var socialData = this.comp("relativeOrgs").getSocialDataComponent();
		if (socialData.isChanged()) {
			this.comp('detailData').setValue('fLastModifyTime', justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
			this.comp('detailData').saveData();
		}
		this.comp('windowReceiver').windowEnsure({
			fID : this.comp('detailData').getValue('OA_Evection'),
			sGroupID : this.comp('commonData').getValue('groupID'),
			fApprove : this.comp('detailData').getValue('fApprove'),
			fStatus : this.comp('detailData').getValue('fStatus'),
		});
	};

	//切换到审批页面
	Model.prototype.approveBtnClick = function(event) {
		this.comp('contents1').to('approve');
		this.comp('commonData').setValue('content','');
	};
	
	//继续审批
	Model.prototype.approvalRowClick = function(event){
		//this.comp('contents1').to('choicePsm');
		this.comp('selectDialog').open({data:this.comp('detailData').getValue('OA_Evection')});
	};

	//审批不同意
	Model.prototype.notAgreeRowClick = function(event) {
		this.approveAndReturn('不同意','已关闭','A');
	};
	
	//批准
	Model.prototype.apprvedRowClick = function(event) {
		this.approveAndReturn('已批准','已关闭','A');
	};
	
	//审批页面的保存按钮
	Model.prototype.saveButClick = function(event) {
		var socialData = this.comp("nextExecutor").getSocialDataComponent();
		var nextExecutor = socialData.getLastRow().val('sPersonName');

		this.approveAndReturn(nextExecutor,'','P');
	};

	//审批后，返回出差列表
	Model.prototype.approveAndReturn = function(sApproce, sStatus, sNewGroupID) {
		var personName = this.getContext().getCurrentPersonName();
		var socialApproce,eveApprove;
		if(sStatus == ""){
			socialApproce = "已审核交由 " + sApproce +' 审批';
			eveApprove = "待 " + sApproce +' 审批';
		}else{
			socialApproce = sApproce;
			eveApprove = personName + ' ' + sApproce;
		}
		
		//保存审批意见
		var content = this.comp("commonData").getValue("content");
		var maxTime = "", maxID = "";
		var me = this;
		var socialData = this.comp("relativeOrgs").getSocialDataComponent();
		socialData.each(function(options) {
			if(options.row.val('sPersonID') == me.getContext().getCurrentPersonID()
				&& options.row.val('sGroupID') == "A"){
				if(maxTime == ""){
					maxTime = options.row.val('sCreateTime');
					maxID = options.row.val('SA_Social');
				}else if(maxTime < options.row.val('sCreateTime')){
					maxTime = options.row.val('sCreateTime');
					maxID = options.row.val('SA_Social');
				}
			}
		});
		if(maxID != ""){
			socialData.setValue("sESField01",socialApproce,socialData.getRowByID(maxID));
			socialData.setValue("sESField02",content,socialData.getRowByID(maxID));
			socialData.saveData();
		}
		this.comp('detailData').setValue('fApprove',eveApprove);
		if(sStatus != '')
			this.comp('detailData').setValue('fStatus',sStatus);
		this.comp('detailData').saveData();
		
		this.comp('windowReceiver').windowEnsure({
			fID : this.comp('detailData').getValue('OA_Evection'),
			sGroupID : sNewGroupID,
			fApprove : this.comp('detailData').getValue('fApprove'),
			fStatus : this.comp('detailData').getValue('fStatus'),
		});
	};

	Model.prototype.backAppButClick = function(event){
		this.comp('contents1').to('detail');
	};
	
	Model.prototype.backDetBtnClick = function(event){
		this.comp('contents1').to('detail');
	};

	Model.prototype.detailDataBeforeSave = function(event){
		this.comp('detailData').setValue('fLastModifyTime', justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
	};

	Model.prototype.selectDialogReceive = function(event){
		if(event.data != ""){
			var socialData = this.comp("relativeOrgs").getSocialDataComponent();
			socialData.refreshData();
			this.approveAndReturn(event.data,'','P');
		}else{
			this.comp('windowReceiver').windowEnsure({
				fID : this.comp('detailData').getValue('OA_Evection'),
				sGroupID : this.comp('commonData').getValue('groupID'),
				fApprove : this.comp('detailData').getValue('fApprove'),
				fStatus : this.comp('detailData').getValue('fStatus'),
			});
		}
	};

	return Model;
});
