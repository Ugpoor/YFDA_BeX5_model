define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	

	Model.prototype.windowEnsureClick = function(event){
		var docNodeList = this.comp("docNodeList");
		var currentRow = docNodeList.getCurrentRow();
		if(currentRow == null){
			this.comp("selectTmpDialog").windowCancel();
			return;
		}
		var docId = currentRow.getID();
		var fileID = docNodeList.getValue("sFileID")
		var docName = docNodeList.getValue("sDocName");
		var docPath = docNodeList.getValue("sDocPath");
		this.comp("selectTmpDialog").windowEnsure({docId:docId,docName:docName,docPath:docPath,fileID:fileID});
	};	

	return Model;
});
