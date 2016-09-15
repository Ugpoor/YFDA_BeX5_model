define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Button=require("$UI/system/components/justep/button/button");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.callParent();
	};
	//改变statusData的值控制为显示状态
	Model.prototype.multiseriateBtnMouseover = function(event) {
		this.comp("statusData").setValue("status", 1);
	};
	//改变statusData的值控制为不显示状态
	Model.prototype.multiseriateDivMouseleave = function(event) {
		this.comp("statusData").setValue("status", 0);
	};
	Model.prototype.contentDivMouseover = function(event) {
		this.comp("contentData").setValue("status", 1);
	};
	Model.prototype.contentDivMouseleave = function(event) {
		this.comp("contentData").setValue("status", 0);
	};
	//select组件绑定Data组件 得到选中的data数据 使select选中项改变
	Model.prototype.citySelectChange = function(event) {
		var city = event.source.val();
		this.comp('selectData').setValue("fCity", city);
	};

	Model.prototype.areaSelectChange = function(event) {
		var area = event.source.val();
		this.comp('selectData').setValue("fArea", area);
	};
	//鼠标移上去控制select组件是否显示
	Model.prototype.selectDivMouseover = function(event) {
		this.comp('selectData').setValue("fStatus", 1);
	};

	Model.prototype.selectDivMouseleave = function(event) {
		this.comp('selectData').setValue("fStatus", 0);
	};
	//点击按钮创建一个 button组件 设置按钮的xid class 点击事件
	Model.prototype.creatBtnClick = function(event) {
		var parentNode = this.getElementByXid("controlGroup8");
		if (parentNode) {
			var xid = "Btn";
			var flag = {
				xid : xid,
				parentNode : parentNode,
				'class' : "btn btn-link btn-only-icon"
			};
			var button = new Button(flag);
			 button.set({
              "icon":"icon-android-add"
             })
             var me=this;
             button.on("onclick", function(event){
            	 me.comp('popMenu').show();
             });
			
		}

	};

	Model.prototype.jsClick = function(event){
			 util.showSource({
              self : this,
               data : "demo/pcSample/navigator/popupMenu.js"
             },true);
	};

	
	Model.prototype.sourceClick = function(event){
		util.showSource({
	   self : this,
	   type : true,
	   data : "demo/pcSample/navigator/popupMenu.w&xid=window"
	  },true);
	};

	
	return Model;
});