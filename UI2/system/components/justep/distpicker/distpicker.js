/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var url = require.normalizeName("./distpicker");
	var ComponentConfig = require("./distpicker.config");
	var provinceSelectUrl = require.normalizeName("./provinceSelect");
	var citySelectUrl = require.normalizeName("./citySelect");
	var districtSelectUrl = require.normalizeName("./districtSelect");

	var Distpicker = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		_get$Select : function(type){
			return this.$domNode.children('select[component$="/system/components/justep/distpicker/'+type+'Select"]');
		},
		getProvinceSelect : function(){
			var $select = this._getSelect('province');
			return $select.size()>0?this.getModel().comp($select[0]):null;
		},
		getCitySelect : function(){
			var $select = this._getSelect('city');
			return $select.size()>0?this.getModel().comp($select[0]):null;
		},
		getDistrictSelect : function(){
			var $select = this._getSelect('district');
			return $select.size()>0?this.getModel().comp($select[0]):null;
		},
		buildTemplate : function(cfg) {
			if (!cfg)
				cfg = {};
			this.set(cfg);
			/*
				<div component="$UI/system/components/justep/distpicker/distpicker" class="form-inline">
			      <select class="form-control" component="$UI/system/components/justep/distpicker/provinceSelect"/> 
			      <select class="form-control" component="$UI/system/components/justep/distpicker/citySelect"/>   
			      <select class="form-control" component="$UI/system/components/justep/distpicker/districtSelect"/>   
				</div> 
			 */
			var $ret = $("<div class='"
					+ (cfg['class']?cfg['class']:'') + "' " + (cfg.style ? (" style='" + cfg.style + "' ") : "")
					+ (cfg.xid ? (" xid='" + cfg.xid + "' ") : "") + " component='" + this.url
					+ "' " + " ></div>");
			if(cfg['bind-provinceRef']){
				$ret.append($("<select class='form-control' component='"+provinceSelectUrl+"'/>").attr('bind-ref',cfg['bind-provinceRef']));
				if(cfg['bind-cityRef']){
					$ret.append($("<select class='form-control' component='"+citySelectUrl+"'/>").attr({'bind-ref':cfg['bind-cityRef'],'bind-provinceRef':cfg['bind-provinceRef']}));
					if(cfg['bind-districtRef']){
						$ret.append($("<select class='form-control' component='"+districtSelectUrl+"'/>").attr({'bind-ref':cfg['bind-districtRef'],'bind-cityRef':cfg['bind-cityRef']}));
					}
				}
			}
			return $ret;
		}
	});

	justep.Component.register(url, Distpicker);
	return Distpicker;
});