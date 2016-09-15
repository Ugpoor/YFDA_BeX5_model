define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");
	var biz = require('$UI/system/lib/biz');

	var Model = function() {
		this.callParent();
		this.openType;// 打开类型（我负责我委托 E、我参与P、已关闭C）
	};

	// 显示任务数据
	Model.prototype.windowReceiverReceive = function(event) {
		//清空消息数 clearMessageNumberAction
		var params = new biz.Request.ActionParam();
		params.setString("data", event.data);
		var options = {};
		options.context = this.getContext();
		options.action = "clearMessageNumberAction";
		options.parameters = params;
		options.directExecute = true;
		options.contentType = biz.Request.JSON_TYPE;
		options.dataType = biz.Request.JSON_TYPE;
		options.callback = function(options) {
		};
		biz.Request.sendBizRequest(options);
		//显示任务数据
		var detailData = this.comp('detailData');
		detailData.setFilter('filter1', "OA_TasksAssigned = '" + event.data + "'");
		detailData.refreshData();
		detailData.setValue('fShowTime', OA.transformDateTime(detailData.getValue('fCreatorTime')));
	};

	Model.prototype.showMemo = function(event) {
		return event.val("fCloser") + "：批准关闭：" + event.val("fCloserMemo") + " （"
			+ justep.Date.toString(event.val("fLastModifyTime"),"hh:mm") + "）";
	};

	// 返回前判断是否修改了附件、修改了参与人，如果修改了，则更新最后修改时间
	// 返回列表 ——返回发生变化的字段
	Model.prototype.listBtnClick = function(event) {
		var socialData = this.comp("relativeOrgs").getSocialDataComponent();
		var detailData = this.comp('detailData');
		if (socialData.isChanged() || detailData.isChanged()) {
			detailData.setValue('fLastModifyTime', justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
			detailData.saveData();
		}
		this.comp('windowReceiver').windowEnsure({
			fID : this.comp('detailData').getValue('OA_TasksAssigned'),
			sActive : this.comp('detailData').getValue('sActive'),
			fStatus : this.comp('detailData').getValue('fStatus'),
			fLastModifyTime : this.comp('detailData').getValue('fLastModifyTime')
		});
	};

	// 打开任务关闭页面
	Model.prototype.closeTaskBtnClick = function(event) {
		this.comp('contents').to('close');
	};

	// 关闭任务，刷新截至日期的显示
	Model.prototype.closeSaveBtnClick = function(event) {
		var detailData = this.comp('detailData');
		if(detailData.getValue('fCloserMemo')==undefined)
			throw new Error('请输入文字内容');
			
		detailData.setValue('fStatus', '已关闭');
		detailData.setValue('fCloserID', this.getContext().getCurrentPersonID());
		detailData.setValue('fCloser', this.getContext().getCurrentPersonName());
		detailData.saveData();

		this.comp('contents').to('detail');
		this.showUpToDate();
	};

	// 返回详细页面
	Model.prototype.closeBackBtnClick = function(event) {
		this.comp('contents').to('detail');
	};

	// 刷新任务数据之后，计算打开类型（我负责我委托 E、我参与P、已关闭C），显示截至日期
	Model.prototype.detailDataAfterRefresh = function(event) {
		var currPerson = this.getContext().getCurrentPersonID();
		var detailData = this.comp('detailData');
		if (detailData.getValue("fStatus") == "已关闭")
			this.openType = "C";
		else if ((detailData.getValue("fCreatorID") == currPerson) || (detailData.getValue("fExecutorID") == currPerson))
			this.openType = "E";
		else
			this.openType = "P";
		this.comp("commoDdata").setValue("openType", this.openType);
		this.showUpToDate();
	}
//显示截至日期
	Model.prototype.showUpToDate = function() {
		var detailData = this.comp('detailData');
		if(detailData.getValue('fStatus') == '未关闭'){
			this.showOpenUpToDate();
		}else{
			this.showCloseUpToDate();
		}
	};
	//显示未关闭的任务的截至日期
	Model.prototype.showOpenUpToDate = function() {
		//清空截至日期
		var div = $('#upToDateDiv');
		$("#upToDateDiv > div").remove();
		var data = this.comp("upToDateData");
		var sFirstRowText, sProgressColor;
		
		//根据任务最终截止日期，计算显示颜色
		var today = justep.Date.fromString( justep.Date.toString( new Date(), "yyyy-MM-dd") , "yyyy-MM-dd") ;
		var lastDate = data.getLastRow().val('fUpToDate');
		var delta = justep.Date.diff(today, lastDate, "d");
		if(delta > 1){//未超时 蓝色
			sProgressColor = 'progrdss-percent';
		}else if(delta == 1){//只差一天 黄色
			sProgressColor = "progrdss-percent-tomorrow" ;
		}else{//今日或已超时 红色
			sProgressColor = "progrdss-percent-yestoday";
		}
		//根据任务最初截止日期，计算第一行上面的文字显示
		var firstDate = data.getFirstRow().val('fUpToDate');
		delta = justep.Date.diff(today, firstDate, "d");
		if(delta > 1){//未超时 蓝色
			sFirstRowText = "截止日：" ;
		}else if(delta == 1){//只差一天 黄色
			sFirstRowText = "距截止日只差一天：" ;
		}else if(delta == 0){//今天 红黄色
			sFirstRowText = "今日已到期：" ;
		}else{//已超时 红色
			sFirstRowText = "已超过截止日：" ;
		}
		//根据任务开始日期，计算任务已经执行的天数
		var startTime = this.comp('detailData').getValue('fCreatorTime');
		var startDate = justep.Date.fromString( justep.Date.toString( startTime, "yyyy-MM-dd") , "yyyy-MM-dd") ;
		var days = justep.Date.diff(startDate, today, "d") + 1;
		
		var needCalcPercent = true, progressDiv, sProgressText, sProgressPercent = 0, percentClass;
		var self = this;
		data.each(function(options) {
			if(needCalcPercent){
			//计算出本条日期的总天数，计算进度条百分比
				var allDays = justep.Date.diff(startDate, options.row.val('fUpToDate'), "d") + 1;
				if(days > allDays){
					sProgressPercent = 100;
				}else if(days == allDays){
					sProgressPercent = 100;
					needCalcPercent = false;
				}else{
					sProgressPercent = parseInt(days / allDays * 100);
					needCalcPercent = false;
				}
			}else{//不需要计算百分比时，百分比为0
				sProgressPercent = 0;
			}
			//计算出每一行显示的文字信息
			var rowDate = justep.Date.toString(options.row.val('fUpToDate'), "yyyy-MM-dd");
			if(options.row == data.getFirstRow()){
				sProgressText = sFirstRowText + rowDate;
			}else{
				sProgressText = options.row.val('fOperator')+" 修改截止日期到：" + rowDate;
			}
			//如果百分比为100，右边也需要出现圆角，所以多加一个class
			if(sProgressPercent < 100)
				percentClass = sProgressColor; 
			else
				percentClass = sProgressColor + " progrdss-percent-full"; 
			//组成idv的html
			progressDiv = "<div class='progrdss'><div class='progrdss-background'></div><div class='" + percentClass + "' style='width:" 
				+ sProgressPercent + "%'></div><div class='progrdss-text'><span>"  + sProgressText + "</span></div>";
			//如果当前人是委托人或负责人，在最后一行，显示＞，并且增加一个class，用于增加单击事件
			if(self.openType=="E" && options.row == data.getLastRow()){
				progressDiv +=	"<div class='progrdss-text progress-last'><a style='float:right;margin-top: 2px;' class='x-img-right'/></div></div>";
			}else{
				progressDiv +=	"</div>";
			}
			div.append($(progressDiv));
		});
		$('.progress-last').click(function(){
			var lastDate = justep.Date.toString(data.getLastRow().val('fUpToDate'), "yyyy-MM-dd");
			var newDate = justep.Date.toString(justep.Date.increase( data.getLastRow().val('fUpToDate'), 1, 'd'), "yyyy-MM-dd");
			self.comp("commoDdata").setValue("lastDate",lastDate);
			self.comp("upToDateData").newData();
			self.comp("contents").to('editTime');
			//设置延至日期的最小值为上一次设置的截至日期加一天
			self.comp("iptNewDate").min = "js:'" + newDate + "'";
		});
	};
	//显示已关闭的任务的截至日期
	Model.prototype.showCloseUpToDate = function() {
		var div = $('#upToDateDiv');
		$("#upToDateDiv > div").remove();
		var data = this.comp("upToDateData");
		data.each(function(options) {
			var sProgressText = "工作已关闭　截止日："+ justep.Date.toString(options.row.val('fUpToDate'), "yyyy-MM-dd");
			var progress = $("<div class='progrdss'><div class='progrdss-background'></div>"+
				"<div class='progrdss-text'><span>"  + sProgressText + "</span></div></div>");
			div.append(progress);
		});
	};
	// 保存前校验————新选择的日期应该大于上一次的日期
	Model.prototype.upToDateDataBeforeSave = function(event) {
		var newDate = justep.Date.toString(this.comp('upToDateData').getValue('fUpToDate'), "yyyy-MM-dd");
		var oldDate = this.comp("commoDdata").getValue("lastDate");
		if (newDate <= oldDate){
			event.cancel = true;
			this.comp("dateMsgDlg").show();
		}
	};

	// 保存修改截至日期
	Model.prototype.dateSaveBtnClick = function(event) {
		this.comp('upToDateData').setValue('fDelay','1');
		this.comp('detailData').saveData();
	};

	// 保存修改截至日期成功后，刷新截至日期
	Model.prototype.upToDateDataSaveCommit = function(event) {
		this.comp('contents').to('detail');
		this.showUpToDate();
	};

	// 返回任务详情，删除新增的记录
	Model.prototype.dateBackBtnClick = function(event) {
		this.comp('contents').to('detail');
		this.comp('upToDateData').deleteData();
	};

	// 保存前修改最后修改时间
	Model.prototype.detailDataBeforeSave = function(event){
		this.comp('detailData').setValue('fLastModifyTime', justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
	};
	return Model;
});

