define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var fileApi = require("$UI/system/components/justep/docCommon/fileApi");
	var BindMapping = require("$UI/system/lib/bind/bind.mapping");
	
	
	var Model = function() {
		var dir = {
			fullPath : "/",
			url:"filesystem:http://localhost/",
			type : "dir",
			name : "文件系统",
			child : []
		};
		this.fileSystemModel = BindMapping.fromJS(dir);
		this.callParent();
		this.rootPath = window.PERSISTENT;

	};
	
	var fileNames = ".avi,.cmd,.code,.cpp,.css,.dll,.doc,.exe,.fla,.flv,.html,.ini,.mdb,.mp3,.pdf,.php,.ppt,.psd,.rar,.rb,.svg,.ttf,.txt,.wmv,.xls,.xml,.zip";
	Model.prototype.getFileImage = function($object){
		require("res!./fileSystemImages");
		var fileName = "";
		if($object.type.get() == "dir"){
			fileName = "folder";
		}else if($object.type.get() == "file"){
			fileName = "file";
			var fileExt = $object.name.get().split(".").reverse()[0];
			if(fileNames.indexOf((String(/\.[^\.]+$/.exec("."+fileExt)).toLowerCase())) >= 0){
				fileName = fileExt;
			}	
		}
		return require.toUrl("./fileSystemImages/" + fileName +".png");
	};
	
	Model.prototype.getRootName = function() {
		return "文件系统("+ (this.rootPath == window.PERSISTENT ? '持久' :'临时') +")"
	};
	
	Model.prototype.loadFs = function(event) {
		var self = this;
		fileApi.getFS(this.rootPath, 0).done(function(fs) {
			fileApi.getDirectory(fs, "/").done(function(result) {
				var fileSystemData = {
					fullPath : "/",
					name : self.getRootName(),
					type : "dir",
					child : result
				};
				BindMapping.fromJS(fileSystemData, self.fileSystemModel);
			}).fail(function(err){
				alert("json:" + JSON.stringify(err));
				alert("errorcode:" + err.code);
			});
		}).fail(function(err){
			alert("getfs error:" + err.code);
		});
	};
	
	Model.prototype.getParentName = function($object){
		var fullPath = $object.fullPath.get();
		fullPath = this.formatPath(fullPath);
		if(fullPath === "/"){
			return "";
		}
		var pathArray = fullPath.split('/');
		var parentName = pathArray[pathArray.length-3 >= 0? pathArray.length-3 : 0];
		if(parentName == ""){
			return this.rootPath == window.PERSISTENT ? '持久' :'临时';
		}
		return parentName;
	};
	
	//path以 /结尾作为规范
	Model.prototype.formatPath = function(path){
		//浏览器fullPath不以/结尾 android以/结尾
		if(path && path.length >1 && path.charAt(path.length-1) !='/'){
			path = path + "/";
		}
		return path;
	};
	
	
	Model.prototype.goBackDir = function($object){
		var fullPath = $object.fullPath.get();
		fullPath = this.formatPath(fullPath);
		if(fullPath === "/"){
			justep.Shell.closePage();
			return;
		}
		
		var pathArray = fullPath.split('/');
		var parentName = pathArray[pathArray.length-3 >= 0? pathArray.length-3 : 0];
		if(parentName == ""){
			parentName = this.getRootName(); 
		}
		pathArray.splice(pathArray.length -2);
		var parentPath = pathArray.join("/");
		if(parentPath == ""){
			parentPath = "/";
		}
		this.openDir(parentName,parentPath);
	};
	
	Model.prototype.openDir = function(name,fullPath) {
		var self = this;
		fileApi.getFS(this.rootPath, 0).done(function(fs) {
			var dirs = [];
			fileApi.getDirectory(fs, fullPath).done(function(result) {
				var fileSystemData = {
					fullPath : fullPath,
					name : name,
					type : "dir",
					child : result
				}
				BindMapping.fromJS(fileSystemData, self.fileSystemModel);
			});
		});
	};
	
	
	Model.prototype.openEntry = function(name,fullPath,type) {
		if(type=="dir"){
			this.openDir(name,fullPath);
		}else if(type=="file"){
			fileApi.getFS(this.rootPath, 0).done(function(fs) {
				fileApi.getFile(fs,fullPath).done(function(item){
					fileApi.browse(item.url, name);
				});
			});
		}
	};
	
	Model.prototype.changeRoot = function(event){
		this.rootPath = (this.rootPath == window.PERSISTENT ? window.TEMPORARY :window.PERSISTENT);
		this.loadFs();
	};

	Model.prototype.modelModelConstructDone = function(event){
		this.loadFs();
	};

	return Model;
});