define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var image = require("$UI/system/api/native/image");//下载
	var Utils = require("$UI/system/api/native/utils");
	var util = require("$UI/system/lib/base/util");

	var Model = function(){
		this.callParent();
		this.fid=1;
		this.paiData;
		this.bottomHeight;
	};
	//接收参数
	Model.prototype.modelParamsReceive = function(event){
		/*
		 * 1、接收参数
		 * 2、并查找数据
		 * 3、修改图片地址
		 */
		this.paiData=this.comp("paiData");
		if(this.params && this.params.fid!=undefined){
			this.fid = this.params.fid;
		}
		
		this.paiData.setFilter('filter1',"fID="+this.fid);
		this.paiData.refreshData();

		$(".o-img", this.getRootNode()).attr("src",this.paiData.getValue("fPreviewPath"));
	};
		
	//打开地图
	Model.prototype.mapBtnClick = function(event){
		/*
		 * 打开地图，并传入坐标
		 */
		justep.Shell.showPage("map", {
			positioning : this.paiData.getValue("fPositioning")
		});
	};
		 
	//下载
	Model.prototype.downloadBtnClick = function(event){
		/*
		 * 使用system/api/native/image.js实现图片下载功能
		 */
		var url=eval("(" + this.paiData.getValue("fDownloadPath") + ")");
		image.downloadImage({
			serverId : JSON.stringify(url[0]),
		    success : function(res) {
		    	util.hint("下载成功！",
					{
						"position": "middle"
					}
				);
		    },
		    fail:function(err){
		    	Utils.errorCallback(self, param, {
					'errMsg' : "downloadImage:fail",
					'resultStr' : err
				});
		    }
		});
	};	
	
	//删除提示窗
	Model.prototype.delOpenClick = function(event){
		this.comp("delPopOver").show();
	};
	
	//删除
	Model.prototype.delBtnClick = function(event){
		/*
		 * 删除当前图片，删除后显示前一张图片，如是第一张显示后一张图片
		 */
		this.dataRefresh();
		var row=this.paiData.getCurrentRow();
		var rowIndex=this.paiData.getRowIndex(row);
		var count=this.paiData.getCount();		
		if(count>1){
			if(rowIndex==0){
				this.rightBtnClick();
			} else {
				this.leftBtnClick();
			}
			this.paiData.deleteData(row);
			this.paiData.saveData();
			this.comp("delPopOver").hide();
		} else {
			this.paiData.deleteData(row);
			this.paiData.saveData();
			this.comp("delPopOver").hide();
			justep.Shell.closePage();
		}				
	};
	//取消删除
	Model.prototype.cancelBtnClick = function(event){
		this.comp("delPopOver").hide();
	};
	
	//显示图片信息
	Model.prototype.informationBtnClick = function(event){
		/*
		 * 点击显示图片信息，再点隐藏
		 */
		this.bottomHeight=$(".o-information", this.getRootNode()).outerHeight()+48;
		if($(".x-panel-bottom", this.getRootNode()).height()==48){
			$(".x-panel-bottom", this.getRootNode()).css({"height":this.bottomHeight});
			$(".o-information", this.getRootNode()).show();
		} else {
			$(".x-panel-bottom", this.getRootNode()).css({"height":"48"});
			$(".o-information", this.getRootNode()).hide();
		}
	};
	
	//编辑描述信息
	Model.prototype.editClick = function(event){
		/*
		 * 点击展开编辑框，再点隐藏
		 */
		if($(".x-panel-bottom", this.getRootNode()).height()==this.bottomHeight){
			$(".x-panel-bottom", this.getRootNode()).css({"height":this.bottomHeight+40});
			$(".o-editDescription", this.getRootNode()).show();
			$(".o-description", this.getRootNode()).hide();
		} else {
			this.okBtnClick();
		}
	};
	//保存描述信息
	Model.prototype.okBtnClick = function(event){
		this.paiData.saveData();		
		$(".x-panel-bottom", this.getRootNode()).css({"height":this.bottomHeight});
		$(".o-editDescription", this.getRootNode()).hide();
		$(".o-description", this.getRootNode()).show();
	};
	//页面离开
	Model.prototype.modelInactive = function(event){
		$(".o-editDescription", this.getRootNode()).hide();
		$(".o-information", this.getRootNode()).hide();
		$(".x-panel-bottom", this.getRootNode()).css({"height":"48"});	
	};	
	
	//图片切换
	Model.prototype.leftBtnClick = function(event){
		/*
		 * 加载所有数据，显示前一张，修改图片地址
		 */
		this.dataRefresh();
		this.paiData.pre();
		$(".o-img", this.getRootNode()).attr("src",this.paiData.getValue("fPreviewPath"));
	};
	Model.prototype.rightBtnClick = function(event){
		/*
		 * 加载所有数据，显示后一张，修改图片地址
		 */
		this.dataRefresh();
		this.paiData.next();
		$(".o-img", this.getRootNode()).attr("src",this.paiData.getValue("fPreviewPath"));	
	};
	Model.prototype.dataRefresh = function(event){
		this.paiData.setFilter('filter1',"");
		this.paiData.refreshData();
	};
	
	return Model;
});