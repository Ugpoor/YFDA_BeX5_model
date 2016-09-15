define(function(require){
	var $ = require("jquery");
	var DocUtils = require('$UI/system/components/justep/docCommon/docUtil');
	var officeViewer = require('$UI/system/components/justep/docCommon/officeViewer');
	
	var $OV = officeViewer.$OV;
	var OV = officeViewer.OV;
	var justep = require("$UI/system/lib/justep");
	
	var self;
	
	var Model = function(){
		this.callParent();
		this.noChange = 'W10=';
		self = this;
	};
	
	Model.prototype.docSaveClick = function(event){
		this.officeEditor.saveToServer(false);
	};
	
	Model.prototype.docCreateVersionClick = function(event){
		this.officeEditor.saveToServer(true);
	};
	
	Model.prototype.attachmentEditorReceiverReceive = function(event){
		var data = JSON.parse(event.data);
		if(data.type == "officeLoaded"){
			var func = data.func;
			var params = data.params;
			var officeEditor = this.officeEditor;
			var ovObj = $OV('ov');
			var execFunc = new Function("params","officeEditor","ovObj","return (" + func.toString() +")")(params,officeEditor,ovObj);
			execFunc.call(this,params,officeEditor,ovObj);
		}else {
			var officeEditor = new OfficeEditor(data);
			this.officeEditor = officeEditor;
			officeEditor.init(this);
		}
	};
	Model.prototype.model1Load = function(event){
		window.isSaved = false;
		window.isCreateVersion = false;
		window.onbeforeunload =  function(){
			if(!window.isCreateVersion){
				//点击关闭按钮时候
				if(!window.isSaved){
					var data = {
						changes: self.noChange,	
						type : "officeAction"
					};
					self.getComponent('attachmentEditorReceiver').sendData(data);
					//window.modalReceiver.sendMessage(data);
				}
				return "请检查文件是否已经保存/成文,如果有未保存的数据会丢失的!";
			}
		};
		
		/*$(function(){
			$('body').bind('modalReceiveData',function(event,data){
				var officeEditor = new OfficeEditor(data);
				officeEditorDialog.officeEditor = officeEditor;
				officeEditor.init();
			});
		});*/
		/*window.test = function(){
			//var data = {"host":"/defaultDocNameSpace","userName":"system","userInitials":"system","programID":"OpenOffice","showField":false,"fileID":"","filename":"数据库切分技术方案比较","fileExt":".docx","isPrint":true,"cacheName":"464-DOC","revisionCacheName":"464-DOC"}
			var data = {"host":"/defaultDocNameSpace","userName":"system","userInitials":"system","programID":"OpenOffice",
						"filename":"Messenger(即时通讯)使用手册","showField":true,
						"isPrint":true,"fileID":"6-defaultDocNameSpace","fileExt":".doc",
						"cacheName":"","revisionCacheName":""}
			var officeEditor = new OfficeEditor(data);
			self.officeEditor = officeEditor;
			officeEditor.init();
		}*/
		
		
		/**
		 *  接管异常，防止异常提示框被office控件挡住
		 **/
		onerror = pageErrorHandler;
		function pageErrorHandler(msg, url, line, stack) {
			msg = ('string'==typeof(msg) && msg)? msg.replace(/Uncaught Error:/,''):'未知错误！';
			var msgs = msg.split("|");
			var detail = msgs.length > 1 ? (msgs[1] == "" ? msg : msgs[1]) : msg;
			if(url){detail += ('\n at ('+url); if(line) detail += (':'+line); detail += ')';}
			if(stack) detail += ('\n'+stack);
			alert(new justep.Message(justep.Message.JUSTEP232093,detail).getMessage());
			return false;
		}
	};
	
	
	var OfficeEditor = function(data){
		this.OVP = data;
		this.OVP.filename = decodeURI(this.OVP.filename);
		this.OVP.saving = false;
		this.OVP.isModified = false;
		this.OVP.state = (this.OVP.programID != "OpenOffice") && (this.OVP.programID != "Template") ? "new" : "edit";
		this.OVP.showSeal = DocUtils._seal_default_show ? true : this.OVP.showSeal;
		$('#fileName').val(this.OVP.filename);
	};
	
	OfficeEditor.prototype = {
		init:function(model){
			this.model = model;
			$OV('ov').CreateOfficeViewer('100%', '100%');
			if(this.OVP.programID == "OpenOffice"){
				this.openOffice();
			}else if(this.OVP.programID == "Template"){
				this.openTemplate();
			}else if(this.OVP.programID != "-"){
				this.createOffice();
			}
			if(this.OVP.programID.indexOf('Application')!= -1 || this.OVP.programID == "Template"){
	    		$('#docSave').hide();
	    	}
			if(justep.Browser.IE && this.OVP.programID == "OpenOffice" && this.OVP.showSeal){
				//TODO:签章能力，仅在ie环境 ，并且文档服务配置为直连的方式才可以
				this.renderSealArea();
			}else if(!justep.Browser.IE && this.OVP.showSeal){
				$('#saveTip').find('span').text('签章能力仅在IE浏览器下支持').end().fadeIn(2000,function(){$(this).fadeOut(1000,function(){
					$('#saveTip').text('保存成功');
				})});
			}
			self.getComponent('attachmentEditorReceiver').sendData({type:"officeLoaded"});
		},
		getUrl:function(docPath,fileID,resultID){
			var u = "";
	    	if(fileID){
	    		u = DocUtils.InnerUtils.getdocServerAction({
					docPath:docPath,
					urlPattern:"/repository/file/cache/office/"+fileID,
					context:self.getContext()
				});
	    	}else if(resultID){
	    		u = DocUtils.InnerUtils.getdocServerAction({
					docPath:docPath,
					urlPattern:"/repository/resultInfo/" + resultID,
					context:self.getContext()
				});
	    	}else{
	    		u = DocUtils.InnerUtils.getdocServerAction({
					docPath:docPath,
					urlPattern:"/repository/file/cache/office/new",
					context:self.getContext()
				});
	    	}
			this.docUrl = u.indexOf(window.location.protocol) < 1 ? u : window.location.protocol+"//"+ window.location.host + u;
			return this.docUrl;
		},
		openOffice:function(){
			var OVObj = $OV("ov");
			//编辑逻辑
			this.OVP.isModified = !(this.OVP.cacheName == "" || OV.isClear(this.OVP.cacheName));
			if (this.OVP.isModified) {
				OVObj.HttpInit();
				var fileID = this.OVP.fileID;
				var partType = "content";
				if(this.OVP.revisionCacheName){
					fileID = this.OVP.revisionCacheName;
					partType = "revision";
				}else if(this.OVP.cacheName){
					fileID = this.OVP.cacheName;
				}
				OVObj.HttpAddPostString("FileID",fileID);
				OVObj.HttpAddPostString("FileExt",this.OVP.fileExt);
				OVObj.HttpAddPostString("PartType",partType);
				OVObj.HttpOpenFileFromStream(this.getUrl(this.OVP.host),OVObj.GetProgIDByDocType(this.OVP.fileExt));
				var errorCode = OVObj.GetErrorCode();
				if(errorCode!= 0){
					alert(new justep.Message(justep.Message.JUSTEP232092).getMessage());
				}
				if (OVObj.IsWordOpened()) {
					OVObj.WordRevisionInit(false, this.OVP.userName, this.OVP.userInitials);
				}
			} else {
				OVObj.HttpInit();
				OVObj.HttpAddPostString("FileID", this.OVP.fileID);
				OVObj.HttpAddPostString("FileExt", this.OVP.fileExt);
				//TODO:_word_all_history2 不推荐采用全局变量  这个特性暂时没人用,需要重构成组件属性
				if (DocUtils._word_all_history){
					var fileinfo = DocUtils.InnerUtils.queryDocByFileId(this.OVP.host,this.OVP.fileID ,this.OVP.filename);
					//TODO: part_3 逻辑已经过时
					var partType = !fileinfo.parts.part_3 ? "content" : "revision";
					OVObj.HttpAddPostString("PartType", partType);	
				}
				OVObj.HttpOpenFileFromStream(this.getUrl(this.OVP.host),OVObj.GetProgIDByDocType(this.OVP.fileExt));
				var errorCode = OVObj.GetErrorCode();
				if(errorCode!= 0){
					alert(new justep.Message(justep.Message.JUSTEP232092).getMessage());
				}
				if (OVObj.IsWordOpened()) {
					OVObj.WordRevisionInit(!DocUtils._word_all_history, this.OVP.userName, this.OVP.userInitials);
				}
			}
		},
		openTemplate:function(){
			var OVObj = $OV("ov");
			//从模版新建
			OVObj.HttpInit();
			OVObj.HttpAddPostString("FileID", this.OVP.templateID);
			OVObj.HttpAddPostString("FileExt", this.OVP.templateExt);
			OVObj.HttpOpenFileFromStream(this.getUrl(this.OVP.templateHost),OVObj.GetProgIDByDocType(this.OVP.templateExt));
			var errorCode = OVObj.GetErrorCode();
			if(errorCode!= 0){
				alert(new justep.Message(justep.Message.JUSTEP232092).getMessage());
			}
			if (OVObj.IsWordOpened()) {
				OVObj.WordRevisionInit(true, this.OVP.userName, this.OVP.userInitials);
			}
			$('#saveBtn').hide();
		},
		renderSealArea: function() {
			$('#toogleSeal').show();
			$('#toogleSeal').toggle(function(){
				$('#ovParent').width('80%');
				$('#slider').show();
			},function(){
				$('#ovParent').width('100%');
				$('#slider').hide();
			});
			var self = this;
			//TODO: 签章权限应该走数据权限,所以这块从文档中心读取权限的代码不抽取到docUtils.js中
			function getDocAuthList(){
				var docAuthList = DocUtils.InnerUtils.getDocAuthList();
				var docAuthListArr = {};
				for(var deptFID in docAuthList) {
					var authItems = docAuthList[deptFID];
					var deptAuth = new Array();
					var i=0;
					for(var authId in authItems) {
						var authItem = authItems[authId];
						deptAuth[i] = {"authId":authId,"sDocPath":authItem.sDocPath,"sAuthorizeeFID" : authItem.sAuthorizeeFID,"sAccess":authItem.sAccess};
						i++;
					}
					docAuthListArr[deptFID] = deptAuth;
				}
				self.docAuthListArr = docAuthListArr;
			}
	            
	        function getAccessBysDocPath(docFullPath){
					var access = 1;	
					for(var item in self.docAuthListArr){
						var docAccess = null;
						while(docFullPath){
							$.each(self.docAuthListArr[item],function(n,value){
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
							if("" == docFullPath)
								docFullPath = "/";
						}
						if(docAccess > access)
							access = docAccess;
					}
					return access;
			}
			
	    	var sealNodeID = DocUtils._seal_doc_node_sid2;
	    	if(!sealNodeID) return;
	    	var resRow = DocUtils.InnerUtils.queryDoc("", "", ["sFileID","sDocName","sDocPath"], "", "sParentID='" + sealNodeID + "'");
	    	var sealJSON = [];
	    	for(var i=0;i < resRow.length;i++){
	    		if(self.docAuthListArr == undefined){
	    			getDocAuthList();
	    		}
	    		var rowId = resRow[i].userdata.id.value;
	    		var sDocPath = resRow[i].sDocPath.value;
	    		var imageAccess = getAccessBysDocPath(sDocPath+'/'+rowId,-1);
				if(imageAccess % 8 < 4){
					continue;
				}					            		
	    		var sFileID = resRow[i].sFileID.value;
	    		var sDocName = resRow[i].sDocName.value;
	    		var resCell_t = sDocName.replace($OV("ov").resCellRegExp_t,"");
	    		var resCell_f = JSON.stringify({sDocPath:sDocPath,sFileID:sFileID,sDocName:sDocName});
	    		sealJSON.push({picName:resCell_t,picInfo:resCell_f});
	    	}
	    	
	    	if (resRow.length > 0){
	    		$("#sealsDiv").show();
	    		var sealListEle = $('<ul></ul>').attr('id','sealList');
	    		var self = this;
	    		for (var i in sealJSON){
	    			$('<li></li>').append($('<span></span>').attr("picInfo",sealJSON[i].picInfo).bind('click',function(){
	    		        self.insertSeal($(this).attr('picInfo'));
	    		    }).text(sealJSON[i].picName)).appendTo(sealListEle);
		    	}
		    	sealListEle.appendTo('#sealsDiv');
	    	}
	    },
		insertSeal:function(params){
	    	params = JSON.parse(params);
	    	var sDocPath = params.sDocPath;
	    	var sFileID = params.sFileID;
	    	var docServer = DocUtils.InnerUtils.getdocServerAction(sDocPath,'/repository/file/view/' + sFileID + '/last/content');
	    	if(docServer.indexOf('http') != 0){
				docServer = window.location.protocol+"//"+window.location.host+docServer;
			}
			try{
			    var shape = $OV("ov").getApplication().Selection.InlineShapes.AddPicture(docServer, false, true);
			    if(shape){
			        var oShape = shape.ConvertToShape();
			        oShape.WrapFormat.Type = 5;
			        oShape.ZOrder(4);
			        oShape.PictureFormat.TransparentBackground = true;
			        oShape.PictureFormat.TransparencyColor = 0xFFFFFF;
				}
			 }catch(e){}
		},
		createOffice:function(){
			//新建空白office文件
			var OVObj = $OV("ov");
			OVObj.CreateDoc(this.OVP.programID);
			if (OVObj.IsWordOpened()) {
				OVObj.WordRevisionInit(true, this.OVP.userName, this.OVP.userInitials);
			}
		},
		saveToServer:function(createVersion){
			var OVObj = $OV("ov");
			if(this.OVP.saving == false && OVObj.IsDocOpened()){
				var docExt = OVObj.GetOpenedFileExt();
				var filename = $('#fileName').val() + docExt;
				OVObj.DisableStandardCommand(1,false);
				OVObj.HttpInit();
				OVObj.HttpAddPostString("fileID",this.OVP.fileID?this.OVP.fileID:"");
				OVObj.HttpAddPostString("cacheName",this.OVP.cacheName?this.OVP.cacheName:"");								
				OVObj.HttpAddPostString("partType","revision");
				var resultID = new justep.UUID().toString();
				OVObj.HttpAddPostString("resultID",resultID);
				OVObj.HttpAddPostOpenedFile(filename);
				OVObj.HttpPost(this.getUrl(this.OVP.host));
				var HTTPResult = OVObj.GetHttpResult(this.getUrl(this.OVP.host,'',resultID));
				HTTPResult.filename = filename;
				HTTPResult.changes = "";
				if(OVObj.IsWordOpened()){
					HTTPResult.changes = justep.Base64.encode(OVObj.WordGetRevisionJSON());
					if(this.OVP.programID == "Template" && HTTPResult.changes == "W10="){
						HTTPResult.changes = justep.Base64.encode('[{"Author":this.OVP.userName,"Date":"","Index":1,"Text":"从模板新建","Type":1}]');
				    }
					if(createVersion){
						OVObj.ActiveDocument().AcceptAllRevisions();
					}
				}
				OVObj.HttpInit();
				OVObj.HttpAddPostOpenedFile(filename);
				OVObj.HttpAddPostString("fileID",this.OVP.fileID?this.OVP.fileID:"");
				OVObj.HttpAddPostString("changes",HTTPResult.changes);
				OVObj.HttpAddPostString("partType","content");
				OVObj.HttpAddPostString("cacheName",HTTPResult.cacheName);
				resultID = new justep.UUID().toString();
				OVObj.HttpAddPostString("resultID",resultID);	
				OVObj.HttpPost(this.getUrl(this.OVP.host));
				var revisionHTTPResult = OVObj.GetHttpResult(this.getUrl(this.OVP.host,'',resultID));
				
				revisionHTTPResult.revisionCacheName = HTTPResult.cacheName;
				revisionHTTPResult.filename = HTTPResult.filename;
				revisionHTTPResult.changes = HTTPResult.changes;
				HTTPResult = revisionHTTPResult;
				HTTPResult.isReadOnly = false;
				HTTPResult.createVersion = createVersion;
				HTTPResult.type = "officeAction";
				self.getComponent('attachmentEditorReceiver').sendData(HTTPResult);
				//window.modalReceiver.sendMessage(HTTPResult);
				this.OVP.saving = false;
				if(createVersion){
					window.isCreateVersion = true;
					window.close();
				}else{
					window.isSaved = true;
					$('#saveTip').fadeIn(2000,function(){$(this).fadeOut(1000)});
				}
			}
		}
	};
	return Model;
});
