<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="process组件"> 
        <div class="x-titlebar-left" xid="div1">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button1" icon="icon-chevron-left" onClick="backBtn"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/>
          </a>
        </div>  
        <div class="x-titlebar-title" xid="div2">process组件</div>  
        <div class="x-titlebar-right reverse" xid="div3"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div style="font-weight:bold;font-size:16px;color:#000000">process demo
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="源码" xid="button2" style="color:#000000" onClick="showProcessSource"> 
          <i xid="i2"/>  
          <span xid="span2">源码</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="js" xid="button3" style="color:#000000" onClick="showJsSource"> 
          <i xid="i3"/>  
          <span xid="span3">js</span>
        </a>
      </div>  
      <div component="$UI/system/components/view/view"> 
        <!--<div component="$UI/system/components/process/process" xid="demoProcess" style="height:24px;width:24px;left:57px;top:85px;" autoStart="false"/>-->  
        <div xid="demoProcess" component="$UI/system/components/justep/process/process"
          autoStart="false" autoFilter="false" autoSave="false" onBeforeStart="beforeStart"
          onAfterStart="afterStart" onStartCommit="startCommit" onStartError="startError"
          onBeforeAdvanceQuery="beforeAdvanceQuery" onAfterAdvanceQuery="afterAdvanceQuery"
          onAdvanceQueryError="advanceQueryError" onBeforeAdvance="beforeAdvance"
          onAfterAdvance="afterAdvance" onAdvanceCommit="advanceCommit" onAdvanceError="advanceError"
          onBeforeBackQuery="beforeBackQuery" onAfterBackQuery="afterBackQuery" onBackQueryError="backQueryError"
          onBeforeBack="beforeBack" onAfterBack="afterBack" onBackCommit="backCommit"
          onBackError="backError" onBeforeAbortQuery="beforeAbortQuery" onAfterAbortQuery="afterAbortQuery"
          onAbortQueryError="abortQueryError" onBeforeAbort="beforeAbort" onAfterAbort="afterAbort"
          onAbortCommit="abortCommit" onAbortError="abortError" onBeforeSuspendQuery="beforeSuspendQuery"
          onAfterSuspendQuery="afterSuspendQuery" onSuspendQueryError="suspendQueryError"
          onBeforeSuspend="beforeSuspend" onAfterSuspend="afterSuspend" onSuspendCommit="suspendCommit"
          onSuspendError="suspendError" onBeforeSpecialQuery="beforeSpecialQuery"
          onAfterSpecialQuery="afterSpecialQuery" onSpecialQueryError="specialQueryError"
          onBeforeSpecial="beforeSpecial" onAfterSpecial="afterSpecial" onSpecialCommit="specialCommit"
          onSpecialError="specialError" onBeforeTransferQuery="beforeTransferQuery"
          onAfterTransferQuery="afterTransferQuery" onTransferQueryError="transferQueryError"
          onBeforeTransfer="beforeTransfer" onAfterTransfer="afterTransfer" onTransferCommit="transferCommit"
          onTransferError="transferError" style="height:24px;width:24px;left:268px;top:-35px;"/>  
        <button bind-click="startProcess">启动流程</button>  
        <button bind-click="advanceProcess">流转</button>  
        <button bind-click="backProcess">回退</button>  
        <button bind-click="suspendProcess">暂停</button>  
        <button bind-click="abortProcess">终止</button>  
        <button bind-click="specialProcess">特送</button>  
        <button bind-click="transferProcess">转发</button>  
        <button bind-click="withdrawTask">回收</button>  
        <button bind-click="startCustomized">定制流程</button> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" style="left:163px;top:41px;"/> 
</div>
