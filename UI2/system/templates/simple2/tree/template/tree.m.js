/*需要您手动修改baas代码，没有了解baas的请先了解baas的原理！然后参照apache-tomcat\webapps\baas\src\com\justep\templates\Test.java
修改数据库的库名和表名即可
另外需要修改：
	配置数据源：apache-tomcat\webapps\baas\META-INF\context.xml
				（修改时手动同步：apache-tomcat\conf\Catalina\localhost\baas.xml）
	映射		：apache-tomcat\webapps\baas\WEB-INF\web.xml 
	url     :下边代码中的Baas.sendRequest方法中的url要和web.xml中的配置一致
*/

define(function(require){
	var Baas = require('$UI/demo/baas/baas');
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.treeDataCustomRefresh = function(event){
		alert("查询数据：请参考注释代码或者baas资料，手动进行修改")
	/*
		var data = event.source;
		var params = {
			"columns" : Baas.getDataColumns(data),
			"limit" : event.limit,
			"offset" : event.offset,
			"sParent" : data.getValue('sParent')
		};
		var success = function(resultData) {
			var append = event.options && event.options.append;
			data.loadData(resultData, append);
		};
		Baas.sendRequest({
			"url" : "/test",  //要和web.xml中的配置一致
			"action" : "queryOrgTest",
			"params" : params,
			"success" : success
		});
	
	*/};
	return Model;
});
