define(function(require) {
	var $ = require("jquery");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");
	require("css!$UI/OA/config/pub").load();
	
	var Model = function() {
		this.callParent();
	};

	// 显示每个list里面的记录数
	Model.prototype.modelLoad = function(event) {
		this.showlistCount();
	};

	// 将来放到每个list的refresh之后事件中显示本list中的记录数
	Model.prototype.showlistCount = function() {
		var exeNO = this.comp('executorList').getBindingObjects().length;
		var croNO = this.comp('creatorList').getBindingObjects().length;
		var parNO = this.comp('parList').getBindingObjects().length;
		var cloNO = this.comp('cloList').getBindingObjects().length;

		this.comp('numData').setValue('exeNum', exeNO);
		this.comp('numData').setValue('croNum', croNO);
		this.comp('numData').setValue('parNum', parNO);
		this.comp('numData').setValue('cloNum', cloNO);
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};

	// 新建请假申请
	Model.prototype.addBtnClick = function(event) {
		//var options = {process: this.getContext().getProcess(), activity: this.getContext().getActivity()};
		//justep.Portal.openWindow("$UI/OA/personalOffice/process/leaveApply/mainActivity.w",options);
		this.comp('newDialog').open({data : {type : 'new'}});
	};

	// 新增后，刷新我发起，更新数量
	Model.prototype.newDialogReceive = function(event) {
		this.comp("creatorData").refreshData();
		this.comp("executorData").refreshData();
		
		var croNO = this.comp('creatorList').getBindingObjects().length;
		this.comp('numData').setValue('croNum', croNO);
	};

	// 显示我发起的请假详情
	Model.prototype.creatorListClick = function(event){
		this.comp('detailDialog').open({
			data : {
				data : this.comp('creatorData').getValue('OA_LeaveApply'),
				type : 'detail'
			}
		});
	};

	// 显示我审批的请假详情
	Model.prototype.executoristClick = function(event){
		//打开流程页面
		var row = this.comp('executorData').getCurrentRow();
		var task = row.val("SA_Task");
		var process = row.val("sProcess");
		var activity = row.val("sActivity");
		var url = this.toAURL(row.val("sEURL"));
		url += ((url.indexOf("?") == -1) ? "?" : "&");
		url += "&process=" + process + "&activity=" + activity + "&task=" + task;
		url = encodeURI(url);
		
		//TODO 将来由门户的api加bsessionid
		url = url + "&bsessionid=" + this.getContext().getBSessionID();
		justep.Shell.showPage(url);	
			
		//打开详细页面
/*		this.comp('detailDialog').open({
			src : url,
			data : {
				data : this.comp('executorData').getValue('OA_LeaveApply'),
				type : 'detail'
			}
		});*/
	};

	Model.prototype.toAURL = function(url) {
		if (url && (url.charAt(0) == "/")){
			url = require.toUrl("$model" + url);
		}
		return url;
	};

	// 显示我相关的请假详情
	Model.prototype.parListClick = function(event){
		this.comp('detailDialog').open({
			data : {
				data : this.comp('parData').getValue('OA_LeaveApply'),
				type : 'detail'
			}
		});
	};
	
	// 显示已关闭的请假详情
	Model.prototype.cloListClick = function(event) {
		this.comp('detailDialog').open({
			data : {
				data : this.comp('closeData').getValue('OA_LeaveApply'),
				type : 'detail'
			}
		});
	};

	// 每个list的filter属性里面都调用这个方法，实现前端过滤，用搜索框中的内容过滤请假原因和申请人
	Model.prototype.dataFilter = function(event) {
		if (this.comp('numData').val('findStr') == undefined) {
			return true;
		} else if (this.comp('numData').val('findStr') == '') {
			return true;
		} else {
			return (event.val('fCreator').indexOf(this.comp('numData').val('findStr')) >= 0) || (event.val('fContent').indexOf(this.comp('numData').val('findStr')) >= 0);
		}
	};

	// 设置前端过滤条件，list会自动刷新
	Model.prototype.smartFilterFilter = function(event) {
		var str = event.source.searchText.get();
		this.comp('numData').setValue("findStr", str);
	};
	
	//转换时间显示方式
	Model.prototype.showTime = function(event){
		return OA.transformDate(event.val('fLastModifyTime'));
	};

	//流转后，刷新全部
	Model.prototype.modelActive = function(event){
		this.comp("creatorData").refreshData();
		this.comp("executorData").refreshData();
		this.comp("parData").refreshData();
		this.comp("closeData").refreshData();
		this.showlistCount();
	};

	return Model;
});

