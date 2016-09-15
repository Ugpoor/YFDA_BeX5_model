<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:68px;top:211px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="WeX5三大核心技术之xid技术"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">WeX5三大核心技术之xid技术</div>  
        <div class="x-titlebar-right reverse"> 
           
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content container" xid="content1"> 
      <h1 id="a"><![CDATA[我的id是a, 来自主页面]]></h1>  
      <h1 xid="b"><![CDATA[我的xid是b, 来自主页面]]></h1>
    
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group" tabbed="true" xid="buttonGroup1"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label='获取id="a"' xid="button3" onClick="button3Click">
   <i xid="i1"></i>
   <span xid="span1">获取id="a"</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-default" label='获取xid="b"' xid="button4" onClick="button4Click">
   <i xid="i3"></i>
   <span xid="span3">获取xid="b"</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="打开对话框" xid="button2" onClick="{operation:'dialog.open'}"> 
            <i xid="i2" />  
            <span xid="span2">打开对话框</span> 
          </a></div></div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dialog"
    src="./dialog.w"/> 
</div>
