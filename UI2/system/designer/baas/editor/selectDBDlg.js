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
		var dataTable = this.comp("dataDB");
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

	Model.prototype.dataDBCustomRefresh = function(event){
		var dbs = BAASModel.getDBs();
		if(dbs){
			var datas = [],self=this;
			$.each(dbs, function(n){
				datas.push({name:n, checked:self.selectedDB===n});
			});
			event.source.loadData(datas);
		}
	};

	Model.prototype.modelParamsReceive = function(event){
		if(event.params.data.row){
			this.row = event.params.data.row;
			this.selectedDB = this.row&&this.row.val('value')?this.row.val('value'):null;
			this.comp('dataDB').refreshData();
		}
	};

	Model.prototype.dataDBValueChanged = function(event){
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