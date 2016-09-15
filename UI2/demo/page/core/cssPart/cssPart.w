<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:17px;top:244px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full "
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="WeX5三大核心技术之css局部化"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">WeX5三大核心技术之css局部化</div>  
        <div class="x-titlebar-right reverse">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="打开对话框" xid="button1" onClick="{operation:'windowDialog1.open'}"> 
            <i xid="i1"/>  
            <span xid="span1">打开对话框</span>
          </a>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content container" xid="content1"> 
      <h1 xid="h11" class="test"><![CDATA[传统：主页中定义的边框是红色]]></h1>  
      <h1 xid="h12" class="test1"><![CDATA[主页中定义的边框是红色]]></h1>  
      </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1"
    src="$UI/demo/page/core/cssPart/dialog.w"/>
  <resource xid="resource2"> 
    <require xid="require2" url="css!$UI/demo/page/core/cssPart/part1"/> 
  </resource> 
</div>
