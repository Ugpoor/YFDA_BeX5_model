define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.callParent();
		this.isVisible=util.flag;
	};
	Model.prototype.outputClick = function(event) {
		var index = event.bindingContext.$index();
		this.click("output", "output", "outputcss", "outputcs", index); 
	};
	Model.prototype.valueBtnClick = function(event) {
		var check = this.checkvalue("output", "output","outputcss")
		justep.Util.hint(check);
	};
	Model.prototype.outputCkeckedClick = function(event) {
		var index = event.bindingContext.$index();
		this.checkBoxClick("outputCkecked", "radio", "outputcss", "outputcs", index)
	};
	Model.prototype.radioValueBtnClick = function(event) {
		var check = this.value("outputCkecked","radio", "outputcss")
		justep.Util.hint(check);
	};
	Model.prototype.defaultBtnClick = function(event) {
		var obj = this.comps("defaultOutput");
		var check = "";
		for (var int = 0; int < obj.length; int++) {
			var string = $(".default:eq(" + int + ")").attr("class")
			var str = string.split(" ", string.length);
			if (this.indexOf("outputcss", str) > 0) {
				check = obj[int].value + " ";
			}}
		justep.Util.hint(check);
	};
	Model.prototype.initOutputClick = function(event) {
		var index = event.bindingContext.$index();
		this.click("initOutput", "init", "outputcss", "outputcs", index)
	};
	//设置初始值
	Model.prototype.modelLoad = function(event) {
		$(".default:eq(" + 0 + ")").addClass("outputcss")
		$(".init:eq(" + 0 + ")").addClass("outputcss")
		$(".init:eq(" + 1 + ")").addClass("outputcss")
		$(".init:eq(" + 2 + ")").addClass("outputcss")
	};
	//设置始终选中一项
	Model.prototype.defaultOutputClick = function(event) {
		var obj = this.comps("defaultOutput");
		var index = event.bindingContext.$index();
		var string = $(".default:eq(" + index + ")").attr("class")
		var str = string.split(" ", string.length);
		for (var i = 0; i < obj.length; i++) {
			if (i == index) {
				$(".default:eq(" + index + ")").removeClass("outputcs");
				$(".default:eq(" + index + ")").addClass("outputcss")
			} else {
				$(".default:eq(" + i + ")").removeClass("outputcss");
				$(".default:eq(" + i + ")").addClass("outputcs")
			}
		}
	};
	//动态选中
	Model.prototype.dynamicBtnClick = function(event) {
		var string = $(".dynamic:eq(" + 0 + ")").attr("class")
		var str = string.split(" ", string.length);
		if (this.indexOf("outputcss", str) < 0) {
			$(".dynamic:eq(" + 0 + ")").removeClass("outputcs");
			$(".dynamic:eq(" + 0 + ")").addClass("outputcss")
		}
		var chars = $(".dynamic:eq(" + 1 + ")").attr("class")
		var char = chars.split(" ", chars.length);
		if (this.indexOf("outputcss", char) < 0) {
			$(".dynamic:eq(" + 1 + ")").removeClass("outputcs");
			$(".dynamic:eq(" + 1 + ")").addClass("outputcss")
		}
		var obj = this.comps("dynamicOutput");
		for (var i = 2; i < obj.length; i++) {
			$(".dynamic:eq(" + i + ")").removeClass("outputcss");
			$(".dynamic:eq(" + i + ")").addClass("outputcs");
		}
	};
	Model.prototype.dynamicOutputClick = function(event) {
		var index = event.bindingContext.$index();
		this.click("dynamicOutput", "dynamic", "outputcss", "outputcs", index);
	};
	Model.prototype.brandOutputClick = function(event) {
		var index = event.bindingContext.$index();
		this.click("brandOutput", "brand", "outputcsss", "outputcs", index)
		
	};
	Model.prototype.classOutputClick = function(event) {
		var index = event.bindingContext.$index();
		this.checkBoxClick("classOutput", "class", "outputcsss", "outputcs", index)
	};
	Model.prototype.sizeOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.checkBoxClick("sizeOutput", "size", "outputcsss", "outputcs", index)
	};
	Model.prototype.priceOutputClick = function(event) {
		var index = event.bindingContext.$index();
		this.checkBoxClick("priceOutput", "price", "outputcsss", "outputcs", index)
	};
	//提交选中项
	Model.prototype.submitBtnClick = function(event) {
		var brand =this.checkvalue("brandOutput", "brand", "outputcsss")
		var type = this.value("classOutput", "class", "outputcsss");
		var role = this.value("sizeOutput", "size", "outputcsss");
		var price =  this.value("priceOutput", "price", "outputcsss");
		
		var message = this.comp("messageDialog");
		message.show({
			message : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌: " + brand + "\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;种类: " + type
					+ "\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;功能: " + role + "\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格: "
					+ price
		})
	};
	//重置选中项
	Model.prototype.resetBtnClick = function(event) {
		this.reset("brandOutput", "brand", "outputcss","outputcs");
		this.reset("classOutput", "class", "outputcss","outputcs");
		this.reset("functionOutput", "function", "outputcss","outputcs");
		this.reset("priceOutput", "price", "outputcss","outputcs");
	};
	// js代码
	Model.prototype.jsBtnClick = function(event){
			util.showSource({
			self : this,
			data : "demo/pcSample/form-element/filterCondition.js"
		},true);
	};
	// 源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/filterCondition.w&xid=contents"
		}, true);
	};
	//单项选中
	Model.prototype.click = function(xid,css,newClass,oldClass,index) {
		var obj = this.comps(xid);
		var string = $("."+css+":eq(" + index + ")").attr("class")
		var str = string.split(" ", string.length);
		debugger
		if (this.indexOf(newClass, str) > 0) {
			$("."+css+":eq(" + index + ")").removeClass(newClass);
			$("."+css+":eq(" + index + ")").addClass(oldClass);
		} else {
			$("."+css+":eq(" + index + ")").addClass(newClass);
			$("."+css+":eq(" + index + ")").removeClass(oldClass);
		}
		
	}
	//数组查找元素
	Model.prototype.indexOf = function(val, arr) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i] == val)
				return i;
		}
		return -1;
	}
	//获取选中值
	Model.prototype.checkvalue = function(xid,css,newClass) {
		var obj = this.comps(xid);
		var check = "";
		for (var int = 0; int < obj.length; int++) {
			var string = $("."+css+":eq(" + int + ")").attr("class")
			var str = string.split(" ", string.length);
			if (this.indexOf(newClass, str) > 0) {
				check += obj[int].value + " ";
			}};
		return check;
	}
	//多项选中
	Model.prototype.checkBoxClick = function(xid,css,newClass,oldClass,index) {
		var obj = this.comps(xid);
		var string = $("."+css+":eq(" + index + ")").attr("class")
		var str = string.split(" ", string.length);
		for (var i = 0; i < obj.length; i++) {
			if (i == index) {
				if (this.indexOf(newClass, str) > 0) {
					$("."+css+":eq(" + index + ")").addClass(oldClass)
					$("."+css+":eq(" + index + ")").removeClass(newClass);
				} else {
					$("."+css+":eq(" + index + ")").addClass(newClass)
					$("."+css+":eq(" + index + ")").removeClass(oldClass);
				}
			} else {
				$("."+css+":eq(" + i + ")").addClass(oldClass)
				$("."+css+":eq(" + i + ")").removeClass(newClass);
			}
		}
	}
	//重置选中项
	Model.prototype.reset = function(xid,css,newClass,oldClass) {
	var brandOutput = this.comps(xid);
		for (var int = 0; int < brandOutput.length; int++) {
			var string = $("."+css+":eq(" + int + ")").attr("class")
			var str = string.split(" ", string.length);
			if (this.indexOf(newClass, str) > 0) {
				$("."+css+":eq(" + int + ")").removeClass(newClass);
				$("."+css+":eq(" + int + ")").addClass(oldClass);
			}
		};
	}
	//获取多项选中值
	Model.prototype.value = function(xid,css,newClass) {
	var obj = this.comps(xid);
		var check = "";
		for (var int = 0; int < obj.length; int++) {
			var string = $("."+css+":eq(" + int + ")").attr("class")
			var str = string.split(" ", string.length);
			if (this.indexOf(newClass, str) > 0) {
				check = obj[int].value + " ";
			}
		};
		return check;
	}
	
	return Model;
});