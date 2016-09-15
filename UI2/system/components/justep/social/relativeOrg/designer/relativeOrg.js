/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	require("css!./css/relativeOrg").load();
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var RTRelativeOrg = require("../relativeOrg");
	var RTRelativeOrgs = require("../relativeOrgs");
	
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	
	var TITLE_TEMPLATE = "" +
		"		<div class='x-ro-title'>" +
		"			<span class='x-ro-title-content pull-left'></span>" +
		"			<div style='clear:both;' />" +
		"		</div>";
	var CONTENT_TEMPLATE = "<div class='x-img-list x-img-list-border'/>";
	
	var RelativeOrg = RTRelativeOrg.extend({
		init: function(value, bindingContext){
			this.$domNode = $(this.domNode);
			this.$domNode.append(TITLE_TEMPLATE);
			this.setGroupName(this.$domNode.attr("groupName"));
			this.$domNode.append(CONTENT_TEMPLATE);
			this.$domNode.attr("d_canAdd", false);
			$("*", this.$domNode).attr("d_canAdd", false);
			$(">.x-ro-title *", this.$domNode).attr("d_selectable", false)
			.attr("d_canRemove", false)
			.attr("d_canMove", false)
			.attr("d_canAdd", false);
			
		},
		
		set: function(config){
			if ("groupName" in config){
				var name = config["groupName"] || "";
				this.setGroupName(name);
			}
		},
		
		setGroupName: function(name){
			this.$domNode.find(">.x-ro-title>.x-ro-title-content").text(name);
		}
	});
	
	var RelativeOrgs = RTRelativeOrgs.extend({
		init: function(){
		},
		add: function(){
			xuiDoc.createComponent('$UI/system/components/justep/social/relativeOrg/relativeOrg#item', 
					this, {paintComponent:true});
		}
	});
	
	var Item = function(config){
		this.domNode = config.templateNode;
		this.$domNode = $(this.domNode);
	};
	
	Item.prototype.init = function(){
		var name = this.$domNode.attr("groupName") || "";
		this.$domNode.append("<div>" + name + "</div>");
	};
	
	Item.prototype.set = function(config){
		if ("groupName" in config){
			var name = config["groupName"] || "";
			this.$domNode.find(">.x-ro-group-title").text(name);
		}
	};
	
	
	return {'$UI/system/components/justep/social/relativeOrg/relativeOrg':RelativeOrg,
		'$UI/system/components/justep/social/relativeOrg/relativeOrgs':RelativeOrgs,
		'$UI/system/components/justep/social/relativeOrg/relativeOrg#item':Item};
});

