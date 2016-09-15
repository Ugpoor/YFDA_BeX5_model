<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="window" style="height:100%;" component="$UI/system/components/justep/window/window"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model1" style="position:absolute;;left:404.0px;top:238.0px" onParamsReceive="modelParamsReceive"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="定位"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">定位</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" style="font-size:0;" xid="mapContent"> 
      <iframe src="" xid="iframe1" frameborder="0" height="100%" width="100%"></iframe></div> 
  </div> 
</div>
