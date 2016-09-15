define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");

	var Model = function() {
		this.callParent();
		this.services;
		this.type;

		this.serviceURL = justep.Bind.observable("");
		this.queryAction = justep.Bind.observable("");
		this.saveAction = justep.Bind.observable("");
		this.table = justep.Bind.observable("");
		
		this.actionType = justep.Bind.observable("query");
		this.filter = justep.Bind.observable("");
	};

	Model.prototype.beforeOkAction = function() {
		if (!this.serviceURL.get())
			return '请选择BAAS Service';
	};

	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function() {
		return {
			url : this.serviceURL.peek(),
			queryAction : this.queryAction.peek(),
			tableName: this.table.peek(),
			saveAction: this.saveAction.peek()
		};
	};

	Model.prototype.initValue = function(did) {
		var xuiDoc = xuiService.getXuiDoc();
		this.table.set(xuiDoc.get(did,"tableName"));
		this.serviceURL.set(xuiDoc.get(did,"url"));
		this.queryAction.set(xuiDoc.get(did,"queryAction"));
		this.saveAction.set(xuiDoc.get(did,"saveAction"));
	};

	Model.prototype.initConfig = function(cfg) {
		this.type = cfg.type;
		if(this.type!=='service') this.actionType.set('save');
	};

	Model.prototype.modelLoad = function(event) {
		var initData = xuiService.getPageParams();// 获取初始化数据
		// 初始化配置
		this.initConfig(initData.editorParameter);
		// 初始化原始值
		this.initValue(initData.d_id);

		//每次打开都重新加载baas模型
		BAASModel.loadBaasModel();
		this.services = BAASModel.getServices();
		this.comp('dataService').refreshData();
		
		//监控filter变化
		this.filter.subscribe(function(){
			this.comp('dataService').refreshData();
		},this);
	};

	Model.prototype.dataServiceCustomRefresh = function(event) {
		if (this.services) {
			var datas = [],type=this.type,model=this;			
			$.each(this.services, function(path, service) {
				if(type!=='service' && path!==model.serviceURL.peek()) return;
				var actionType = model.actionType.get();
				var filter = model.filter.get();
				var actions = service.actions;
				if (actions) {
					$.each(actions, function(i, action) {
						if(action.private) return;//禁用的不提供选择
						if(actionType==='query' && action.name.indexOf('query')<0 && 'action:common/CRUD/query'!=action.impl && 'action:common/sqlQuery'!=action.impl) return;
						else if(actionType==='save' && action.name.indexOf('save')<0 && 'action:common/CRUD/save'!=action.impl) return; 
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

	Model.prototype.tr8Click = function(event) {
		event.bindingContext.$object.val("checked", true);
	};

	Model.prototype.getSaveActionByTable = function(serviceURL,table){
		var service = this.services[serviceURL];
		var ret;
		if(service && $.isArray(service.actions)){
			var saveAction = "save" + table.substring(0, 1).toUpperCase() + table.substring(1);
			$.each(service.actions, function(i,action){
				if(action.name == saveAction){
					ret = action.name;
					return false;
				}
			});
		}
		return ret;
	};
	
	Model.prototype.dataServiceValueChanged = function(event) {
		if ("checked" == event.col && true === event.value) {
			//目前radio组件同name的不能出发onchange事件，通过下面代码进行处理
			event.source.each(function(p){
				if(p.row!==event.row) p.row.val("checked",false); 
			});
			if (this.type == "service") {
				var serviceURL = event.row.val("path"),table = event.row.val("table");
				this.serviceURL.set(serviceURL);
				this.queryAction.set(event.row.val("action"));
				this.table.set(table);
				var saveAction = this.getSaveActionByTable(serviceURL,table);
				if(saveAction) this.saveAction.set(saveAction); 
			}else{
				this.saveAction.set(event.row.val("action"));
			}
		}
	};

	Model.prototype.select1Change = function(event){
		this.comp('dataService').refreshData();
	};

	return Model;
});