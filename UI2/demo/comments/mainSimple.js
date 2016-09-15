define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.submitClick = function(event) {
		var commentData = this.comp("commentData");
		if (commentData.isValid()) {
			var author = commentData.val("author");
			var comment = commentData.val("comment");
			if (author && comment) {
				var data = this.comp("data");
				data.add({
					author : author,
					comment : comment
				});

				commentData.setValue("author", "");
				commentData.setValue("comment", "");
			}
		} else {
			justep.Util.hint(commentData.getInvalidInfo());

		}

	};

	return Model;
});
