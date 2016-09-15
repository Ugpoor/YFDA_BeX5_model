define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var _Date = require("$UI/system/lib/base/date");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.newDocNameSpaceBtnClick = function(event){
		this.comp("docNameSpaceData").newData({defaultValues: [{"sFlag":"1","sAccessMode":"1"}]});
		this.comp('docNameSpaceDialog').open();
	};

	Model.prototype.saveNewDocNameSpaceBtnClick = function(event){
		if(this.testDocServer()){
			if(this.comp("docNameSpaceData").getCurrentRowID() != "defaultDocNameSpace"){
				var sDisplayName = this.comp("docNameSpaceData").getValue("sDisplayName");  
				var sUrl = this.comp("docNameSpaceData").getValue("sUrl");
				var docNode = this.comp("docNodeData");
				docNode.newData();
				docNode.setValue("sDocName",sDisplayName);
				docNode.setValue("sKind","dir");
				docNode.setValue("sDocPath","/");
				docNode.setValue("sDocDisplayPath","/");
				docNode.setValue("sCreatorFID",this.getContext().getCurrentPersonMemberFID());
				docNode.setValue("sCreatorName",this.getContext().getCurrentPersonName());
				docNode.setValue("sCreatorDeptName",this.getContext().getCurrentDeptName());
				docNode.setValue("sCreateTime",_Date.toString(new Date(),_Date.STANDART_FORMAT));
				docNode.setValue("sLastWriterFID",this.getContext().getCurrentPersonName());
				docNode.setValue("sLastWriterDeptName",this.getContext().getCurrentDeptName());
				docNode.setValue("sLastWriteTime",_Date.toString(new Date(),_Date.STANDART_FORMAT));
				docNode.setValue("sNameSpace",this.comp("docNameSpaceData").getCurrentRowID());
				docNode.setValue("sFlag","1");
				docNode.saveData();
			};
			this.comp("docNameSpaceData").saveData();
			this.comp("docNameSpaceDialog").close();
		}
	};

	Model.prototype.cancelNewDocNameSpaceBtnClick = function(event){
		this.comp("docNameSpaceData").refreshData();
		this.comp("docNameSpaceDialog").close();
	};

	Model.prototype.delDocNameSpaceBtnClick = function(event){
		var docNameSpaceData = this.comp("docNameSpaceData");
		if(docNameSpaceData.getCurrentRowID() == "defaultDocNameSpace"){
			alert("不能删除默认文档服务器!如果需要设置默认文档服务器，仅修改当前配置的服务器地址即可。");
			this.comp('docNameSpaceDialog').open();
			return;
		}
		if(!confirm('是否删除“'+ docNameSpaceData.getValue("sDisplayName")+'”？(提示：文档中心对应文件夹及文件同时会删除)')){
			return;
		}
		var sendParam = new biz.Request.ActionParam();
		sendParam.setBoolean("isHttps", false);
		sendParam.setString('sID',docNameSpaceData.getCurrentRowID());
		var options = {};
		options.process = "/SA/doc/system/systemProcess";
		options.activity = "mainActivity";
		options.dataType = "json";
		options.parameters = sendParam;
		options.action = "deleteNameSpace";
		options.directExecute = true;
		options.context = this.getContext();
		options.callback = function(result) {
			if (result.state) {
				docNameSpaceData.refreshData();
			} else {
				throw new Error(result.response.message);
			}
		};
		biz.Request.sendBizRequest(options);
		this.comp('docNameSpaceData').refreshData();
	};
	
	Model.prototype.testDocServer = function(){
		var nameSpaceData = this.comp("docNameSpaceData");
		var url = nameSpaceData.getValue('sUrl');
		if(url == undefined){
			throw new Error("文档服务地址配置不正确");
		}
		if(url.indexOf('/')+1 != url.length){
			url+="/";
		}
		url= require.toUrl("$UI/system/service/doc/common/uploadDoc.j?dochost="+url+"&rType=test");
		var response = $.ajax({
			url:url,
			async:false,
			cache:false
		});
		if(response.responseText.length > 200){
			throw new Error("文档服务地址配置不正确\n");
		}else{
			return true;
		}
	};
	
	
	
	
	
	Model.prototype.docNameSpaceDialogHide = function(event){
		this.comp('docNameSpaceData').refreshData();
	};
	
	return Model;
});