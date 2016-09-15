define(function(require) {
	var $ = require("jquery");
	require("cordova!cordova-plugin-calendar");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function() {
		this.callParent();
		this.setParameters();
	};

	Model.prototype.setParameters = function(event) {
		this.title = "X5开发者大会";// 标题
		this.location = "北京国际会议中心";// 地点
		this.notes = "九点前签到，有大牛到场。干货分享会。";// 内容

		this.start = new Date();
		this.end = new Date();

		this.start.setMinutes(0);
		this.end.setMinutes(0);
		this.start.setSeconds(0);
		this.end.setSeconds(0);

		this.start.setHours(this.start.getHours() + 2);
		this.end.setHours(this.end.getHours() + 3);

		this.calendarName = "我的X5日历";// 活动
		this.success = function(message) {
			justep.Util.hint("Success: " + JSON.stringify(message));
		};
		this.error = function(message) {
			justep.Util.hint("Error: " + message);
		};
	};

	Model.prototype.createEventWithOptionsClick = function(event) {
		var calOptions = window.plugins.calendar.getCalendarOptions();
		calOptions.url = "http://www.wex5.com";
		calOptions.firstReminderMinutes = 120;
		calOptions.secondReminderMinutes = 60;
		calOptions.recurrence = "monthly";
		calOptions.recurrenceEndDate = new Date(2025, 10, 1, 0, 0, 0, 0, 0);
		calOptions.recurrenceInterval = 2;
		var cal = window.plugins.calendar;
		cal.createEventWithOptions(this.title, this.location, this.notes, this.start, this.end, calOptions, this.success, this.error);
	};

	Model.prototype.openCalendarClick = function(event) {
		var cal = window.plugins.calendar;
		cal.openCalendar();
	};

	Model.prototype.createEventInteractivelyClick = function(event) {
		var cal = window.plugins.calendar;
		cal.createEventInteractively(this.title, this.location, this.notes, this.start, this.end, this.success, this.error);
	};

	Model.prototype.createEventClick = function(event) {
		var cal = window.plugins.calendar;
		cal.createEvent(this.title, this.location, this.notes, this.start, this.end, this.success, this.error);

	};

	Model.prototype.findEventClick = function(event) {
		var cal = window.plugins.calendar;
		cal.findEvent(this.title, this.location, this.notes, this.start, this.end, this.success, this.error);
	};

	Model.prototype.deleteEventClick = function(event) {
		var cal = window.plugins.calendar;
		cal.deleteEvent(this.title, this.location, this.notes, this.start, this.end, this.success, this.error);
	};

	Model.prototype.createCalendar = function(event) {
		var cal = window.plugins.calendar;
		cal.createCalendar(this.calendarName, this.success, this.error);
	};

	Model.prototype.createEventInNamedCalendar = function(event) {
		var cal = window.plugins.calendar;
		cal.createEventInNamedCalendar(this.title, this.location, this.notes, this.start, this.end, this.calendarName, this.success, this.error);
	};

	Model.prototype.findAllEventsInNamedCalendar = function(event) {
		var cal = window.plugins.calendar;
		cal.findAllEventsInNamedCalendar(this.calendarName, this.success, this.error);
	};

	Model.prototype.deleteCalendar = function(event) {
		var cal = window.plugins.calendar;
		cal.deleteCalendar(this.calendarName, this.success, this.error);
	};

	Model.prototype.listEventsInRange = function(event) {
		var fromDate = new Date();
		var toDate = new Date();
		toDate.setFullYear(2050);
		var cal = window.plugins.calendar;
		cal.listEventsInRange(fromDate, toDate, this.success, this.error);
	};

	Model.prototype.modelModelConstructDone = function(event) {
		utils.showCode(this, "setParameters").showCode("openCalendarClick").showCode("createEventWithOptionsClick").showCode("createEventInteractivelyClick").showCode(
				"createEventClick").showCode("findEventClick").showCode("deleteEventClick").showCode("createCalendar").showCode("createEventInNamedCalendar").showCode("findAllEventsInNamedCalendar")
				.showCode("listEventsInRange").showCode("deleteCalendar").prettyPrint();
	};

	return Model;
});