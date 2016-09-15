<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/SA/OPM/dialogs/selectFunction/selectMultiFunctions.w" >

   <div xid="treeGrid" multiselect="false"  xui:update-mode="merge"/>
   <a xid="okBtn" bind-enable="$model.treeData.getCurrentRow() &amp;&amp; !$model.treeData.val('isFolder')"  xui:update-mode="merge"/>

</div>