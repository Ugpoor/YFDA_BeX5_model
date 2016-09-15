<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/demo/plugin/template/demo.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:m;" >

  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="titleBar" title="privacyscreen"  xui:update-mode="merge"/>
    <p xid="p11_1" xui:before="div4" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[大多数情况下这样做是没有问题的，但有时候该快照图会涉及敏感信息，造成个人隐私泄露的风险。]]>
</p>
    <p xid="p31_1" xui:before="div4" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[本插件屏蔽了Android系统和IOS系统的截屏功能，在使用本插件的应用内无法调用系统截图的功能。切换应用时，用空白图替换了可能包含个人隐私的应用快照图。降低了隐私泄露的风险。]]>
</p>
   <p xid="p1"  xui:update-mode="merge-and-replace">

ID：cordova-plugin-privacyscreen</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">IOS系统和Android系统都有切换应用的功能，在切换时显示应用当前页面的屏幕快照。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">

Android、IOS</p>   <p xid="accountP"  xui:update-mode="merge-and-replace">
本插件无调用接口，包含即可。包含后，切换应用时将不会看到当前应用的屏幕快照，也无法使用系统截屏功能。</p>
</div>