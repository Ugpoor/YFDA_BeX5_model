define(function(require){
	var Util = require("$UI/system/components/justep/common/common");
	//var $ = require("jquery");
	//var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.isVisible = Util.flag;
	};

	Model.prototype.showJsSource = function(event) {
		Util.showSource({data:'system/components/fragment/list/demo/listTable.js',self : this});
	};

	Model.prototype.showSource = function(event) {
		Util.showSource({data:'system/components/fragment/list/demo/listTable.w&xid=listTable1',self : this,type:true});
	};

	return Model;
});