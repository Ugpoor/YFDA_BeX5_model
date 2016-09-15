define(function(require) {
	// var $ = require("jquery");
	// var justep = require("$UI/system/lib/justep");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var initData = xuiService.getPageParams();// 获取传入的参数
		var dataComp = this.comp("mainData");
		if(!initData.xml && initData.d_id){
			initData.xml = xuiDoc.getNodeByDId(initData.d_id);
		}

		// data列与xml节点属性值的映射
		var binding = {
			"name" : "@name",
			"url" : "@url",
			"title" : "@title"
		};
		var config = {
			xmlData : initData.xml,
			rowIdPath : "@xid", // 行id映射
			rowNodePath : "mapping", // 行节点映射
			idField : "xid", // data
			data : dataComp,// data组件
			binding : binding
		};
		this.xmlModel = xuiService.createXmlModel(config);
	};

	Model.prototype.beforeOkAction = function() {
		var data = this.comp('mainData');
		
		if (!data.isValid())
			return data.getInvalidInfo();
	};

	Model.prototype.getReturnValue = function() {
		var mapping = [];
		mapping = this.xmlModel.childAsArray();
		return {
			mapping : mapping
		};
	};

	Model.prototype.fileClick = function(event){
		this.comp('dlgFile').open();
	};

	Model.prototype.dlgFileReceive = function(event){
		var data = this.comp('mainData');
		var file = event.data.file;
		data.setValue('url',file);
	};

	return Model;
});