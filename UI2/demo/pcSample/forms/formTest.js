define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.showFilterGird = justep.Bind.observable(false);
		this.callParent();
	};
	//查看JS代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/forms/formTest.js"
		});
	};
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/forms/formTest.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/forms/formTest.w&xid=controlGroup"
		},true);
	};
	//移除empData里面的数据
	Model.prototype.remove = function(row){
		var data = this.comp('empData');
		data.deleteData(row);
	};
	//移除addEmp里面的数据
	Model.prototype.removeTo = function(row){
		var data = this.comp('addEmp');
		data.deleteData(row);
	};
	//双击把empData里添加到addEmp
	Model.prototype.searchGridRowDblClick = function(event){
		this.add(event.row);
		this.remove(event.row);
		//this.removeChoose(event.row);
	};
	//把empData里面的数据添加到addEmp
	Model.prototype.addAll = function(treeData){
		treeData.each(function(p){
			this.add(p.row);
		},this);
	};
	
	//清空addEmp;
	Model.prototype.clear = function(){
		var data = this.comp('addEmp'); 
		data.clear();
	};
	
	//执行添加员工的操作
	Model.prototype.add = function(row){
		if(row instanceof Data.Row){
			var data = this.comp("addEmp");
			if(data.isExist(row.getID())) return;
			var defaultValue = {};
			$.each(data.defCols, function(col,v){
				defaultValue[col] = row.val(col);
			});
			data.newData({defaultValues:[defaultValue]});
		}
	};
	
	//添加到addEmp
	Model.prototype.addTo = function(row){
		if(row instanceof Data.Row){
			var data = this.comp("empData");
			if(data.isExist(row.getID())) return;
			var defaultValue = {};
			$.each(data.defCols, function(col,v){
				defaultValue[col] = row.val(col);
			});
			data.newData({defaultValues:[defaultValue]});
		}
	};
	/*全部选择*/
	Model.prototype.addAllBtnClick = function(event){
		this.addAll(this.comp("empData"));
		this.comp("empData").clear();
	};
	
	/*单个选择添加到左面*/
	Model.prototype.addLeft = function(event){
		var searchGrid = this.comp('selectGrid');
		var row = searchGrid.getSelection();
		this.addTo(row);
		if(row instanceof Data.Row){
			row.data.next();
		}
	};
	/*清空添加的员工*/
	Model.prototype.removeAllBtnClick = function(event){
		this.clear();
		var data = this.comp("empData");
		data.refreshData();
	};
	//删除addEmp里面的数据；
	Model.prototype.selectGridRowDblClick = function(event){
		this.removeTo(event.row);
		this.addTo(event.row);
	};
	
	
	//清空数据
	Model.prototype.regestBtnClick = function(event){
		var data = this.comp("userData");
		data.clear();
		var row = data.getCurrentRow();
		if(!row){
			data.newData();
		}
		
	};

	//验证用户名；
	Model.prototype.uNameKeyup = function(event){
		var uName = this.getElementByXid("uName").value;
		var uSpan = this.getElementByXid("uSpan");
		var reg = /^\w{5,15}$/;
		if(!reg.test(uName)){
			uSpan.innerHTML = '长度为5-15';
			justep.Util.hint("用户名格式不正确");
			uSpan.style.color = "red";
			return false;
		}else{
			uSpan.innerHTML = '!ok';
			uSpan.style.color = "green";
		}
	};
	//验证姓名
	Model.prototype.nameKeyup = function(event){
		var name = this.getElementByXid("name").value;
		var regName = /^[\u4E00-\u9FA5]{2,6}$/;
		var nameSpan = this.getElementByXid("nameSpan");
		if(!regName.test(name)){
			nameSpan.innerHTML = '长度为2-6';
			justep.Util.hint("姓名格式不正确");
			nameSpan.style.color = "red";
		}else{
			nameSpan.innerHTML = '!ok';
			nameSpan.style.color = "green";
		}
	};

	//验证密码
	Model.prototype.passKeyup = function(event){
		var passReg = /^\w{6,16}$/;
		var pass = this.getElementByXid("pass").value;
		var pspan = this.getElementByXid("pspan");
		if(!passReg.test(pass)||pass==''){
			pspan.innerHTML = '请输入用密码：长度为6-16';
			pspan.style.color = "red";
			return false;
		}else{
			pspan.innerHTML = '!ok';
			pspan.style.color = "green";
		}	
	};

	//重复密码；
	Model.prototype.repassKeyup = function(event){
		var pass = this.getElementByXid("pass").value;
		var repass = this.getElementByXid("repass").value;
		var repspan = this.getElementByXid("repspan");
		if(repass==''){
			justep.Util.hint("密码不能为空");
		}else{
			if(pass!=repass){
				repspan.innerHTML = "两次密码不一致";
				repspan.style.color = "red";
				return false;
			}else{		
				repspan.innerHTML = "!ok";
				repspan.style.color = "green";
			}
		}
	};

	//年龄验证
	Model.prototype.ageKeyup = function(event){
		var regAge = /^120$|^((1[0-1]|[1-9])?\d)$/;
		var age = this.getElementByXid("age").value;
		var agespan = this.getElementByXid("agespan");
		if(!regAge.test(age)){
			agespan.innerHTML = '请输入年龄：0-120';
			agespan.style.color = "red";
			return false;
		}else{
			agespan.innerHTML = '!ok';
			agespan.style.color = "green";
		}	
	};

	//邮箱验证
	Model.prototype.emailKeyup = function(event){
		var regEmail = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
		var email = this.getElementByXid("email").value;
		var emspan = this.getElementByXid("emspan");
		if(!regEmail.test(email)){
			emspan.innerHTML = '邮箱格式不正确';
			emspan.style.color = "red";
			return false;
		}else{
			emspan.innerHTML = '!ok';
			emspan.style.color = "green";
		}	
	};
	//手机号码验证
	Model.prototype.telKeyup = function(event){
		
		var regTel = /^1[3,4,5,8]\d{9}$/;
		var tel = this.getElementByXid("tel").value;
		var telspan = this.getElementByXid("telspan");
		if(!regTel.test(tel)){
			telspan.innerHTML = '号码不正确';
			telspan.style.color = "red";
			return false;
		}else{
			telspan.innerHTML = '!ok';
			telspan.style.color = "green";
		}	
	};
	//邮政编码验证
	Model.prototype.pastcodeKeyup = function(event){
		var regPostcode = /^\d{6}$/;
		var pastcode = this.getElementByXid("pastcode").value;
		var pcspan = this.getElementByXid("pcspan");
		if(!regPostcode.test(pastcode)){
			pcspan.innerHTML = '邮政编码格式不正确';
			pcspan.style.color = "red";
			return false;
		}else{
			pcspan.innerHTML = '!ok';
			pcspan.style.color = "green";
		}	
	};
	//QQ验证
	Model.prototype.QQKeyup = function(event){
		var regQQ = /^\d{6,11}$/;
		var QQ = this.getElementByXid("QQ").value;
		var QQspan = this.getElementByXid("QQspan");
		if(!regQQ.test(QQ)){
			QQspan.innerHTML = 'QQ长度6-11';
			QQspan.style.color = "red";
			return false;
		}else{
			QQspan.innerHTML = '!ok';
			QQspan.style.color = "green";
		}	
	};
	//IP验证
	Model.prototype.IPKeyup = function(event){
		var regIP = /^([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$/;
		var IP = this.getElementByXid("IP").value;
		var IPspan = this.getElementByXid("IPspan");
		if(!regIP.test(IP)){
			IPspan.innerHTML = 'IP地址格式不正确';
			IPspan.style.color = "red";
			return false;
		}else{
			IPspan.innerHTML = '!ok';
			IPspan.style.color = "green";
		}	
	};
	//正负小数验证
	Model.prototype.deciKeyup = function(event){
		var regDeci = /^[-]?\d{1,}[.]\d{1,}$/;
		var deci = this.getElementByXid("deci").value;
		var decispan = this.getElementByXid("decispan");
		if(!regDeci.test(deci)){
			decispan.innerHTML = '数据格式错误';
			decispan.style.color = "red";
			return false;
		}else{
			decispan.innerHTML = '!ok';
			decispan.style.color = "green";
		}	
	};
	//正负整数与小数验证
	Model.prototype.integKeyup = function(event){
		var regInteg = /^[-]?\d{0,}[.]?\d{1,}$/;
		var integ = this.getElementByXid("integ").value;
		var integspan = this.getElementByXid("integspan");
		if(!regInteg.test(integ)){
			integspan.innerHTML = '数据格式错误';
			integspan.style.color = "red";
			return false;
		}else{
			integspan.innerHTML = '!ok';
			integspan.style.color = "green";
		}	
	};
	//数字减1
	Model.prototype.subBtnClick = function(event){
		var data = this.comp("userData").getValue("num");
		if(data>0){
			this.comp("userData").setValue("num",data-1);
		}
	};
	//数字加1
	Model.prototype.addNumBtNClick = function(event){
		var data = this.comp("userData").getValue("num");
		if(!data)
			data=0;
		this.comp("userData").setValue("num",data+1);
	};
	
	//选择框
	Model.prototype.radioSelectChange = function(event){
		var xiaspan = this.getElementByXid("xiaspan");
		xiaspan.innerHTML = '!ok';
		xiaspan.style.color = "green";
	};
	
	//爱好验证
	Model.prototype.dataValueChange = function(event){
		var data = event.newValue;
		var hobbyspan = this.getElementByXid("hobbyspan");
		if(data=='打羽毛球'||data=='打篮球'||data=='打羽毛球 打篮球'){
			hobbyspan.innerHTML = '!ok';
			hobbyspan.style.color = "green";
		}else{
			hobbyspan.innerHTML = '*';
			hobbyspan.style.color = "red";
		}
	};
	//性别是否选中
	Model.prototype.radioGroupChange = function(event){
		var sexspan = this.getElementByXid("sexspan");
		sexspan.innerHTML = "!ok";
		sexspan.style.color = "green";
	}; 
	
	//选择地址
	Model.prototype.outputClick = function(event){
		var row = event.bindingContext.$object;
		var data = row.val("address");
		var hspan = this.getElementByXid("hspan");
		hspan.innerHTML = '!ok';
		hspan.style.color = "green";
		this.comp("userData").setValue("hintSelect", data);
	};
	//选择日期
	Model.prototype.dateChange = function(event){
		var datespan = this.getElementByXid("datespan");
		datespan.innerHTML = '!ok';
		datespan.style.color = "green";
	};
	//显示popMenu
	Model.prototype.hintInputFocus = function(event){
		this.comp("popMenu").show();
	};
	
	//提交
	Model.prototype.submitBtnClick = function(event){
		justep.Util.hint("已提交。。请等待审核");
	};
	
	Model.prototype.userDataCustomSave = function(event){
		justep.Util.hint("保存成功");
	};
	
	return Model;
});