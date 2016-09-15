<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:239px;top:49px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="视频播放插件实例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">视频播放插件实例</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content container-fluid" xid="content1"> 
      <p><![CDATA[播放视频，请输入视频路径支持file:///本地路径或http://路径]]></p>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="url" style="margin-bottom:5px;"/>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="播放" xid="playVideo" onClick="playVideoClick"> 
        <i xid="i1"/>  
        <span xid="span1">播放</span> 
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="浏览本地视频" xid="localBtn" onClick="localBtnClick"> 
        <i xid="i2"/>  
        <span xid="span2">浏览本地视频</span>
      </a>
    </div> 
  </div> 
</div>
