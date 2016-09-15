define(function(require){
	var $ = require("jquery");
	var DocUtils = require('$UI/system/components/justep/docCommon/docUtil');
	var officeViewer = require('$UI/system/components/justep/docCommon/officeViewer');
	var biz = require('$UI/system/lib/biz');
	require('$UI/system/components/justep/common/res');
	
	var $OV = officeViewer.$OV;
	var OV = officeViewer.OV;
	
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	Model.prototype.model1Load = function(event){
		this.load();
	};
	
	window.onerror = null;
	
	Model.prototype.load = function() {
		$('#ov').attr('showToolbar',false);
		$OV('ov').CreateOfficeViewer('100%','100%');
		var param = justep.Base64.decode(decodeURIComponent((biz.Request.getParamsFromURL(location.href)["param"]))); 
		this.officeViewerInit(JSON.parse(param));
	};
	Model.prototype.getUrl=function(docPath,fileID){
    	if(!this.docUrl){
    		var u = DocUtils.InnerUtils.getdocServerAction({
				docPath:docPath,
				urlPattern:"/repository/file/cache/office/"+fileID,
				context:this.getContext(),
				useCookie:false
			});
			this.docUrl = u.indexOf(window.location.protocol) < 1 ? u : window.location.protocol+"//"+ window.location.host + u;
		}
		return this.docUrl;	 
    };
    Model.prototype.officeViewerInit= function(obj) {
    	if ($OV("ov").IsOpened()){
    		return;
    	}
    	this.OVP = obj;
    	this.OVP.saving = false;
    	this.OVP.isRevision = false;
    	this.OVP.isModified = false;
		$OV("ov").Toolbars = false;
		$OV("ov").HttpInit();
		$OV("ov").HttpAddpostString("FileID", this.OVP.fileID);
		$OV("ov").HttpAddpostString("FileExt", this.OVP.fileExt);
		$OV("ov").HttpAddpostString("FileID", this.OVP.fileID);
		$OV("ov").HttpAddpostString("VersionID", this.OVP.versionID);
		$OV("ov").HttpAddpostString("PartType", this.OVP.partType);
		$OV("ov").HttpOpenFileFromStream(this.getUrl(this.OVP.host,this.OVP.fileID),$OV("ov").GetProgIDByDocType(this.OVP.fileExt));
		var errorCode = $OV("ov").GetErrorCode();
		if(errorCode!= 0){
			alert("office文件打开异常 错误编码["+errorCode+"]");
		}
    	if(this.OVP.partType == "revision" ) {
    		if($OV("ov").IsWordOpened()){
    			$OV("ov").ActiveDocument().ShowRevisions = true;
    		}
    	}else{
    		if($OV("ov").IsWordOpened()){
    			$OV("ov").ActiveDocument().AcceptAllRevisions();	
    		}
    	}
		$OV("ov").DisableHotKey(true);
		$OV("ov").DisableViewRightClickMenu(true);
		if (this.OVP.showField && $OV("ov").IsWordOpened()) {
    		$OV("ov").focus();
    	}
    	if (this.OVP.programID != "History"){
            $OV("ov").DisableOfficeReviewingBar(false);
        }
        $OV("ov").ProtectDoc(2);
    };

	return Model;
});
