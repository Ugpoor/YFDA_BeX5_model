<div xmlns:xu="http://www.xmldb.org/xupdate" xmlns:xui="http://www.justep.com/xui"
	xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window"
	extends="$UI/system/service/process/dialog/processDialog.m.w" sysParam="false">
	<div xid="panelTop" xui:update-mode="delete" />
	<div xid="model" style="height:auto;left:273px;top:289px;"
		xui:update-mode="merge" />
	<div class="x-panel-bottom" 
		xid="panelPanel" xui:parent="panel" xui:update-mode="insert">
		<a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
			label="取消" onClick="cancelBtnClick" xid="cancelBtn">
			<i xid="i4_1" />
			<span xid="span4_1">取消</span>
		</a>
		<a class="btn btn-primary btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
			label="确定" onClick="okBtnClick" 
			xid="okBtn">
			<i xid="i3_1" />
			<span xid="span3_1">确定</span>
		</a>
	</div>

</div>