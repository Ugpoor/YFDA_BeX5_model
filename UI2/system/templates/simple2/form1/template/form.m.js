/*需要您手动修改baas代码，没有了解baas的请先了解baas的原理！然后参照apache-tomcat\webapps\baas\src\com\justep\templates\Test.java
修改数据库的库名和表名即可
另外需要修改：
	配置数据源：apache-tomcat\webapps\baas\META-INF\context.xml
				（修改时手动同步：apache-tomcat\conf\Catalina\localhost\baas.xml）
	映射		：apache-tomcat\webapps\baas\WEB-INF\web.xml 
	url     :下边代码中的Baas.sendRequest方法中的url要和web.xml中的配置一致
*/


define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = require('$UI/demo/baas/baas');
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		alert("保存数据成功！");
	};

	Model.prototype.mainDataCustomSave = function(event){
		alert("数据保存：请参考注释代码或者baas资料，手动进行修改")
	/*
		// 获取当前数据对象
	    var data = event.source;

	    // 构造请求参数
	    var params = {
	    	'data' : data.toJson(true) // 将数据集中已变更数据导出为JSON数据
	    };
	    // 请求成功后的回调方法
	    var success = function(resultData) {
	        // 保存成功后，必须调用data.applyUpdates()，用于数据集确认数据已更新
	        data.applyUpdates();
	    };
	    // 发送请求
	    Baas.sendRequest({
	        'url' : '/test', // servlet请求地址，url要和web.xml中的配置一致，需要手动修改
	        'action' : 'saveTest', // action
	        'params' : params, // action对应的参数
	        'success' : success // 请求成功后的回调方法
	    });
	*/};
	
	return Model;
});
