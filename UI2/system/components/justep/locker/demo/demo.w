<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="手势密码组件"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">手势密码组件</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div xid="div1" style="height:100%;width:100%;"> 
        <table style="height:100%;width:100%;"> 
          <tr style="vertical-align: middle;text-align: center;">
            <td style="vertical-align: middle;text-align: center;"> 
              <canvas xid="locker" component="$UI/system/components/justep/locker/locker" class="x-locker" mode="2"
                style="width:320px;height:320px;" 
                onInput="linePoint" onPasswordSuccess="setPasswordSuccess"/> 
            </td>
          </tr> 
        </table> 
      </div> 
    </div> 
  <div class="x-panel-bottom" xid="bottom1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="true" xid="buttonGroup1" selected="btnSetPassword"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="设置密码" xid="btnSetPassword" onClick="btnSetPasswordClick">
   <i xid="i1"></i>
   <span xid="span1">设置密码</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="检验密码" xid="btnCheck" onClick="btnCheckClick">
   <i xid="i2"></i>
   <span xid="span2">检验密码</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="通用模式" xid="btnNormal" onClick="btnNormalClick">
   <i xid="i3"></i>
   <span xid="span3">通用模式</span></a></div></div></div> 
</div>
