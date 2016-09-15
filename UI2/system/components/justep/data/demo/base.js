/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Message = require("$UI/system/components/justep/common/common");
	var Data = require("../data");
	
	var Model = function() {
		this.callParent();
		this.isVisible = Message.flag;

		this.mainData = new Data(this, {
			xid : 'mainData',//和this.mainData一致
			defCols : {
				sID : {
					type : 'String',
					label : 'ID'
				},
				sName : {
					type : 'String',
					label : '名字',
					rules : {
						required : {
							params : true,
							message : '名字必须有值'
						}
					}
				},
				sAge : {
					type : 'Integer',
					label : '年龄'
				}
			},
			idColumn : 'sID'
		});
	};

	Model.prototype.modelLoad = function(event) {
	    //mainData新增两行数据
		this.comp('mainData').newData({defaultValues:[{sID:'001',sName:'xiaomin',sAge:18},{sID:'002',sName:'zhang',sAge:38}]});
		
		var masterData = this.comp('masterData');
		$.getJSON(require.toUrl('./base.json'), function(data) {
			masterData.newData({
				defaultValues : data
			});
		});
		var isPC = justep.Browser.isPC;
		if (!isPC) {
			this.comp("windowDialog").set({'status':'maximize'});
		}
	};

	Model.prototype.showBizDataSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/data/demo/base.w&xid=masterData"
		});
	};

	Model.prototype.showJsSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/components/justep/data/demo/base.js"
		});
	};

	return Model;
});