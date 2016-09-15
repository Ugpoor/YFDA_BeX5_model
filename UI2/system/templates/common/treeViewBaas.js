define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var templateService = require("$UI/system/templates/common/js/templateService");
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.templateEngine = this.getParent().templateEngine;
		this.templateFile = this.getContext().getRequestParameter("templateFile");
		this.templateFilePath = this.templateEngine.templatePath + "/" + this.templateFile;
		var treeData = this.getTreeData();
		treeData.newData({
			defaultValues : [ {
				id : "id1"
			} ]
		});
		treeData.first();
//		this._addSelectData();
	};
	
	

	Model.prototype.getTreeData = function() {
		return this.comp("treeData");
	}

	Model.prototype.validate = function(wizard) {
		var data = this.getTreeData();
		var msg = "";
		data.each(function(p) {
			var row = p.row;
			var parentRelation = data.getValue("parentRelation",row);
			var treeNodeName = data.getValue("treeNodeName",row);
			if (treeNodeName === 'undefined') {
				msg += "树节点名称(*):不能为空，";
			}
			if (parentRelation === 'undefined') {
				msg += "parent-relation(*):不能为空，";
			}
		})
		return msg;
	};

	Model.prototype.finish = function(wizard) {
		var config = this.templateEngine.getConfig();
		var xid = config.current.baasDataXid ? config.current.baasDataXid : "mainData";
		var treeData = this.getTreeData();
		var tree = [];
		treeData.each(function(param) {
			var row = param.row;
			var parentRelation = row.val("parentRelation");
			var rootNodeLable = row.val("rootNodeLable");
			var treeNodeName = row.val("treeNodeName");
			var nodeKindRelation = row.val("nodeKindRelation");
			var nodeLevelRelation = row.val("nodeLevelRelation");
			var rootFilter = row.val("rootFilter");
			tree.push({
				"data_xid"  : xid,
				"parent_relation" : parentRelation,
				"root_nodeLable" : rootNodeLable,
				"tree_nodeName" : treeNodeName,
				"node_kindRelation" : nodeKindRelation,
				"node_levelRelation" : nodeLevelRelation,
				"root_filter" : rootFilter,
			})
		})
		this.templateEngine.addContext(this.templateFile, "tree", tree);
	};
	
	Model.prototype.selectColumn = function(type){
		
		var config = this.templateEngine.getConfig();
		var db = config.current ? config.current.db :'';
		var table = config.current ? config.current.table :'';
		
		this.comp('windowDialog').open({
			data:{
				db:db,
				table:table,
				type:type
			}
		});

	};
	//0表示树节点名称，1表示父关系，2表示节点类型
	Model.prototype.selectRootLabel = function(event){
		this.selectColumn(0);
	};
	Model.prototype.selectParentRelation = function(event){
		this.selectColumn(1);
	};
	Model.prototype.selectNodeKind = function(event){
		this.selectColumn(2);
	};

	Model.prototype.windowDialogReceive = function(event){
		var data = this.comp('treeData');
		var type = event.data.type; 
		var columnName = event.data.columnName; 
			switch(type){
			case 0:
				data.setValue('treeNodeName',columnName);
				break;
			case 1:
				data.setValue('parentRelation',columnName);
				break;
			case 2:
				data.setValue('nodeKindRelation',columnName);
				break;
		}
	};

	return Model;
});