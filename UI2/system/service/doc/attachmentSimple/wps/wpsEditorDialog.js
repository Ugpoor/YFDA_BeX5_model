define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		
	};
	
	
	//http://192.168.1.97:8080/x5/UI2/test/slm/wps/wpsEditorDialog.w?storeFileName=C69F2562A4E00001CB5372811100B690&ownerID=C698B4B906800001521712F04B651BE7&operateType=browse&realFileName=test.wps
	Model.prototype.modelLoad = function(event){
		var userAgent = navigator.userAgent.toUpperCase(); 
    	if(userAgent.indexOf('X11') == -1 || userAgent.indexOf('FIREFOX') == -1){
    		justep.Util.hint("需要安装wps及插件！");
    		return;
    	}
		this.getParam();
		this.initPlugin();
		this.attachEvent();
		//this.openFile();
		
	};
	
	Model.prototype.attachEvent = function(){
		var self = this;
		this.comp('editorReceiver').on('onReceive',function(event){
			if(event.data){
				var data = JSON.parse(event.data);
				if(data.type === "fileOpened"){
					var editorApplication = self.wpsEditorPlugin.Application;
					var func = data.func;
					var params = data.params;
					var execFunc = new Function("params","editorApplication","return (" + func.toString() +")")(params,editorApplication);
					execFunc.call(self,params,editorApplication);
				}
			}			
		});
	};
	
	Model.prototype.getParam = function(){
		var context = this.getContext();
		this.storeFileName = context.getRequestParameter('storeFileName');
		this.ownerID = context.getRequestParameter('ownerID');
		this.realFileName = context.getRequestParameter('realFileName');
		//?storeFileName=C69F2562A4E00001CB5372811100B690&ownerID=C698B4B906800001521712F04B651BE7&operateType=browse&realFileName=test.wps
		var wpsBaseUrlObj = new justep.URL(require.toUrl('$UI/system/service/doc/common/simpleFileStore.j'));
		wpsBaseUrlObj.protocol = location.protocol;
		wpsBaseUrlObj.hostname = location.hostname;
		wpsBaseUrlObj.port = location.port;
		this.wpsBaseUrl = wpsBaseUrlObj.toString();
		this.wpsPluginDataUrl = './Normal.wpt';
	};
	
	Model.prototype.initPlugin = function(){
		var wpsParent = this.getElementByXid("wpsObjectParent");
		var codes=[];
		codes.push("<object  name='webwps' id='webwps_id' type='application/x-wps' data='"+ this.wpsPluginDataUrl +"'  width='100%'  height='100%' >  </object>");
		wpsParent.innerHTML = codes.join("");
		this.wpsEditorPlugin = document.getElementById("webwps_id");
		this.comp('editorReceiver').sendData({
			eventName:"pluginInited"
		});
	};
	
	
	Model.prototype.openFile = function(){
		var editorApplication = this.wpsEditorPlugin.Application;
		var openUrl = new justep.URL(this.wpsBaseUrl);
		openUrl.setParam('storeFileName',this.storeFileName);
		openUrl.setParam('ownerID',this.ownerID);
		openUrl.setParam('operateType','browse');
		openUrl.setParam('realFileName','test.wps');
		var ret = editorApplication.openDocumentRemote(openUrl.toString(), false);
		if(!ret){
			alert('打开失败');
		}else{
			var data = {
				eventName:"fileOpened",
				func:function(){},
				params:{}
			};
			this.comp('editorReceiver').sendData(data);
		}
	};
	

	Model.prototype.saveBtnClick = function(){
		var editorApplication = this.wpsEditorPlugin.Application;
		var saveUrl = new justep.URL(this.wpsBaseUrl);
		saveUrl.setParam('storeFileName',this.storeFileName);
		saveUrl.setParam('ownerID',this.ownerID);
		var ret = editorApplication.saveURL(saveUrl.toString(), this.realFileName);
		if(!ret){
			alert('保存失败');
		}else{
			editorApplication.close();
			window.close();
		}
	};

	
	Model.prototype.openBtnClick = function(event){
		this.openFile();
	};
	
	Model.prototype.editorReceiverReceive = function(event){
		
	};
	
	Model.prototype.button1Click = function(event){
		var filedID = prompt("请输入域ID");
		var editorApplication = this.wpsEditorPlugin.Application;
		editorApplication.insertDocumentField(filedID);
	};
	
	return Model;
});