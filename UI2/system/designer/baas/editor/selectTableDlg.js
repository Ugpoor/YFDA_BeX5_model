define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
	};

	Model.prototype.getSaveTable = function(){
		var ret = '';
		var dataTable = this.comp("dataTable");
		 dataTable.each(function(p){
			 if(p.row.val('checked')){
				 ret = p.row.val('name');
				 p.cancel = true;
			 }
		 });
		 return ret;
	};
	
	Model.prototype.toRow = function(){
		if(this.row){
			this.row.val('value',this.getSaveTable());
		}
	};
	
	Model.prototype.button1Click = function(event){
		this.toRow();
		this.owner.close();
	};

	Model.prototype.dataTableCustomRefresh = function(event){
		var tables = BAASModel.getTables(this.db);
		if(tables){
			var datas = [],self=this;
			$.each(tables, function(i,t){
				datas.push({name:t.name, checked:self.selectedTable===t.name, type:t.type});
			});
			event.source.loadData(datas);
		}
	};

	Model.prototype.modelParamsReceive = function(event){
		if(event.params.data.db){
			this.db = event.params.data.db;
			this.row = event.params.data.row;
			this.selectedTable = this.row&&this.row.val('value')?this.row.val('value'):null;
			this.comp('dataTable').refreshData();
		}else justep.Util.hint({text:'无效的db参数',type:'danger',delay:8000});
	};

	Model.prototype.dataTableValueChanged = function(event){
		if(event.col=='checked' && event.value==true){
			event.source.each(function(p){
				if(event.row!==p.row) p.row.val('checked',false);
			});
		}
	};

	Model.prototype.dataTables1RowClick = function(event){
		event.row.val('checked',true);
	};

	return Model;
});