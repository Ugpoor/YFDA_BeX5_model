<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window portal-left" component="$UI/system/components/justep/window/window" sysParam="portal" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:325px;top:12px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-top" xid="top">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar" title="user name"> 
        <div class="x-titlebar-left" xid="div1" dir="rtl">
        	<i xid="i1" class="icon-android-social-user"/>
          </div>  
        <div class="x-titlebar-title" xid="div2">user name</div>  
        <div class="x-titlebar-right reverse" xid="div3">
        </div>
      </div>
    </div>  
    <div class="x-panel-content" xid="content">
      </div>  
    <div class="x-panel-bottom" xid="bottom">
      <div component="$UI/system/components/justep/bar/bar" class="x-bar" xid="bar">
        <a component="$UI/system/components/justep/button/button" class="btn btn-warning btn-block"
          label="  注销" xid="logout" onClick="logoutClick" icon="icon-power"> 
          <i xid="i2" class="icon-power"/>  
          <span xid="span1">  注销</span>
        </a>
      </div>
    </div>
  </div>
</div>
