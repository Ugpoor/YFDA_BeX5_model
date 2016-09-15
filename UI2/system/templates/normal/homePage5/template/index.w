<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:187px;top:249px;"/>  
  <div component="$UI/system/components/justep/wing/wing" class="x-wing" xid="wing"
    display="push"> 
    <div class="x-wing-left" xid="left"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="设置"> 
        <div class="x-titlebar-left" xid="div2"/>  
        <div class="x-titlebar-title" xid="div3">设置</div>  
        <div class="x-titlebar-right reverse" xid="div4"/> 
      </div> 
    </div>  
    <div class="x-wing-content" xid="content1"> 
      <div class="x-wing-backdrop" xid="div1"/>  
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="pages" slidable="true" wrap="false"><div class="x-contents-content" xid="main"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="mainContainer" src="{{main_page}}"></div></div></div> 
    </div>  
    </div> 
</div>

