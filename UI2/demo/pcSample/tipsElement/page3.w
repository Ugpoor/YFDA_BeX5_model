<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:91px;top:131px;"/> 这是弹窗的内容页面。注意放在弹窗中的页面没有id="scrollContent"的div
  <br/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"/>  
    <div class="x-panel-content" xid="content1"/>  
    <div class="x-panel-bottom" xid="bottom1">
      <div style="border:1px solid;height:38px;width:180px;" class="pull-right">
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="确定" xid="button3" style="height:34px;width:71px;" onClick="button3Click"> 
          <i xid="i3"/>  
          <span xid="span3">确定</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="取消" xid="button2" onClick="button2Click" style="width:71px;"> 
          <i xid="i2"/>  
          <span xid="span2">取消</span>
        </a> 
      </div> 
    </div> 
  </div>
</div>
