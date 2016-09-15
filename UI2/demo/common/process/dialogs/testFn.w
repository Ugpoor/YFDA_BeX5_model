<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:44px;top:281px;"/> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" onReceive="windowReceiver1Receive"></span>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1" height="200"><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-top" xid="top2" height="5"></div>
   <div class="x-panel-content" xid="content2"><textarea cols="5" rows="5" xid="textFn" style="height:100%;width:100%;"></textarea></div>
   <div class="x-panel-bottom" xid="bottom2" height="35"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="测试执行" xid="btnExecute" style="height:100%;width:100%;" onClick="btnExecuteClick">
   <i xid="i2"></i>
   <span xid="span2">测试执行</span></a></div></div></div>
   <div class="x-panel-content" xid="content1"><textarea cols="5" rows="5" xid="resultFn" style="height:100%;width:100%;"></textarea></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="关闭" xid="btnClose" onClick="btnCloseClick" style="margin-right:auto;margin-left:auto;width:100%;">
   <i xid="i1"></i>
   <span xid="span1">关闭</span></a></div></div></div>