define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// 新增会员
	Model.prototype.addClick = function(event) {
		this.comp("userWindowDialog").open({
			"data" : {
				"operator" : "new"
			}
		});
	};

	// 编辑会员信息
	Model.prototype.editUser = function(row) {
		this.comp("userWindowDialog").open({
			"data" : {
				"operator" : "edit",
				"rowData" : row.toJson()
			}
		});
	}
	// 编辑会员按钮
	Model.prototype.editClick = function(event) {
		var row = this.comp("userData").getCurrentRow();
		this.editUser(row);
	};
	// 双击列表编辑会员信息
	Model.prototype.userDataTablesRowDblClick = function(event) {
		var row = this.comp("userData").getCurrentRow();
		this.editUser(row);
	};

	// 保存会员数据更新
	Model.prototype.userWindowDialogReceived = function(event) {
		this.comp("userData").saveData();
	};

	// 删除会员
	Model.prototype.deleteClick = function(event) {
		var data = this.comp("userData");
		var row = this.comp("userData").getCurrentRow();
		this.comp("userData").deleteData([ row ], {
			"async" : true,
			"onSuccess" : function() {
				data.saveData();
			}
		})
	};

	// 搜索
	Model.prototype.selectClick = function(event) {
		var text = this.getElementByXid('selectCondition').value;

		if (text != null && text != "") {
			this.comp('userData').setFilter(
					"filter1",
					"takeout_user.fID like '%" + text + "%' or takeout_user.fName like '%" + text + "%' or takeout_user.fPhoneNumber like '%" + text + "%' or takeout_user.fAddress like '%" + text
							+ "%'");

		} else {
			this.comp('userData').filters.clear();
		}
		this.comp('userData').refreshData();
	};

	return Model;
});