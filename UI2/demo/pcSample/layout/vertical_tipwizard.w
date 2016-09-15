<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:73px;top:317px;"/>  
  <div xid="div2" style="height:118px;width:433px;" class="div2">
    <label xid="label1" style="font-size:x-large;"><![CDATA[快捷操作向导]]></label>  
    <hr xid="hr8" class="hr1"/> 
  </div>  
  <div xid="div1" style="height:383px;width:400px;" class="pull-left div1"> 
    <hr xid="hr1"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="菜单栏目1" xid="button1" icon="icon-ios7-circle-filled" style="height:25px;"> 
      <i xid="i1" class="icon-ios7-circle-filled"/>  
      <span xid="span1">菜单栏目1</span>
    </a>  
    <hr xid="hr3"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left "
      label="菜单栏目2" xid="button2" icon="icon-ios7-circle-filled" style="height:25px;"> 
      <i xid="i2" class="icon-ios7-circle-filled"/>  
      <span xid="span2">菜单栏目2</span>
    </a>  
    <hr xid="hr4"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="菜单栏目3" xid="button3" icon="icon-ios7-circle-filled" style="height:25px;"> 
      <i xid="i3" class="icon-ios7-circle-filled"/>  
      <span xid="span3">菜单栏目3</span>
    </a>  
    <hr xid="hr5"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="菜单栏目4" xid="button4" icon="icon-ios7-circle-filled" style="height:25px;"> 
      <i xid="i4" class="icon-ios7-circle-filled"/>  
      <span xid="span4">菜单栏目4</span>
    </a>  
    <hr xid="hr6"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="菜单栏目5" xid="button5" icon="icon-ios7-circle-filled" style="height:25px;"> 
      <i xid="i5" class="icon-ios7-circle-filled"/>  
      <span xid="span5">菜单栏目5</span>
    </a>  
    <hr xid="hr7"/>
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn1"
    label="js" xid="jsBtn" onClick="jsBtnClick"> 
    <i xid="i6"/>  
    <span xid="span11">js</span>
  </a>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn1"
    label="源码" xid="sourceBtn" onClick="sourceBtnClick" bind-visible="isVisible"> 
    <i xid="i8"/>  
    <span xid="span18">源码</span>
  </a>
</div>
