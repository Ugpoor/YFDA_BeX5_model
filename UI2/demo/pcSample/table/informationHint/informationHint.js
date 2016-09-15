define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;
	};


	//单击事件
	Model.prototype.dataTablesRowClick = function(event){
		var row = this.comp("tableData").getCurrentRow();//获取data当前的行
		var domButton = $(event.domEvent.target);//获取点击的元素
	    var temp = this.comp("popOverData");
	    if (domButton.hasClass("infoBtn")) {//判断是否包含某个样式，怎么使用转换按钮button的其他事件？？？？？？？？
			temp.newData({
				defaultValues:[{
					"tName": row.val("tName"),
					"tSex":	row.val("tSex"),
					"tAge":	row.val("tAge"),
					"tPhone":	row.val("tPhone"),
					"tAddress":	row.val("tAddress")
				}]
			});
			var popOver = this.comp('demoPopOver');
			popOver.show();
			//设置定时隐藏popOver
			setTimeout(function(){
				popOver.hide();
			},5000);
	    }
	};

	//把tHint列  转换成 按钮button
	Model.prototype.dataTablesCellRender = function(event){
	
		if(event.colName == 'tName'){
			event.html = this.comp("tableData").getValue("tName",event.row)+"<i xid='i3' class='icon-card text-primary o-info infoBtn'/>";
		}
		if(event.colName == 'tHint'){
			event.html = "<i xid='i3' class='icon-android-note text-primary o-info' title='详情'/> <i xid='i3' class='icon-compose text-primary o-info' title='修改'/> <i xid='i3' class='icon-close text-danger o-info' title='删除'/>";
		}
	};
	
	//显示 js代码
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self: this,
			data: 'demo/pcSample/table/informationHint/informationHint.js'
		},true);
	};
	//显示源码
	Model.prototype.showSourceBtnClick = function(event){
		util.showSource({
			data: 'demo/pcSample/table/informationHint/informationHint.w$xid=window',
			self: this,
			type: true
		},true);
	};

	return Model;
});