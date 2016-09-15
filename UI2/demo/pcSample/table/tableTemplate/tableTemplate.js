define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js
	
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;
	};
	
	/**
		accordionForm组件，首次折叠的时候存在bug，
		controlGropFrom组件没问题，但是其标题背景不能充满整行
		pageBar组件需要后台数据配合才能使用
	 */
	
	//通过Ajax加载数据到data组件中
	Model.prototype.userDataCustomRefresh = function(event){
		var user = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./json/data.json'),
            dataType: 'json',
            async: false,
            cache: false,
            success: function(data){
            	user.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
            	throw justep.Error.create("加载数据失败");
            }
        }); 
	};
	
	//onCellRender渲染单元格事件，转换button按钮
	Model.prototype.userDataTablesCellRender = function(event){
		if(event.colName == 'uOperate'){
			event.html = "<a class='o-link btnHint'>详情</a><a class='o-link btnUpdate'>修改</a><a class='o-link btnDelete'>删除</a>";
		}
	};
	
	//给转换button增加事件
	Model.prototype.userDataTablesRowClick = function(event){
		var row = this.comp('userData').getCurrentRow(true);//获取当前行数据
		var rowid = this.comp('userData').getRowIndex(row)+1;//获取当前行索引
	    var domButton = $(event.domEvent.target);//获取点击的元素
	    var data = this.comp("userData");
	    var temp = this.comp('popOverdata');
	    if (domButton.hasClass("btnUpdate")) {//判断是否包含修改样式
	        this.comp("windowDialogUpdate").open({
	        	data:{
	        		name: row.val('uName'),
	        		password: row.val('uPassword'),
	        		sex: row.val('uSex'),
	        		age: row.val('uAge'),
	        		education: row.val('uEducation'),
	        		hiredate: row.val('uHiredate'),
	        		remark: row.val('uRemark')
	        	}
	        });
	    }else if(domButton.hasClass("btnDelete")){//判断是否包含删除样式
	    	data.deleteData(event.row);
	    }else if(domButton.hasClass("btnHint")){//判断是否包含提示信息样式
	    	temp.newData({
	    		defaultValues:[{
	    			"uName": row.val("uName"),
	    			"uSex": row.val("uSex"),
	    			"uAge": row.val("uAge"),
	    			"uEducation": row.val("uEducation"),
	    			"uHiredate": row.val("uHiredate"),
	    			'uRemark': row.val('uRemark')
	    		}]
	    	});
	    	var popOver = this.comp('popOver');
	    	popOver.show();
	    }
	    
	    //单选checkbox
		var table = this.comp('userDataTables');
		if(table.isChecked(row)){//判断是否勾选中【打勾】
			event.source.setRowChecked(row, false);//设置当前行选中状态
			if($(event.domEvent.target).attr("type") === "checkbox"){
				event.source.setRowChecked(row, true);
				event.source.setRowCss(row,{"backgroundColor": "#93dffe"})
			}else{
				event.source.setRowChecked(row, false);
				if(rowid%2==1){
					event.source.setRowCss(row,{"backgroundColor":"#f9f9f9"});
				} else {
					event.source.setRowCss(row,{"backgroundColor":"#fff"});
				}
			}
		}else {
			event.source.setRowChecked(row, true);
			event.source.setRowCss(row,{"backgroundColor": "#93dffe"});
			if(($(event.domEvent.target).attr("type") === "checkbox")&& table.isChecked(row)){
				event.source.setRowChecked(row, false);
				if(rowid%2==1){
					event.source.setRowCss(row,{"backgroundColor":"#f9f9f9"});
				} else {
					event.source.setRowCss(row,{"backgroundColor":"#fff"});
				}
			}
		}
	};
	
	//接收update弹窗返回的数据
	Model.prototype.windowDialogUpdateReceive = function(event){
		var temp = this.comp('userData');
		temp.setValue('uPassword', event.data.password);
		temp.setValue('uEducation', event.data.education);
		temp.setValue('uSex', event.data.sex);
		temp.setValue('uHiredate', event.data.hiredate);
	};
	
	//添加新用户
	Model.prototype.addButtonClick = function(event){
		var row = this.comp('userData').getCurrentRow();
		var lastRow = this.comp('userData').getLastRow();
		if(lastRow != null){
			this.comp('windowDialogAdd').open({
				data: {
					name: row.val("uName"),
					password: row.val("uPassword"),
					sex: row.val("uSex"),
					age: row.val("uAge"),
					education: row.val("uEducation"),
					hiredate: row.val("uHiredate"),
					remark: row.val('uRemark')
				}
			});
		}else{
			this.comp('windowDialogAdd').open({
				data: {
					name: "",
					password: "",
					sex: "",
					age: "",
					education: "",
					hiredate: "",
					remark: ""
				}
			});
		}
	};
	
	//接收add弹窗返回的数据
	Model.prototype.windowDialogAddReceive = function(event){
		var lastRow = this.comp('userData').getLastRow();
		var temp = this.comp('userData');
		temp.newData({//新增一行
			defaultValues:[{
				'uId': lastRow.getID() + 1,//id++
				'uName': event.data.name,
				'uPassword': event.data.password,
				'uSex': event.data.sex,
				'uAge': event.data.age,
				'uEducation': event.data.education,
				'uHiredate': event.data.hiredate,
				'uRemark': event.data.remark
			}]
		});
	};
	
	//批量删除
	Model.prototype.removeButtonClick = function(event){
		var rows = this.comp('userDataTables').getCheckeds();
		if(rows.length > 0){
			this.comp('userData').deleteData(rows);
		}else{
			justep.Util.hint("请至少选中一项");
		}
	};
	
	//重置按钮
	Model.prototype.resetButtonClick = function(event){
		this.comp('queryInput').val("");
		this.comp('userData').refreshData();
	};
	
	//检索关键字button
	Model.prototype.queryButtonClick = function(event){
		var name = this.comp('queryInput').val();//获取输入框的值
		var temp = this.comp("userData");
		temp.refreshData();
		var arr = [];//数组
		temp.each(function(options){//遍历data
			if(name != options.row.val("uName") && name!=""){//判断name是否相同
				arr.push(options.row);//放进数组中
			}
		});
		temp.deleteData(arr);//删除整个数组

	};
	
	//上传下载类型大小个数设置
	Model.prototype.modelLoad = function(event){
		var data=this.comp("fileData");
		var uploader = this.comp("attachmentSimple").uploader;
		uploader.on('onFileSelected',function(event){
			if(event.file.name.split(".")[1] != "txt"){//控制上传文件类型
				justep.Util.hint("只能上传后缀名是 .txt的文件");
				event.cancel = true;
			}
			if(event.file.size > 2048){//控制上传文件大小
				justep.Util.hint("上传的文件大小不能超过2KB");
				event.cancel = true;
			}
			var file = data.val("fFile");
			if(file){
				if($.parseJSON(data.getValue("fFile")).length>=2){//控制上传文件个数
					justep.Util.hint("只能上传2个文件");
					event.cancel = true;
				}
			}
		});
	};
	//全选checkbox
	Model.prototype.userDataTablesRowCheckedAll = function(event){
		this.comp('userData').each(function(options){
			if(options.index%2==0){
				event.source.setRowCss(options.row,{"backgroundColor":"#f9f9f9"});
			} else {
				event.source.setRowCss(options.row,{"backgroundColor":"#fff"});
			}
		});
		var rows = this.comp("userDataTables").getCheckeds();//选中行的行数组
		for(var i=0;i<rows.length;i++){
			if(this.comp('userDataTables').isChecked(rows[i])){
				event.source.setRowCss(rows[i],{"backgroundColor": "#93dffe"});
			}
		}
	};

	//显示JavaScript代码
	Model.prototype.jsButtonClick = function(event){
		util.showSource({
			self: this,
			data: 'demo/pcSample/table/tableTemplate/tableTemplate.js'
		},true);
	};

	//显示源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			data: 'demo/pcSample/table/tableTemplate/tableTemplate.w&xid=window',
			self: this,
			type: true
		},true);
	};


	return Model;
});