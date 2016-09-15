define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");

	var Model = function() {
		this.callParent();
		this.services;

		this.actionType = justep.Bind.observable("all");
		this.filter = justep.Bind.observable("");
		this.initOK = justep.Bind.observable(false);
		
		this.canReturn = justep.Bind.computed(function(){
			if(!this.initOK.get()) return false;
			return !!this.comp("dataService").getCurrentRow();
		},this);
	};

	Model.prototype.modelLoad = function(event) {
		this.services = BAASModel.getServices();
		this.comp('dataService').refreshData();
		
		//监控filter变化
		this.filter.subscribe(function(){
			this.comp('dataService').refreshData();
		},this);
		
		this.initOK.set(true);
	};

	Model.prototype.dataServiceCustomRefresh = function(event) {
		if (this.services) {
			var datas = [],model=this;			
			$.each(this.services, function(path, service) {
				var actionType = model.actionType.get();
				var filter = model.filter.get();
				var actions = service.actions;
				if (actions) {
					$.each(actions, function(i, action) {
						if(actionType==='query' && action.name.indexOf('query')<0) return;
						else if(actionType==='save' && action.name.indexOf('save')<0) return; 
						//不区分大小写  
						if(filter && (path+"/"+action.name).toLowerCase().indexOf(filter.toLowerCase())<0) return; 
						var table = action.privateParams && action.privateParams['tableName'] ? action.privateParams['tableName'].value : "";
						datas.push({
							path : path,
							action : action.name,
							table : table
						});
					});
				}
			});
			event.source.loadData(datas);
		} else
			event.source.clear();
	};

	Model.prototype.select1Change = function(event){
		this.comp('dataService').refreshData();
	};

	Model.prototype.button1Click = function(event){
		var row = this.comp('dataService').getCurrentRow(true);
		if(row){
			this.owner.send({service:row.val("path"),action:row.val("action")});
			this.owner.close();
		}
	};

	return Model;
});