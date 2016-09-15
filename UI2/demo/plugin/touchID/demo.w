<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="div3" xui:update-mode="delete"/>
  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="touchID"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">
ID：com.justep.cordova.plugin.touchid</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">




  这是一个指纹识别的插件。只支持iOS平台，提供了iOS上指纹识别的功能。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">




iOS7.0及以后版本</p>    <div style="padding:20px" xid="div1_4" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p1_4" >
<![CDATA[本插件只支持iOS7.0以上平台。首先检查当前设备是否支持指纹识别，如果支持则会提示OK！然后即可开始指纹识别，如果指纹匹配则会显示成功，有三次匹配机会，连续三次识别不通过则会终止识别。]]>
</p>
</div>
    <div style="height:50px;padding:0px 40px 40px 40px;" xid="div2_4" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="检查是否支持指纹识别" onClick="checkClick" style="width:100%;" xid="check" >
<i xid="i1_4" />
<span xid="span1_4" >








检查是否支持指纹识别</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div3_4" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="指纹识别" onClick="authenticateClick" style="width:100%;" xid="authenticate" >
<i xid="i2_4" />
<span xid="span2_4" >








指纹识别</span>
</a>
</div>
    <div xid="div4_4" xui:parent="demoContent" xui:update-mode="insert" />
    <div xid="div5_4" xui:parent="demoContent" xui:update-mode="insert" />
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p1_23" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[检查是否支持指纹识别]]>
</p>
    <div xid="checkClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p2_23" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[指纹识别]]>
</p>
    <div xid="authenticateClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>