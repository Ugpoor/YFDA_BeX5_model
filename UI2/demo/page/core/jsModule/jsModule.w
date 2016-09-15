<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1" src="$UI/demo/page/core/jsModule/dialog.w"></span><div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="WeX5三大核心技术之js模块化"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">WeX5三大核心技术之js模块化</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="打开对话框" xid="button1" onClick="{operation:'windowDialog1.open'}">
   <i xid="i1"></i>
   <span xid="span1">打开对话框</span></a></div>
        </div> 
      </div>  
    <div class="x-panel-content container" xid="content1"><button xid="button4" onClick="showMessage()" style="height:41px;"><![CDATA[调用传统js的showMessage方法]]></button>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="调用当前模块中的showMessage方法" xid="button2" onClick="button2Click">
   <i xid="i2"></i>
   <span xid="span2">调用当前模块中的showMessage方法</span></a></div>
  </div> 
<resource xid="resource2"><require xid="require1" url="$UI/demo/page/core/jsModule/page1"></require></resource></div>