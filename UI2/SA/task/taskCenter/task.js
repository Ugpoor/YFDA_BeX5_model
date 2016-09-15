define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var MessageDialog = require("$UI/system/components/justep/messageDialog/messageDialog");
	
	return {
		recy: function(vm, dataXid, windowXid){
			var mainData = vm.comp(dataXid);
			//要求sCURL能推出相应的activity
			var url = mainData.val("sCURL");
			if (!url){
				var name = mainData.val("sName");
				throw new Error("被回收任务 '" + name + "' 的sCURL不允许为空！");
			}
			
			if (!vm._recyTaskDialog) {
				vm._recyTaskDialog = new MessageDialog({
					parentNode : vm.getElementByXid(windowXid)
				});
				vm._recyTaskDialog.on("onOK", function() {
					var creatorFID = mainData.val("sCreatorFID");
					var process = mainData.val("sProcess");
					var activity = url.substring(url.lastIndexOf("/")+1, url.lastIndexOf("."));
					
					var param = new biz.Request.ActionParam();
					param.setString("task", mainData.getCurrentRowID());
					var options = {
						context : vm.getContext(),
						parameters : param,
						process : process,
						activity : activity,
						action : "withdrawTaskAction",
						contentType : biz.Request.JSON_TYPE,
						dataType : biz.Request.JSON_TYPE,
						directExecute : true,
						executor: creatorFID,
						callback : function(data) {
							if (data.state) {
								mainData.refreshData();
							} else {
								data.ignoreError = false;
							}
						}
					};
					biz.Request.sendBizRequest(options);
				});
			}
			vm._recyTaskDialog.show({
				type : "OKCancel",
				title : "提示",
				message : "确认要回收当前选中的任务吗？"
			});
		}
	};
});