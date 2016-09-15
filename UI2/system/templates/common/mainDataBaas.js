define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");

	var Model = function() {
		
		this.callParent();
		this.services;
		this.type='service';

		this.serviceURL = justep.Bind.observable("");
		this.queryAction = justep.Bind.observable("");
		this.saveAction = justep.Bind.observable("");
		this.table = justep.Bind.observable("");
		this.db = justep.Bind.observable("");
		this.baasDataXid = justep.Bind.observable("mainData");
		
		this.actionType = justep.Bind.observable("query");
		this.filter = justep.Bind.observable("");
	};
	
	Model.prototype._recalcHeight = function() {
		var height = $("body").height() - $('.nav-row').height();
		$('.data-nav').height(height);
		$('.data-form').height(height);
	};
	
	

	Model.prototype.beforeOkAction = function() {
		if (!this.serviceURL.get())
			return '请选择BAAS Service';
	};


	Model.prototype.modelLoad = function(event) {
		this.templateEngine = this.getParent().templateEngine;
		this.templateFile = this.getContext().getRequestParameter("templateFile");
		
		this._recalcHeight();
		var self = this;
		$(window).resize(function() {
			self._recalcHeight();
		});
	};




	/** 校验方法，如果校验不通过返回错误提示--框架调用 */
	Model.prototype.validate = function(wizard) {
		
		var data = this.comp('mainData');
		var msg = "";
		if(!this.serviceURL.peek()){
			msg += '服务器URL不能为空 ';
		}if(!this.queryAction.peek()){
			msg += 'queryAction不能为空 ';
		}if(!this.table.peek()){
			msg += '表名不能为空 ';
		}
		return msg;
	};
	
	/** 完成时操作--框架调用 */
	Model.prototype.finish = function(wizard) {
		
		var dataXid = this.baasDataXid.peek();
		this.templateEngine.addContext(this.templateFile, "data_xid", dataXid?dataXid:'mianData');
		this.templateEngine.addContext(this.templateFile, "service_url", this.serviceURL.peek());
		this.templateEngine.addContext(this.templateFile, "query_action", this.queryAction.peek());
		this.templateEngine.addContext(this.templateFile, "save_action", this.saveAction.peek());
		this.templateEngine.addContext(this.templateFile, "table", this.table.peek());
	}


	Model.prototype.selectUrl = function(event){
		
		this.selectDialog('query')
	};
	
	Model.prototype.selectDialog = function(type){
/*		
		this.serviceURL.set('');
		this.queryAction.set('');
		this.saveAction.set('');
		this.table.set('');
		this.db.set('');*/
		this.comp('selectBaasDialog').open({params: {
			data:{
				actionType:type,
				serviceURL:this.serviceURL,
				queryAction:this.queryAction,
				saveAction:this.saveAction,
				table:this.table,
				db:this.db,
				baasDataXid:this.baasDataXid
				
			}
		}});
	};

	Model.prototype.selectTable = function(event){
		this.selectDialog('query');
	};

	Model.prototype.selectQueryAction = function(event){
		this.selectDialog('query');
	};

	Model.prototype.selectSaveAction = function(event){
		this.selectDialog('save');
	};

	return Model;
});