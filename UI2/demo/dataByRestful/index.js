define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var restfulUtil = require("./js/util");

	var Model = function() {
		this.callParent();
	};

	// 通过/rest/contacts?offset=0&limit=20---get请求获取数据，参数offset，limit实现分页获取数据，当offset=0即首页数据获取时增加获取获取总记录数
	Model.prototype.contactDataCustomRefresh = function(event) {
		event.promise = restfulUtil.customRefresh({
			data : event.source,
			url: '/rest/contacts',
			param: {// 参数offset，limit实现分页获取数据
				offset : event.offset,
				limit : event.limit
			},
			offset : event.offset,
			limit : event.limit,
			append : event.options.append,
			getDataCallback : function(data, textStatus, jqXHR) {
				// 后端给出json数据结构为：{contact:[{id:'',name:''},...]},此处请根据后端返回结构修改data.contact
				return data.contact;
			}
			/*
			 //默认总记录数通过http头X-Total-Count获取
			,getCountCallback : function(data, textStatus, jqXHR) {
				// 通过/rest/contacts/count---get请求获取总记录数
				return restfulUtil.getCount('/rest/contacts/count');
				//如果请求中返回count，代码如下：
				//return data.count;
			}
			*/
		});
	};

	// 通过/rest/contacts/{id}---delete请求删除数据
	Model.prototype.contactDataCustomDelete = function(event) {
		var row = event.deleteRows[0];// 这里只实现了单条数据删除，可根据后台能力扩展实现多条数据删除
		event.promise = restfulUtil.customDelete({
			row : row,
			url : "/rest/contacts/" + row.getID()
		});
	};

	// 通过/rest/contacts---post请求新增数据保存到服务端
	// 通过/rest/contacts/{id}---put请求修改数据保存到服务端
	Model.prototype.contactDataCustomSave = function(event) {
		var row = event.source.getCurrentRow();// 这里只实现了单条数据保存，可根据后台能力扩展实现多条数据保存
		event.promise = restfulUtil.customSave({
			row : row,
			newUrl : "/rest/contacts",
			updateUrl : "/rest/contacts/" + row.getID()
		});
	};

	// 实现前端新增逻辑，也可通过后端请求实现，返回event.data为数组，支持新增多行
	// 注意这里的新增指前端data的数据新增，新增数据需要data.saveData()才保存到服务端
	var i = 0;
	Model.prototype.contactDataCustomNew = function(event) {
		i++;
		event.data = [ {
			id : 'newID' + i,
			name : 'name' + i
		} ];
	};

	return Model;
});