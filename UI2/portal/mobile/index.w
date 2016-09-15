<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" extends="$UI/portal/base/base.w" 
  xid="window" class="window" component="$UI/system/components/justep/window/window"
  sysParam="false" design="device:m;">  
  <div component="$UI/system/components/justep/wing/wing" class="x-wing x-wing-xs"
    xid="portal" dismissible="true" display="push" routable="false" xui:parent="window" xui:update-mode="insert"> 
    <div class="x-wing-left" xid="left" style="border-right: 1px solid #eee;"/>  
    <div class="x-wing-content" xid="center"> 
      <div class="x-wing-backdrop"/>  
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full x-portal-pages"
        active="0" xid="pages" slidable="true" wrap="false" routable="true" swipe="false">
        <!-- 
        <div class="x-contents-content" xid="main"/> 
         -->
      </div>  
      <div id="debugBar" style="display:none;"> 
        <a component="$UI/system/components/justep/button/button" class="btn x-orange"
          xid="toggleLeft" onClick="toggleLeftClick" icon="icon-android-sort"> 
          <i xid="i2" class="icon-android-sort"/>  
          <span xid="span2"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          xid="prev" icon="icon-chevron-left" onClick="prevClick"> 
          <i xid="i11" class="icon-chevron-left"/>  
          <span xid="span1"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          xid="next" icon="icon-chevron-right" onClick="nextClick"> 
          <i xid="i3" class="icon-chevron-right"/>  
          <span xid="span3"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          xid="clear" label="clear" onClick="clearClick"> 
          <i xid="i4"/>  
          <span xid="span4">clear</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          xid="refresh" icon="icon-refresh" onClick="refreshClick"> 
          <i xid="i5" class="icon-refresh"/>  
          <span xid="span5"/> 
        </a> 
      </div> 
    </div> 
  </div>  
  </div>
