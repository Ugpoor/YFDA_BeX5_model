define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");
	require("css!$UI/OA/config/pub").load();

	var Model = function() {
		this.callParent();
		this.openTaskStatus;
	};
	
	//显示每个list里面的记录数
	Model.prototype.modelLoad = function(event) {
		this.showTotalNotReadNum();
		this.showlistCount();
	};
	
	//获得list中的记录数
	Model.prototype.showlistCount = function() {
		var appNO = this.comp('approveList').getBindingObjects().length;
		var croNO = this.comp('createList').getBindingObjects().length;
		var parNO = this.comp('parList').getBindingObjects().length;
		var cloNO = this.comp('cloList').getBindingObjects().length;
		
		this.comp('numData').setValue('appNum', appNO);
		this.comp('numData').setValue('croNum', croNO);
		this.comp('numData').setValue('parNum', parNO);
		this.comp('numData').setValue('cloNum', cloNO);
	};

	//刷新总未读数
	Model.prototype.showTotalNotReadNum = function() {
		var totalNotReadNum = this.comp('evectionData').Sum("sMessageNumber") + this.comp('closeData').Sum("sMessageNumber");
		this.comp("listTitleBar").setTitle("出差管理（" + totalNotReadNum + "）");
	};
	
	//关闭功能
	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};
	
	// 新建任务
	Model.prototype.addBtnClick = function(event) {
		this.comp('newDialog').open();
	};
	
	//新增后，在evectionData中增加返回的数据，刷新我发起的数量
	Model.prototype.newDialogReceive = function(event){
		var evectionData = this.comp("evectionData");
		evectionData.newData({index : 0});
		evectionData.setValue("OA_Evection",event.data.val("OA_Evection"));
		evectionData.setValue("fCreatorID",event.data.val("fCreatorID"));
		evectionData.setValue("fCreator",event.data.val("fCreator"));
		evectionData.setValue("fName",event.data.val("fName"));
/*		evectionData.setValue("fContent",event.data.val("fContent"));
		evectionData.setValue("fPlace",event.data.val("fPlace"));
		evectionData.setValue("fStartDate",event.data.val("fStartDate"));
		evectionData.setValue("fEndDate",event.data.val("fEndDate"));
*/		evectionData.setValue("fApprove",event.data.val("fApprove"));
		evectionData.setValue("sGroupID","C");

		var croNO = this.comp('createList').getBindingObjects().length;
		this.comp('numData').setValue('croNum', croNO);
	};
	
	//显示未关闭详情，隐藏未读数徽章
	Model.prototype.listClick = function(event){
		this.openTaskStatus = "open";
		this.comp('detailDialog').open({data : {data : this.comp('evectionData').getValue('OA_Evection'),
			groupID : this.comp('evectionData').getValue('sGroupID')}});
	};

	//显示已关闭详情，隐藏未读数徽章
	Model.prototype.cloListClick = function(event){
		this.openTaskStatus = "close";
		this.comp('detailDialog').open({data : {data:this.comp('closeData').getValue('OA_Evection'),
			groupID : this.comp('closeData').getValue('OA_Evection')}});
	};

	//在出差详情中进行了修改相关人等操作后更新evectionData，刷新closeData，设置未读数为0
	//区分是从evectionData打开的，还是从closeData打开的
	Model.prototype.detailDialogReceive = function(event) {
		var data;
		if(this.openTaskStatus == "open"){
			data = this.comp("evectionData");
			if(event.data.fApprove != data.getValue("fApprove",data.getRowByID(event.data.fID)))
				data.setValue("fApprove",event.data.fApprove,data.getRowByID(event.data.fID));

			if(event.data.sGroupID != data.getValue("sGroupID",data.getRowByID(event.data.fID)))
				data.setValue("sGroupID",event.data.sGroupID,data.getRowByID(event.data.fID));
		
			if(event.data.fStatus != data.getValue("fStatus",data.getRowByID(event.data.fID))){
				data.setValue("fStatus",event.data.fStatus,data.getRowByID(event.data.fID));
				this.comp("closeData").refreshData();
			}
		}else{
			data = this.comp("closeData");
		}
		data.setValue("sMessageNumber",0,data.getRowByID(event.data.fID));
		this.showlistCount();
		this.showTotalNotReadNum();
	};
	
	//每个list的filter属性里面都调用这个方法，实现前端过滤，用搜索框中的内容过滤任务标题和任务内容
	Model.prototype.dataFilter = function(event){
		if(this.comp('numData').val('findStr')== undefined){
			return true;
		}else if(this.comp('numData').val('findStr')==''){
			return true;
		}else{
			return (event.val('fName').indexOf(this.comp('numData').val('findStr')) >= 0) || (event.val('fApprove').indexOf(this.comp('numData').val('findStr')) >= 0);
		}
	};

	//设置前端过滤条件，list会自动刷新
	Model.prototype.smartFilterFilter = function(event){
		var str = event.source.searchText.get();
		this.comp('numData').setValue("findStr",str);
	};
	
	//刷新已关闭之后，刷新总未读数、已关闭条数
	Model.prototype.closeDataAfterRefresh = function(event){
		if (this.comp('numData')!= null && this.comp('numData').getCount()==1) {
			this.comp('numData').setValue('cloNum', this.comp('closeData').getCount());
			this.showTotalNotReadNum();
		}
	};

	//转换时间显示方式
	Model.prototype.showTime = function(event){
		return OA.transformDate(event.val('fLastModifyTime'));
	};
	
	return Model;
});

