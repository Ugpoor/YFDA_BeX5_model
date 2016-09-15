define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!com.justep.cordova.plugin.iFlytek");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
	//开始语音听写，
	Model.prototype.startListenningClick = function(event){
		alert("请对准麦克风开始说话");
		navigator.speech.startListening({}, 
			function(res) {
				alert("listen:" + JSON.stringify(res));
		});
	};
	//取消听写
	Model.prototype.cancleListenningClick = function(event){
		navigator.speech.cancelListening();
	};
	//停止听写
	Model.prototype.stopListenningClick = function(event){
		navigator.speech.stopListening();
	};
	
	//开始语音合成
	Model.prototype.startSpeakingClick = function(event){
		navigator.speech.startSpeaking("故今日之责任，不在他人，而全在我少年。少年智则国智，少年富则国富；少年强则国强，少年独立则国独立；少年自由则国自由；少年进步则国进步；少年胜于欧洲，则国胜于欧洲；少年雄于地球，则国雄于地球。");
	};
	//暂停语音合成
	Model.prototype.pauseSpeakingClick = function(event){
		navigator.speech.pauseSpeaking();
	};
	//恢复语音合成
	Model.prototype.resumeSpeakingClick = function(event){
		navigator.speech.resumeSpeaking();
	};
	//停止语音合成
	Model.prototype.stopSpeakingClick = function(event){
		navigator.speech.stopSpeaking();
	};
	Model.prototype.modelModelConstructDone = function(event){
		utils.showCode(this, "startListenningClick");
		utils.showCode(this, "cancleListenningClick");
		utils.showCode(this, "stopListenningClick");
		utils.showCode(this, "startSpeakingClick");
		utils.showCode(this, "pauseSpeakingClick");
		utils.showCode(this, "resumeSpeakingClick");
		utils.showCode(this, "stopSpeakingClick");
		utils.prettyPrint();
	};
	return Model;
});