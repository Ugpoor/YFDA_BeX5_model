<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:239px;top:49px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="浮动提示插件实例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">浮动提示插件实例</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content container-fluid" xid="content1"> 
      <p>显示一个浮动提示框</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="显示" xid="showToast" onClick="showToastClick"> 
        <i xid="i1"/>  
        <span xid="span1">显示</span> 
      </a>  
      <p>手动隐藏浮动提示框，</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="隐藏" xid="hiddenToast" onClick="hiddenToastClick"> 
        <i xid="i2"/>  
        <span xid="span2">隐藏</span> 
      </a>  
      <p>垂直调整显示位置</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="显示" xid="tweakvposition" onClick="tweakvpositionClick"> 
        <i xid="i3"/>  
        <span xid="span3">显示</span>
      </a>
    </div> 
  </div> 
</div>
