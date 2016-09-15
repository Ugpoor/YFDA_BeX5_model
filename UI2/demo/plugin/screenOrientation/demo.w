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
  <div xid="button1" xui:update-mode="delete"/>
  <div xid="button2" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="screenOrientation"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">



ID：cordova-plugin-screen-orientation</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">



屏幕方向插件，该插件控制程序的显示方式为横屏/竖屏，要注意的是该插件只是控制当前应用显示的方式，并不改变设备的重力感应相关设置。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">



iOS，Android</p>    <div style="padding:20px 40px 20px 40px;" xid="div1_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="跟随系统" onClick="unlockClick" style="width:100%;" xid="unlock" >
<i xid="i1_3" />
<span xid="span1_3" >


跟随系统</span>
</a>
</div>
    <div style="padding:20px 40px 20px 40px;" xid="div2_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="获取当前屏幕方向" onClick="currentClick" style="width:100%;" xid="current" >
<i xid="i2_3" />
<span xid="span2_3" >






获取当前屏幕方向</span>
</a>
</div>
   <div xid="div6" style="padding:20px 40px 20px 40px;"  xui:update-mode="merge"/>
    <a class="btn btn-default" component="$UI/system/components/justep/button/button" label="强制竖屏" onClick="portraitClick" style="width:100%;" xid="portrait" xui:parent="div6" xui:update-mode="insert" >
<i xid="i1_2" />
<span xid="span1_2" >


强制竖屏</span>
</a>
   <div xid="div7" style="padding:20px 40px 20px 40px;"  xui:update-mode="merge"/>
    <a class="btn btn-default" component="$UI/system/components/justep/button/button" label="强制横屏" onClick="landscapeClick" style="width:100%;" xid="landscape" xui:parent="div7" xui:update-mode="insert" >
<i xid="i2_2" />
<span xid="span2_2" >


强制横屏</span>
</a>
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p1_22" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[强制竖屏]]>
</p>
    <div xid="portraitClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p2_22" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[强制横屏]]>
</p>
    <div xid="landscapeClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p3_22" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[跟随系统]]>
</p>
    <div xid="unlockClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p4_22" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[获取当前屏幕方向]]>
</p>
    <div xid="currentClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>