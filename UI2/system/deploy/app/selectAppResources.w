<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window"
  sysParam="false" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:171px;top:339px;"
    onLoad="modelLoad">
    </div>  
  <div xid="serverDiv"> 
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelInput1"> 
      <label class="x-label" xid="serverURLLabel"><![CDATA[Web服务地址：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="serverURL" placeHolder="例：http://ip:port"/>
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" label="button" xid="selectIPButton" icon="icon-arrow-down-b" onClick="selectIPButtonClick">
    <i xid="i1" class="icon-arrow-down-b"></i>
    <span xid="span1"></span></a></div>
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="webPathLabelInput">
   <label class="x-label" xid="label2"><![CDATA[Web路径：]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="webPath" placeHolder="例：/x5，可为空，表示使用根路径。UIServer模式推荐用/x5/UI2"></input><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" label="button" xid="selectWebPathButton" icon="icon-arrow-down-b" onClick="selectWebPathButtonClick">
   <i xid="i2" class="icon-arrow-down-b"></i>
   <span xid="span2"></span></a></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="indexURLLabelInput"> 
      <label class="x-label" xid="label6"><![CDATA[首页：]]></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="indexURL" placeHolder="例：/takekout/index.w。双击下方资源树.w类型可设置为首页"/>
    </div>
    
  </div>  
  
  <!--   
  <div xid="div1" style="margin-left: 60px; float: left;"><div style='margin-top: 10px;'><div xid='jqxCheckBox'>Three Check States</div></div></div>
  -->
  <div xid="uiResDiv"><label xid="label1" class="x-label" style="width:100%;"><![CDATA[选择需要发布的资源：]]></label><textarea class="form-control x-edit" component="$UI/system/components/justep/textarea/textarea" xid="uiResDirs" readonly="true"></textarea><div xid="uiResDirsTree" style="overflow-y:auto;visibility:hidden;">
  </div></div>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="popMenu" anchor="selectIPButton" direction="right-bottom">
   <div class="x-popMenu-overlay" xid="div2"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu"></ul></div>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="webPathPopMenu" anchor="selectWebPathButton" direction="right-bottom">
   <div class="x-popMenu-overlay" xid="div1"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu1"><li class="x-menu-item" xid="item1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="/x5" xid="webPathButton1" onClick="webPathButtonClick">
    <i xid="i3"></i>
    <span xid="span3">/x5</span></a> </li>
  <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="/x5/UI2" xid="webPathButton2" onClick="webPathButtonClick">
    <i xid="i4"></i>
    <span xid="span4">/x5/UI2</span></a> </li></ul></div></div>
