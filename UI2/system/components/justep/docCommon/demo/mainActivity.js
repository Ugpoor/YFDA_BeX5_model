define(function(require){
	var $ = require("jquery");
	var fileApi = require("$UI/system/components/justep/docCommon/fileApi");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.modelModelConstructDone = function(event){
		var self = this;
		this.addLogFile().done(function(){
			self.changeRoot();
		});
	};
	
	//test
	Model.prototype.addLogFile = function(event) {
		var dtd = $.Deferred();
		fileApi.getFS(0, 1024*1024).done(function(fs) {
			fs.root.getDirectory('test', {
				create : true
			}, function(dirEntry) {
				fs.root.getFile('test/temp.txt', {
					create : true
				}, function(fileEntry) {
					fileEntry.createWriter(function(fileWriter) {
						fileWriter.onwriteend = function(e) {
							console.log('写入完毕.');
							dtd.resolve();
						};
						fileWriter.onerror = function(e) {
							console.log('写入失败: ' + e.toString());
							dtd.reject();
						};
						var blob = new Blob([ 'test insert text into file' ], {
							type : 'text/plain'
						});
						fileWriter.write(blob);
					}, null);
				}, null);
			}, null);
		});
		return dtd;
	};
	
	return Model;
	
});