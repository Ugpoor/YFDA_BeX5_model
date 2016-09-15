<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window portal-main" component="$UI/system/components/justep/window/window"
  sysParam="portal">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:206px;top:222px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="configDialog"
    style="left:47px;top:32px;" title="设置首页布局" src="$UI/portal/pc/main/config/config.w"
    showTitle="true" status="minimize" onReceive="configDialogReceive"/>
  <div class="debug-mode hide">警告：当前运行在调试模式下， 调试模式下系统运行速度会慢！</div>  
  <div component="$UI/system/components/justep/widgets/widgets" class="x-widgets row"
    xid="widgets"> 
    <div class="x-column col-xs-12" xid="column1"/>  
    <div class="x-column col-xs-12 col-sm-12 col-md-6 col-lg-6" xid="column2"/>  
    <div class="x-column col-xs-12 col-sm-12 col-md-6 col-lg-6" xid="column3"/>  
    <div class="x-column hidden" xid="column4"/> 
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label=" 配置布局" xid="configBtn" icon="icon-gear-a" style="float:right;color: #aaa;"
    onClick="configBtnClick"> 
    <i xid="i1" class="icon-gear-a"/>  
    <span xid="span1">配置布局</span> 
  </a> 
</div>