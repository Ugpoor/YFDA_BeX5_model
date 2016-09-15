define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
		this.setListeners();
	};

	Model.prototype.setListeners = function(event) {
		this.DeviceReadyListener = function() {
			justep.Util.hint("deviceReady: 设备就绪！");

		}

		this.ResumeListener = function() {
			setTimeout(function() {
				justep.Util.hint("resume:应用恢复到前台！");
			}, 2000);
		}
		this.PauseListener = function() {
			justep.Util.hint("pause:应用收到后台！", {
				"type" : "danger"
			});
		}
		this.BackKeyDownListener = function() {
			justep.Util.hint("backbutton:您点击了返回键！", {
				"type" : "danger"
			});
		}
		this.MenuKeyDownListener = function() {
			justep.Util.hint("menubutton:您点击了Menu键！", {
				"type" : "danger"
			});
		}
		this.MenuKeyDownListener = function() {
			justep.Util.hint("menubutton:您点击了Menu键！", {
				"type" : "danger"
			});
		}

		this.SearchKeyDownListener = function() {
			justep.Util.hint("searchbutton:您点击了搜索键！", {
				"type" : "danger"
			});
		}
		this.VolumeDownKeyDownListener = function() {
			justep.Util.hint("volumedownbutton:您按下了减小音量键", {
				"type" : "danger"
			});
		}

		this.VolumeUpKeyDownListener = function() {
			justep.Util.hint("volumeupbutton:您按下了增大音量键", {
				"type" : "danger"
			});
		}

	}
	Model.prototype.onDeviceReadyClick = function(event) {
		document.addEventListener("deviceReady", this.DeviceReadyListener, false);

	};

	Model.prototype.onResumeClick = function(event) {
		document.addEventListener("resume", this.ResumeListener, false);
		justep.Util.hint("OK,您监听了resume事件，切换app试试");
	};

	Model.prototype.onPauseClick = function(event) {
		document.addEventListener("pause", this.PauseListener, false);
		justep.Util.hint("OK,您监听了pause事件，切换app试试");
	};

	Model.prototype.onBackKeyDownClick = function() {
		document.addEventListener("backbutton", this.BackKeyDownListener, false);
		justep.Util.hint("您监听了backbutton事件，点返回键试试");
	}
	Model.prototype.onMenuKeyDownClick = function() {
		document.addEventListener("menubutton", this.MenuKeyDownListener, false);
		justep.Util.hint("您监听了menubutton事件，点返Menu键试试");
	}
	Model.prototype.onSearchKeyDownClick = function() {
		document.addEventListener("searchbutton", this.SearchKeyDownListener, false);
		justep.Util.hint("您监听了searchbutton事件，点返搜索键试试");
	}
	Model.prototype.onVolumeDownKeyDownClick = function() {
		document.addEventListener("volumedownbutton", this.VolumeDownKeyDownListener, false);
		justep.Util.hint("您监听了音量减小事件，减小音量试试");
	}
	Model.prototype.onVolumeUpKeyDownDownClick = function() {
		document.addEventListener("volumeupbutton", this.VolumeUpKeyDownListener, false);
		justep.Util.hint("您监听了音量增大事件，增大音量试试");
	}

	Model.prototype.stopEventListener = function(event) {
		document.removeEventListener("deviceready", this.DeviceReadyListener, false);
		document.removeEventListener("resume", this.ResumeListener, false);
		document.removeEventListener("pause", this.PauseListener, false);
		document.removeEventListener("backbutton", this.BackKeyDownListener, false);
		document.removeEventListener("volumedownbutton", this.VolumeDownKeyDownListener, false);
		document.removeEventListener("volumeupbutton", this.VolumeUpKeyDownListener, false);

		justep.Util.hint("OK,您移除了监听！");
	};
	Model.prototype.modelModelConstructDone = function(event) {
		var utils = require("$UI/demo/plugin/utils");
		utils.showCode(this, "setListeners").showCode("onDeviceReadyClick").showCode("onResumeClick").showCode("onPauseClick").showCode("onBackKeyDownClick").showCode("onVolumeDownKeyDownClick")
				.showCode("onVolumeUpKeyDownDownClick").showCode("stopEventListener").prettyPrint();
	};
	return Model;
});
