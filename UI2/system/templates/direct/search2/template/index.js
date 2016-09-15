define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!com.justep.cordova.plugin.iFlytek");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.sayingTouchstart = function(event) {
		this.comp('popOver1').show();
		var search = this.comp('search');
		navigator.speech.startListening({
			"asr_ptt" : 0
		}, function(res) {

			search.val(res);
		});
	};

	Model.prototype.sayingTouchend = function(event) {
		this.comp('popOver1').hide();
		navigator.speech.stopListening(function(res) {
			alert("stopListen OK :" + JSON.stringify(res))
		}, function(res) {
			alert("stopListen NO :" + JSON.stringify(res))
		});

	};



	return Model;
});