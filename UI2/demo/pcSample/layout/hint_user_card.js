define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.isVisible = util.flag;
		this.callParent();
	};

	Model.prototype.userDataCustomRefresh = function(event){
		this.comp("userData").newData({
			defaultValues:[{
				fId:"001",
				fUserName:"admin",
				fName:"张三",
				fPassword:"123456",
				fRemark:"备注"
			}]
		});
	};

	Model.prototype.editClick = function(event){
		this.comp("statusData").setValue("edit", 1);
	};

	Model.prototype.sureClick = function(event){
		this.comp("statusData").setValue("edit", 0);
		this.comp("popOver1").hide();
	};
	//js
	Model.prototype.jsClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/hint_user_card.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/hint_user_card.w&xid=window"
		},true);
	};

	return Model;
});