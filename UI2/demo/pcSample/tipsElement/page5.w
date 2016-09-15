<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:213px;top:272px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">这是弹窗的内容页面。注意放在弹窗中的页面没有id="scrollContent"的div</div>  
    <div class="x-panel-content" xid="content1"/>  
    <div class="x-panel-bottom" xid="bottom1">
      <div xid="div1" style="width:265px;" class="pull-right">
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="按钮" xid="button1" style="width:58px;" onClick="button1Click"> 
          <i xid="i1"/>  
          <span xid="span1">按钮</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="确定" xid="button2" style="width:62px;"> 
          <i xid="i2"/>  
          <span xid="span2">确定</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="取消" xid="button3" onClick="button3Click"> 
          <i xid="i3"/>  
          <span xid="span3">取消</span>
        </a>
      </div>
    </div> 
  </div> 
</div>
