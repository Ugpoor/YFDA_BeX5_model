/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");
	require('css!./css/datePicker').load();

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var PopPicker = require("$UI/system/components/justep/picker/popPicker");
	var url = require.normalizeName("./datePicker");
	var ComponentConfig = require("./datePicker.config");

	var DatePicker = PopPicker.extend({
		constructor: function(){
			this.callParent();
			this.type = 'datetime';//date/time/datetime
			
			this.min = null;
			this.max = null;
			this._yearValue = justep.Bind.observable(2016);
			this._monthValue = justep.Bind.observable(1);
			this._dayValue = justep.Bind.observable(1);
			this._hourValue = justep.Bind.observable(0);
			this._minuteValue = justep.Bind.observable(0);
			this._secondValue = justep.Bind.observable(0);
		},
		getConfig : function() {
			return ComponentConfig;
		},
		dispose : function() {
			var ls = ['year','month','day','hour','minute','second'], self = this;
			$.each(ls,function(i,name){
				if(self['_set'+name+'PickerValueHandle']) clearTimeout(self['_set'+name+'PickerValueHandle']);
			});
			this.callParent();
		},
		buildTemplate : function(cfg) {
			return this.callParent(cfg);
		},
		propertyChangedHandler : function(key, oldVal, value) {
			if (this.$domNode){
				this.$domNode.attr(key, value);
			}
		},
		_createTitle: function(){
			this.getContent$().append(
				    '<div class="x-poppicker-title">'+ 
				    '    <h5 class="x-year">'+justep.Message.getMessage(justep.Message.JUSTEP231504)+'</h5>'+  
				    '    <h5 class="x-month">'+justep.Message.getMessage(justep.Message.JUSTEP231502)+'</h5>'+  
				    '    <h5 class="x-day">'+justep.Message.getMessage(justep.Message.JUSTEP231503)+'</h5>'+  
				    '    <h5 class="x-hour">'+justep.Message.getMessage(justep.Message.JUSTEP231505)+'</h5>'+  
				    '    <h5 class="x-minute">'+justep.Message.getMessage(justep.Message.JUSTEP231506)+'</h5>'+  
				    '    <h5 class="x-second">'+justep.Message.getMessage(justep.Message.JUSTEP231507)+'</h5>'+ 
				    '</div>' 
			);
		},
		_createPickers: function(){
			if(!this._isPickersCreated){
				var self = this;
				this._createTitle();
				
				//创建picker的数据
				this._dayData = justep.Bind.computed(function() {
					var yearValue = self._yearValue.get();
					var monthValue = self._monthValue.get();
					if (yearValue && monthValue) {
						var ret = [];
						var oldv = self._dayValue.peek();
						var max = justep.Date.MaxDay(yearValue,monthValue);
						if(max<oldv){
							self._dayValue.set(max);
							self._setPickerValue('day',max);
						}
						for(var i=1;i<=max;i++){
							ret.push(justep.String.zeros(i,2));
						}
						//显示刺激day日期列表，bind-each有优化当数据对象没有变化时不重新渲染导致，数据变化后没有刺激doAfterRender()
						if(self._dayComp) self._dayComp.doAfterRender(); 
						return ret;
					} else
						return [];
				});
				this._yearData = justep.Bind.computed(function() {
					var yearValue = self._yearValue.get();
					var ret = [],MaxYear = self._getMaxYear(),MinYear = self._getMinYear();
					for(var i=0;i<40;i++){
						var v = yearValue+i-20;
						if(v>=MinYear && v<=MaxYear)
							ret.push(v);//前后20年
					}
					return ret;
				});
				this._monthData = [];
				for(var i=1;i<=12;i++){
					this._monthData.push(justep.String.zeros(i,2));
				}
				this._hourData = [];
				for(i=0;i<24;i++){
					this._hourData.push(justep.String.zeros(i,2));
				}
				this._minuteData = [];
				this._secondData = [];
				for(i=0;i<60;i++){
					var v = justep.String.zeros(i,2);
					this._minuteData.push(v);
					this._secondData.push(v);
				}

				//创建picker,把data写入model，便于picker组件data部分bind
				var model = this.getModel();
				if (!model['__justep__'])
					model['__justep__'] = {};
				if(!model.__justep__.datepicker) 
					model.__justep__.datepicker = {};
				var xid = this.$domNode.attr('xid');
				if(!xid) xid = justep.UUID.createUUID();
				model.__justep__.datepicker[xid+'_dayData_'] = this._dayData;
				model.__justep__.datepicker[xid+'_monthData_'] = this._monthData;
				model.__justep__.datepicker[xid+'_yearData_'] = this._yearData;
				model.__justep__.datepicker[xid+'_hourData_'] = this._hourData;
				model.__justep__.datepicker[xid+'_minuteData_'] = this._minuteData;
				model.__justep__.datepicker[xid+'_secondData_'] = this._secondData;
				this._yearComp = this.addPicker({'class':'x-picker x-year',data:'$model.__justep__.datepicker["'+xid+'_yearData_"]','bind-itemText':'$object',onChange:this._doChange.bind(this)});
				this._yearComp._value = this._yearValue;
				this._monthComp = this.addPicker({'class':'x-picker x-month',data:'$model.__justep__.datepicker["'+xid+'_monthData_"]','bind-itemText':'$object',onChange:this._doChange.bind(this)});
				this._monthComp._value = this._monthValue;
				this._dayComp = this.addPicker({'class':'x-picker x-day',data:'$model.__justep__.datepicker["'+xid+'_dayData_"]','bind-itemText':'$object',onChange:this._doChange.bind(this)});
				this._dayComp._value = this._dayValue;
				this._hourComp = this.addPicker({'class':'x-picker x-hour',data:'$model.__justep__.datepicker["'+xid+'_hourData_"]','bind-itemText':'$object',onChange:this._doChange.bind(this)});
				this._hourComp._value = this._hourValue;
				this._minuteComp = this.addPicker({'class':'x-picker x-minute',data:'$model.__justep__.datepicker["'+xid+'_minuteData_"]','bind-itemText':'$object',onChange:this._doChange.bind(this)});
				this._minuteComp._value = this._minuteValue;
				this._secondComp = this.addPicker({'class':'x-picker x-second',data:'$model.__justep__.datepicker["'+xid+'_secondData_"]','bind-itemText':'$object',onChange:this._doChange.bind(this)});
				this._secondComp._value = this._secondValue;
				this._isPickersCreated = true;
				this.updatePickerValue();
			}
		},
		_getMaxYear: function(){
			var ret = 9999;
			if(this.max instanceof Date){
				ret = this.max.getFullYear();
			}
			return ret;
		},
		_getMinYear: function(){
			var ret = 0;
			if(this.min instanceof Date){
				ret = this.min.getFullYear();
			}
			return ret;
		},
		_doChange : function(event) {
			var value = event.item;
			if(value){
				event.source._value.set(value);
				this.updatePickerValue();
				var self = this;
				setTimeout(justep.Util.bindModelFn(self.getModel(),function(){self._updatePickerValueByMaxAndMin();}), 1);
			}
		},
		_updatePickerValueByMaxAndMin:function(){
			var val = this.getValue();
			if(val instanceof Date){
				if(this.min instanceof Date && val.getTime()<this.min.getTime()) this.setValue(this.min);
				else if(this.max instanceof Date && val.getTime()>this.max.getTime()) this.setValue(this.max);
			}
		},
		setValue : function(datetime) {
			if(datetime instanceof Date){
				this._createPickers();
				if(this._isPickersCreated){
					if(this.type=='datetime' || this.type=='date'){
						this._yearValue.set(datetime.getFullYear());
						this._monthValue.set(datetime.getMonth()+1);
						this._dayValue.set(datetime.getDate());
					}
					if(this.type=='datetime' || this.type=='time'){
						this._hourValue.set(datetime.getHours());
						this._minuteValue.set(datetime.getMinutes());
						this._secondValue.set(datetime.getSeconds());
					}
					this.updatePickerValue();
				}
			}
		},
		getValue : function(){
			if(this._isPickersCreated){
				if(this.type=='date') return justep.Date.fromString(this._getPickerValue('year')+this._getPickerValue('month')+this._getPickerValue('day'),'yyyyMMdd');
				else if(this.type=='datetime') return justep.Date.fromString(this._getPickerValue('year')+this._getPickerValue('month')+this._getPickerValue('day')+this._getPickerValue('hour')+this._getPickerValue('minute')+this._getPickerValue('second'),'yyyyMMddhhmmss');
				else if(this.type=='time') return justep.Date.fromString(this._getPickerValue('hour')+this._getPickerValue('minute')+this._getPickerValue('second'),'hhmmss');
			}
		},
		_setPickerValue : function(name, value) {
			var comp = this['_'+name+'Comp'];
			if (comp) {
				var index = 0;
				$.each(comp.items, function(i, item) {
					if (item == value) {
						index = i;
						return false;
					}
				});
				comp.setSelectedIndex(index);
			}
		},
		_getPickerValue : function(name) {
			var comp = this['_'+name+'Comp'];
			if (comp) {
				var item = comp.getSelectedItem();
				return item||"";
			}
			return "";
		},
		updatePickerValue : function(){
			this._updatePickerValue('year');
			this._updatePickerValue('month');
			this._updatePickerValue('day');
			this._updatePickerValue('hour');
			this._updatePickerValue('minute');
			this._updatePickerValue('second');
		},
		_updatePickerValue : function(name){
			var comp = this['_'+name+'Comp'];
			if (comp) {
				var self = this;
				if(this['_set'+name+'PickerValueHandle']) clearTimeout(this['_set'+name+'PickerValueHandle']);
				this['_set'+name+'PickerValueHandle'] = setTimeout(justep.Util.bindModelFn(self.getModel(),function() {
					self['_set'+name+'PickerValueHandle'] = null;
					self._setPickerValue(name, self['_'+name+'Value'].peek());
				}), 1);
			}
		},
		show: function(){
			this._createPickers();
			this.callParent();
		}		
	});

	justep.Component.register(url, DatePicker);
	return DatePicker;
});