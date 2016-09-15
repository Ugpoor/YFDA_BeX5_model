<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:83px;height:auto;left:220px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="文件下载插件实例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">文件下载插件实例</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content container-fluid" xid="content1"> 
      <p>下载单个文件</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="下载" xid="initdownloader" onClick="initdownloaderClick"> 
        <i xid="i1"/>  
        <span xid="span1">下载</span> 
      </a>  
      <p>下载多个文件</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="下载" xid="multidown" onClick="multidownClick"> 
        <i xid="i2"/>  
        <span xid="span2">下载</span>
      </a>  
      <p>判断该插件是否初始化</p>
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="是否初始化" xid="button1" onClick="button1Click"> 
        <i xid="i3"/>  
        <span xid="span3">是否初始化</span>
      </a>
    </div> 
  </div> 
</div>
