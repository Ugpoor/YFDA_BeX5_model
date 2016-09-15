<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:390px;top:161px;"
    onLoad="{&quot;operation&quot;:&quot;shell.showMainPage&quot;}"> 
    <div component="$UI/system/components/justep/shell/shell" xid="shell"/>  
    <div component="$UI/system/components/justep/shell/shellImpl" xid="shellImpl"
      contentsXid="pages"> 
      <mapping name="main" url="$UI/demo/tuniu/index_main.w" xid="xid1"/>  
      <mapping name="detail" url="$UI/demo/tuniu/detail.w" xid="xid2"/>  
      <mapping name="searchList" url="$UI/demo/tuniu/searchList.w" xid="xid3"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="pages" swipe="false"> 
    <div class="x-contents-content" xid="main"> 
      <div component="$UI/system/components/justep/windowContainer/windowContainer"
        class="x-window-container" xid="windowContainer1" src="./index_main.w"/> 
    </div> 
  </div> 
</div>
