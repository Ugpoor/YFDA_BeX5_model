<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:189px;top:15px;"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="editorReceiver" style="left:56px;top:104px;"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1">
      <div xid="wpsObjectParent" align="right" style="width:100%; height:100%; position:absolute;overflow:hidden;"/>
    </div>  
    <div class="x-panel-bottom" xid="bottom1">
      <a component="$UI/system/components/justep/button/button" class="btn x-green" label="保存" xid="saveBtn" style="float:right;margin-right:15px" onClick="saveBtnClick">
   <i xid="i1"></i>
   <span xid="span1">保存</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="插入域" xid="button1" onClick="button1Click">
   <i xid="i2"></i>
   <span xid="span2">插入域</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="打开" xid="openBtn" style="float:right;margin-right:15px" onClick="openBtnClick">
   <i xid="i4"></i>
   <span xid="span4">打开</span></a></div>
  </div>
</div>
