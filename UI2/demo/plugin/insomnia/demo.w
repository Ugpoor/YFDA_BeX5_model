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
   <div xid="titleBar" title="insomnia"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">



ID：cordova-plugin-insomnia</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">



息屏插件，控制屏幕常亮或者自动息屏。设置常亮仅在应用前台运行时生效，一旦应用进入后台或者被关掉则不再生效。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">



iOS，Android</p>    <div style="padding:0px 40px 40px 40px;" xid="div1_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="保持常亮" onClick="button1_3Click" style="width:100%;" xid="button1_3" >
<i xid="i1_3" />
<span xid="span1_3" >






保持常亮</span>
</a>
</div>
    <div style="height:30px;" xid="div3_3" xui:parent="demoContent" xui:update-mode="insert" />
    <div xid="div2_3" xui:parent="demoContent" xui:update-mode="insert" >
<p style="text-align:center;" xid="p1_4" >
<![CDATA[允许自动息屏]]>
</p>
</div>
    <div style="padding:0px 40px 40px 40px;" xid="div4_4" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="允许息屏" onClick="button2_4Click" style="width:100%;" xid="button2_4" >
<i xid="i2_4" />
<span xid="span2_4" >






允许息屏</span>
</a>
</div>
   <p xid="accountP" style="text-align:center;"  xui:update-mode="merge-and-replace">


保持屏幕常亮接口</p>   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p2_4" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[保持常亮]]>
</p>
    <div xid="button1_3Click" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p3_4" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[允许息屏]]>
</p>
    <div xid="button2_4Click" xui:parent="codeContent" xui:update-mode="insert" />

</div>