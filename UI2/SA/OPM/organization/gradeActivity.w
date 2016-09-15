<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/SA/OPM/organization/mainActivity.w" 
  xid="window" 
  class="window x-full-screen container-fluid" 
  xmlns="http://www.w3.org/1999/xhtml" >

   <span xid="assignPersonOrgDialog" manageCodes="systemManagement" rootFilter="1=1"  xui:update-mode="merge"/>
   <span xid="moveOrgDialog" manageCodes="systemManagement" rootFilter="1=1"  xui:update-mode="merge"/>
   <div xid="orgTreePC1" manageCodes="systemManagement"  xui:update-mode="merge"/>
   <treeOption xid="default15" rootFilter="1=1"  xui:update-mode="merge"/>
   <div xid="orgTreeGrid" useVirtualRoot="false"  xui:update-mode="merge"/>

</div>