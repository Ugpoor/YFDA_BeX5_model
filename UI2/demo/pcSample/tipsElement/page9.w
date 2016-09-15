<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:45px;top:120px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"/>这是弹窗的内容页面。注意放在弹窗中的页面没有id="scrollContent"的div 
    <div class="x-panel-content" xid="content1"/>  
    <div class="x-panel-bottom" xid="bottom1">
      <div xid="div1" style="width:130px;" class="pull-right">
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="关闭" xid="button1" onClick="button1Click"> 
          <i xid="i1"/>  
          <span xid="span1">关闭</span>
        </a>
      </div>
    </div> 
  </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1"></span></div>
