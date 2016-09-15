define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.changeCount = 0;
		this.isReceive = false;
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
		var pageInfo = this.comp('pageInfo');
		return {
			displayName: pageInfo.val('displayName'),
			paperType: pageInfo.val('paperType'),
			pageWidth: pageInfo.val('pageWidth'),
			pageHeight: pageInfo.val('pageHeight'),
			orientation: pageInfo.val('orientation'),
			marginTop: pageInfo.val('marginTop'),
			marginBottom: pageInfo.val('marginBottom'),
			marginLeft: pageInfo.val('marginLeft'),
			marginRight: pageInfo.val('marginRight'),
			marginHeader: pageInfo.val('marginHeader'),
			marginFootter: pageInfo.val('marginFootter')
		};
	};

	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure(this.result());
	};

	Model.prototype.wReceiverReceive = function(event){
		this.isReceive = true;
		try{
			var pageInfo = this.comp('pageInfo');
			var param = event.data;
			pageInfo.setValue('displayName',param['displayName']);
			pageInfo.setValue('paperType',param['paperType']);
			pageInfo.setValue('pageWidth',param['pageWidth']);
			pageInfo.setValue('pageHeight',param['pageHeight']);
			pageInfo.setValue('orientation',param['orientation']);
			pageInfo.setValue('marginTop',param['marginTop']);
			pageInfo.setValue('marginBottom',param['marginBottom']);
			pageInfo.setValue('marginLeft',param['marginLeft']);
			pageInfo.setValue('marginRight',param['marginRight']);
			pageInfo.setValue('marginHeader',param['marginHeader']);
			pageInfo.setValue('marginFootter',param['marginFootter']);
		} finally {
			this.isReceive = false;
		}
	};

	Model.prototype.pageInfoValueChanged = function(event){
		if(this.isReceive) return; 
		try {
			this.changeCount++;
			if (this.changeCount == 1) {
				var data = event.source;
				if (event.col == 'paperType' || event.col == 'orientation') {
					var pageTypeData = this.comp('pageType');
					var pageType = data.val('paperType');
					var row = pageTypeData.getRowByID(pageType);
					var width = row.val('pageWidth');
					var height = row.val('pageHeight');
	
					if (data.getValue('orientation') == 'Landscape') {
						data.setValue('pageWidth', height);
						data.setValue('pageHeight', width);
					} else {
						data.setValue('pageWidth', width);
						data.setValue('pageHeight', height);
					}
				} else if ((event.col == 'pageWidth')
						|| (event.col == 'pageHeight')) {
					data.setValue('paperType', 'custom');
					data.setValue('displayName', '自定义');
				}
			}
		} finally {
			this.changeCount--;
		}
	};

	return Model;
});