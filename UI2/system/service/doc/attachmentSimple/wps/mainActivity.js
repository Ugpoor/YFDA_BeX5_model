//http://192.168.1.97:8080/x5/UI2/system/service/doc/attachmentSimple/wps/mainActivity.w?process=/SA/doc/docSetting/docSettingProcess&activity=mainActivity
define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
		this.comp('attachmentSimple2').on('fileOpened',function(event){
			var data = event.data;
			data.editorContext.exec(function(){
				//"params","editorApplication"
				editorApplication.insertDocumentField("001");
				editorApplication.setDocumentField('001',params.key);
				
				//editorApplication.showDocumentField('001',false);
			},{"key":"新的域填充值"});
		});
	};
	return Model;
});