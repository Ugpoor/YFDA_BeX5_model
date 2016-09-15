define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.callParent();
	};
	Model.prototype.jsClick = function(event){
		 util.showSource({
         self : this,
         data : "demo/pcSample/navigator/basic-staticFlow.js"
     },true);
    
	};	

	Model.prototype.sourceClick = function(event){
		util.showSource({
	   self : this,
	   type : true,
	   data : "demo/pcSample/navigator/basic-staticFlow.w&xid=window"
	  },true);
	};	
	return Model;
});