define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
	};

	Model.prototype.getSaveWritable = function(){
		var ret = {},has=false;
		var dataTable = this.comp("dataTable"), dataFiled = this.comp("dataFiled");
		 dataTable.each(function(p){
			 if(p.row.val('checked')){
				 has=true;
				 var ss = [];
				 var fileds = dataFiled.find([ 'tableName','checked' ], [ p.row.val('name'), true ],false,false,false,true);
				 if(fileds.length>0){
					 $.each(fileds, function(i,filed){
						 ss.push(filed.val('name'));
					 });
					ret[p.row.val('name')] = ss.join(); 
				 }else ret[p.row.val('name')] = "";
			 }
		 });
		 return has?JSON.stringify(ret):null;
	};
	
	Model.prototype.toRow = function(){
		if(this.row){
			this.row.val('value',this.getSaveWritable());
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
				datas.push({name:t.name, checked:undefined!==self.defind[t.name]});
			});
			event.source.loadData(datas);
		}
	};

	Model.prototype.modelParamsReceive = function(event){
		if(event.params.data.db){
			this.db = event.params.data.db;
			this.row = event.params.data.row;
			this.defind = this.row&&this.row.val('value')?$.parseJSON(this.row.val('value')):{};
			this.comp('dataTable').refreshData();
		}else justep.Util.hint({text:'无效的db参数',type:'danger',delay:8000});
	};

	Model.prototype.dataFiledLoadSlave = function(event){
		if(event.masterRow){
			var tableName = event.masterRow.val('name');
			var defind = this.defind[tableName];
			defind = defind?defind.split(","):[];
			var fileds = BAASModel.getFileds(this.db, tableName);
			if(fileds){
				var datas = [];
				$.each(fileds, function(i,filed){
					datas.push({name:filed.name, info:filed.remarks, tableName:tableName, checked:($.inArray(filed.name,defind)>-1)});
				});
				event.source.loadData(datas,true);
			}
			event.loaded = true;
		}
	};

	return Model;
});