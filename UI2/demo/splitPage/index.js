define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.offset = 0;
		this.count ;
	};

	Model.prototype.userDataCustomRefresh = function(event){
	var userData=this.comp("userData"),self = this,limit = event.limit,offset = event.offset,i,newArr;
		$.ajax({
            type: "GET",
            url: require.toUrl('./json/userData.json'),
            dataType: 'json',
            async: false,
            cache: false,
            success: function(data){
            	var start = limit*self.offset;
            	self.count = data.length;
            	var end = limit * (self.offset+1);
            	var length = data.length > end ? end :  data.length;
            	var newData = [];
            	for(i = start;i<length;i++){
            		newData.push(data[i])
            	}
            	event.source.setTotal(data.length);
            	event.source.loadData(newData)
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });	
	};

	Model.prototype.nextPageClick = function(event){
		var num=this.comp("userData").limit
		var number = this.count;
		if(this.offset==(number%num+1)){
			return 
		}else{
			this.offset += 1;
		}
		this.comp("userData").refreshData()
	};

	Model.prototype.prePageClick = function(event){
		if(this.offset==0){
			return;
		}else{
			this.offset -= 1;
		}
		this.comp("userData").refreshData()
	};

	return Model;
});