define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.flag = false;
	};

	Model.prototype.dataValueChanged = function(event){
		this.flag = true;
	};
//	
//	<column label="tool_tip_label" name="tool_tip_label" type="String" xid="default3"/>  
//      <column label="tool_tip_fm" name="tool_tip_fm" type="String" xid="default4"/>  
//      <column label="tool_tip_type" name="tool_tip_type" type="String" xid="default5"/> 
	
	Model.prototype.finish = function(wizard) {
		var data = this.comp("data");
		var hotspot_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var tool_tip_label = data.getValue("tool_tip_label", row);
			var tool_tip_fm = data.getValue("tool_tip_fm", row);
			var tool_tip_type = data.getValue("tool_tip_type", row);
			var serie_tip_type = data.getValue("serie_tip_type", row);
			var serie_tip_fm = data.getValue("serie_tip_fm", row);
			var showHotSpot;
			self.flag ? showHotSpot = "show" : showHotSpot = showHotSpot;
			hotspot_data.push({
				"tool_tip_label" : tool_tip_label,
				"tool_tip_fm" : tool_tip_fm,
				"tool_tip_type" : tool_tip_type,
				"showHotSpot" : showHotSpot,
				"serie_tip_type" : serie_tip_type,
				"serie_tip_fm" : serie_tip_fm
			});
		});
		return hotspot_data;
	}

	return Model;
});