define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.isVisible = util.flag;
		this.callParent();
	};

	Model.prototype.dictionaryDataCustomRefresh = function(event){
		var dictionaryData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./json/dictionary.json'),
            dataType: 'json',
            async: false,
            cache: false,
            success: function(data){
            	dictionaryData.loadData(data);
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });
	};

	Model.prototype.recordDataCustomRefresh = function(event){
		var recordData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./json/record.json'),
            dataType: 'json',
            async: false,
            cache: false,
            success: function(data){
            	recordData.loadData(data);
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });
	};
	//js代码
	Model.prototype.showjsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/dictionary_maintenance.js"
		},true);
	};
	//源码
	Model.prototype.showSource = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/dictionary_maintenance.w&xid=window"
		},true);
	};

	Model.prototype.showDataMaintenanceSource = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/dictionary_maintenance.w&xid=dataMaintenance"
		},true);
	};

	return Model;
});