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
	
	//将来放到每个list的refresh之后事件中显示本list中的记录数
	Model.prototype.showlistCount = function() {
		var attNO = this.comp('attList').getBindingObjects().length;
		var cloNO = this.comp('cloList').getBindingObjects().length;
		var parNO = this.comp('parList').getBindingObjects().length;
		var exeNO = this.comp('exeList').getBindingObjects().length;
		var creNO = this.comp('creList').getBindingObjects().length;
		
		var noData = this.comp('numData');
		if (this.comp('attList') != null) {
			this.comp('numData').setValue('attNum', attNO);
			this.comp('numData').setValue('cloNum', cloNO);
			noData.setValue('exeNum', exeNO);
			noData.setValue('parNum', parNO);
			this.comp('numData').setValue('creNum', creNO);
			//给实现前端过滤条件设置默认值
			this.comp('numData').setValue('findStr', "");
		}
	}
	
	//刷新总未读数
	Model.prototype.showTotalNotReadNum = function() {
		var totalNotReadNum = this.comp('taskData').Sum("sMessageNumber") + this.comp('closeData').Sum("sMessageNumber");
		this.comp("listTitleBar").setTitle("工作交办（" + totalNotReadNum + "）");
	};
	
	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};
	
	// 新建任务
	Model.prototype.addBtnClick = function(event) {
		this.comp('newDialog').open();
	};
	
	//新增后，在taskData中增加返回的数据，刷新我委托的数量
	Model.prototype.newDialogReceive = function(event){
		var options = {
			index : 0,
			defaultValues : [{
				OA_TasksAssigned : event.data.val("OA_TasksAssigned"),
				fCreatorID : event.data.val("fCreatorID"),
				fName : event.data.val("fName"),
				fContent : event.data.val("fContent"),
				fLastModifyTime : justep.Date.toString(event.data.val("fLastModifyTime"), justep.Date.STANDART_FORMAT),
				sActive : 0,
				sMessageNumber : 0,
				sGroupID : "C"
			}]
		};    
		this.comp("taskData").newData(options);
     		
		var creNO = this.comp('creList').getBindingObjects().length;
		this.comp('numData').setValue('creNum', creNO);
	};
	
	//显示未关闭的工作交办详情，隐藏未读数徽章
	Model.prototype.listClick = function(event) {
		this.openTaskStatus = "open";
		this.comp('detailDialog').open({data : this.comp('taskData').getValue('OA_TasksAssigned')});
	};

	//显示已关闭的工作交办详情，隐藏未读数徽章
	Model.prototype.cloListClick = function(event){
		this.openTaskStatus = "close";
		this.comp('detailDialog').open({data : this.comp('closeData').getValue('OA_TasksAssigned')});
	};

	//在任务详情中进行了关注、取消关注、关闭、修改参与人等操作后更新taskData，刷新closeData，设置未读数为0
	//区分是从taskData打开的，还是从closeData打开的
	Model.prototype.detailDialogReceive = function(event) {
		var data;
		if(this.openTaskStatus == "open"){
			data = this.comp("taskData");

			if(event.data.sActive != data.getValue("sActive",data.getRowByID(event.data.fID)))
				data.setValue("sActive",event.data.sActive,data.getRowByID(event.data.fID));
		
			if(event.data.fLastModifyTime != data.getValue("fLastModifyTime",data.getRowByID(event.data.fID)))
				data.setValue("fLastModifyTime",event.data.fLastModifyTime,data.getRowByID(event.data.fID));
		
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
	//刷新一关闭任务之后，刷新总未读数、已关闭任务条数
	Model.prototype.closeDataAfterRefresh = function(event){
		if (this.comp('numData')!= null && this.comp('numData').getCount()==1) {
			this.comp('numData').setValue('cloNum', this.comp('closeData').getCount());
			this.showTotalNotReadNum();
		}
	};
	//每个list的filter属性里面都调用这个方法，实现前端过滤，用搜索框中的内容过滤任务标题和任务内容
	Model.prototype.dataFilter = function(event){
		if(this.comp('numData').val('findStr')== undefined){
			return true;
		}else if(this.comp('numData').val('findStr')==''){
			return true;
		}else{
			return (event.val('fName').indexOf(this.comp('numData').val('findStr')) >= 0) || (event.val('fContent').indexOf(this.comp('numData').val('findStr')) >= 0);
		}
	};

	//设置前端过滤条件，list会自动刷新
	Model.prototype.smartFilterFilter = function(event){
		var str = event.source.searchText.get();
		this.comp('numData').setValue("findStr",str);
	};

	//转换时间显示方式
	Model.prototype.showTime = function(event){
		return OA.transformDate(event.val('fLastModifyTime'));
	};

	return Model;
});
