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

  <div xid="button2" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="ShortCut"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">
ID：com.plugins.shortcut</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">
在android桌面上创建一个快捷方式。注意：与厂商的桌面设定有关。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">
Android</p>   <p xid="accountP"  xui:update-mode="merge-and-replace">
在桌面上创建一个本应用的快捷方式。</p>   <a xid="button1" label="创建快捷方式" onClick="createShortcutClick"  xui:update-mode="merge"/>
   <span xid="span4"  xui:update-mode="merge-and-replace">
创建快捷方式</span>   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xui:parent="codeContent" xui:update-mode="insert" >

创建一个X5快捷方式</p>
    <div xid="createShortcutClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>