define(function(require){
	var Observable = require("$UI/system/lib/base/observable");
	var Object = require("$UI/system/lib/base/object");
	var $ = require("jquery");
	var Browser = require("$UI/system/lib/base/browser");
	require("$UI/system/lib/cordova/cordova");
	
	require("cordova!cordova-plugin-file");
	require("cordova!cordova-plugin-file-transfer");
	require("cordova!cordova-plugin-inappbrowser");
	
	
	var requestFileSystemApi = window.webkitRequestFileSystem || window.requestFileSystem;
	
	var FileApi = Object.extend({
		mixins : Observable,
		constructor : function() {
			this.callParent();
		},
		_toFullUrl : function(url){
			if(this._isHttpFile(url)){
				return url;
			}
			return (location.origin ? location.origin : (location.protocol + "//" + location.host)) + require.toUrl(url);
		},
		download : function(url,fileName,option){
			var dtd = $.Deferred();
			option = option || {};
			fileName = encodeURIComponent(fileName);
			var self = this;
			var _url = this._toFullUrl(url);
			if(typeof FileTransfer != 'undefined'){
				this.getFS(option.type == window.TEMPORARY ? window.TEMPORARY : window.PERSISTENT, 0).done(function(fileSystem){
					var ft = new FileTransfer();
					var destPath = fileSystem.root.toURL() + (option.downloadPath || "justep/download/") + fileName;
					ft.download(_url, destPath, function(entry) {
			        	dtd.resolve(entry.toURL());
			        }, function(err){
			        	dtd.reject(err);
			        });
				}).fail(function(){
					dtd.reject();
				});
			}else{
				var downLoadFrame = $('#_downloadFrame');
				if(downLoadFrame.length === 0){
					downLoadFrame = $('<iframe id="_downloadFrame"></iframe>').css('display','none').appendTo(document.body);
				}
				downLoadFrame.attr('src',_url);
	            dtd.resolve(_url);
			}
			return dtd.promise();
		},
		getFS : function(type,size){
			var dtd = $.Deferred();
			var self = this;
			if(window.cordova){
				document.addEventListener('deviceReady',function(){
					window.requestFileSystem(type, size, function(fs){
						dtd.resolve(fs);
					},function(err){
						dtd.reject(err);
					});
				},false);
			}else if(requestFileSystemApi){
				requestFileSystemApi(type, size, function(fs){
					dtd.resolve(fs);
				},function(err){
					dtd.reject(err);
				});
			}else{
				dtd.reject({code:0,msg:"not implement fileSystem"});
			}
			return dtd.promise();
		},
		_isLocalFile : function(url){
			if(url.indexOf("file:") == 0 || url.indexOf("cdvfile:") == 0 || url.indexOf("filesystem:") == 0){
				return true;
			}else{
				return false;
			}
		},
		_isHttpFile : function(url){
			if(url.indexOf("http") == 0){
				return true;
			}else{
				return false;
			}
		},
		
		/**
		 *   fileEntry 
		 *     fullPath: "/test"
		 *     name: "test"
		 *     toURL():"filesystem:http://192.168.1.49:8080/temporary/test"
		 *     
		 *   浏览本地文件需要传url为 toURL之后的  
		 */
		browse:function(url,fileName, option){
			var dtd = $.Deferred();
			var self = this;
			if(Browser.isX5App){
				if(this._isLocalFile(url)){
					if(Browser.isAndroid){
						window.open(url,"_system");
						dtd.resolve(url);
					}else if(Browser.isIOS){
						window.open(url, '_blank', 'toolbarposition=top,location=no,enableViewportScale=yes');
						dtd.resolve(url);
					}
				}else{
					url = this._toFullUrl(url);
					this.download(url, fileName,option).done(function(nativeUrl){
						self.browse(nativeUrl).done(function(url){
							dtd.resolve(url);
						}).fail(function(err){
							dtd.reject(err);
						});
					}).fail(function(err){
						dtd.reject(err);
					});
				}
			}else{
				//TODO:支持浏览器中filesystem的文件浏览
				window.open(url, '_blank');
				dtd.resolve(url);
			}
			return dtd.promise();
		},
		//path '/'
		getDirectory : function(fileSystem,path){
			var dtd = $.Deferred();
			var result = [];
			fileSystem.root.getDirectory(path, {}, function(dirEntry){
	            var dirReader = dirEntry.createReader();
	            dirReader.readEntries(function(entries) {
	                for(var i = 0; i < entries.length; i++) {
	                    var entry = entries[i];
	                    var item = {};
	                    if (entry.isDirectory){
	                    	item.type = "dir";
	                    }else if (entry.isFile){
	                    	item.type = "file";
	                    }
	                    item.fullPath = entry.fullPath;
	                    item.name = entry.name;
	                    item.url = entry.toURL();
	                    result.push(item);
	                }
	                dtd.resolve(result);
	            });
	        },function(err){
	        	dtd.reject(err);
	        });
			return dtd.promise();
		},
		//path '/'
		getFile : function(fileSystem,path){
			var dtd = $.Deferred();
			var result = [];
			fileSystem.root.getFile(path, {}, function(fileEntry){
				var item = {};
				item.type = "file";
				item.fullPath = fileEntry.fullPath;
                item.name = fileEntry.name;
                item.url = fileEntry.toURL();
				dtd.resolve(item);
	        },function(err){
	        	dtd.reject(err);
	        });
			return dtd.promise();
		}
	});
	return new FileApi();
});