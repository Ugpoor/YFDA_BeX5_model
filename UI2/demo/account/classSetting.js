define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.newBtnClick = function(event) {
		// 新增分类数据并给出默认值
		this.comp("classData").newData({
			"defaultValues" : [ {
				"fID" : justep.UUID.createUUID(),
				"fType" : "支出"
			} ]
		});
	};

	Model.prototype.deleteBtnClick = function(event) {
		// 行删除
		var row = event.bindingContext.$object;
		this.comp("classData").deleteData([ row ], {
			"async" : true
		});
	};

	Model.prototype.classDataAfterSave = function(event) {
		// 通过Shell发出一个消息，通知其他页面分类数据已改变，并且在消息中携带了改变后的分类数据
		var classData = this.comp("classData");
		justep.Shell.fireEvent("onClassChanged", {
			"classData" : classData.toJson()
		});
	};

	return Model;
});