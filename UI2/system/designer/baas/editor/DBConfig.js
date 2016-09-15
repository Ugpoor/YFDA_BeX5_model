define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var XML = require("$UI/system/lib/base/xml");
	var docService = require("$UI/system/designer/baas/docService");// 文档服务
	//var BAASModel = require("$UI/system/designer/baas/BAASModel");
	
	var Model = function(){
		this.callParent();
		this.DBConfigDom;
	};

	// 加载xml
	Model.prototype.initXML = function() {
		this.DBConfigDom = XML.fromString(docService.getContent());
		
		//this.DBConfigDom = XML.fromString('<?xml version="1.0" encoding="utf-8"?><model><datasource name="takeout" value="java:comp/env/takeout" /></model>');
	};

	// 保存xml
	Model.prototype.saveXML = function() {
		this.updateDBConfigDom();
		var str = this.DBConfig2String();
		//console.log(str);
		docService.setContent(str);
	};

	Model.prototype.modelModelConstruct = function(event){
		this.initXML();
		//BAASModel.loadBaasModel();//页面打开加载一次
	};

	//调接口获取设计时DB
	Model.prototype.getDBs = function(){
		var ret = [];
		var dbs = docService.getDsNames();
		if(dbs){
			dbs = dbs.split(",");
			$.each(dbs,function(i,v){
				ret.push({name:v});
			});
		}
		return ret;
	};
	
	Model.prototype.DBConfig2String = function(){
		var ret = XML.toString(this.DBConfigDom);
		return ret;
	};
	
	Model.prototype.updateDBConfigDom = function() {
		var $dom = this.$DbDom();
		$dom.empty();
		var data = this.comp("dataDB");
		data.each(function(param) {
			var row = param.row;
			if(row.val('checked')){
				var name = row.val('name');
				$(justep.String.format('<datasource name="{0}" value="java:comp/env/{0}" />', name)).appendTo($dom);
				//此处必须用appendTo，不能用append否在在safari浏览器上运行会出问题 zmh 20160106
			}
		});
	};
	
	Model.prototype.$DbDom = function(){
		return $(this.DBConfigDom.documentElement);
	};
	
	Model.prototype.loadDBByXML = function(dbs) {
		var data = [];
		if (!this.DBConfigDom)
			return;
		this.$DbDom().children("datasource").each(function() {
			var $datasource = $(this);
			var db = $datasource.attr('name');
			$.each(dbs, function(i,v){
				if(db==v.name) v.checked = true;
			});
		});
	};

	//加载db数据
	Model.prototype.dataDBCustomRefresh = function(event){
		var dbs = this.getDBs();
		this.loadDBByXML(dbs);
		this.comp("dataDB").loadData(dbs);
	};

	Model.prototype.dataDBValueChanged = function(event){
		this.saveXML();
	};

	return Model;
});