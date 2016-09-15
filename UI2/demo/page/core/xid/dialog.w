<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="对话框"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">对话框</div>  
        <div class="x-titlebar-right reverse"></div> 
      </div> 
    </div>  
    <div class="x-panel-content container" xid="content1"> 
      <h1 id="a"><![CDATA[我的id是a, 来自对话框]]></h1>  
      <h1 xid="b"><![CDATA[我的xid是b, 来自对话框]]></h1>  
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group"
        tabbed="true" xid="buttonGroup1">
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label='获取id="a"' xid="button1" onClick="button1Click"> 
          <i xid="i1"/>  
          <span xid="span1">获取id="a"</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label='获取xid="b"' xid="button2" onClick="button2Click"> 
          <i xid="i2"/>  
          <span xid="span2">获取xid="b"</span>
        </a>
      </div>
    </div> 
  </div> 
</div>
