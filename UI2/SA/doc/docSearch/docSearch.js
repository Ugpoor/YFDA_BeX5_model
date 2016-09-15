define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var XML = require('$UI/system/lib/base/xml');
	var BindMapping = require("$UI/system/lib/bind/bind.mapping");
	var DocUtils = require('$UI/system/components/justep/docCommon/docUtil');
	
	var Model = function(){
		this.callParent();
		var defaultValue = {
			searchWord:'',
			dataSize:"0",
			serverCounts:"0",
			pages:"0",
			currentPage:"0",
			rows:[]
		};
		this.$docs = BindMapping.fromJS(defaultValue);
	};
	Model.prototype.getAuth = function(docFullPath){	
		var access = -1;	
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
				if("" == docFullPath)
					docFullPath = "/";
			}
			if(docAccess > access)
				access = docAccess;
		}
		return access;	
	}
	
	Model.prototype.getAuthList = function(){
		var docAuthList = DocUtils.InnerUtils.getDocAuthList(this.getContext());
		if(!this.docAuthListArr) 
		    this.docAuthListArr = {};
		for(var deptFID in docAuthList) {
			var authItems = docAuthList[deptFID];
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
	
	
	
	Model.prototype.openResource = function(obj){
		var path = obj.path;
		var docID = obj.doc-id;
		var docFullPath = DocUtils.InnerUtils.getDocFullPath(docID, path);
		if(this.getAuth(docFullPath)>0){
			justep.Shell.showPage({title:"文档中心",url:"$UI/SA/doc/docCenter/docCenter.w?process=/SA/doc/docCenter/docCenterProcess&activity=mainActivity&docPath="+path+"&docID="+docID});
		}else{
			justep.Util.hint("您未被授权查看此文件");
		}
	}

	Model.prototype.searchBtnClick = function(event){
		this.search();
	};
	
	Model.prototype.browseDoc = function($object){
		var path = $object.docPath.get();
		var fileID = $object.id.get();
		var docName = $object.title.get();
		if(this.getAuth(path)%8 >= 4){
			DocUtils.InnerUtils.browseDocByFileID(path, docName ,fileID,undefined,undefined,undefined,false,this.getContext());
		}else{
			justep.Util.hint("您未被授权查看此文件");
		}
	};
	
	Model.prototype.sourceLocation = function(event){
		
	};
	
	Model.prototype.prePage = function(event){
		this.search(parseInt(this.$docs.currentPage.get()) - 1);
	};
		
	Model.prototype.nextPage = function(event){
		this.search(parseInt(this.$docs.currentPage.get()) + 1);
	};
	
	
	Model.prototype.search = function(searchPage, pageCount,recordCount){
		var searchData = this.comp('docSearchData');
		if(searchPage == undefined){
			searchPage = searchData.val('pageNum');	
		}
		if(parseInt(searchPage) <= 0 || isNaN(parseInt(searchPage))){
			searchPage = 1;
		}
		
		var searchWord = searchData.val('searchWord');
		pageCount =  pageCount|50;
		recordCount =  recordCount|'';
		if(searchWord){
			if(searchWord.replace(/^ +| +$/g,"")){
				var words = $.trim(searchWord).split(" ");
				var wordItems = [];
				for(i=0;i<words.length;i++){
					wordItems.push("<word>");
					wordItems.push(words[i]);
					wordItems.push("</word>");
				}
			   	
	           var param = '<data><operate>queryDocSearch</operate><form><keyword>'+ searchWord +'</keyword>' +
					       '             <querySql>default</querySql><extraCond>FullText(\'' 
					       + searchWord + '\') and #sFlag = 1 </extraCond><extraOrderBy>creationTime desc</extraOrderBy>' +
					       '             <words>' 
					       + wordItems.join('') + '</words>' +
					       '<pageCount>'+ pageCount +'</pageCount><pageSize>10</pageSize><currentPage>'+ searchPage +'</currentPage>'+
					       '<servers>'+ 0 +'</servers><recordCount>'+recordCount+'</recordCount><deptPath>'
					       + this.getContext().getCurrentPersonMemberFID() +'</deptPath><personId>'
					       + this.getContext().getCurrentPersonCode() +'</personId><ishttps>false</ishttps></form></data>';
				var sendParam = new biz.Request.ActionParam();
				sendParam.setXml('param',new biz.Request.XMLParam(param));
				var self = this;
				var options = {};
				options.process = this.getContext().getCurrentProcess();
				options.activity = this.getContext().getCurrentActivity();
				options.contentType = "application/json";
				options.dataType = "application/json";
				options.parameters = sendParam;
				options.action = "queryDocSearch";
				options.directExecute = true;
				options.context = this.getContext();
				options.callback = function(result) {
					if (result.state) {
						var responseXML = XML.fromString(result.response.xml);
						var namespace = 'xmlns="http://www.w3.org/1999/xhtml" xmlns:ns="http://outerx.org/daisy/1.0"';
						var dataSize = XML.eval(responseXML, "//ns:rows/ns:row","",namespace).length;
						//var dataSize = XML.getNodeText(XML.eval(responseXML, "//ns:servers/@size","single",namespace));
						var serverCounts = XML.getNodeText(XML.eval(responseXML, "//ns:servers/@serverCounts","single",namespace));

						var pages = XML.getNodeText(XML.eval(responseXML, "//ns:servers/@pages","single",namespace));
						var currentPage = XML.getNodeText(XML.eval(responseXML, "//ns:servers/@currentPage","single",namespace));
						var rows = XML.eval(responseXML, "//ns:searchResult/ns:rows/ns:row","",namespace);
						var responseJSON = {
							searchWord:searchWord,
							dataSize:dataSize,
							serverCounts:serverCounts,
							pages:pages,
							currentPage:currentPage,
							rows:[]
						};
						for(var i = 0;i < rows.length;i++){
							var row = rows[i];
							var id = XML.getNodeText(XML.eval(row, "./ns:value[1]","single",namespace));
							var docId = XML.getNodeText(XML.eval(row, "./ns:value[4]","single",namespace));
							var docPath = XML.getNodeText(XML.eval(row, "./ns:value[5]","single",namespace));
							var title = XML.getNodeText(XML.eval(row, "./ns:value[2]","single",namespace));
							var creatorName = XML.getNodeText(XML.eval(row, "./ns:value[8]","single",namespace));
							var keywords = XML.getNodeText(XML.eval(row, "./ns:value[9]","single",namespace));
							var lastWriteTime = XML.getNodeText(XML.eval(row, "./ns:value[3]","single",namespace));
							var descrption = XML.getNodeText(XML.eval(row, "./ns:value[11]","single",namespace));
							var rowJSON = {
								id:id,
								docId:docId,
								docPath:docPath,
								title:title,
								creatorName:creatorName,
								keywords:keywords,
								lastWriteTime:lastWriteTime,
								descrption:descrption
							}
							responseJSON.rows.push(rowJSON);
						}
						BindMapping.fromJS(responseJSON,self.$docs);
					} else {
						throw new Error(result.response.message);
					}
				};
				biz.Request.sendBizRequest(options);
			}
		}
	};
	
	
	
	Model.prototype.model1ModelConstructDone = function(event){
		this.getAuthList();
	};
	
	
	
	return Model;
});