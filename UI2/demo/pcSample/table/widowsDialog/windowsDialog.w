<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:56px;top:187px;"/>  
  <h4 xid="h44"><![CDATA[弹窗中的表格]]>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="showJSButton" onClick="showJSButtonClick"> 
      <i xid="i4"/>  
      <span xid="span4">JS</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" bind-visible="isVisible" onClick="showSourceBtnClick"> 
      <i xid="i5"/>  
      <span xid="span5">源码</span>
    </a>
  </h4>
  <h4 xid="h41"><![CDATA[1、空白弹窗]]></h4>
  <div xid="div1" class="panel-body">
    <h5 xid="h51"><![CDATA[弹出一个空白弹窗]]></h5>
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="查看效果" xid="dialogButton" onClick="dialogButtonClick"> 
      <i xid="i1"/>  
      <span xid="span1">查看效果</span>
    </a>
  </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wdEmpty"
    style="left:152px;top:11px;" src="$UI/demo/sample/table/widowsDialog/empty.w"
    status="normal" title="空白" showTitle="true"/>  
  <h4 xid="h42"><![CDATA[2、普通表格弹窗]]></h4>
  <div xid="div2" class="panel-body">
    <h5 xid="h52"><![CDATA[就是把内容放在body中，整体内容随滚动条滚动，没什么特别的地方。]]></h5>
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="查看效果" xid="wdTableButton" onClick="wdTableButtonClick"> 
      <i xid="i2"/>  
      <span xid="span2">查看效果</span>
    </a>
  </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wdTable"
    style="left:151px;top:231px;" title="普通弹窗表格" showTitle="true" src="$UI/demo/sample/table/widowsDialog/windowDialogTable.w"
    resizable="false" status="normal"/>
  <h4 xid="h43"><![CDATA[3、上下固定的弹窗]]></h4>
  <div xid="div3" class="panel-body">
    <h5 xid="h53">让弹窗内容也像右侧内页那样有滚动区域和固定区域。</h5>
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="查看效果" xid="wdTableButtonPlus" onClick="wdTableButtonPlusClick"> 
      <i xid="i3"/>  
      <span xid="span3">查看效果</span>
    </a>
  </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wdTablePlus"
    style="left:150px;top:406px;" title="表头固定弹窗" src="$UI/demo/sample/table/widowsDialog/wdTablePlus.w"
    resizable="true" status="normal" showTitle="true" height="85%"/> 
</div>
