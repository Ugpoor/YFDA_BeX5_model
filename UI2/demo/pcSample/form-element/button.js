define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Button = require("$UI/system/components/justep/button/button");
	var Message = require("$UI/system/lib/base/message");
	var Model = function() {
		this.callParent();
		this.isVisible = util.flag;
	};
	// 动态创建按钮，绑定点击事件弹出提示框
	Model.prototype.addBtnClick = function(event) {
		var parentNode = this.getElementByXid("addDefaultBtn");
		if (parentNode) {
			var xid = "Btn";
			var flag = {
				xid : xid,
				label : xid,
				parentNode : parentNode,
				'class' : "btn btn btn-default"
			};
			var button = new Button(flag);
			button.on("onClick", function(event) {
				justep.Util.hint("这是普通按钮");
			});
		}
	};
	// 动态创建按钮，绑定点击事件弹出提示框
	Model.prototype.addIconBtnClick = function(event) {
		var parentNode = this.getElementByXid("addiconBtn");
		if (parentNode) {
			var xid = "Btn";
			var flag = {
				xid : xid,
				label : "设置",
				parentNode : parentNode,
				'class' : "btn btn-default btn-icon-top"
			};
			var button = new Button(flag);
			button.on("onClick", function(event) {
				justep.Util.hint("这是图标按钮");
			});
			button.set({
				"icon" : "icon-gear-b"
			})
		}
	};

	// 获取选种值
	Model.prototype.toggleBtnClick = function(event) {

		justep.Util.hint(this.comp("toggleValue").value);
	};
	// 获取选种值
	Model.prototype.buttonToggleClick = function(event) {
		justep.Util.hint(this.comp("toggleVal").value);

	};
	// js代码
	Model.prototype.jsBtnClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/button.js"
		}, true);
	};

	// 源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/button.w&xid=contents"
		}, true);
	};

	return Model;
});