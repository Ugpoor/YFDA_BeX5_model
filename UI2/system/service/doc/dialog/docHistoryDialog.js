define(function(require){
	var $ = require("jquery");
	var DocUtils = require('$UI/system/components/justep/docCommon/docUtil');
	var justep = require();
	
	
	var Model = function(){
		this.callParent();
	};
	
	var docHostPath;
	var fileID;
	var docAccess;
	var isPrintDoc = true;
	var currDocVersion ;
	var docID;
	var historyRecordData;

	Model.prototype.docHistoryDialogReceive = function(event){
		var data = event.data;
		fileID = data.fileID;
		docHostPath = data.docPath;
		docID = data.docID;
		historyRecordData = this.getComponent("historyRecord");
		historyRecordData.refreshData();
		this.initParam(data.access);				
		if(!(typeof data.isPrint === "undefined" || data.isPrint == null)) 	
			isPrintDoc = data.isPrint;	
	};
	
	Model.prototype.initParam = function(access){
		docAccess = typeof access === "undefined" || access == null ? 32768 : access;
	};
	
	Model.prototype.browseDocByType = function(type){
		var currentRow = historyRecordData.getCurrentRow();
		var docVersion = historyRecordData.getValue("sDocVersionID", currentRow);
		var docName = historyRecordData.getValue("sDocName", currentRow);
		DocUtils.InnerUtils.browseDocByFileID(docHostPath, docName, fileID, docVersion, type, 'History',isPrintDoc,this.getContext());
	};
	
	Model.prototype.browseDoc = function(type){
		this.browseDocByType("content");
	};
	
	Model.prototype.browseRevisionDoc = function(){
		var currentRow = historyRecordData.getCurrentRow();
		var docName = historyRecordData.getValue("sDocName", currentRow);
		if ('.doc.docx.xls.xlsx.ppt.mpp.vsd.'.indexOf(String(/\.[^\.]+$/.exec(docName)) + '.') >= 0) {
			this.browseDocByType("revision");
		}else {
			alert("“" + docName　+  "”不包含修订类型的文件");
		}
	};
	
	Model.prototype.deleteVersion = function(){
		var rowId = historyRecordData.getRowID(historyRecordData.getCurrentRow());
		DocUtils.InnerUtils.deleteVersion(docHostPath, fileID,rowId, '-1',this.getContext());
		historyRecordData.refreshData();
	};
	
	Model.prototype.deleteCurrentVersion = function(){
		var currentRow = historyRecordData.getCurrentRow();
		var docVersion = historyRecordData.getValue("sDocVersionID", currentRow);
		var rowId = historyRecordData.getRowID(currentRow);
		DocUtils.InnerUtils.deleteVersion(docHostPath, fileID,rowId, docVersion,this.getContext());
		historyRecordData.refreshData();
	};
	
	Model.prototype.downloadDoc = function(){
		var currentRow = historyRecordData.getCurrentRow();
		var docVersion = historyRecordData.getValue("sDocVersionID", currentRow);
		DocUtils.InnerUtils.downloadDocByFileID({
			docPath:docHostPath, 
			fileID:fileID, 
			docVersion:docVersion,
			context:this.getContext()
		});
	};
	
	Model.prototype.historyRecordCustomRefresh = function(event){
		if(docID){
			var response = DocUtils.InnerUtils.getAccessRecord({
				docID:docID,
				hasDownload:false,
				context:this.getContext()
			});
			historyRecordData.loadData(response);
		}
	};
	
	Model.prototype.tabItem2Select = function(event){
	};
	Model.prototype.li2Click = function(event){
		var currentRow = historyRecordData.getCurrentRow();
		var docVersion = historyRecordData.getValue("sDocVersionID", currentRow);
		if(!currentRow || docVersion == currDocVersion) 
			return;					
		currDocVersion = docVersion;
		var arr = DocUtils.InnerUtils.browseFileComment(docHostPath, fileID, docVersion,this.getContext());
		var a="";
		for(var i =0 ; i < arr.length ;i++){
			var item = arr[i];
			var revisionType ="其他操作";
			if(item.Type == 1){
				revisionType = "插入";
			}else if(item.Type == 2){
				revisionType = "删除";
			}						
			var content =item.Text?("\r\n内容:"+item.Text):'';
			a += "序号:"+item.Index+"; 操作类型:"+ revisionType +"; 修改人:"+item.Author+"; 修改时间:"+item.Date+";"+content+"\r\n\r\n";
		}
		$(this.getElementByXid('commentArea')).val(a);
	};
	return Model;
});
