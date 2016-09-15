define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.submitClick = function(event){
		var data = this.comp("data");
		if (data.isValid()){
			var author = data.val("author");
			var comment = data.val("comment");
			if (author && comment){
				//将当前评论提交给主页面处理
				this.owner.send({author: author, comment: comment});
				
	
				//清空当前评论
				data.setValue("author", "");
				data.setValue("comment", "");
			}
		} else {
			justep.Util.hint(data.getInvalidInfo());
		}
	};

	return Model;
});
