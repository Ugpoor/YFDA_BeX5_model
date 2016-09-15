/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");
	require('css!./css/distpicker').load();
	
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var PopPicker = require("$UI/system/components/justep/picker/popPicker");
	var url = require.normalizeName("./distpicker2");
	var ComponentConfig = require("./distpicker2.config");

	var chineseDistricts = require("$UI/system/components/justep/distpicker/js/chineseDistricts");

	var Distpicker2 = PopPicker.extend({
		constructor: function(){
			this.callParent();
			
			this._provinceValue = justep.Bind.observable("北京市");// "北京"
			this._cityValue = justep.Bind.observable("北京市市辖区");// "北京市市辖区"
			this._districtValue = justep.Bind.observable();
		},
		getConfig : function() {
			return ComponentConfig;
		},
		dispose : function() {
			var ls = ['province','city','district'], self = this;
			$.each(ls,function(i,name){
				if(self['_set'+name+'PickerValueHandle']) clearTimeout(self['_set'+name+'PickerValueHandle']);
			});
			this.callParent();
		},
		buildTemplate : function(cfg) {
			return this.callParent(cfg);
		},
		_createPickers: function(){
			if(!this._isPickersCreated){
				var self = this;
				
				this._districtData = justep.Bind.computed(function() {
					var cityValue = self._cityValue.get();
					if (cityValue) {
						var ret = self.getDistrict(cityValue);
						//console.log('district:' + ret);
						return ret;
					} else
						return [];
				});
				this._cityData = justep.Bind.computed(function() {
					var provinceValue = self._provinceValue.get();
					if (provinceValue) {
						var ret = self.getDistrict(provinceValue);
						//console.log('city:' + ret);
						return ret;
					} else
						return [];
				});
				this._provinceData = justep.Bind.computed(function() {
					var ret = self.getDistrict();
					//console.log('province:' + ret);
					return ret;
				});

				var model = this.getModel();
				if (!model['__justep__'])
					model['__justep__'] = {};
				if(!model.__justep__.distpicker2) 
					model.__justep__.distpicker2 = {};
				var xid = this.$domNode.attr('xid');
				if(!xid) xid = justep.UUID.createUUID();
				model.__justep__.distpicker2[xid+'_provinceData_'] = this._provinceData;
				model.__justep__.distpicker2[xid+'_cityData_'] = this._cityData;
				model.__justep__.distpicker2[xid+'_districtData_'] = this._districtData;
				this._provinceComp = this.addPicker({'class':'x-picker x-province',data:'$model.__justep__.distpicker2["'+xid+'_provinceData_"]','bind-itemText':'name',onChange:this._doProvinceChange.bind(this)});
				this._cityComp = this.addPicker({'class':'x-picker x-city',data:'$model.__justep__.distpicker2["'+xid+'_cityData_"]','bind-itemText':'name',onChange:this._doCityChange.bind(this)});
				this._districtComp = this.addPicker({'class':'x-picker x-district',data:'$model.__justep__.distpicker2["'+xid+'_districtData_"]','bind-itemText':'name'});
				this._isPickersCreated = true;
			}
		},
		_doProvinceChange : function(event) {
			var value = event.item && event.item.name;
			//console.log("provinceChange:" + value);
			this._setProvinceValue(value);
		},
		_doCityChange : function(event) {
			var value = event.item && event.item.name;
			//console.log("cityChange:" + (value));
			this._setCityValue(value);
		},
		setValue : function(value) {
			this._createPickers();
			if(this._isPickersCreated){
				this._setProvinceValue(value.province);
				this._updatePickerValue('province');
				this._setCityValue(value.city);
				this._setDistrictValue(value.district);
			}
		},
		getValue : function(){
			if(this._isPickersCreated){
				return {
					province: this._getPickerValue('province'),
					city: this._getPickerValue('city'),
					district: this._getPickerValue('district')
				};
			}
		},
		_setPickerValue : function(name, value) {
			var comp = this['_'+name+'Comp'];
			if (comp) {
				var index = 0;
				$.each(comp.items, function(i, item) {
					if (item.name === value) {
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
				return (item && item.name)||"";
			}
			return "";
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
		_setProvinceValue : function(value) {
			this._provinceValue.set(value);
			this._updatePickerValue('city');
		},
		_setCityValue : function(value) {
			this._cityValue.set(value);
			this._updatePickerValue('district');
		},
		_setDistrictValue : function(value) {
			this._districtValue.set(value);
		},
		getDistrict : function(name) {
			if (name === undefined)
				name = '中国';
			var ret = [];
			var datas = chineseDistricts[name];
			if (datas) {
				$.each(datas, function(code, v) {
					ret.push({
						name : v,
						code : code
					});
				});
			}
			return ret;
		},
		show: function(){
			this._createPickers();
			this.callParent();
		}		
	});

	justep.Component.register(url, Distpicker2);
	return Distpicker2;
});