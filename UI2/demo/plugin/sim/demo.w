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
   <div xid="model" onModelConstructDone="modelModelConstructDone" style="height:auto;left:591px;top:540px;"  xui:update-mode="merge"/>
   <div xid="titleBar" title="sim"  xui:update-mode="merge"/>
    <div style="height:30px;" xid="div71_2" xui:parent="infoContent" xui:update-mode="insert" />
    <h4 xid="h411_2" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[注意事项：]]>
</h4>
    <p xid="p41_2" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[Android、iOS两个平台返回的数据不同，demo中做了区分。]]>
</p>
   <p xid="p1"  xui:update-mode="merge-and-replace">


ID：cordova-plugin-sim</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">


作用是获取SIM卡的信息，如运行商的名字,mcc,mnc和国家代码等通讯相关信息。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">

Android、IOS</p>    <div xid="div11_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="Android" onClick="AndroidClick" style="width:100%;" xid="Android" >
<i xid="i11_1" />
<span xid="span11_1" >






Android</span>
</a>
</div>
    <div class="x-contents-content" style="padding:10px;width:100%;" xid="content11_1" xui:parent="demoContent" xui:update-mode="insert" >
<div style="height:15px;" xid="div51_1" />
<div xid="div41_1" >
<p xid="p21_1" >






Android返回数据</p>
</div>
</div>
    <p xid="p22_1" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[IOS返回sim卡信息]]>
</p>
    <a class="btn btn-default" component="$UI/system/components/justep/button/button" label="IOS" onClick="IOSClick" style="width:100%;" xid="IOS" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i32_1" />
<span xid="span32_1" >






iOS</span>
</a>
   <p xid="accountP"  xui:update-mode="merge-and-replace">


Android返回sim卡信息</p>    <p xid="p121_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[Android返回sim卡信息]]>
</p>
    <div style="padding:10px" xid="AndroidClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p31_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[iOS返回sim卡信息]]>
</p>
    <div style="padding:10px" xid="IOSClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>