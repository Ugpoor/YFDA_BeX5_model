<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:193px;top:274px;"/>  
  <span xid="windowReceive" component="$UI/system/components/justep/windowReceiver/windowReceiver"
    onReceive="windowReceiveReceive" style="left:332px;top:107px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel"> 
    <div class="x-panel-top" xid="panelTop"> 
      <div xid="bar" component="$UI/system/components/justep/titleBar/titleBar"
        title="流程图" class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="glyphicon icon-chevron-left" xid="okBtn"
            onClick="okBtnClick"> 
            <i class="glyphicon icon-chevron-left"/>  
            <span></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title">流程图</div>  
        <div class="x-titlebar-right reverse"> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" load="false" refresh="false" xid="panelContent">
	   <div class="x-processChart" xid="processChart" component="$UI/system/components/justep/processChart/processChart" contents="track"/>
    </div> 
  </div> 
</div>
