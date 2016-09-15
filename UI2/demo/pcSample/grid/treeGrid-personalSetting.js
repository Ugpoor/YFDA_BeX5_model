define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/treeGrid-personalSetting.js"
		},true);
	};

	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/treeGrid-personalSetting.w&xid=areaGrid"
		},true);
	};
	// 个性图标展示
	Model.prototype.areaGridTreeIconRender = function(event) {
		if (event.row.val('fType') == 'zone')
			event.html = '<i class="icon-android-contact" style="font-size:16px;color:skyblue;"/>';
		else if (event.row.val('fType') == 'province') {
			event.html = '<i class="icon-android-star" style="font-size:16px;color:skyblue;"/>';
		} else {
			event.html = '<i class="icon-android-promotion" style="font-size:16px;color:skyblue;"/>';
		}
	};
	// 展开台港澳地区
	Model.prototype.expandClick = function(event) {
		this.comp('areaGrid').expandRow('8');
	};
	// 折叠台港澳地区

	Model.prototype.foldClick = function(event) {
		this.comp('areaGrid').collapseRow('8');
	};

	return Model;
});