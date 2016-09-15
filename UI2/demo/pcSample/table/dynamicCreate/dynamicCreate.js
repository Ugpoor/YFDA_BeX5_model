define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var dataTables = require("$UI/system/components/justep/dataTables/dataTables");//引用dataTables.js
	var input = require("$UI/system/components/justep/input/input");
	var pwd=require("$UI/system/components/justep/input/password");
	var textarea = require("$UI/system/components/justep/textarea/textarea");
	var titleBar = require("$UI/system/components/justep/titleBar/titleBar");
	var button = require("$UI/system/components/justep/button/button");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js
	
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;//自定义的全局变量
	};

	//新增一行
	Model.prototype.addButtonClick = function(event){
		var temp = this.comp('data');
		var lastRow = temp.getLastRow();//获取最后一行
		if(lastRow != null){//当最后一行不为空时
			var rid = lastRow.val('tID');//获取行ID
			temp.newData({
				defaultValues:[{
					"tID": ++rid,
					"tName": this.comp('nameInput').val(),
					"tSex": this.comp('radioGroup').val(),
					"tAge": this.comp('ageInput').val(),
					"tAddress": this.comp('addressInput').val(),
				}]
			});
		}else{
			temp.newData({
				defaultValues:[{
					"tID": 1,
					"tName": this.comp('nameInput').val(),
					"tSex": this.comp('radioGroup').val(),
					"tAge": this.comp('ageInput').val(),
					"tAddress": this.comp('addressInput').val(),
				}]
			});
		}
		//清空input输入框中的数据
		this.comp('nameInput').val("");
		this.comp('radioGroup').val("");
		this.comp('ageInput').val("");
		this.comp('addressInput').val("");
	};
	
	//利用单元格渲染事件onCellRender  把操作 转换成按钮button
	Model.prototype.dataTablesCellRender = function(event){
		if(event.colName == "tOperation"){
			event.html = "<button class='btn btn-link btnUpper'>上移一行</button><button class='btn btn-link btnUpdate'>修改</button><button class='btn btn-link btnDel'>删除</button>";
		}
	};
	
	//给转换的按钮增加单击事件
	Model.prototype.dataTablesRowClick = function(event){
		var row = this.comp('data').getCurrentRow(true);//获取当前行数据
	    var domButton = $(event.domEvent.target);//获取点击的元素
	    var data = this.comp("data");
	    if (domButton.hasClass("btnUpdate")) {//判断是否包含某个样式
	        this.comp("windowsDialog").open({
	        	data:{
	        		name: row.val('tName'),
	        		sex: row.val('tSex'),
	        		age: row.val('tAge'),
	        		address: row.val('tAddress')
	        	}
	        });
	    }else if(domButton.hasClass("btnDel")){
	    	data.deleteData(event.row);
	    }else if(domButton.hasClass('btnUpper')){
	    	var index = row.index();//获取一行的索引
	    	if(index !=0){//判断是否为第一行
	    		data.deleteData(row);
	    		data.newData({
	    			index: index-1,
	    			defaultValues:[{
	    				'tID': row.val('tID'),
	    				'tName': row.val('tName'),
	    				'tSex': row.val('tSex'),
	    				'tAge': row.val('tAge'),
	    				'tAddress': row.val('tAddress')
	    			}]
	    		});
	    	}else{
	    		justep.Util.hint("第一行不能上移...");
	    	}
	    }
	};

	//接收弹窗返回的数据
	Model.prototype.windowsDialogReceive = function(event){
		this.comp('data').setValue("tName", event.data.name);
		this.comp('data').setValue("tSex", event.data.sex);
		this.comp('data').setValue("tAge", event.data.age);
		this.comp('data').setValue("tAddress", event.data.address);

	};
	
	//撤销按钮 单击事件
	Model.prototype.backButtonClick = function(event){
		var lastRow = this.comp('data').getLastRow();//获取最后一行
		if(lastRow != null && lastRow.getID()>1){
			this.comp('data').deleteData(lastRow);
		}
	};
	
	//动态创建 新表格
	Model.prototype.createTableBtnClick = function(event){
	    var parentNode = this.getElementByXid("tableDiv");
//	    var parentNode = this.getElementsByXid('tableDiv');//切记，这个是根据xid获取Element列表
	    var option = {
	        parentNode : parentNode,
	        //dataTables的属性，设计时有的属性都可以设置
	        xid: "cTable",
	        data : "createTableData",
	        class:'table table-bordered table-hover table-striped',
	        flexibleWidth : true,
	        responsive : false,
	        multiSelect: true,//多选框 属性，没有效果
	        showRowNumber: true,
	        ordering : true,
	        // 列定义
	        columns : [{sName:"name",xid:"column1"},
	                   {sName:"sex",xid:"column2"},
	                   {sName:"age",xid:"column3"},
	                   {sName:"phone",xid:"column4"},
	                   {sName:"address",xid:"column5"}]
	    };
	   var newTable = new dataTables(option);
	   newTable.setCSS({"margin": "0px"});//设置CSS样式
	};
	
	//动态创建 form表单
	Model.prototype.createFormBtnClick = function(event){
		var parentNode = this.getElementByXid('formDiv');
		//生成titleBar标题栏
		if (parentNode) {
			var bar = {
				"xid" : "titleBarNew",
			    "title" :"动态创建form表单",
			    "class" : "x-titlebar",
			    "parentNode" : parentNode,
			    "left" : {
			       "reverse" : "reverse",
			       "body" : ""
			    },
			    "right" : {
			       "reverse" : "reverse",
			       "body" : ""
			    }
			};
			var newTitleBar = new titleBar(bar);
			newTitleBar.setCSS({//设置CSS样式
				"margin-bottom": "5px",
				//"backgroundColor": "rgb(176, 245, 176)",
				"color": "black"
			});
			//生成input输入框
			var optionInput = {
				parentNode: parentNode,
				//组件 属性的设置
				xid: 'input',
				class: "form-control x-edit",
				style: "width:220px;"
			};
			var newInput= new input(optionInput);
			newInput.set({
				"placeHolder": "请输入用户名",
				"autoComplete": false
			});
			newInput.setCSS({
				"margin-bottom":"5px"
			});
			//生成password密码框
			var optionPwd = {
					parentNode: parentNode,
					xid:"pwd",
					class: "form-control x-edit",
					style: "width:220px;"
			};
			var newPwd = new pwd(optionPwd);
			newPwd.setCSS({
				"margin-bottom":"5px"
			});
			//生成textarea文本框
			var optionText = {
					parentNode: parentNode,
					xid:"text",
					class: "form-control x-edit",
					style: "height:100px;width:310px;"
			};
			var newTextarea = new textarea(optionText);
			newTextarea.set({
				"placeHolder": "请输入...",
			});

			//生成button按钮
			var flg = {
					xid: "botton",
					parentNode: parentNode,
					class: "btn btn btn-link"
			};
			var btn = new button(flg);
			var bttn = new button(flg);
			btn.setCSS({
				"margin-bottom":"5px"
			});
			btn.set({
				label: "提交"
			});
			bttn.setCSS({
				"margin-bottom":"5px"
			});
			bttn.set({
				"label": "重置"
			});
		};
	};
	
	//显示JS代码
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			data: 'demo/pcSample/table/dynamicCreate/dynamicCreate.js',
			self: this
		},true);
	};
	
	//显示源码
	Model.prototype.showSourceBtnClick = function(event){
		util.showSource({
			self: this,
			type: true,
			data: 'demo/pcSample/table/dynamicCreate/dynamicCreate.w&xid=window'
		},true);
		
	};


	return Model;
});