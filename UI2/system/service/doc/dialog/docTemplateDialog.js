define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiver1Receive = function(event){
		var initData = event.data;
	    var templateList = this.comp("attachmentTemplate");
	    for(var i=0 ;i < initData.length; i++){
		    var row = initData[i];
		    templateList.newData({defaultValues:[{sDocId:row.sDocId,sDocName:row.sDocName,sFileId:row.sFileId,sDocPath:row.sDocPath}]});
		}
	};
	
	Model.prototype.getTemplateData = function(event){
 		var attachmentTemplate = this.comp("attachmentTemplate");
		var data = {
			templateDocName: attachmentTemplate.getValue("sDocName"),
			templateHost: attachmentTemplate.getValue("sDocPath"),
			templateFileID: attachmentTemplate.getValue("sFileId"),
			templateID: attachmentTemplate.getValue("sDocId")
		};
		return data;
	};

	Model.prototype.windowEnsureClick = function(event){
		this.comp('windowReceiver1').windowEnsure(this.getTemplateData())
	};

	return Model;
});