define(function(require){
	//var $ = require("jquery");
	//var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.importExcel = null;
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
		var importExcel = this.importExcel;
		var data = this.comp('cfgData');
		var cfg = importExcel._cfg;
		importExcel.useDefault = '1'!=data.getValue('userConfig');
		cfg.allSheet = '1'==data.getValue('allSheet');
		cfg.sheetStart = data.getValue('sheetStart');
		cfg.sheetEnd = data.getValue('sheetEnd');
		cfg.allRow = '1'==data.getValue('allRow');
		cfg.rowStart = data.getValue('rowStart');
		cfg.rowEnd = data.getValue('rowEnd');
		cfg.mapping = data.getValue('mapping');
	};

	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure(this.result());
	};

	Model.prototype._doFileSelected = function(event){
		this.comp('cfgData').setValue('excel',event.file.name);
	};
	
	Model.prototype.init = function(){
		var importExcel = this.importExcel;
		var data = this.comp('cfgData');
		//创建上传组件
		importExcel._createUploader(this.getElementByXid("openBtn"));
		importExcel.uploader.on('onFileSelected', this._doFileSelected, this);
		//初始化相关参数
		var cfg = importExcel._cfg;
		data.setValue('userConfig',importExcel.useDefault?"0":"1");
		data.setValue('allSheet',cfg.allSheet?"1":"0");
		data.setValue('sheetStart',cfg.sheetStart);
		data.setValue('sheetEnd',cfg.sheetEnd);
		data.setValue('allRow',cfg.allRow?"1":"0");
		data.setValue('rowStart',cfg.rowStart);
		data.setValue('rowEnd',cfg.rowEnd);
		if(importExcel.mappings){
			var rows = [];
			var mappList = importExcel.mappings.split(',');
			for(var i=0;i<mappList.length;i++){
				var s = mappList[i];
				var name = s.substring(s.lastIndexOf("/")+1);
				rows.push({
					file: s,
					fileName: name
				});
			}
			if(rows.length>0)data.setValue('mapping',rows[0].file);
			this.comp('mappingFilesdata').loadData({rows:rows});
		}
	};

	Model.prototype.wReceiverReceive = function(event){
		//处理接收参数
		if(this.importExcel!==event.data){
			this.importExcel = event.data;
			this.init();
		}
	};

	return Model;
});