define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.mainDataCustomRefresh = function(event) {
		var options = {
			dataType: "json",
			url: require.toUrl("$UI/system/service/common/queryOnlineUsers.j")
		};
		var result = biz.Request.sendHttpRequest(options);
		var number = 0;
		if (biz.Request.isSuccess(result) && result.responseJSON.flag){
			var data = biz.Request.getData(result);
			event.source.loadData(data);
			event.source.first();
			number = data.rows.length;
		}else{
			event.source.clear();
			justep.Util.confirm("更新在线用户数失败！");
		}
		$(this.getElementByXid("number")).text(number);
	};
	return Model;
});