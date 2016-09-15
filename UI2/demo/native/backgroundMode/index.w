<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:239px;top:49px;"
    onLoad="modelLoad"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="app后台运行插件实例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">app后台运行插件实例</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content container-fluid" xid="content1"> 
      <p xid="p1"><![CDATA[app后台运行时，是否启用和禁用背景模式]]></p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="isEnable" xid="isEnable" onClick="isEnableClick"> 
        <i xid="i1"/>  
        <span xid="span1">isEnable</span>
      </a>  
      <p>激活app后台运行模式</p>
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="enable" xid="enable" onClick="enableClick"> 
        <i xid="i2"/>  
        <span xid="span2">enable</span>
      </a>  
      <p>终止app后台运行模式</p>
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="disable" xid="disable" onClick="disableClick"> 
        <i xid="i3"/>  
        <span xid="span3">disable</span>
      </a>  
      <p><![CDATA[设置默认配置1]]></p>
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="configure1" xid="configure1" onClick="configure1Click"> 
        <i xid="i4"/>  
        <span xid="span4">configure1</span>
      </a>
      <p><![CDATA[设置默认配置2]]></p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="configure2" xid="configure2" onClick="configure2Click"> 
        <i xid="i5"/>  
        <span xid="span5">configure2</span>
      </a>  
      <p>设置silent</p>
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="设置" xid="configSilent" onClick="configSilentClick"> 
        <i xid="i6"/>  
        <span xid="span6">设置</span>
      </a>
    </div> 
  </div> 
<span component="$UI/system/components/justep/messageDialog/messageDialog" xid="messageDialog" type="Prompt" title="信息输入"></span></div>
