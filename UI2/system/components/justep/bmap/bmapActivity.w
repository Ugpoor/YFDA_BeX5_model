<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:184px;top:30px;"
    onParamsReceive="modelParamsReceive"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="mapPanel" style="z-index:1;"> 
    <div class="x-panel-top" xid="top3">
      <div component="$UI/system/components/justep/titleBar/titleBar" title="百度地图"
        class="x-titlebar" xid="titleBar2"> 
        <div class="x-titlebar-left" xid="left2"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left" xid="i1"/>  
            <span xid="span1"/>
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="title2" bind-click="title2Click">百度地图</div>  
        <div class="x-titlebar-right reverse" xid="right2"/>
      </div>
    </div>
    <div class="x-panel-content" xid="mapArea" style="font-size:0"> 
      <iframe style="width:100%;height:100%;border:0;" xid="mapFrame"/> 
    </div> 
  </div> 
</div>
