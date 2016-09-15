define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.commentFormReceive = function(event){
		//正常的逻辑: 将新的comment提交到服务端, 之后从服务端取最新的评论
		//当前简化: 直接将新的评论插入到data中, 展现会自动显示当前data中的评论
		var data = this.comp("data");
		data.add({
			author: event.data.author, 
			comment: event.data.comment});
		
	};

	return Model;
});