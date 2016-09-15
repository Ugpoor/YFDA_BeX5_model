define(function(require){
	var $ = require("jquery");
	require("cordova!cordova-plugin-spinner-dialog");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
//	function withCallback() {
//        window.plugins.spinnerDialog.show(
//            null,
//            null,
//            function(msg) {alert("Callback msg: " + msg)}
//        );
//    };
//

	Model.prototype.spinneronlyClick = function(event){
		window.plugins.spinnerDialog.show();
	};
	Model.prototype.mspinnerClick = function(event){
		window.plugins.spinnerDialog.show(
	          null,
	          "正在加载...",
	          null
	        );  
	};
	Model.prototype.persispinnerClick = function(event){
        window.plugins.spinnerDialog.show(
          "spinner标题",
          "显示5秒后消失",
          true
        );
        setTimeout(function() {
            window.plugins.spinnerDialog.hide();
        }, 5000);
	};
	Model.prototype.otspinnerClick = function(event){
        window.plugins.spinnerDialog.show(
          "只有标题的spinner",
          null,
          null
        );
	};
	Model.prototype.tmspinnerClick = function(event){
        window.plugins.spinnerDialog.show(
          "spinner标题",
          "正在加载...",
          null
        );
	};
	Model.prototype.modelModelConstructDone = function(event) {
		utils.showCode(this,"spinneronlyClick").showCode("mspinnerClick").showCode("persispinnerClick").showCode("otspinnerClick").showCode("tmspinnerClick").prettyPrint();
	};
	return Model;
});