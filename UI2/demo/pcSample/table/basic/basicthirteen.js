define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.callParent();
		this.isVisible= util.flag;
	};
	
	//源码
	Model.prototype.jsButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basicthirteen.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basicthirteen.w&xid=controlGroup1"
		},true);
	};

	return Model;
});