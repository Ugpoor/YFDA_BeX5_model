<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model1" style="position:absolute;;left:221.0px;top:42.0px">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="docLinkKeys" idColumn="sKeyId" confirmRefresh="false">
      <column label="sKeyId" name="sKeyId" type="String" xid="default1"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver1" style="left:84px;top:243px;" onReceive="windowReceiver1Receive"/>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="docSettingDlg" style="left:78px;top:179px;" src="$UI/SA/doc/docPermission/docSetting.w" onReceive="docSettingDlgReceive" forceRefreshOnOpen="true" showTitle="true" title="文档配置" status="normal"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group" tabbed="true" xid="buttonGroup1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新建Key" xid="createKey" onClick="createKeyClick">
   <i xid="i1"></i>
   <span xid="span1">新建Key</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除Key" xid="deleteKey" onClick="deleteKeyClick">
   <i xid="i2"></i>
   <span xid="span2">删除Key</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="修改Key" xid="changeKey" onClick="changeKeyClick">
   <i xid="i3"></i>
   <span xid="span3">修改Key</span></a></div></div>  
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/grid/grid" class="x-grid-no-bordered" hiddenCaptionbar="true"
        xid="grid1" data="docLinkKeys" width="100%" height="auto"> 
        <columns xid="columns1"> 
          <column name="sKeyId" xid="column1"/>
        </columns> 
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/>
  </div>
</div>
