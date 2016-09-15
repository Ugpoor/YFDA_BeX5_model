define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

/*
	event.data = {
		selectedFilter : 已经选中的节点
		roots : UI,mobileUI,UI2 菜单根目录
		files : .function.xml,.function.m.xml 菜单文件类型 
		identity : true | false 单数据是否合并（process、activity、path相同）
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		this.selectedFilter = (event.data && event.data.selectedFilter) ? new justep.Express(event.data.selectedFilter) : null;
		
		this.roots = (event.data && event.data.roots) ? "&roots=" + event.data.roots : "";
		this.files = (event.data && event.data.files) ? "&files=" + event.data.files : "";
		this.identity = (event.data && event.data.identity) ? "&identity=true" : "&identity=false";
		this.type = (event.data && event.data.type) ? "&type=" + event.data.type : "";
		var treeData = this.comp("treeData"); 
		var treeGrid = this.comp("treeGrid");
		
		if (!treeData.isLoaded()) {
			treeData.refreshData();
		}else{
		}
		
		
		
		if (treeGrid.getCheckeds()) {
			$.each(treeGrid.getCheckeds(), function(i, id) {
				treeGrid.setRowChecked(id, false);
			});
		}
		
		if (this.selectedFilter){
			var self = this;
			treeData.each(function(params){
				var row = params.row;
				if (self.doSelectedFilter(row)){
					treeGrid.setRowChecked(row.getID(), true);
				}
			});
		}
	};
	
	Model.prototype.doSelectedFilter = function(row){
		if (this.selectedFilter){
			var ctx = {
				$model : this,
				$row : row
			};
			return justep.Express.eval(this.selectedFilter, ctx.$row, ctx);
		}
		return false;
	};
	
	
	

	Model.prototype.treeDataCustomRefresh = function(event){
		biz.Request.sendHttpRequest({
			"contentType" : "application/json",
			"url" : require.toUrl("$UI/SA/OPM/dialogs/selectFunction/getFunctionData.j?mode=tree" + this.roots + this.files + this.identity + this.type), 
			"callback" : function(xhr, ts) {
				if (biz.Request.isSuccess(xhr)) {
					event.source.loadData(xhr.responseJSON);
				}
			}
		});
	};

	Model.prototype.listDataCustomRefresh = function(event){
		biz.Request.sendHttpRequest({
			"contentType" : "application/json",
			"url" : require.toUrl("$UI/SA/OPM/dialogs/selectFunction/getFunctionData.j?mode=list" + this.roots + this.files + this.identity + this.type), 
			"callback" : function(xhr, ts) {
				if (biz.Request.isSuccess(xhr)) {
					event.source.loadData(xhr.responseJSON);
				}
			}
		});
	};

	Model.prototype.okBtnClick = function(event){
		var treeData = this.comp("treeData");
		var treeGrid = this.comp("treeGrid");
		var rows = [];
		var self = this;
		$.each(treeGrid.getCheckeds(), function(i, id) {
			var row = treeData.getRowByID(id);
			if (!row.val("isFolder") && !self.doSelectedFilter(row)) {
				rows.push(row);
			}
		});
		this.comp("windowReceiver").windowEnsure(rows);
	};

	return Model;
});