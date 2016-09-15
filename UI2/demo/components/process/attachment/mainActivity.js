define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	
	
	var Model = function(){
		this.callParent();
	};



	Model.prototype.btnInitClick = function(event){
	//	var progress = new Progress("lbProgress", "附件演示数据初始化中，请稍候");
	   debugger;
	 //   this.getElementByXid('lbProgress').style.display = "block";
	//    var progress = this.comp("lbProgress");
	
	//	progress.start();
		biz.Request.sendBizRequest({
		    "context" : this.getContext(),
			"action": "initAttachmentDemo",
			"async": true, // 为显示进度，必须异步调用
			"callback": function(callbackData) {
			// 关闭进度提示
			//	progress.stop();
				callbackData.ignoreError = false;
				if (callbackData.state) {
				   alert("ok");
				/*	
					this.comp("messageDialog").open({
						"img": "right",
						"msg": "初始化成功。\n\n“确定”后将会自动重新加载当前页面......",
						"callback": function() {
							window.location.reload();
						}
					});*/
				}
			}
		});
	};

	Model.prototype.tabItemVisible = function(event){
		var dSingle = this.comp("dAttachment_Editor_Single");
		dSingle.loadData();
		var inited = dSingle.getCount() > 0; 
		return inited;
	}

	Model.prototype.modelLoad = function(event){
	    debugger;
	  
	//	$("#lbProgress").hide();
		var dSingle = this.comp("dAttachment_Editor_Single");
		dSingle.refreshData();
		var inited = dSingle.getCount() > 0; 
		var tabMain = this.comp("tabPanelMain");
	    if(inited){
	    	tabMain.setActiveTab("li10");
	    }
	       
	/*	.setVisable("tabInit", !inited, "tabMain");
		this.comp("tabPanelMain").setVisable("tabMain", inited);
		this.comp("tabPanelMain").setVisable("tabDefine", inited);
		this.comp("tabPanelMain").setVisable("tabExtend", inited);*/
	};






	Model.prototype.li14Click = function(event){
		this.comp("dAttachment_Editor_Multi").refreshData();
	};



	Model.prototype.li11Click = function(event){
		this.comp("dAttachment_Define").refreshData();
	};



	Model.prototype.li4Click = function(event){
		this.comp("dAttachment_Template").refreshData();
	    divCode_FillTemplate = this.getElementByXid("divCode_FillTemplate");
	    divCode_FillTemplate.innerText = this.attachmentEditor_TemplateOfficeLoaded.toString();
		//TextOut.setText("divCode_FillTemplate", this.attachmentEditor_TemplateOfficeLoaded.toString());
	};





	Model.prototype.attachmentEditor_TemplateOfficeLoaded = function(event){
	    debugger;
		var data = this.comp("dAttachment_Template"); 
	// 将需要填充的内容构造成一个JSON数据
		var p = {
				"title": data.getValue("fTitle"),
				"number": data.getValue("fNumber"),
				"author": data.getValue("fAuthor"),
				"createDate": data.getValue("fCreateDate")
		};
	
	
		
		event.officeEditorContext.execute(function(params,officeEditor,ovObj) {
			// 在officeEditor对话框的页面内获取officeViewer
			// 遍历填充数据
			$.each(params, function(k, v) {
				// 填充
				ovObj.WriteWordBookmarkInfo(k, v);
			});
		}, p);
		
		
	};



	Model.prototype.li6Click = function(event){
		
       debugger;
        this.comp("dAttachment_Extend_Permission").refreshData();
		var dTemp = this.comp("dTemp");
		var atcm = this.comp("attachmentEditor_Extend_Permission"); 
	
		dTemp.setValue("access", atcm.access);
		var divCode_Permission = this.getElementByXid("divCode_Permission");
		divCode_Permission.innerText = this.dTempValueChanged.toString();
		
	};



	Model.prototype.dTempValueChanged = function(event){
		if (event.col == "access") {
			var dTemp = this.comp("dTemp");
			var atcm = this.comp("attachmentEditor_Extend_Permission"); 
		// 设置附件权限
		
			atcm.set({
					'access' : event.value
					});	
				
		
			}
	};






	Model.prototype.li7Click = function(event){
		this.comp("dAttachment_Extend_LimitUpload").refreshData();
		var divCode_LimitUpload = this.getElementByXid("divCode_LimitUpload");
		divCode_LimitUpload.innerText = this.attachmentEditor_Extend_LimitUploadStart.toString();
		
		
	};



	Model.prototype.li8Click = function(event){
		this.comp("dAttachment_Extend_SetTemplate").refreshData();
		this.comp("dAttachment_Extend_SetTemplate_Temp").refreshData();
		
		var divCode_SetTemplate = this.getElementByXid("divCode_SetTemplate");
		divCode_SetTemplate.innerText = this.attachmentEditor_Extend_SetTemplate_TempNewFromTemplate.toString();
	};


	Model.prototype.attachmentEditor_Extend_SetTemplate_TempNewFromTemplate = function(event){
	 
		// 获取用户选择的模板
		debugger;
		var dTemplate = this.comp("dAttachment_Extend_SetTemplate");
		var docsStr = dTemplate.getValue("fAttachment");
		var template = null;
		if (docsStr != "") {
			var docs = eval(docsStr);
			if (docs.length > 0) {
				template = docs[0];
			}
		}
		// 没有模板阻止新建
		if (template == null) {
			event.cancel = true;
			
			justep.Util.hint("没有可用的模板");
			return;
		}
	
		// 设定新建模板
		event.data[0] = {
				sDocId: template.docID,
				sDocName: template.docName,
				sDocPath: template.docPath,
				sFileId: template.fileID
		};
		event.data.length = 1;
	};



	Model.prototype.li12Click = function(event){
		this.comp("dAttachment_Extend_Style").refreshData();
	};



	Model.prototype.li2Click = function(event){
		this.comp("dAttachment_Image").refreshData();
		this.comp("dBlobImage").refreshData();
	};



	Model.prototype.li1Click = function(event){
		this.comp("dAttachment_Editor_Multi").refreshData();
	};



	Model.prototype.attachmentEditor_Extend_LimitUploadStart = function(event){
		var docName = event.event.file.name;
		var docs = event.source.getValue();
	// 遍历已上传文档
		$.each(docs, function(k, v) {
			if (v.docName == docName) {
				justep.Util.hint("已存在同名文件“" + docName + "”");
			// 当发现已存在同名文档，阻止上传
				event.cancel = true;
				return;
			}
		}); 
	};



	return Model;
});