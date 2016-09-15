define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	require("cordova!com.phonegap.plugins.videoplayer");
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.playVideoClick = function(event) {
		var url = this.comp("url").val();
		if(!url){
			justep.Util.hint("请输入视频路径", {type : "danger"});
			return false;
		}
		cordova.plugins.videoPlayer.play(url);
	};

	Model.prototype.localBtnClick = function(event){
		justep.Shell.showPage("fileSystem");
	};

	Model.prototype.modelLoad = function(event){
		var web = "http://doc.wex5.com/wp-content/uploads/2016/04/2.mp4"
		this.comp("url").val(web);
	};

	return Model;
});