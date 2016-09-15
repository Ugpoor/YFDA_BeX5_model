define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	var biz = require('$UI/system/lib/biz');

	var Model = function(){
		this.callParent();
		this.loaded = false;//没有加载数据，不能显示日程
		this.colleagueID;
	};
	//打开功能，显示当月日程
	Model.prototype.modelLoad = function(event){
		this.loaded = true;

		var now = new Date();
		this.comp("calData").setValue("monthFirstDay", new Date(now.setDate(1)));
		this.comp("scheTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("monthFirstDay"), "yyyy年MM月") );

		this.comp('calendar').navigate("today");
	};
	
	//显示当月的日程
	Model.prototype.todayBtnClick = function(event){
		var now = new Date();
		this.comp("calData").setValue("monthFirstDay", new Date(now.setDate(1)));
		this.comp("scheTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("monthFirstDay"), "yyyy年MM月") );

		this.comp("scheduleData").refreshData();
		this.comp('calendar').navigate("today");
		this.comp('scrollView').scroller.scrollTo(0,0);
	};
	
	//显示上个月的日程
	Model.prototype.prevBtnClick = function(event){
		this.comp("calData").setValue("monthFirstDay", justep.Date.decrease(this.comp("calData").getValue("monthFirstDay"), 1, 'm'));
 		this.comp("scheTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("monthFirstDay"), "yyyy年MM月") );

		this.comp("scheduleData").refreshData();
		this.comp('calendar').navigate("prev");
		this.comp('scrollView').scroller.scrollTo(0,0);
	};

	//显示下个月的日程
	Model.prototype.nextBtnClick = function(event){
		this.comp("calData").setValue("monthFirstDay", justep.Date.increase(this.comp("calData").getValue("monthFirstDay"), 1, 'm'));
 		this.comp("scheTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("monthFirstDay"), "yyyy年MM月") );

		this.comp("scheduleData").refreshData();
		this.comp('calendar').navigate("next");
		this.comp('scrollView').scroller.scrollTo(0,0);
	};
	
	//查询日程前，传入查询月、查询人，不传人则使用当前人
	Model.prototype.scheduleDataRefreshCreateParam = function(event){
		var sScheMonth;
		if(this.comp("calData").getValue("monthFirstDay") == undefined){
			scheMonth = new Date();
		}else{
			scheMonth = this.comp("calData").getValue("monthFirstDay")
		}
		event.param.setString("scheMonth", justep.Date.toString( scheMonth, "yyyy-MM"));
		event.param.setString("schePerson", this.getContext().getCurrentPersonID());
	};
	
	//在日历组件上标注
	Model.prototype.calendarEventsLoad = function(event){
		return this.calendarLoadEvents("scheduleData");
	};
	
	Model.prototype.calendarLoadEvents = function(dataID){
		if(!this.loaded) return;

		var arrSche = new Array(); 
		var data = this.comp(dataID);
		if(data.getCount() > 0){
			var sScheDay , mTime;
			data.each(function(options) {
				if(options.row.val("fIsTitle") == "1"){
					mTime = (new Date(options.row.val("fScheDay"))).getTime(); //得到毫秒数
					sScheDay = "{start:" + mTime + "}";
					sScheDay = eval("("+sScheDay+")");
					arrSche.push(sScheDay);
				}
			});		
			return arrSche;
		}else
			return [];
	};
	
	//点击日程的某天，让scrollView定位到日程的某天
	Model.prototype.calendar1EventsSelected = function(event){
		//判断是否存在某天的日程
		var sScheDay = justep.Date.toString(event.begin,"yyyy-MM-dd");;
		if($('li[flag="' + sScheDay + '"]')[0] != undefined){
			this.comp('scrollView').scroller.scrollToElement($('li[flag="' + sScheDay + '"]')[0], 100);
		}
	};
	
	// 新建日程
	Model.prototype.addBtnClick = function(event) {
		this.comp('newDialog').open();
	};
	
	//新增后，重新计算日程
	Model.prototype.newDialogReceive = function(event){
		this.comp("scheduleData").refreshData();
		this.comp('calendar').refresh();
	};
	
	//显示详情
	Model.prototype.scheduleListClick = function(event){
		if(this.comp('scheduleData').getValue('fScheID') != undefined){
			this.comp('detailDialog').open({data : {scheID : this.comp('scheduleData').getValue('fScheID'),canEdit : true}});

		}
	};
	
	//从详情返回，重新计算日程，可以增加判断是否修改过
	Model.prototype.detailDialogReceive = function(event) {
		this.comp("scheduleData").refreshData();
		this.comp('calendar').refresh();
	};
	
	//关闭功能
	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};
		
	//显示未确认日程
	Model.prototype.confirmBtnClick = function(event){
		this.comp("confirmData").refreshData();
		this.comp("contents").to("confirm");
	};

	//拒绝参加日程
	Model.prototype.cancelBtnClick = function(event){
		var sScheID = event.bindingContext.$rawData.val("OA_Schedule");
		var params = new biz.Request.ActionParam();
		params.setString("scheID", sScheID);
		var options = {};
		options.context = this.getContext();
		options.action = "refuseScheAction";
		options.parameters = params;
		biz.Request.sendBizRequest(options);	
		this.comp("confirmData").setValue("sGroupID","C",this.comp("confirmData").getRowByID(sScheID));
	};

	//确认参加日程
	Model.prototype.okBtnClick = function(event){
		var sScheID = event.bindingContext.$rawData.val("OA_Schedule");
		var params = new biz.Request.ActionParam();
		params.setString("scheID", sScheID);
		var options = {};
		options.context = this.getContext();
		options.action = "confirmScheAction";
		options.parameters = params;
		biz.Request.sendBizRequest(options);	
		this.comp("confirmData").setValue("sGroupID","O",this.comp("confirmData").getRowByID(sScheID));
	};

	//从未确认日程返回列表
	Model.prototype.confirmBackBtnClick = function(event){
		this.comp("contents").to("list");
		this.comp("scheduleData").refreshData();
		this.comp('calendar').refresh();
	};
	
	//根据日历的高度改变top的高度
	Model.prototype.calendarAfterViewLoad = function(event){
		if(!this.loaded) return;
		var newHeight = $('#'+this.getIDByXID("calendar")).height() + 50;
		$('#'+this.getIDByXID("topArea")).height(newHeight);
		$('#'+this.getIDByXID("contentArea")).css('top',newHeight);
	};

	//选择同事
	Model.prototype.colleagueBtnClick = function(event){
		this.comp('orgDialog').open();
	};

	//显示同事日程
	Model.prototype.orgDialogReceive = function(event){
		this.colleagueID = event.data[0].val('sPersonID');
		var now = new Date();
		this.comp("calData").setValue("cMonthFirstDay", new Date(now.setDate(1)));
		this.comp("colleagueTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("colleagueData").refreshData();
		this.comp("contents").to("colleague");
		this.comp("colleagueCalendar").refresh();
	};

	Model.prototype.colleagueDataRefreshCreateParam = function(event){
		var sScheMonth;
		if(this.comp("calData").getValue("cMonthFirstDay") == undefined){
			scheMonth = new Date();
		}else{
			scheMonth = this.comp("calData").getValue("cMonthFirstDay")
		}
		event.param.setString("scheMonth", justep.Date.toString( scheMonth, "yyyy-MM"));
		event.param.setString("schePerson", this.colleagueID);

	};

	//返回自己的日程
	Model.prototype.colleagueBackBtnClick = function(event){
		this.comp("contents").to("list");
	};

	//显示上个月的日程
	Model.prototype.colleaguePrevBtnClick = function(event){
		this.comp("calData").setValue("cMonthFirstDay", justep.Date.decrease(this.comp("calData").getValue("cMonthFirstDay"), 1, 'm'));
 		this.comp("colleagueTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("colleagueData").refreshData();
		this.comp('colleagueCalendar').navigate("prev");
		this.comp('colleagueScrollView').scroller.scrollTo(0,0);

	};

	//显示下个月的日程
	Model.prototype.colleagueNextBtnClick = function(event){
		this.comp("calData").setValue("cMonthFirstDay", justep.Date.increase(this.comp("calData").getValue("cMonthFirstDay"), 1, 'm'));
 		this.comp("colleagueTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("colleagueData").refreshData();
		this.comp('colleagueCalendar').navigate("next");
		this.comp('colleagueScrollView').scroller.scrollTo(0,0);
	};

	//在日历组件上标注
	Model.prototype.colleagueCalendarEventsLoad = function(event){
		var aa = this.calendarLoadEvents("colleagueData"); 
		return aa;
	};

	//点击日程的某天，让scrollView定位到日程的某天
	Model.prototype.colleagueCalendar1EventsSelected = function(event){
		//判断是否存在某天的日程
		var sScheDay = justep.Date.toString(event.begin,"yyyy-MM-dd");;
		if($('li[cflag="' + sScheDay + '"]')[0] != undefined){
			this.comp('colleagueScrollView').scroller.scrollToElement($('li[cflag="' + sScheDay + '"]')[0], 100);
		}
	};

	//根据日历的高度改变top的高度
	Model.prototype.colleagueCalendarAfterViewLoad = function(event){
		var newHeight = $('#'+this.getIDByXID("colleagueCalendar")).height() + 50;
		$('#'+this.getIDByXID("colleagueTopArea")).height(newHeight);
		$('#'+this.getIDByXID("colleagueContentArea")).css('top',newHeight);
	};

	//显示详情
	Model.prototype.colleagueListClick = function(event){
		if(this.comp('colleagueData').getValue('fScheID') != undefined)
			this.comp('detailDialog').open({data : {scheID : this.comp('colleagueData').getValue('fScheID'),canEdit : false}});
	};

	return Model;
});

