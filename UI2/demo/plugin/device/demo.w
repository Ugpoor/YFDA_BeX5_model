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

  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="Device"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">

ID：cordova-plugin-device</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">

获取设备信息插件。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">

Android,IOS</p>    <div xid="div1_1" xui:parent="demoContent" xui:update-mode="insert" >
<div id="info" >
<h4 >



cordova版本: <span id="cordovaSpan" />
</h4>
<h4 >



平台: <span id="platform" />
</h4>
<h4 >



版本: <span id="version" />
</h4>
<h4 >



UUID: <span id="uuid" />
</h4>
<h4 >



产品型号: <span id="model" />
</h4>
<h4 >



厂商: <span id="manufacturer" />
</h4>
</div>
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="获取设备信息" onClick="getInfo" style="width:100%;" xid="button41_1" >
<i xid="i41_1" />
<span xid="span41_1" >



获取设备信息</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="清除" onClick="clearInfo" style="width:100%;" xid="button41_1" >
<i xid="i41_1" />
<span xid="span41_1" >



清除</span>
</a>
<p />
</div>
   <p xid="accountP"  xui:update-mode="merge-and-replace">

插件在全局建立一个名为“device"的变量，访问device属性即可。也可使用device.getInfo方法来取得设备信息。</p>   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xui:parent="codeContent" xui:update-mode="insert" >

设备信息</p>
    <div xid="getInfo" xui:parent="codeContent" xui:update-mode="insert" />

</div>