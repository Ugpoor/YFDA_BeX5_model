<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/demo/plugin/template/demo.w" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:m;" >

  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
  <div xid="accountP" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="statusbar"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">

ID：cordova-plugin-statusbar</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">

状态栏插件：控制状态栏的显示方式和样式。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">

Android、IOS</p>    <p style="font-size:medium;font-weight:bolder;" xid="p111_3" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[Android显示状态栏]]>
</p>
    <p xid="p31_3" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[显示状态栏]]>
</p>
    <div style="padding:10px;" xid="div1_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="显示状态栏" onClick="showClick" style="width:100%;" xid="show" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i121_3" />
<span xid="span121_3" >




显示状态栏</span>
</a>
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p11_3" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[Android隐藏状态栏]]>
</p>
    <p xid="p21_3" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[隐藏状态栏]]>
</p>
    <div style="padding:10px;" xid="div5_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="隐藏状态栏" onClick="hideClick" style="width:100%;" xid="hide" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i21_3" />
<span xid="span21_3" >




隐藏状态栏</span>
</a>
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p21_1" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[(Android、IOS)设置背景颜色]]>
</p>
    <p xid="p11_1" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[设置状态栏的背景颜色，取值范围：black, darkGray, lightGray, white, gray, red, green, blue, cyan, yellow, magenta, orange, purple, brown。注意：Android5.0系统以上支持设置状态栏颜色。]]>
</p>
    <div style="padding:10px;" xid="div4_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="设置背景颜色" onClick="setBackBroundColorClick" style="width:100%;" xid="setBackBroundColor" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i11_1" />
<span xid="span11_1" >


设置背景颜色</span>
</a>
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p31_1" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[IOS状态栏设置(True)]]>
</p>
    <p xid="p41_1" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[设置状态栏是否重叠，在IOS7中，设为false，状态栏的风格接近于IOS6]]>
</p>
    <div style="padding:10px;" xid="div3_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="状态栏浮动模式(是)" onClick="showWebViewClick" style="width:100%;" xid="showWebView" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i21_1" />
<span xid="span21_1" >


状态栏浮动模式(是)</span>
</a>
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p51_1" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[IOS状态栏设置(False)]]>
</p>
    <p xid="p61_1" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[设置状态栏是否重叠，在IOS7中，设为false，状态栏的风格接近于IOS6]]>
</p>
    <div style="padding:10px;" xid="div2_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="状态栏浮动模式(否)" onClick="hideWebViewClick" style="width:100%;" xid="hideWebView" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i31_1" />
<span xid="span31_1" >


状态栏浮动模式(否)</span>
</a>
</div>
    <p xid="p111_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[显示状态栏]]>
</p>
    <div xid="showClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p12_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[隐藏状态栏]]>
</p>
    <div xid="hideClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p22_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[设置背景颜色]]>
</p>
    <div xid="setBackBroundColorClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p32_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[状态栏浮动模式(是)]]>
</p>
    <div xid="showWebViewClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p42_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[状态栏浮动模式(否)]]>
</p>
    <div xid="hideWebViewClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>