define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var stopRoll;
	var stopcustomRoll;
	var Model = function() {
		this.callParent();
	};
	Model.prototype.modelLoad = function(event) {
		// 字体滚动
		var divId = this.getIDByXID("rollDiv");// 根据div的xid取对应的id
		var divObj = document.getElementById(divId); // 根据id取js对象
		var left = -60;// 规定内侧div距离外侧div的初始值
		// 循环方法设置div距离左边的距离，当大于外侧div的宽度时，恢复left初始值
		window.setInterval(function() {
			left++;
			if (left > 450) {
				left = -60;
			}
			divObj.style.left = left + 'px';
		}, 40);
		// 新闻滚动
		var newsUlid = this.getIDByXID('newsUl');// 得到ul的id
		var newsUlObj = document.getElementById(newsUlid);// 得到ul的js对象
		var top = 0;// ul的top初始值
		var me = this;
		stopRoll = window.setInterval(function() {// 循环自定义方法
			top--; // 每次向上移动一像素
			if (top < -25) {// 想向上移动25像素时
				var val = me.comp('newData').getFirstRow().val('new');// 得到data的第一行的值
				var row = me.comp('newData').getFirstRow();// 得到第一行的行对象
				me.comp('newData').deleteData(row);// 将第一行删除
				me.comp('newData').newData({// 将第一行的数据重新添加到data
					defaultValues : [ {
						"new" : val
					} ]
				});
				top = 0;// 恢复top的初始值
			}
			newsUlObj.style.top = top + 'px';// 设置ul的top值
		}, 100);
		// 自定义新闻条数
		var customUlid = this.getIDByXID('customUl');// 得到ul的id
		var customUlObj = document.getElementById(customUlid);// 得到ul的js对象
		var customTop = 0;// ul的top初始值
		var me = this;
		stopcustomRoll = window.setInterval(function() {// 循环自定义方法
			customTop--; // 每次向上移动一像素
			if (customTop < -25) {// 想向上移动25像素时
				var val = me.comp('customData').getFirstRow().val('customNew');// 得到data的第一行的值
				var row = me.comp('customData').getFirstRow();// 得到第一行的行对象
				me.comp('customData').deleteData(row);// 将第一行删除
				me.comp('customData').newData({// 将第一行的数据重新添加到data
					defaultValues : [ {
						"customNew" : val
					} ]
				});
				customTop = 0;// 恢复top的初始值
			}
			customUlObj.style.top = customTop + 'px';// 设置ul的top值
		}, 100);
	};

	// 鼠标移上去停止滚动
	Model.prototype.newsListMouseover = function(event) {
		window.clearInterval(stopRoll);
	};
	// 鼠标离开继续滚动
	Model.prototype.newsListMouseleave = function(event) {
		var newsUlid = this.getIDByXID('newsUl');// 得到ul的id
		var newsUlObj = document.getElementById(newsUlid);// 得到ul的js对象
		var top = newsUlObj.style.top;// ul的top初始值
		top = top.substring(0, top.length - 2);// 截取ul的top，去掉px两个字符
		var me = this;
		stopRoll = window.setInterval(function() {// 循环自定义方法
			top--; // 每次向上移动一像素
			if (top < -25) {// 想向上移动25像素时
				var val = me.comp('newData').getFirstRow().val('new');// 得到data的第一行的值
				var row = me.comp('newData').getFirstRow();// 得到第一行的行对象
				me.comp('newData').deleteData(row);// 将第一行删除
				me.comp('newData').newData({// 将第一行的数据重新添加到data
					defaultValues : [ {
						"new" : val
					} ]
				});
				top = 0;// 恢复top的初始值
			}
			newsUlObj.style.top = top + 'px';// 设置ul的top值
		}, 100);
	};
	
	Model.prototype.customListMouseover = function(event) {
		window.clearInterval(stopcustomRoll);
	};
	Model.prototype.customListMouseleave = function(event) {
		var customUlid = this.getIDByXID('customUl');// 得到ul的id
		var customUlObj = document.getElementById(customUlid);// 得到ul的js对象
		var customTop = customUlObj.style.top;// ul的top初始值
		customTop = customTop.substring(0, customTop.length - 2);// 截取ul的top，去掉px两个字符
		var me = this;
		stopcustomRoll = window.setInterval(function() {// 循环自定义方法
			customTop--; // 每次向上移动一像素
			if (customTop < -25) {// 想向上移动25像素时
				var val = me.comp('customData').getFirstRow().val('customNew');// 得到data的第一行的值
				var row = me.comp('customData').getFirstRow();// 得到第一行的行对象
				me.comp('customData').deleteData(row);// 将第一行删除
				me.comp('customData').newData({// 将第一行的数据重新添加到data
					defaultValues : [ {
						"customNew" : val
					} ]
				});
				customTop = 0;// 恢复top的初始值
			}
			customUlObj.style.top = customTop + 'px';// 设置ul的top值
		}, 100);

	};
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/text/roll.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/text/roll.w&xid=window"
		},true);
	};
	return Model;
});