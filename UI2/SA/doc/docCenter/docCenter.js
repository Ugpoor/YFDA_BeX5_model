define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Uploader = require('$UI/system/components/justep/uploader/uploader');
	var DocUtils = require('$UI/system/components/justep/docCommon/docUtil');
	var DocDialog = require('$UI/system/components/justep/docCommon/docDialog');
	
	var Model = function() {
		this.callParent();
		this.changeLog = null;
		this.docAuthList = null;
		this.docAuthListArr = null;
		this.currentRootAccess = null;
	};
	
	Model.prototype.docNodeTreeAfterNew = function(event) {
		var currentRow = event.source.getCurrentRow();
		var parentID = currentRow.val('sParentID');
		var parentRow = event.source.getRowByID(parentID);
		var newDirDocPath = DocUtils.InnerUtils.getDocFullPath(parentID, parentRow.val("sDocPath"));
		var newDirDocDisplayPath = DocUtils.InnerUtils.getDocFullDisplayPath(parentRow.val("sDocName"), parentRow.val("sDocDisplayPath"));
		currentRow.val("sDocName", "新建文件夹");
		currentRow.val("sKind", "dir");
		currentRow.val("sDocPath", newDirDocPath);
		currentRow.val("sDocDisplayPath", newDirDocDisplayPath);
		currentRow.val("sCreatorFID", this.getContext().getCurrentPersonMemberFID());
		currentRow.val("sCreatorName", this.getContext().getCurrentPersonName());
		currentRow.val("sCreatorDeptName", this.getContext().getCurrentDeptName() ? this.getContext().getCurrentDeptName() : "");
		currentRow.val("sCreateTime", new Date());
		currentRow.val("sLastWriterFID", this.getContext().getCurrentPersonMemberFID());
		currentRow.val("sLastWriterName", this.getContext().getCurrentPersonName());
		currentRow.val("sLastWriterDeptName", this.getContext().getCurrentDeptName() ? this.getContext().getCurrentDeptName() : "");
		currentRow.val("sLastWriteTime", new Date());
		currentRow.val("sFlag", "1");
		event.source.saveData();
	};

	Model.prototype.docNodeTreeAfterDelete = function(event) {
		event.source.saveData();
	};

	Model.prototype.commit = function(changeLog) {
		var docNodeTree = this.comp("docNodeTree");
		var docPath = DocUtils.InnerUtils.getDocFullPath(docNodeTree.getCurrentRowID(), docNodeTree.getValue("sDocPath"));
		return DocUtils.InnerUtils.commitDoc(changeLog, docPath);
	};

	Model.prototype.upload = function(docName, kind, size, cacheName, revisionCacheName, commentFileContent) {
		var docNodeTree = this.comp("docNodeTree");
		var docNodeList = this.comp("docNodeList");
		var docID = (new justep.UUID()).valueOf();
		var parentID = docNodeTree.getCurrentRowID();
		var docPath = DocUtils.InnerUtils.getDocFullPath(docNodeTree.getCurrentRowID(), docNodeTree.getValue("sDocPath"));
		var displayPath = DocUtils.InnerUtils.getDocFullDisplayPath(docNodeTree.getValue('sDocName'), docNodeTree.getValue('sDocDisplayPath'));
		changeLog = {
			items : [],
			autoCreateVersion : true,
			"operate" : "",
			"url" : ""
		};

		DocUtils.InnerUtils.addChangeLog(changeLog, "new", [ docID, "0", "", "", docName, kind, size, parentID, docPath, displayPath, "", "", "", "", "" ], [ "document", cacheName, revisionCacheName,
				commentFileContent ], undefined, this.getContext());

		var items = this.commit(changeLog).rows;
		var fileID = items[0].sFileID.value;
		var docVersionID = items[0].sDocLiveVersionID.value;
		DocUtils.InnerUtils.updateChangeLog(changeLog, docID, fileID, docVersionID);
		docNodeList.newData({
			defaultValues : [ {
				"SA_DocNode" : docID
			} ]
		});
		docNodeList.setValue("sDocName", docName);
		docNodeList.setValue("sParentID", parentID);
		docNodeList.setValue("sKind", kind);
		docNodeList.setValue("sSize", size);
		docNodeList.setValue("sDocPath", docPath);
		docNodeList.setValue("sDocDisplayPath", displayPath);
		docNodeList.setValue("sCreatorFID", this.getContext().getCurrentPersonMemberFID());
		docNodeList.setValue("sCreatorName", this.getContext().getCurrentPersonName());
		docNodeList.setValue("sCreatorDeptName", this.getContext().getCurrentDeptName() ? this.getContext().getCurrentDeptName() : "");
		docNodeList.setValue("sCreateTime", new Date());
		docNodeList.setValue("sLastWriterFID", this.getContext().getCurrentPersonMemberFID());
		docNodeList.setValue("sLastWriterName", this.getContext().getCurrentPersonName());
		docNodeList.setValue("sLastWriterDeptName", this.getContext().getCurrentDeptName() ? this.getContext().getCurrentDeptName() : "");
		docNodeList.setValue("sLastWriteTime", new Date());
		docNodeList.setValue("sFileID", fileID);
		docNodeList.setValue("sDocLiveVersionID", docVersionID);
		docNodeList.setValue("sFlag", "1");
		docNodeList.saveData();
		DocUtils.InnerUtils.commitDocFlag(changeLog);
	};

	Model.prototype.modelModelConstructDone = function(event) {
		var self = this;
		self.uploader = new Uploader(this.getElementByXid('uploadBtn'));
		
		var docNodeTree = this.comp('docNodeTree');
		var docPath = DocUtils.InnerUtils.getDocFullPath(docNodeTree.getCurrentRowID(), docNodeTree.getValue("sDocPath"));

		self.uploader.on('onStart', function(data) {
			var actionUrl = DocUtils.InnerUtils.getdocServerAction({
				"docPath" : docPath,
				urlPattern : "/repository/file/cache/upload",
				isFormAction : true,
				context : self.getContext()
			});
			self.uploader.actionUrl = actionUrl;
		});

		self.uploader.on('onSuccess', function(data, fileName) {
			// data.response 为 ResponseXML
			var file = $(data.response).find("file");
			var kind = $(file).attr("mediatype");
			var cacheName = $(file).attr("file-name");
			var size = $(file).attr("fileSize");
			self.upload(fileName, kind, size, cacheName);
		});
		this.docNodeTreeIndexChanged();

	};

	Model.prototype.docNodeListAfterDelete = function(event){
		this.comp('docNodeList').saveData();
	};
	
	Model.prototype.editBtnClick = function(event){
		var self = this;
		if (!DocUtils.InnerUtils.checkOcx()){
			return;
		}
		var docFullPath = DocUtils.InnerUtils.getDocFullPath(this.comp("docNodeTree").getCurrentRowID(), this.comp("docNodeTree").getValue("sDocPath"));
		var OVP = {
			// host: getHost(docFullPath),
			host: docFullPath,	
			userName : this.getContext().getCurrentPersonName() + (this.getContext().getCurrentDeptName()?this.getContext().getCurrentDeptName():"") ,
			userInitials : this.getContext().getCurrentPersonName(),
			programID: "OpenOffice",
			filename: this.comp("docNodeTree").getValue("sDocName"),
			showField: true,
			isPrint : true
		};
		var docNodeList = this.comp("docNodeList");
		var filename = docNodeList.getValue("sDocName");
		OVP.filename = filename.substr(0, filename.lastIndexOf('.'));
		OVP.fileID = docNodeList.getValue("sFileID");
		OVP.fileExt = String(/\.[^\.]+$/.exec(filename));
		if ('.doc.docx.xls.xlsx.ppt.mpp.vsd.'.indexOf(OVP.fileExt + '.') >= 0) {
			var cacheInfo =DocUtils.InnerUtils.queryDocCache(docNodeList.getCurrentRowID());
			if(cacheInfo.isLockSuccess=="success"||cacheInfo.isLockSuccess=="noNeedLock"){
				OVP.cacheName =cacheInfo.sCacheName; 
				OVP.revisionCacheName = cacheInfo.sRevisionCacheName;
				document.lastOperation=cacheInfo.isLockSuccess;
			}else if(cacheInfo.isLockSuccess=="failure"){
				alert("该文件正在被别人编辑,您不能编辑，只能浏览最新版本");
				return;
			}
			var callback = function(event) {
				var data = event.data;
				if (data.type == "officeAction") {
					if (data.changes != 'W10=') {
						document.lastOperation="noNeedLock";
						self.update(data.filename, data.mediatype,data.size, data.cacheName, data.revisionCacheName, data.changes,data.createVersion);
					} else {
						if (document.lastOperation == "success") {
							DocUtils.InnerUtils.unLockDoc(docNodeList.getCurrentRowID());
						}
					}
				}
			};	
			DocDialog.openOfficeEditorDialog(callback,OVP,this);
		}else{
			justep.Util.hint("当前文件不支持在线编辑");
		}
	};
	
	Model.prototype.update = function(docName, kind, size, cacheName, revisionCacheName, commentFileContent,createVersion){
		var docNodeList = this.comp("docNodeList");
		var docID = docNodeList.getCurrentRowID();
		var version = docNodeList.getValue("version");
		var fileID = docNodeList.getValue("sFileID");
		var parentID = docNodeList.getValue("sParentID");
		var docPath = docNodeList.getValue("sDocPath");
		var displayPath	= docNodeList.getValue("sDocDisplayPath");
		var description = docNodeList.getValue("sDescription"); 
		var classification = docNodeList.getValue("sClassification");
		var keywords = docNodeList.getValue("sKeywords"); 
		var finishTime = docNodeList.getValue("sFinishTime");
		var serialNumber = docNodeList.getValue("sDocSerialNumber");
		var docVersionID = docNodeList.getValue("sDocLiveVersionID");
		
		docNodeList.setValue("sDocName",docName);
		docNodeList.setValue("sParentID",parentID);
		docNodeList.setValue("sKind",kind);
		docNodeList.setValue("sSize",size);
		docNodeList.setValue("sLastWriterFID",this.getContext().getCurrentPersonMemberFID());
		docNodeList.setValue("sLastWriterName",this.getContext().getCurrentPersonName());
		docNodeList.setValue("sLastWriterDeptName",this.getContext().getCurrentDeptName()?this.getContext().getCurrentDeptName():"");
		docNodeList.setValue("sLastWriteTime",new Date());
		docNodeList.saveData();
		
		changeLog = {items:[],autoCreateVersion:true,"operate":"","url":""};
		DocUtils.InnerUtils.addChangeLog(changeLog, "edit", [docID, version, fileID, docVersionID, docName, kind, size, parentID, docPath, displayPath, description, classification, keywords, finishTime, serialNumber], ["document", cacheName, revisionCacheName, commentFileContent],undefined,this.getContext());
		if('W10='!=commentFileContent){
			DocUtils.InnerUtils.commitDocCache(docID,changeLog);
		}
		if(!!createVersion){
			// ocx控件挡住了成文状态的提示信息，所以不提示原因
			DocUtils.InnerUtils.createVersion(docID);
		}
		docNodeList.refreshData();
	};
	
	Model.prototype.lockDoc = function(){
		var docNodeList = this.comp("docNodeList");
		if(docNodeList.getCurrentRowID()){
			DocUtils.InnerUtils.lockDoc(docNodeList.getCurrentRowID(),this.getContext());
		}
		docNodeList.refreshData();
	};

	Model.prototype.unlockDoc = function(){
		var docNodeList = this.comp("docNodeList");
		if(docNodeList.getCurrentRowID()){
			if(confirm('强行解锁会造成当前锁定人已经编辑的东西丢失,你确定继续吗？')){
				docNodeList.setValue("sCacheName","");
				docNodeList.setValue("sRevisionCacheName","");
				docNodeList.setValue("sEditorFID", "");
				docNodeList.setValue("sEditorName", "");
				docNodeList.setValue("sEditorDeptName", "");
				docNodeList.saveData();
			}
		}
		docNodeList.refreshData();
	};
	
	Model.prototype.docListDataTablesCellRender = function(event){
		if(event.colName === "isLock"){
			var sEditorFID = event.row.val('sEditorFID');
			if(!(sEditorFID === "" || sEditorFID === undefined)){
				event.html = '<i class="icon-locked"></i>';
			}
		}
	};
	
	Model.prototype.downloadDoc = function(event){
		var docNodeList = this.comp("docNodeList");
		var docPath = docNodeList.getValue("sDocPath");
		var fileID = docNodeList.getValue("sFileID");
		DocUtils.InnerUtils.downloadDocByFileID({
			docPath:docPath,
			fileID:fileID,
			context:this.getContext()
		});
	};
	
	Model.prototype.browseDoc = function(event){
		var docNodeList = this.comp("docNodeList");
		var docPath = docNodeList.getValue("sDocPath");
		var rowId = docNodeList.getCurrentRowID();
		var docFullPath = DocUtils.InnerUtils.getDocFullPath(rowId, docPath);
		var filename = docNodeList.getValue("sDocName");
		var fileID = docNodeList.getValue("sFileID");
		DocUtils.InnerUtils.browseDocByFileID(docPath, filename, fileID, "last", "content", 'OpenOffice',false,this.getContext());
	};
	
	Model.prototype.showHistoryRecordDialog = function(event){
		var docNodeList = this.comp("docNodeList");
		var docID = docNodeList.getCurrentRowID();
		var fileID = docNodeList.getValue("sFileID");
		var docPath = docNodeList.getValue("sDocPath");
	
		var docFullPath = DocUtils.InnerUtils.getDocFullPath(docID, docPath);
		DocDialog.openDocHistoryDialog(docID, fileID, docPath,16384);
		
		
	};
	
	Model.prototype.getDocAuthList = function(){
		this.docAuthList = DocUtils.InnerUtils.getDocAuthList(this.getContext());
		if(!this.docAuthListArr) {
			this.docAuthListArr = {};
		}
		//将文档权限列表转换为ObjectMap
		
		for(var deptFID in this.docAuthList) {
			var authItems = this.docAuthList[deptFID];
			var deptAuth = new Array();
			var i=0;
			for(var authId in authItems) {
				var authItem = authItems[authId];
				deptAuth[i] = {"authId":authId,"sDocPath":authItem.sDocPath,"sAuthorizeeFID" : authItem.sAuthorizeeFID,"sAccess":authItem.sAccess};
				i++;
			}
			this.docAuthListArr[deptFID] = deptAuth;
		}
	}
	
	Model.prototype.getTreeIndexChangedAccess = function(docFullPath){
		var access = 1;	
		for(var item in this.docAuthListArr){
			var docAccess = null;
			while(docFullPath){
				$.each(this.docAuthListArr[item],function(n,value){
					if(value.sDocPath == docFullPath){
						docAccess = value.sAccess;
						return false;
					}
				});
				if(docAccess != null) break;
				if("/" == docFullPath){
					docAccess = 1;
					break;
				}
				docFullPath = docFullPath.substring(0, docFullPath.lastIndexOf("/"));
				if("" == docFullPath){
					docFullPath = "/";
				}
			}
			if(docAccess > access){
				access = docAccess;
			}
		}
		return access;
	}
	
	Model.prototype.docNodeTreeIndexChanged = function(event){
//		docAuthList = null;
		if(!this.docAuthList){
			this.getDocAuthList();
		}
		var docNodeTree = this.comp("docNodeTree");
		var rowId = docNodeTree.getCurrentRowID();
		var docPath = docNodeTree.getValue("sDocPath");
		var docFullPath = null;
		if(!docPath){
			docPath ="/";
			docFullPath = "/";
		}else{
			docFullPath = DocUtils.InnerUtils.getDocFullPath(rowId, docPath);
		}
		var access = this.getTreeIndexChangedAccess(docFullPath);
		if(docNodeTree.getCount()==0){
			access = 1;
		}  
		this.currentRootAccess = access ;
		var permissions = this.comp("permissions");
		permissions.newData({
			"defaultValues" : [
			                   {"col11":1}
			]
		});
		permissions.setValue("newDir", access % 512 >= 256);
		permissions.setValue("deleteDir", access % 2048 >= 1024);
		permissions.setValue("editDir", access % 1024 >= 512);
		permissions.setValue("manageDir", access % 32768 >= 16384);
		permissions.setValue("downloadDir", access % 8 >= 4);
		permissions.setValue("newDoc", access % 512 >= 256);	
		if(this.comp("docNodeList").getCount()>0){
			if(justep.Browser.hasTouch){
				permissions.setValue("editDoc", false);
			}else{
				permissions.setValue("editDoc", access % 1024 >= 512);
			}
			permissions.setValue("deleteDoc", access % 2048 >= 1024);
			permissions.setValue("manageDoc", access % 32768 >= 16384);
			permissions.setValue("downloadDoc", access % 8 >= 4);
			permissions.setValue("browseDoc", access % 4 >= 2);
			this.docNodeListIndexChanged();
		}else if(this.comp("docNodeList").getCount() == 0){
			permissions.setValue("editDoc", false);
			permissions.setValue("deleteDoc",false);
			permissions.setValue("manageDoc", false);
			permissions.setValue("downloadDoc", false);
			permissions.setValue("browseDoc", false);
		}
	};
	
	
	Model.prototype.permissionBtnClick = function(event){
		var docNodeTree = this.comp("docNodeTree");
		var docPath = docNodeTree.getValue("sDocPath");
		var rowId = docNodeTree.getValue("SA_DocNode");
		var docFullPath = DocUtils.InnerUtils.getDocFullPath(rowId, docPath);
		this.comp("dialog_permission").set({
			"title" : "文件夹权限"
		});
		this.comp("dialog_permission").open({data : docFullPath});
	};
	
	Model.prototype.button15Click = function(event){
		var docNodeList = this.comp("docNodeList");
		var docPath = docNodeList.getValue("sDocPath");
		var rowId = docNodeList.getCurrentRowID();
		var docFullPath = DocUtils.InnerUtils.getDocFullPath(rowId, docPath);
		this.comp("dialog_permission").set({
			"title" : "文件权限"
		});
		this.comp("dialog_permission").open({data : docFullPath});
	};
	
	Model.prototype.getAccessBysDocPath = function(docFullPath , defaultAccess){
		var docAccess = null;
		for(var item in this.docAuthListArr){
			var itemAceess = defaultAccess;  
			$.each(this.docAuthListArr[item],function(n,value){
			    if(value.sDocPath == docFullPath){	
			    	itemAceess = value.sAccess;
			       return false;
			    }
			});
			if (!docAccess) docAccess = itemAceess ;
			if(itemAceess > docAccess) docAccess = itemAceess;
		}
		return (docAccess != null && docAccess) > defaultAccess ? docAccess:defaultAccess;
	}
	
	Model.prototype.docNodeListIndexChanged = function(event){
		if(!this.docAuthList){
			this.getDocAuthList();
		}
		var docNodeTree = this.comp("docNodeTree");
		var rowId = docNodeTree.getCurrentRowID();
//		var isVirtualRoot = docNodeTree.getStore()._isVirtualRoot(rowId);
		var docNodeList =  this.comp("docNodeList");
		var rowId = docNodeList.getCurrentRowID();
		var docPath = docNodeList.getValue("sDocPath");
		if(typeof(docPath)=="undefined"){
			docPath = "/";
		}
		var docFullPath = docFullPath = DocUtils.InnerUtils.getDocFullPath(rowId, docPath);
		
		var access = this.getAccessBysDocPath(docFullPath , this.currentRootAccess);	
		var permissions = this.comp("permissions");
		permissions.setValue("newDoc", access % 512 >= 256);
		if(justep.Browser.hasTouch){
			permissions.setValue("editDoc", false);
		}else{
			permissions.setValue("editDoc", access % 1024 >= 512);
		}
		permissions.setValue("deleteDoc", access % 2048 >= 1024);
		permissions.setValue("manageDoc",access % 32768 >= 16384);
		permissions.setValue("downloadDoc",access % 8 >= 4);
		permissions.setValue("browseDoc", access % 4 >= 2);
		
	};
	
	return Model;
});