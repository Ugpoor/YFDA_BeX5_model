define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var $items = this.$items = $(".portal-main-config .item");
		this.$items.click(function() {
			$items.removeClass('selected');
			$(this).addClass('selected');
		});

		// init widget list
		if (__justep.__portalContext && __justep.__portalContext.data.widgetList.menu.$children) {
			var root = __justep.__portalContext.data.widgetList.menu.$children;
			var wd = this.comp("widgetsData"),
				data = [];
			for(var i=0; i<root.length; i++){
				var label = root[i].label;
				for(var j=0; j<root[i].$children.length; j++){
					var item = root[i].$children[j];
					data.push({
						"id" : item.id,
						"title" : item.title,
						"dir" : label,
						"open" : opened(item.id)
					});
				}
			}
			wd.loadData({
				"@type" : "table",
				"rows" : data
			});
		}

	};
	
	var opened = function(id){
		return $('.portal-main .x-widgets .x-widget[widgetid="' + id + '"]').length > 0
	};

	Model.prototype.windowReceiver1Receive = function(event) {
		var layoutID = event.data.id;
		this.$items.removeClass("selected");
		$(".portal-main-config .item[layoutID='" + layoutID + "']").addClass("selected");
		
		var wd = this.comp("widgetsData");
		wd.each(function(option){
			var id = option.row.val("id");
			option.row.val("open", opened(id))
		})
		
	};

	Model.prototype.okBtnClick = function(event) {
		var wd = this.comp("widgetsData"),
			opened = {};
		wd.each(function(option){
			var id = option.row.val("id");
			opened[id] = option.row.val("open");
		});
		var result = $(".portal-main-config .item.selected").attr("layoutID");
		this.comp("windowReceiver1").windowEnsure({
			layoutID: result,
			opened: opened
		});
	};

	return Model;
});