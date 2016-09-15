/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	//var $ = require("jquery");
	require("res!./img");
	var justep = require("$UI/system/lib/justep");
	var Message = require("$UI/system/components/justep/common/common");

	var Model = function(){
		this.callParent();
		this.isVisible = Message.flag;
	};

	Model.prototype.closeWin = function(event){
		justep.Shell.closePage();
	};

	Model.prototype.showListSource = function(event){
		var activeXid = this.comp("contents").getActiveXid();
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/list/demo/list.w&xid="+('orgImgContent'==activeXid?"orgList":"newsList")
		});
	};

	Model.prototype.getImageUrl = function(row){
		return require.toUrl(row.val('fImage'));
	};
	
	Model.prototype.modelLoad = function(event){
		var isPC = justep.Browser.isPC;
		if (!isPC) {
			this.comp("windowDialog").set({'status':'maximize'});
		}
	};
	
	Model.prototype.getTexts = function(){
		var data = this.comp('newsData');
		var ret = [];
		data.each(function(param){
		  var row = param.row;
		  var fTitle = row.val('fTitle')||'';
		  //不显示fTitle中包含2的数据
		  if(fTitle.indexOf('2')<0) ret.push(row);
		});
		return ret;
	};
	
	return Model;
});