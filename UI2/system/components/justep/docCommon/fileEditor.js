define(function(require) {
	var Observable = require("$UI/system/lib/base/observable");
	var Object = require("$UI/system/lib/base/object");
	var URL = require('$UI/system/lib/base/url');

	var FileEditor = Object.extend({
		mixins : Observable,
		constructor : function(args) {
			this.callParent();
			Observable.prototype.constructor.call(this);
			this.storeFileName = args.storeFileName;
			this.realFileName = args.realFileName;
			this.ownerID = args.ownerID;
			this.createObject(args.parentNode);
		},
		connect:function(timeout){
			console.log('connect to server');
			timeout = timeout || 5000;
			var startTime = new Date().getTime();
			this._connection();
			this.on('close',function(){
				var currentTime = new Date().getTime();
				if(currentTime - startTime < timeout){
					this._connection();
				}
			},this);
		},
		
		_connection:function(){
			this.ws = new WebSocket("ws://localhost:9090/wps/");
			this.isConnected = false;
			this.mode = "";
			var self = this;
			this.ws.onopen = function() {
				console.log("onopen");
				self.isConnected = true;
			};
			this.ws.onclose = function() {
				console.log("onclose");
				self.fireEvent('close',{source:self});
				self.isConnected = false;
			};
			this.ws.onmessage = function(evt) {
				var msg = JSON.parse(evt.data);
				console.log("receive message form backend:" + JSON.stringify(msg));
				if(self.mode == "edit"){
					if(msg.type == "downloaded" && msg.flag == true){
						self.open();
					}else if(msg.type == "closed" && msg.flag == true){
						self.upload();
					}else if(msg.type == "uploaded" && msg.flag == true){
						//客户端不主动断开ws连接，后台在没有客户端连接的时候自动停止服务
						//self.stop();
					}
				}
			};
		},
	
		
		createObject:function(parent){
			this.id = justep.UUID.createUUID();
			var fileEditorObj = $("<embed id='"+this.id+"' type='application/x5-office-plugin' width='100%' height='100%'>");
			fileEditorObj.appendTo(parent);
			var self = this;
			var loop = setInterval(function(){
				debugger;
				var fileEditorObj = $('#'+self.id).get(0);
				//等带组件初始化完成
				if(fileEditorObj.bar != undefined){
					self.fileEditorObj = fileEditorObj;
					self.fileEditorObj.init();
					setTimeout(function(){
						self.connect();
					},500);
					clearInterval(loop);
				}
			},100);
		},
		sendMessage:function(message){
			message.realFileName = this.realFileName;
			message.storeFileName = this.storeFileName;
			message.ownerID = this.ownerID;
			
			if(this.isConnected == true){
				this.ws.send(JSON.stringify(message));
			}else{
				console.log('!!!!!!!!!!!!!!!!!!!! not connectiong');
			}
		},
		//"192.168.1.97:8080/x5/UI2/firefox/plugin.docx"
		download : function() {
			var url = '$UI/system/service/doc/common/simpleFileStore.j?realFileName=' + this.realFileName + '&storeFileName=' + this.storeFileName + '&ownerID='+ this.ownerID + '&operateType=download';
			url = location.origin + require.toUrl(url);
			var message = {
				type : "download",
				url : url
			}
			this.sendMessage(message);
		},
		open : function() {
			var message = {
				type : "open"
			}
			this.sendMessage(message);
		},
		//"192.168.1.97:8080/x5/system/service/doc/common/simpleFileStore.j"
		/*String uploadUrl = msg.getString("url");
		String ownerID = msg.getString("ownerID");
		String storeFileName = msg.getString("storeFileName");*/
		upload : function() {
			var url = require.toUrl("$UI/system/service/doc/common/simpleFileStore.j");
			url = location.origin + require.toUrl(url);
			var message = {
				type : "upload",
				url : url
			}
			this.sendMessage(message);
		},
		stop : function() {
			var message = {
				type : "stop"
			}
			this.sendMessage(message);
		},
		edit:function(realFileName,storeFileName,ownerID){
			this.mode = "edit";
			this.fileInfo = {
				realFileName:realFileName,
				storeFileName:storeFileName,
				ownerID:ownerID
			};
			this.download(this.fileInfo.realFileName,this.fileInfo.storeFileName,this.fileInfo.ownerID);
		}
	});
	
	return FileEditor;
});