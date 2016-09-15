define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var DocUtils = require('$UI/system/components/justep/docCommon/docUtil');
	
	var Model = function(){
		this.callParent();
		window.bb = this;
	};

	Model.prototype.windowEnsureClick = function(event){
		var docNodeTree = this.comp("docNodeTree"); 
		var curRow = docNodeTree.getCurrentRow(); 
		var rootName = docNodeTree.getValue("sDocName",curRow); 
		var docPath = docNodeTree.getValue("sDocPath",curRow);
		var rootPath = DocUtils.InnerUtils.getDocFullPath(curRow.getID(), docPath); 
		var data = { rootName: rootName, rootPath: rootPath };
		this.comp("windowReceiver").windowEnsure(data);
	};
	
	Model.prototype.windowCancelClick = function(event){
		this.comp("windowReceiver").windowCancel();
	};
	
	return Model;
});