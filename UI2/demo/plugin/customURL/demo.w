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
   <div xid="model" onModelConstructDone="modelModelConstructDone" onunLoad="modelUnLoad" style="height:auto;top:280px;left:392px;"  xui:update-mode="merge"/>
   <div xid="titleBar" title="customURL"  xui:update-mode="merge"/>
    <div style="height:30px;" xid="div1_1" xui:parent="infoContent" xui:update-mode="insert" />
    <h4 xid="h41_1" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[注意事项：]]>
</h4>
    <div style="height:53px;" xid="div8_1" xui:parent="infoContent" xui:update-mode="insert" >
<li >





不可以自定义已经注册过的URL，比如QQ：“mqq”，微信：“weixin”等。</li>
<li >





不要有空格等特殊字符，所有字母必须小写。</li>
<li >





在大多数安卓的邮箱中是不可以直接输入URL然后跳转到应用的。</li>
</div>
   <p xid="p1"  xui:update-mode="merge-and-replace">




ID：cordova-plugin-customurlscheme</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">




自定义URLScheme插件，开发者可在打包的时候以参数的形式配置应用的URLScheme，这样，我们就可在其他APP、email链接、网页等通过这个URL打开我们的应用。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">

iOS，Android</p>    <div style="padding:10px 10px 10px 10px;" xid="div1_3" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p1_3" >
<![CDATA[本demo提供了一个简单的测试的方法，首先跳转到手机系统浏览器中打开某一个网页，然后再重新回到该应用内。在该应用接收了URL参数后，可以根据URL参数做不同的处理，在此不再做具体展示。本demo默认配置的URL是“wex5app”,用户可以根据自己的需求自定义合乎规范的URL参数。]]>
</p>
</div>
    <div style="height:20px;" xid="div2_3" xui:parent="demoContent" xui:update-mode="insert" >
</div>
    <div style="padding:40px;height:50px;" xid="div3_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="打开浏览器" onClick="openClick" style="width:100%;" xid="open" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i1_3" />
<span xid="span1_3" >








打开浏览器</span>
</a>
</div>
    <div style="padding:40px;height:50px;" xid="div4_3" xui:parent="demoContent" xui:update-mode="insert" />
    <div style="padding:40px;height:50px;" xid="div5_3" xui:parent="demoContent" xui:update-mode="insert" />
    <div xid="div6_3" xui:parent="demoContent" xui:update-mode="insert" />
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p1_25" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[Model]]>
</p>
    <div xid="Model" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p2_25" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[modelUnload]]>
</p>
    <div xid="modelUnLoad" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p3_25" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[handleOpenURL]]>
</p>
    <div xid="handleOpenURL" xui:parent="codeContent" xui:update-mode="insert" />

</div>