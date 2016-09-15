<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:303px;left:165px;" onModelConstruct="modelModelConstruct"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="插件的名字"
          class="x-titlebar" xid="titleBar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="backBtn" icon="icon-chevron-left" onClick="{operation:'window.close'}">
   <i xid="i6" class="icon-chevron-left"></i>
   <span xid="span6"></span></a></div>  
          <div class="x-titlebar-title">插件的名字</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents1">
   <div class="x-contents-content" xid="infoContent" style="padding:10px;"><h3 xid="h31" style="text-align:center;"><![CDATA[插件概述]]></h3><h4 xid="h41"><![CDATA[介绍：]]></h4><p xid="p1"><![CDATA[ID：在此填入插件的ID。]]></p><p xid="introduceP">在这里添加插件的描述。。。。。。</p><div xid="div4" style="height:30px;"></div>
  <h4 xid="h42"><![CDATA[适用平台：]]></h4>
  <p xid="platformP">在这里添加插件试用的平台</p>
  </div>
  <div class="x-contents-content" xid="demoContent" style="padding:10px;width:100%;"><div xid="div2" style="height:15px;"></div><div xid="div3"><p xid="accountP"><![CDATA[在这里做简单地接口的叙述。。。。。]]></p></div>
  <div xid="div6" style="height:50px;padding:40px"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="接口1" xid="button1" style="width:100%;" onClick="button1Click">
   <i xid="i4"></i>
   <span xid="span4">接口1</span></a></div>
  <div xid="div7" style="height:50px;padding:40px"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="接口2" xid="button2" style="width:100%;" onClick="button2Click">
   <i xid="i5"></i>
   <span xid="span5">接口2</span></a></div>
  
  </div>
  <div class="x-contents-content" xid="codeContent"></div></div></div>
  <div class="x-panel-bottom" xid="bottom1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-card " tabbed="true" xid="buttonGroup1"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="info" xid="info" target="infoContent">
   <i xid="i1"></i>
   <span xid="span1">info</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="demo" xid="demo" target="demoContent">
   <i xid="i2"></i>
   <span xid="span2">demo</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="code" xid="code" target="codeContent">
   <i xid="i3"></i>
   <span xid="span3">code</span></a></div></div></div> 
</div>