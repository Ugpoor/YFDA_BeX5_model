<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="introduceP" xui:update-mode="delete"/>
  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="spinner"  xui:update-mode="merge"/>
    <p xid="p61_1" xui:before="div4" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[添加引用本插件，可以使应用增加显示spinner和隐藏spinner的能力。spinner一般用于程序加载、跳转等场景，美观得体的spinner会让你的应用有更好的用户体验。]]>
</p>
   <p xid="p1"  xui:update-mode="merge-and-replace">




ID：cordova-plugin-spinner-dialog</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">




Android、IOS</p>    <div style="padding:10px;" xid="div11_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="只显示spinner" onClick="spinneronlyClick" style="width:100%;" xid="spinneronly" >
<i xid="i11_1" />
<span xid="span11_1" >








只显示spinner</span>
</a>
</div>
    <div style="padding:10px;" xid="div41_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="包含信息的spinner" onClick="mspinnerClick" style="width:100%;" xid="mspinner" >
<i xid="i41_1" />
<span xid="span41_1" >








包含信息的spinner</span>
</a>
</div>
    <div xid="div51_1" xui:parent="demoContent" xui:update-mode="insert" >
<p style="font-size:medium;font-weight:bolder;" xid="p21_1" >
<![CDATA[持续一段时间的spinner]]>
</p>
<p xid="p31_1" >
<![CDATA[无法通过点击屏幕(IOS),或者回退键(Android)隐藏这种spinner，本示例显示五秒后消失。]]>
</p>
</div>
    <div style="padding:10px;" xid="div61_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="持续型spinner" onClick="persispinnerClick" style="width:100%;" xid="persispinner" >
<i xid="i51_1" />
<span xid="span51_1" >








持续型spinner</span>
</a>
</div>
    <div xid="div71_1" xui:parent="demoContent" xui:update-mode="insert" >
<p style="font-size:medium;font-weight:bolder;" xid="p41_1" >
<![CDATA[Android独有的形式]]>
</p>
<p xid="p51_1" >
<![CDATA[IOS只能显示一行文本信息。以下形式的spinner在IOS只能显示标题,而在Android则能显示标题和内容。]]>
</p>
</div>
    <div style="padding:10px;" xid="div81_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="只有标题的spinner" onClick="otspinnerClick" style="width:100%;" xid="otspinner" >
<i xid="i61_1" />
<span xid="span61_1" >








只有标题的spinner</span>
</a>
</div>
    <div style="padding:10px;" xid="div91_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="同时包含标题和信息的spinner" onClick="tmspinnerClick" style="width:100%;" xid="tmspinner" >
<i xid="i71_1" />
<span xid="span71_1" >








同时包含标题和信息的spinner</span>
</a>
</div>
    <p xid="p11_1" xui:parent="div3" xui:update-mode="insert" >
<![CDATA[点击屏幕(IOS)，或者回退键(Android)隐藏spinner。]]>
</p>
   <p xid="accountP" style="font-size:medium;font-weight:bolder;"  xui:update-mode="merge-and-replace">



显示spinner</p>   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p111_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[只显示spinner]]>
</p>
    <div xid="spinneronlyClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p12_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[包含信息的spinner]]>
</p>
    <div xid="mspinnerClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p22_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[持续型spinner]]>
</p>
    <div xid="persispinnerClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p32_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[只有标题的spinner]]>
</p>
    <div xid="otspinnerClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p42_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[同时包含标题和信息的spinner]]>
</p>
    <div xid="tmspinnerClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>